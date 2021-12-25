FROM nomiro/devcontainers:go

# Avoid installing Rust and compiling from source, which pulls in a lot of
# dependencies and takes a lot of time

ENV WOKE_BIN="woke"
ENV WOKE_PKG="${WOKE_BIN}-0.17.1-linux-amd64"
ENV WOKE_TGZ="${WOKE_PKG}.tar.gz"
ENV WOKE_URL="https://git.io/JDvO1"
RUN curl -fsSL "${WOKE_URL}" >"${WOKE_TGZ}" && \
    tar -xzf "${WOKE_TGZ}" && \
    chmod 755 "${WOKE_PKG}/${WOKE_BIN}" && \
    mv "${WOKE_PKG}/${WOKE_BIN}" /usr/local/bin

# Timestamp: 1640390497
