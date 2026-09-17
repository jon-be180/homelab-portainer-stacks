FROM lscr.io/linuxserver/jellyfin:latest

# Install runtime dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 python3-yaml python3-click openssh-client netcat-openbsd curl && \
    rm -rf /var/lib/apt/lists/*

# Download rffmpeg
RUN curl -fsSL https://raw.githubusercontent.com/joshuaboniface/rffmpeg/master/rffmpeg -o /usr/local/bin/rffmpeg && \
    chmod +x /usr/local/bin/rffmpeg

# CRITICAL FIX: Backup the real ffmpeg binary before symlinking rffmpeg
RUN cp /usr/lib/jellyfin-ffmpeg/ffmpeg /usr/lib/jellyfin-ffmpeg/ffmpeg.original && \
    cp /usr/lib/jellyfin-ffmpeg/ffprobe /usr/lib/jellyfin-ffmpeg/ffprobe.original && \
    ln -sf /usr/local/bin/rffmpeg /usr/lib/jellyfin-ffmpeg/ffmpeg && \
    ln -sf /usr/local/bin/rffmpeg /usr/lib/jellyfin-ffmpeg/ffprobe

# Create required directories
RUN mkdir -p /etc/rffmpeg /var/lib/rffmpeg /custom-cont-init.d

RUN printf '#!/bin/bash\n\
if [ -f /root/.ssh/id_ed25519 ]; then\n\
  cp /root/.ssh/id_ed25519 /tmp/id_ed25519\n\
  chmod 600 /tmp/id_ed25519\n\
fi\n\
mkdir -p /var/lib/rffmpeg /etc/rffmpeg\n\
chmod 777 /var/lib/rffmpeg\n\
if [ -f /etc/rffmpeg/rffmpeg.yml ]; then\n\
  rffmpeg init 2>/dev/null || true\n\
fi\n\
touch /var/lib/rffmpeg/rffmpeg.db\n\
chmod 666 /var/lib/rffmpeg/rffmpeg.db 2>/dev/null || true\n\
' > /custom-cont-init.d/00-rffmpeg-init.sh && \
    chmod +x /custom-cont-init.d/00-rffmpeg-init.sh
