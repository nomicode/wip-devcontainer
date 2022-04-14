.EXPORT_ALL_VARIABLES:

.DEFAULT_GOAL = all

LOG_FILE = make.log

# Clear the log
$(shell echo >$(LOG_FILE))

PREFIX = /opt

NODESOURCE_SETUP=https://deb.nodesource.com/setup_current.x

nodesource-setup:
	curl -sSL $(NODESOURCE_SETUP) | bash - >>$(LOG_FILE)

DEBIAN_FRONTEND=noninteractive

define APT_PACKAGES
	bandit
	bash-completion
	black
	codespell
	cronic
	fd-find
	fdupes
	file
	flake8
	imagemagick
	isort
	make
	moreutils
	nodejs
	optipng
	pandoc
	pydocstyle
	pylint
	python3-docutils
	python3-proselint
	python3-pyroma
	shellcheck
	silversearcher-ag
	tidy
	tree
	util-linux
	vulture
	yamllint
endef

APT_GET_INSTALL = apt-get install -y --no-install-recommends

# $(call apt_get_install_packages, packages)
define apt_install
	apt-get update >>$(LOG_FILE)
	$(APT_GET_INSTALL) $(strip $(1)) >>$(LOG_FILE)
	apt-get clean -y
	rm -rf /var/lib/apt/lists/*
endef

apt-install: nodesource-setup
	$(call apt_install, $(APT_PACKAGES))

apt: apt-install

define NPM_PACKAGES
	@textlint-rule/textlint-rule-no-unmatched-pair
	@textlint-rule/textlint-rule-proselint
	cspell
	dockerfilelint
	jscpd
	lintspaces-cli
	markdown-link-check
	markdownlint-cli
	prettier
	strip-ansi-cli
	textlint
	textlint-filter-rule-allowlist
	textlint-filter-rule-comments
	textlint-filter-rule-node-types
	textlint-rule-alex
	textlint-rule-doubled-spaces
	textlint-rule-en-capitalization
	textlint-rule-en-max-word-count
	textlint-rule-no-empty-section
	textlint-rule-no-todo
	textlint-rule-rousseau
	textlint-rule-stop-words
	textlint-rule-terminology
	textlint-rule-unexpanded-acronym
	textlint-rule-write-good
endef

npm-install: apt
	npm update >>$(LOG_FILE) 2>&1
	npm install --prefer-dedupe $(strip $(NPM_PACKAGES)) >>$(LOG_FILE) 2>&1
	rm -rf $(PREFIX)/npm
	mkdir -p $(PREFIX)/npm
	mv node_modules $(PREFIX)/npm
	ln -s $(PREFIX)/npm/node_modules/bin $(PREFIX)/npm/bin

npm: npm-install

PIPX_HOME = $(PREFIX)/pipx
PIPX_BIN_DIR = $(PREFIX)/pipx/bin
# Silence warning about `PIPX_BIN_DIR` not being on the `PATH`
PATH := $(PIPX_BIN_DIR):$(PATH)

define PIPX_PACKAGES
	poetry
endef

define PIPX_APT_DEPS
	python3-venv
	pipx
endef

pipx-install:
	$(call apt_install, $(PIPX_APT_DEPS))
	pipx install --force $(strip $(PIPX_PACKAGES)) >>$(LOG_FILE)

pipx: pipx-install

GO_VERSION = 1.18.1
GO_TGZ = go$(GO_VERSION).linux-amd64.tar.gz
GO_URL = https://go.dev/dl/$(GO_TGZ)

GO_DIST = go/dist
GO_WORKSPACE = go/workspace
GOROOT = $(abspath $(GO_DIST))
GOPATH = $(abspath $(GO_WORKSPACE))
GOBIN = $(PREFIX)/go/bin

go-setup:
	wget -q $(GO_URL) -O $(GO_TGZ)
	mkdir -p $(GO_DIST)
	tar -xzf $(GO_TGZ) --strip-components=1 -C $(GO_DIST)
	chmod 755 $(GO_DIST)/bin/go

EC = editorconfig-checker

define GO_PACKAGES
	github.com/$(EC)/$(EC)/cmd/$(EC)@latest
	github.com/client9/misspell/cmd/misspell@latest
	github.com/errata-ai/vale@latest
	github.com/rif/imgdup2go@latest
	mvdan.cc/sh/v3/cmd/shfmt@latest
endef

go-install: go-setup
	echo $(strip $(GO_PACKAGES)) | xargs -n 1 $(GO_DIST)/bin/go install >>$(LOG_FILE) 2>&1

go: go-install

all: apt npm pipx
