import ws from 'k6/ws';
import { check } from 'k6';
import { sleep } from 'k6';

export const options = {
  vus: 1000,
  durations: '60s',
};

const STOMP_HEADERS = {
  'accept-version': '1.2',
  host: 'localhost',
};

const buildStompFrame = (command, headers = {}, body = '') => {
  const headerStr = Object.entries(headers).map(([k, v]) => `${k}:${v}`).join('\n');
  return `${command}\n${headerStr}\n\n${body}\0`;
};

export default function () {
  const url = 'ws://localhost:8083/ws'; // STOMP 웹소켓 엔드포인트
  
  const res = ws.connect(url, {}, function (socket) {
    socket.on('open', function () {
      console.log('✅ WebSocket 연결됨');
      
      // 1. STOMP CONNECT
      const connectFrame = buildStompFrame('CONNECT', STOMP_HEADERS);
      socket.send(connectFrame);
      console.log('📤 CONNECT 전송');
      
      let isConnected = false;
      
      socket.on('message', function (message) {
        console.log('📥 받은 메시지:', message);
        
        // 2. CONNECTED → SUBSCRIBE
        if (!isConnected && message.startsWith('CONNECTED')) {
          isConnected = true;
          
          const subscribeFrame = buildStompFrame('SUBSCRIBE', {
            id: 'sub-0',
            destination: '/topic/public',
          });
          socket.send(subscribeFrame);
          console.log('📤 SUBSCRIBE 전송');
          
          // 3. SEND → 메시지 전송
          const payload = JSON.stringify({ sender: 'k6-test', content: 'Hello STOMP' });
          const sendFrame = buildStompFrame('SEND', {
            destination: '/app/chat.sendMessage',
            'content-type': 'application/json',
          }, payload);
          socket.send(sendFrame);
          console.log('📤 SEND 전송');
        }
        
        // 4. MESSAGE 수신 시 출력
        if (message.startsWith('MESSAGE')) {
          console.log('✅ 메시지 수신 확인됨');
        }
      });
      
      socket.setTimeout(function () {
        socket.close();
      }, 5000);
    });
    
    socket.on('close', function () {
      console.log('🔌 연결 종료');
    });
    
    socket.on('error', function (e) {
      console.error('❌ 에러 발생:', e.error());
    });
  });
  
  check(res, {
    '🟢 연결 상태코드 101 확인': (r) => r && r.status === 101,
  });
  
  sleep(1);
}