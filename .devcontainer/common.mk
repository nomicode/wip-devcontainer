.EXPORT_ALL_VARIABLES:

.DEFAULT_GOAL = help

define sh
@ printf "\e[0;2m$$ %s\e[0m\n" "$1" && $1
endef

.PHONY: help # Print this help message
help:
	@ echo "Targets:"
	@ echo
	@ @grep -E '^.PHONY:' $(shell printf "%s\n" $(MAKEFILE_LIST) | tac) | \
		grep "#" | sed 's,.*: ,,' | \
		awk 'BEGIN {FS = " # "}; {printf "  make %s,%s\n", $$1, $$2}' | \
		column -t -s ',' | \
		sed -E 's,(.*make )([^ ]+)( .*),\1\x1b[0;4m\2\x1b[0m\3,'
