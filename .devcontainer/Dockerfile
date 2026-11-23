FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

# Install essential development tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    wget \
    unzip \
    python3 \
    python3-pip \
    ffmpeg \
    git-core \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Bun
RUN bash -c "curl -fsSL https://bun.sh/install | bash" && \
    export PATH="/root/.bun/bin:$PATH" && \
    echo 'export PATH="/root/.bun/bin:$PATH"' >> /root/.bashrc && \
    ln -sf /root/.bun/bin/bun /usr/local/bin/bun || true

# Install Deno (optional - will be retried at runtime if network fails)
ARG DENO_VERSION=2.8.1
RUN curl -fsSL https://deno.land/install.sh | DENO_INSTALL=/usr/local sh -s -- "v${DENO_VERSION}" 2>/dev/null || \
    echo "⚠️  Deno installation deferred (network unavailable - will retry at first run)"

# Install yt-dlp (optional - will be retried at runtime if network fails)
RUN curl -fsSL https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp 2>/dev/null && \
    chmod a+rx /usr/local/bin/yt-dlp || \
    echo "⚠️  yt-dlp installation deferred (network unavailable - will retry at first run)"

# Create app directory
WORKDIR /workspace

# Set up PATH for Bun
ENV PATH="/root/.bun/bin:$PATH"
