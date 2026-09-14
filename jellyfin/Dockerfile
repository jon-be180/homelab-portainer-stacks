FROM lscr.io/linuxserver/jellyfin:latest

# Step 1: Update package list
RUN apt-get update

# Step 2: Install system packages
RUN apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    openssh-client \
    netcat-openbsd

# Step 3: Install rffmpeg
RUN pip3 install --no-cache-dir --break-system-packages rffmpeg

# Step 4: Initialize rffmpeg
RUN rffmpeg init

# Step 5: Clean up apt cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
