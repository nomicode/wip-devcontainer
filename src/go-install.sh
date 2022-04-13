#!/bin/sh -e

GO_VERSION=1.18.1
GO_TGZ="go${GO_VERSION}.linux-amd64.tar.gz"
GO_URL="https://go.dev/dl/${GO_TGZ}"

GOBIN=/opt/go/bin
export GOBIN

wget -q "${GO_URL}"
tar -xzf "${GO_TGZ}"
chmod 755 go/bin/go

xargs -n 1 ./go/bin/go install <<EOF
mvdan.cc/sh/v3/cmd/shfmt@latest
EOF
