FROM ubuntu:22.04

# Install development tools
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    nodejs \
    npm \
    python3 \
    python3-pip \
    ripgrep \
    tmux \
    vim \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Create restricted user
RUN useradd -m -s /bin/bash claude && \
    mkdir -p /workspace && \
    chown claude:claude /workspace

# Security restrictions
USER claude
WORKDIR /workspace

# Resource limits set at runtime