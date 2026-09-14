FROM lscr.io/linuxserver/jellyfin:latest

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    openssh-client \
    netcat-openbsd

# Bypass PEP 668 via environment variable
ENV PIP_BREAK_SYSTEM_PACKAGES=1

RUN pip3 install --no-cache-dir rffmpeg

RUN rffmpeg init
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
