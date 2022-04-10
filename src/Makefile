.EXPORT_ALL_VARIABLES:

.DEFAULT_GOAL = all

LOG_FILE = make.log
LOG_OUT = >>$(LOG_FILE) 2>&1

# Clear the log
$(shell echo >$(LOG_FILE))

PREFIX = /usr/local
BIN_DIR = $(PREFIX)/bin
PATH := $(PREFIX)/bin:$(PATH)

# =============================================================================

GH_PACKAGES_URL = https://cli.github.com/packages
GH_KEYRING = githubcli-archive-keyring.gpg
GH_APT_SOURCE = deb $(GH_PACKAGES_URL) stable main
GH_APT_LIST = /etc/apt/sources.list.d/github-cli.list
APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE = 1

gh-setup:
	curl -fsSL $(GH_PACKAGES_URL)/$(GH_KEYRING) | apt-key add $(LOG_OUT)
	echo $(GH_APT_SOURCE) >$(GH_APT_LIST)

NODESOURCE_SETUP = https://deb.nodesource.com/setup_current.x

nodesource-setup:
	curl -sSL $(NODESOURCE_SETUP) | bash - $(LOG_OUT)

DEBIAN_FRONTEND = noninteractive

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
	gh
	isort
	moreutils
	nodejs
	optipng
	pipx
	pydocstyle
	pylint
	python3-docutils
	python3-proselint
	python3-pyroma
	python3-venv
	shellcheck
	silversearcher-ag
	tree
	util-linux
	vulture
	yamllint
endef

APT_ARGS = -y --no-install-recommends

all: apt-install
apt-install: gh-setup nodesource-setup
	apt-get update $(LOG_OUT)
	apt-get install $(APT_ARGS) $(strip $(APT_PACKAGES)) $(LOG_OUT)
	apt-get clean -y
	rm -rf /var/lib/apt/lists/*

# =============================================================================

define NPM_PACKAGES
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
	textlint-rule-doubled-spaces
	textlint-rule-en-capitalization
	textlint-rule-en-max-word-count
	textlint-rule-no-empty-section
	textlint-rule-no-start-duplicated-conjunction
	textlint-rule-rousseau
	textlint-rule-stop-words
	textlint-rule-terminology
	textlint-rule-unexpanded-acronym
endef

NPM_ARGS = --global --prefer-dedupe

all: npm-install
npm-install: apt-install
	npm update $(LOG_REDIRECT)
	npm install $(NPM_ARGS) $(strip $(NPM_PACKAGES)) $(LOG_OUT)

# =============================================================================

PIPX_HOME = /opt/pipx
PIPX_BIN_DIR = $(PREFIX)/bin

all: pipx-install
pipx-install: apt-install
	pipx install poetry $(LOG_OUT)

# =============================================================================

DOWNLOAD_DIR = downloads

# $(call install_gh_release,repo,file)
define install_gh_release
	gh release -R $(1) download -p $(2) -D $(DOWNLOAD_DIR)
	tar -xzf $(DOWNLOAD_DIR)/$(2) -C $(DOWNLOAD_DIR)
	mv $(DOWNLOAD_DIR)/$@ $(BIN_DIR)/$@
endef

MISSPELL_REPO = github.com/client9/misspell
MISSPELL_FILE = misspell_*_linux_64bit.tar.gz

all: misspell
misspell:
	$(call install_gh_release,$(MISSPELL_REPO),$(MISSPELL_FILE))


IMGDUP_REPO = github.com/rif/imgdup2go
IMGDUP_FILE = imgdup2go_*_linux_amd64.tar.gz

all: imgdup2go
imgdup2go:
	$(call install_gh_release,$(IMGDUP_REPO),$(IMGDUP_FILE))

BROK_REPO = github.com/smallhadroncollider/brok
BROK_FILE = brok-*_x86-64-linux.tar.gz

all: brok
brok:
	$(call install_gh_release,$(BROK_REPO),$(BROK_FILE))

# =============================================================================

# explore docker images and test their efficiency
# https://github.com/wagoodman/dive
