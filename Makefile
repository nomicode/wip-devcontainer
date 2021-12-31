
.PHONY: stamp-all
stamp-all:
	@ utils/stamp.sh

.PHONY: yamlliny
yamllint:
	@ yamllint .

.PHONY: actionlint
actionlint:
	@ actionlint

.PHONY: lint
lint: yamllint actionlint
