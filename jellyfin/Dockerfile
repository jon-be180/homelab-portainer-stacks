FROM lscr.io/linuxserver/jellyfin:latest

# Install Python, SSH client, and rffmpeg into the image
RUN apt-get update && \
    apt-get install -y python3-pip openssh-client && \
    pip3 install rffmpeg --break-system-packages && \
    rffmpeg init && \
    rm -rf /var/lib/apt/lists/*
