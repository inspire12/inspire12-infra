# macOS 네트워크 명령어 및 도구 모음

macOS 환경에서 네트워크 상태 진단 및 문제 해결을 위한 필수 명령어와 도구

---

## 📌 1. 네트워크 인터페이스 정보 확인

### ✅ `ifconfig`

```shell
ifconfig                  # 인터페이스 전체 정보 확인
ifconfig en0              # 특정 인터페이스 정보
```
📌 2. 라우팅 및 DNS 확인
✅ 라우팅 정보 확인
```
netstat -nr               # 라우팅 테이블 및 default gateway 확인
```
✅ DNS 서버 확인
```
scutil --dns              # DNS 서버 상세 정보 확인
cat /etc/resolv.conf      # 간략한 DNS 정보 확인
```
📌 3. 네트워크 연결 점검
✅ 연결 확인 (ping)
```
ping google.com
ping 8.8.8.8
```
✅ 네트워크 경로 추적 (traceroute, mtr)
```
traceroute google.com
mtr google.com            # 설치 필요 (brew install mtr)
```
📌 4. 포트 및 소켓 상태 확인
✅ 포트 상태 확인 (lsof)
```
sudo lsof -i -P -n | grep LISTEN   # Listening 포트 및 프로세스 확인
```
✅ 소켓 상태 (netstat)
```
netstat -anvp tcp         # TCP 소켓 연결 상태 상세 확인
```
📌 5. 소켓 연결 테스트
✅ nc (Netcat)
```
nc -zv google.com 80      # 포트 상태 확인
nc -lvp 1234              # 로컬에서 포트 오픈
```
📌 6. DNS 정보 조회
✅ dig
```
dig google.com
dig google.com MX
dig @8.8.8.8 google.com
```
✅ nslookup
```
nslookup google.com
```
📌 7. HTTP 요청 테스트
✅ curl
```
curl -I http://google.com
curl -X POST http://localhost/api -d '{"name":"test"}' -H 'Content-Type: application/json'
```
✅ wget (설치 필요)
```
brew install wget
wget http://example.com/file.zip
```
📌 8. 패킷 분석 및 캡처
✅ tcpdump
```
sudo tcpdump -i en0 port 80
sudo tcpdump -nn -i en0
```
✅ Wireshark (GUI 기반, 설치 필요)
```
brew install --cask wireshark
```
📌 9. 방화벽 설정 확인
✅ macOS 방화벽 상태 확인
```
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate
```
📌 10. 네트워크 속도 측정
✅ iperf3 (설치 필요)
```
brew install iperf3
```

# 서버 모드
```
iperf3 -s
```
# 클라이언트 모드
```
iperf3 -c 서버IP
```
🚩 macOS 네트워크 명령어 요약표

| 명령어 | 용도 | 자주 쓰는 옵션 |
| --- | --- | --- |
| `ifconfig` | 인터페이스 정보 확인 | - |
| `netstat` | 라우팅 및 소켓 정보 확인 | `-nr`, `-anvp tcp` |
| `scutil` | DNS 서버 확인 | `--dns` |
| `ping` | 연결 테스트 | - |
| `traceroute` | 네트워크 경로 확인 | - |
| `mtr` | 지속적 네트워크 진단 | - |
| `lsof` | Listening 포트 확인 | `-i -P -n` |
| `nc` | 포트 상태 및 연결 테스트 | `-zv`, `-lvp` |
| `dig` | DNS 조회 | - |
| `curl` | HTTP 요청 테스트 | `-I`, `-X` |
| `wget` | 파일 다운로드 | - |
| `tcpdump` | 패킷 분석 및 캡처 | `-i en0` |
| `iperf3` | 네트워크 속도 측정 | `-s`, `-c` |