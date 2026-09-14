FROM lscr.io/linuxserver/jellyfin:latest

# Environment variable to bypass PEP 668 PEP restrictions on Debian/Ubuntu
ENV PIP_BREAK_SYSTEM_PACKAGES=1

# Step 1: Update package list
RUN apt-get update

# Step 2: Install required system dependencies (including git for rffmpeg source install)
RUN apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    git \
    openssh-client \
    netcat-openbsd

# Step 3: Install rffmpeg directly from the GitHub repository
RUN pip3 install --no-cache-dir git+https://github.com/joshuaboniface/rffmpeg.git

# Step 4: Initialize rffmpeg default configuration structure
RUN rffmpeg init

# Step 5: Clean up apt cache to keep image size small
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
