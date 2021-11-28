FROM mcr.microsoft.com/vscode/devcontainers/base:alpine

ENV GOPATH="/usr/local/go"
ENV PATH="/usr/local/go/bin:${PATH}"

COPY * /tmp/
# RUN make clean && make install
RUN ash /tmp/setup.sh
