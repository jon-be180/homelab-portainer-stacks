FROM lscr.io/linuxserver/jellyfin:latest

# Install python3, yaml support, openssh, and curl
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-yaml \
    openssh-client \
    netcat-openbsd \
    curl && \
    rm -rf /var/lib/apt/lists/*

# Download rffmpeg binary directly into PATH from joshuaboniface/rffmpeg
RUN curl -fsSL https://raw.githubusercontent.com/joshuaboniface/rffmpeg/master/rffmpeg -o /usr/local/bin/rffmpeg && \
    chmod +x /usr/local/bin/rffmpeg

# Create the configuration directory expected by rffmpeg
RUN mkdir -p /etc/rffmpeg
