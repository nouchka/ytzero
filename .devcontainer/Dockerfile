FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

# Install essential development tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    unzip \
    python3 \
    python3-pip \
    ffmpeg \
    git-core \
    && rm -rf /var/lib/apt/lists/*

# Install Bun
RUN curl -fsSL https://bun.sh/install | bash && \
    ln -s ~/.bun/bin/bun /usr/local/bin/bun

# Install Deno
ARG DENO_VERSION=2.8.1
RUN curl -fsSL https://deno.land/install.sh | DENO_INSTALL=/usr/local sh -s -- "v${DENO_VERSION}"

# Install yt-dlp
RUN curl -fsSL https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp && \
    chmod a+rx /usr/local/bin/yt-dlp

# Install bgutil plugin for yt-dlp (optional but recommended)
ARG BGUTIL_VERSION=1.3.1
RUN mkdir -p /opt/ytzero/yt-dlp-plugins /opt/ytzero && \
    curl -fsSL "https://github.com/Brainicism/bgutil-ytdlp-pot-provider/releases/download/${BGUTIL_VERSION}/bgutil-ytdlp-pot-provider.zip" -o /opt/ytzero/yt-dlp-plugins/bgutil-ytdlp-pot-provider.zip && \
    curl -fsSL "https://github.com/Brainicism/bgutil-ytdlp-pot-provider/archive/refs/tags/${BGUTIL_VERSION}.tar.gz" -o /tmp/bgutil.tar.gz && \
    tar -xzf /tmp/bgutil.tar.gz -C /opt/ytzero && \
    mv "/opt/ytzero/bgutil-ytdlp-pot-provider-${BGUTIL_VERSION}" /opt/ytzero/bgutil && \
    cd /opt/ytzero/bgutil/server && deno install --allow-scripts=npm:canvas --frozen && \
    rm /tmp/bgutil.tar.gz

# Create app directory
WORKDIR /workspace
