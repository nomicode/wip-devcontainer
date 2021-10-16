.EXPORT_ALL_VARIABLES:

ifeq ($(shell which brew),)
BREW_PREFIX := /home/linuxbrew/.linuxbrew
PATH        := ${BREW_PREFIX}/sbin:${BREW_PREFIX}/bin:${PATH}
endif

.PHONEY: devcontainer
devcontainer:
	.devcontainer/init.sh

.PHONEY: test-sh
test-sh:
	mkdir -p build/logs
	echo "::add-matcher::.github/matchers/shellcheck-gcc.json" > \
		build/logs/shellcheck.log
	find . -type f -name '*.sh' | \
		xargs -n 1 shellcheck --format=gcc | tee -a \
		build/logs/shellcheck.log

.PHONEY: test
test: test-sh
