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

# Create symlinks so rffmpeg acts as transparent proxy
RUN ln -sf /usr/local/bin/rffmpeg /usr/local/bin/ffmpeg && \
    ln -sf /usr/local/bin/rffmpeg /usr/local/bin/ffprobe

# Create required directories
RUN mkdir -p /etc/rffmpeg /var/lib/rffmpeg /custom-cont-init.d

# Write startup initialization script (ignoring read-only bind mount errors)
RUN printf '#!/bin/bash\nif [ -f /etc/rffmpeg/rffmpeg.yml ]; then\n  rffmpeg init\n  chown -R abc:abc /var/lib/rffmpeg 2>/dev/null || true\nfi\n' > /custom-cont-init.d/00-rffmpeg-init.sh && \
    chmod +x /custom-cont-init.d/00-rffmpeg-init.sh
