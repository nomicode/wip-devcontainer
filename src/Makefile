GH_RAW = https://raw.githubusercontent.com
MS_VSCODE_DEVCONTAINERS = microsoft/vscode-dev-containers
COMMON_DEBIAN = main/script-library/common-debian.sh

.PHONY: init
init:

init: vendor/common-debian.sh
vendor/common-debian.sh:
	mkdir -p $(dir $@)
	curl -sSL $(GH_RAW)/$(MS_VSCODE_DEVCONTAINERS)/$(COMMON_DEBIAN) >$@
	sed -i -r 's,^(ADD_NON_FREE_PACKAGES=.*)(false),\1true,' $@
	sed -i 's/liblttng-ust0/liblttng-ust1/' $@
	chmod +x $@

clean:
	rm -rf vendor
