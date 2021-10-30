include common.mk

Brewfile.lock.json: Brewfile
	$(call sh,brew bundle --file $<)

brew: Brewfile.lock.json

brew-clean:
	$(call sh,rm -f Brewfile.lock.json)

package-lock.json: brew
package-lock.json: package.json
	$(call sh,npm install --global npm@latest)
	$(call sh,npm install --global --prefer-dedupe)
	$(call sh,npm install --package-lock-only > /dev/null)

npm: package-lock.json

npm-clean:
	$(call sh,rm -f package-lock.json)

install.stamp: brew
	$(call sh,touch $@)

.PHONY: install # Install the necessary software packages
install: install.stamp

install-clean:
	$(call sh,rm -f install.stamp)

.PHONY: clean # Reset the Make cache
clean: brew-clean npm-clean install-clean
