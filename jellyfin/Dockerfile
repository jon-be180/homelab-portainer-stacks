FROM lscr.io/linuxserver/jellyfin:latest

# Install runtime dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-yaml \
    python3-click \
    openssh-client \
    netcat-openbsd \
    curl && \
    rm -rf /var/lib/apt/lists/*

# Download rffmpeg binary into PATH
RUN curl -fsSL https://raw.githubusercontent.com/joshuaboniface/rffmpeg/master/rffmpeg -o /usr/local/bin/rffmpeg && \
    chmod +x /usr/local/bin/rffmpeg

# Create required directories
RUN mkdir -p /etc/rffmpeg /var/lib/rffmpeg

# Create an init script in LinuxServer's s6 init directory to run 'rffmpeg init' on container start
RUN echo '#!/bin/bash\nif [ ! -f /var/lib/rffmpeg/rffmpeg.db ]; then\n  rffmpeg init\nfi' > /custom-cont-init.d/00-rffmpeg-init.sh && \
    chmod +x /custom-cont-init.d/00-rffmpeg-init.sh
