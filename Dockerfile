# 개발용 Linux 환경 (Windows x86_64 / Mac M1 arm64 모두 같은 이미지로 동작)
FROM ubuntu:24.04

# apt 설치 중 대화형 질문(시간대 등)이 뜨지 않도록 설정
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

RUN apt-get update && apt-get install -y --no-install-recommends \
    # C 컴파일러(gcc), make 등 빌드 도구
    build-essential \
    # 디버거
    gdb \
    # 시스템 콜 추적 (socket, bind, accept 등이 실제로 호출되는 걸 볼 수 있음)
    strace \
    # Git + SSH 클라이언트 (컨테이너 안에서 commit/push 하기 위함)
    git \
    openssh-client \
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
    # 로케일 데이터 (ko_KR.UTF-8 등을 만들기 위함)
    locales \
    && rm -rf /var/lib/apt/lists/*

# VS Code 터미널이 LANG을 ko_KR.UTF-8 / en_US.UTF-8 등으로 바꿔도 동작하도록 로케일 생성
RUN locale-gen ko_KR.UTF-8 en_US.UTF-8

# 마운트된 폴더는 소유자가 컨테이너 사용자와 달라서 Git이 "dubious ownership" 경고를 냄
# → /workspace는 믿을 수 있는 폴더라고 등록
RUN git config --system --add safe.directory /workspace

WORKDIR /workspace

CMD ["bash"]
