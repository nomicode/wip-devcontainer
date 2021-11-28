# GitHub VS Code Development Container

_[VS Code][vscode] [devcontainer][devcontainer] designed to work with [GitHub Codespaces][codespaces] and [GitHub Actions][actions]_

[vscode]: https://code.visualstudio.com/
[devcontainer]: https://code.visualstudio.com/docs/remote/containers
[codespaces]: https://github.com/features/codespaces
[actions]: https://docs.github.com/en/actions

## Tags

### Universal

The `universal` tag includes the following pre-installed software:

[universal]: https://github.com/bottle-garden/gh-vscode/pkgs/container/gh-vscode/universal

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

[gh]: https://github.com/cli/cli
[act]: https://github.com/nektos/act
[editorconfig]: https://editorconfig.org/
[prettier]: https://prettier.io/
[dockerfilelint]: https://github.com/replicatedhq/dockerfilelint
[shellcheck]: https://www.shellcheck.net/
[markdownlint-cli]: https://github.com/igorshubovych/markdownlint-cli
[markdown-link-check]: https://github.com/tcort/markdown-link-check
[cspell]: https://streetsidesoftware.github.io/cspell/
[woke]: https://getwoke.tech/
