GH_RAW = https://raw.githubusercontent.com
NODESOURCE_SETUP = https://deb.nodesource.com/setup_current.x
GET_POETRY = $(GH_RAW)/python-poetry/poetry/master/get-poetry.py

.PHONY: init
init:

vendor:
	mkdir -p $@

init: vendor/get-poetry.py
vendor/get-poetry.py: vendor
	curl -sSL $(GET_POETRY) >$@
	chmod +x $@


init: vendor/nodesource-setup.sh
vendor/nodesource-setup.sh: vendor
	curl -sSL $(NODESOURCE_SETUP) >$@
	chmod +x $@

.PHONY: clean
clean:
	rm -rf vendor
