import ws from 'k6/ws';
import { check } from 'k6';
import { sleep } from 'k6';

export const options = {
  vus: 10,           // 가상 유저 수
  duration: '30s',   // 테스트 시간
};

export default function () {
  const url = 'ws://localhost:8080/ws'; // 테스트할 WebSocket 주소
  const params = { tags: { my_tag: 'websocket_test' } };
  
  const res = ws.connect(url, params, function (socket) {
    socket.on('open', function () {
      console.log('🔌 WebSocket 연결 성공');
      
      // 연결 후 메시지 전송
      socket.send('Hello Server!');
      console.log('📤 메시지 전송함: Hello Server!');
      
      // 응답 수신
      socket.on('message', function (message) {
        console.log(`📥 서버 응답 받음: ${message}`);
      });
      
      // 5초마다 ping 전송
      socket.setInterval(function () {
        socket.send('ping');
        console.log('📤 ping 전송');
      }, 5000);
      
      // 20초 후 연결 종료
      socket.setTimeout(function () {
        console.log('⏱️ 20초 후 소켓 종료');
        socket.close();
      }, 20000);
    });
    
    socket.on('close', function () {
      console.log('🔌 WebSocket 연결 종료');
    });
    
    socket.on('error', function (e) {
      console.error(`❌ WebSocket 에러: ${e.error()}`);
    });
  });
  
  check(res, { '연결 상태코드가 101임': (r) => r && r.status === 101 });
  
  sleep(1); // VU가 너무 빨리 종료되지 않도록 함
}