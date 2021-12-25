FROM nomiro/devcontainers:cargo

# Avoid installing Rust and compiling from source, which pulls in a lot of
# dependencies and takes a lot of time

ENV LYCHEE_BIN="lychee"
ENV LYCHEE_PKG="${LYCHEE_BIN}-v0.8.1-x86_64-unknown-linux-musl"
ENV LYCHEE_TGZ="${LYCHEE_PKG}.tar.gz"
ENV LYCHEE_URL="https://git.io/JDvLb"
RUN curl -fsSL "${LYCHEE_URL}" >"${LYCHEE_TGZ}" && \
    tar -xzf "${LYCHEE_TGZ}" && \
    chmod 755 "${LYCHEE_BIN}" && \
    mv "${LYCHEE_BIN}" /usr/local/bin

# TODO: Look into setting GitHub token to avoid getting rate limited
# https://github.com/lycheeverse/lychee#github-token

# Timestamp: 1640390497
