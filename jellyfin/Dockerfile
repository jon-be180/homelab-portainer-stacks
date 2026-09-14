FROM lscr.io/linuxserver/jellyfin:latest

# Install python3, yaml, click, openssh, and curl
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-yaml \
    python3-click \
    openssh-client \
    netcat-openbsd \
    curl && \
    rm -rf /var/lib/apt/lists/*

# Download rffmpeg binary directly into PATH
RUN curl -fsSL https://raw.githubusercontent.com/joshuaboniface/rffmpeg/master/rffmpeg -o /usr/local/bin/rffmpeg && \
    chmod +x /usr/local/bin/rffmpeg

# Create required configuration and state directories, then initialize the database
RUN mkdir -p /etc/rffmpeg /var/lib/rffmpeg && \
    rffmpeg init
