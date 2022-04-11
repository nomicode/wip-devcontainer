GH_RAW = https://raw.githubusercontent.com
MS_VSCODE_DEVCONTAINERS = microsoft/vscode-dev-containers
COMMON_DEBIAN = main/script-library/common-debian.sh

.PHONY: init
init:

init: vendor/common-debian.sh
vendor/common-debian.sh:
	mkdir -p $(dir $@)
	curl -sSL $(GH_RAW)/$(MS_VSCODE_DEVCONTAINERS)/$(COMMON_DEBIAN) >$@
	sed -i 's,liblttng-ust0,liblttng-ust1,' $@
	chmod +x $@

# NodeSource does not support Ubuntu development releases
#
# NODESOURCE_SETUP = https://deb.nodesource.com/setup_current.x
#
# init: nodesource-setup.sh
# vendor/nodesource-setup.sh:
# 	mkdir -p $(dir $@)
# 	curl -sSL $(NODESOURCE_SETUP) >$@
# 	chmod +x $@

clean:
	rm -rf vendor
