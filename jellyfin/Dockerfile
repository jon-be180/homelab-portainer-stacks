FROM lscr.io/linuxserver/jellyfin:latest

# Bypass PEP 668 restrictions on Debian/Ubuntu
ENV PIP_BREAK_SYSTEM_PACKAGES=1

# Step 1: Update package list
RUN apt-get update

# Step 2: Install system dependencies including build tools, git, and python-yaml
RUN apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    python3-yaml \
    git \
    openssh-client \
    netcat-openbsd

# Step 3: Install rffmpeg directly from the official Jellyfin repository
RUN pip3 install --no-cache-dir git+https://github.com/jellyfin/rffmpeg.git

# Step 4: Initialize rffmpeg configuration directory
RUN rffmpeg init

# Step 5: Clean up apt cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
