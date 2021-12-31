FROM nomiro/devcontainers:build-go

# Avoid installing Rust and compiling from source, which pulls in a lot of
# dependencies and takes a lot of time

ENV MISSPELL_BIN="misspell"
ENV MISSPELL_PKG="${MISSPELL_BIN}_0.3.4_linux_64bit"
ENV MISSPELL_TGZ="${MISSPELL_PKG}.tar.gz"
ENV MISSPELL_URL="https://git.io/JDvms"
RUN curl -fsSL "${MISSPELL_URL}" >"${MISSPELL_TGZ}" && \
    tar -xzf "${MISSPELL_TGZ}" && \
    chmod 755 "${MISSPELL_BIN}" && \
    mv "${MISSPELL_BIN}" /usr/local/bin

# Timestamp: 1640929891
