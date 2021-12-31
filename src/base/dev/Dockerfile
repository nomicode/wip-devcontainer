FROM alpine:3.14

RUN groupadd docker && \
  usermod -aG docker root && \
  useradd --create-home runner && \
  usermod -aG docker runner && \
  apk update && \
  apk upgrade && \
  apk add --no-cache \
  bash \
  git

# Timestamp: 1640920142
