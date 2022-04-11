GH_RAW = https://raw.githubusercontent.com
MS_VSCODE_DEVCONTAINERS = microsoft/vscode-dev-containers
COMMON_DEBIAN = main/script-library/common-debian.sh

.PHONY: init
init:

GREP_ORIG=debconf: delaying package configuration
GREP_APPEND=update-alternatives: warning: skip creation

init: vendor/common-debian.sh
vendor/common-debian.sh:
	mkdir -p $(dir $@)
	curl -sSL $(GH_RAW)/$(MS_VSCODE_DEVCONTAINERS)/$(COMMON_DEBIAN) >$@
	sed -i 's,liblttng-ust0,liblttng-ust1,' $@
	sed -i -r "s,(grep -v '$(GREP_ORIG).*'),\1 | grep -v '$(GREP_APPEND)'," $@
	chmod +x $@

clean:
	rm -rf vendor
