FROM lscr.io/linuxserver/jellyfin:latest

# Install runtime dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 python3-yaml python3-click openssh-client netcat-openbsd curl && \
    rm -rf /var/lib/apt/lists/*

# Download rffmpeg and setup symlinks
RUN curl -fsSL https://raw.githubusercontent.com/joshuaboniface/rffmpeg/master/rffmpeg -o /usr/local/bin/rffmpeg && \
    chmod +x /usr/local/bin/rffmpeg && \
    ln -sf /usr/local/bin/rffmpeg /usr/local/bin/ffmpeg && \
    ln -sf /usr/local/bin/rffmpeg /usr/local/bin/ffprobe

# Create required directories
RUN mkdir -p /etc/rffmpeg /var/lib/rffmpeg /custom-cont-init.d

# Startup script: fix key perms, ensure state dir perms BEFORE init, and add host target
RUN printf '#!/bin/bash\n\
if [ -f /root/.ssh/id_ed25519 ]; then\n\
  cp /root/.ssh/id_ed25519 /tmp/id_ed25519\n\
  chmod 600 /tmp/id_ed25519\n\
fi\n\
mkdir -p /var/lib/rffmpeg\n\
chmod 777 /var/lib/rffmpeg\n\
if [ -f /etc/rffmpeg/rffmpeg.yml ]; then\n\
  rffmpeg init\n\
  rffmpeg add host.docker.internal 2>/dev/null || true\n\
fi\n\
chmod 666 /var/lib/rffmpeg/rffmpeg.db 2>/dev/null || true\n\
' > /custom-cont-init.d/00-rffmpeg-init.sh && \
    chmod +x /custom-cont-init.d/00-rffmpeg-init.sh
