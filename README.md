# GitHub VS Code Development Container

_[VS Code][vscode] [devcontainer][devcontainer] designed to work with [GitHub Codespaces][codespaces] and [GitHub Actions][actions]_

## Tags

### Universal

The `universal` tag includes the following pre-installed software:

- Git
  - [GitHub CLI][gh] (`gh`)
- Formatting
  - [EditorConfig][editorconfig] (`editorconfig`)
  - [Prettier][prettier] (`prettier`)
- Docker
  - [Linter and validator for Dockerfile][dockerfilelint] (`dockerfilelint`)
- Shell scripts
  - [ShellCheck][shellcheck] (`shellcheck`)
- Markdown
  - [MarkdownLint CLI][markdownlint-cli] (`markdownlint`)
  - [markdown-link-check][ markdown-link-check] (`markdown-link-check`)
- Natural language
  - [CSpell][cspell] (`cspell`)
  - [woke][woke] (`woke`)

[act]: https://github.com/nektos/act
[actions]: https://docs.github.com/en/actions
[codespaces]: https://github.com/features/codespaces
[cspell]: https://streetsidesoftware.github.io/cspell/
[devcontainer]: https://code.visualstudio.com/docs/remote/containers
[dockerfilelint]: https://github.com/replicatedhq/dockerfilelint
[editorconfig]: https://editorconfig.org/
[gh]: https://github.com/cli/cli
[markdown-link-check]: https://github.com/tcort/markdown-link-check
[markdownlint-cli]: https://github.com/igorshubovych/markdownlint-cli
[prettier]: https://prettier.io/
[shellcheck]: https://www.shellcheck.net/
[universal]: https://github.com/bottle-garden/gh-vscode/pkgs/container/gh-vscode/universal
[vscode]: https://code.visualstudio.com/
[woke]: https://getwoke.tech/
