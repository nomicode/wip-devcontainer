FROM nomiro/devcontainers:base

WORKDIR /tmp
RUN apk add --no-cache \
      python3 \
      python3-dev \
      py3-pip && \
    pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir pyinstaller

# Timestamp: 1640405330
