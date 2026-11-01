# chat-server

C 소켓으로 직접 구현하는 멀티 클라이언트 채팅 서버.
1:1 echo 서버에서 시작해 epoll 기반 채팅 서버까지 단계적으로 발전시키며 네트워크 개념을 학습한다.

## 개발 환경
- Docker (Ubuntu 24.04) — Windows / macOS(M1) 공통
- C (gcc), Linux socket API

```bash
docker compose up -d --build    # 개발 컨테이너 실행
docker compose exec dev bash    # 컨테이너 접속
```

## 진행 단계
| 단계 | 내용 | 개발일지 |
|---|---|---|
| 0 | 개발 환경 구성 (Git, Docker) | [00-setup](docs/devlog/00-setup.md) |
| 1 | 1:1 echo 서버 | |
| 2 | 다중 접속 (fork / thread) | |
| 3 | 채팅 브로드캐스트 + 메시지 프로토콜 설계 | |
| 4 | select → epoll | |
| 5 | 닉네임 / 방 / 귓속말 / 종료 처리 | |
| 6 | 성능 측정 및 회고 | |
