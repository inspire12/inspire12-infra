# Linux Net Commands
리눅스 네트워크 명령어 및 도구 모음

리눅스 환경에서 네트워크 진단 및 문제 해결을 위해 필수적으로 사용되는 명령어와 도구를 정리함.

1. 네트워크 인터페이스 정보 확인

ip (추천)
```
ip addr         # 인터페이스 IP 주소
ip link         # 인터페이스 상태
ip route        # 라우팅 테이블 및 게이트웨이
```
구형 명령어
```
ifconfig -a
```
2. 라우팅 및 DNS 확인

라우팅 확인
```
ip route
route -n
DNS 서버 확인
cat /etc/resolv.conf
```
3. 네트워크 연결 점검

연결 확인 (ping)
```
ping google.com
ping 8.8.8.8
```
네트워크 경로 추적 (traceroute, mtr)
```
traceroute google.com
mtr google.com
```
4. 포트 및 소켓 상태 확인

ss (추천)
```
ss -tulnp
netstat
netstat -tulnp
```
5. 소켓 연결 테스트

nc (Netcat)
nc -zv google.com 80
nc -lvp 1234
6. DNS 정보 조회
```
dig
dig google.com
dig google.com MX
dig @8.8.8.8 google.com
nslookup
nslookup google.com
```
7. HTTP 요청 테스트
```
curl
curl -I http://google.com
curl -X POST http://localhost/api -d '{"name":"test"}' -H 'Content-Type: application/json'
wget
wget http://example.com/file.zip
```
8. 패킷 분석 및 캡처
```
tcpdump
sudo tcpdump -i eth0 port 80
sudo tcpdump -nn -i eth0
Wireshark (GUI 기반)
sudo apt install wireshark
```
9. 방화벽 설정 확인
```
ufw
sudo ufw status
sudo ufw allow 80/tcp
iptables
sudo iptables -L -n -v
```
10. 네트워크 속도 측정
```
iperf3
# 서버
iperf3 -s
```
# 클라이언트
```
iperf3 -c 서버IP
```
📌 네트워크 명령어 요약표

		
ip	인터페이스, 라우팅 정보	ip addr, ip route
ping	연결 확인	-
traceroute	경로 확인	-I
mtr	실시간 모니터링	-
ss	소켓 상태 확인	-tulnp
netstat	소켓 상태 확인 (구형)	-tulnp
dig	DNS 조회	-
curl	HTTP 요청	-I, -X
tcpdump	패킷 캡처	-i eth0

| 명령어 | 용도 | 자주 쓰는 옵션 |
| --- | --- | --- |
| `ip` | 인터페이스, 라우팅 정보 | `ip addr`,`ip route` |
| `ping` | 연결 확인 | - |
| `traceroute` | 경로 확인 | `-I` |
| `mtr` | 실시간 모니터링 | - |
| `ss` | 소켓 상태 확인 | `-tulnp` |
| `netstat` | 소켓 상태 확인 (구형) | `-tulnp` |
| `dig` | DNS 조회 | - |
| `curl` | HTTP 요청 | `-I`,`-X` |
| `tcpdump` | 패킷 캡처 | `-i eth0` |
| `nc` | 포트 연결 테스트 | `-zv host port` |
| `iperf3` | 네트워크 성능 측정 | `-s`,`-c` |

