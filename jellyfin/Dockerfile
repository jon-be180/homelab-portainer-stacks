FROM lscr.io/linuxserver/jellyfin:latest

# Install dependencies, set up Python environment, and install rffmpeg
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        python3-setuptools \
        python3-wheel \
        openssh-client \
        netcat-openbsd && \
    pip3 install --no-cache-dir --break-system-packages rffmpeg && \
    rffmpeg init && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
