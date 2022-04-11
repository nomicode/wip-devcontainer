.PHONY: init
init:

NODESOURCE_SETUP = https://deb.nodesource.com/setup_current.x

init: nodesource-setup.sh
vendor/nodesource-setup.sh:
	mkdir -p $(dir $@)
	curl -sSL $(NODESOURCE_SETUP) >$@
	chmod +x $@

.PHONY: clean
clean:
	rm -rf vendor
