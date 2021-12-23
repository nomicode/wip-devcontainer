
.PHONY: stamp-all
stamp-all:
	@ find src -type f -name 'Dockerfile' | while read -r file; do \
		tmp_file="$$(mktemp)"; \
		head -n -1 "$$file" >"$${tmp_file}"; \
		echo "# Timestamp: $$(date +%s)" >>"$${tmp_file}"; \
		mv "$${tmp_file}" "$${file}"; \
		echo "Stamped: $${file}"; \
	done

.PHONY: yamlliny
yamllint:
	@ yamllint .

.PHONY: actionlint
actionlint:
	@ actionlint

.PHONY: lint
lint: yamllint actionlint
