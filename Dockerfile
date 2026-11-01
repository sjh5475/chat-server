# 개발용 Linux 환경 (Windows x86_64 / Mac M1 arm64 모두 같은 이미지로 동작)
FROM ubuntu:24.04

# apt 설치 중 대화형 질문(시간대 등)이 뜨지 않도록 설정
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    # C 컴파일러(gcc), make 등 빌드 도구
    build-essential \
    # 디버거
    gdb \
    # 시스템 콜 추적 (socket, bind, accept 등이 실제로 호출되는 걸 볼 수 있음)
    strace \
    # nc: 간단한 TCP/UDP 클라이언트/서버 (서버 테스트용)
    netcat-openbsd \
    # tcpdump: 패킷 캡처 (3-way handshake 등을 눈으로 확인)
    tcpdump \
    # ip, ss: 네트워크 인터페이스/소켓 상태 확인
    iproute2 \
    # ping
    iputils-ping \
    # dig, nslookup: DNS 확인
    dnsutils \
    curl \
    ca-certificates \
    # man 페이지 (man 2 socket 등)
    man-db manpages-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

CMD ["bash"]
