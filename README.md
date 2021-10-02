# GitHub Devcontainers

<!-- markdownlint-disable-next-line MD036 -->
_VS Code devcontainers designed to work with GitHub Actions_

<!-- cspell:disable -->

- [Containers](#containers)
  - [`vscode/gh`](#vscodegh)
  - [`vscode/gh/brew`](#vscodeghbrew)
  - [`vscode/gh/brew/devtools`](#vscodeghbrewdevtools)
- [Notes](#notes)
  - [Dependency versions](#dependency-versions)

<!-- cspell:enable -->

## Containers

### `vscode/gh`

The purpose of the [vscode/gh][gh] container is to provide an identical
environment for [Visual Studio Code][vscode] (VS Code) and [GitHub
Actions][actions] workflows.

This container is based on the stock VS Code [Ubuntu][ubuntu] [development
container][devcontainer] and provides the usual `vscode` user account with
passwordless `sudo` privileges.

In addition, this container adds a `runner` user account with no `sudo`
privileges.

With the `runner` user, the [GitHub-hosted runner][runner] can execute
workflow [jobs][job] inside this container without the need for privilege
escalation or the need to manually configure any permissions.

To run the [steps][steps] of job inside this container, add a
[container][container] key to your job definition, like this:

```yaml
jobs:
  example:
    runs-on: ubuntu-latest
    container:
      image: ghcr.io/bottle-garden/vscode/gh:main
      options: --user runner
```

In this example, the Github-hosted runner will execute any subsequent steps in
the `example` job as the `runner` user inside the `vscode/gh` container.

[vscode]: https://code.visualstudio.com/
[actions]: https://docs.github.com/en/actions
[gh]: https://github.com/orgs/bottle-garden/packages/container/package/vscode%2Fgh
[ubuntu]: https://github.com/microsoft/vscode-dev-containers/tree/main/containers/ubuntu
[devcontainer]: https://code.visualstudio.com/docs/remote/containers
[runner]: https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners
[job]: https://docs.github.com/en/actions/learn-github-actions/workflow-syntax-for-github-actions#jobsjob_id
[steps]: https://docs.github.com/en/actions/learn-github-actions/workflow-syntax-for-github-actions#jobsjob_idsteps
[container]: https://docs.github.com/en/actions/learn-github-actions/workflow-syntax-for-github-actions#jobsjob_idcontainer

### `vscode/gh/brew`

The [vscode/gh/brew][brew] container is based on the [vscode/gh][gh] container
and comes with a full [Homebrew][homebrew] installation. Due to the inherent
size of the Homebrew installation, this container is not intended for permanent
use with VS Code or GitHub Actions.

Instead, this container serves as an intermediary image that you can use as a
base for other images. The Homebrew installation serves as an addition to the
Ubuntu package repository, expanding the amount of packages you can install
with minimal fuss.

When using this container to build a new image, you can use `brew` in your
`Dockerfile` to install packages. After installing the packages you need, you
should remove the primary Homebrew repository to substantially reduce the size
of your final image.

You can remove the Homebrew repository in your `Dockerfile` like this:

```Dockerfile
RUN rm -rf "$(brew --repo)"
```

> 📝&nbsp;&nbsp;**Note:**
>
> After removing the Homebrew repository, you will no longer be able to use
> Homebrew to install any more packages inside your container.

[brew]: https://github.com/orgs/bottle-garden/packages/container/package/vscode%2Fgh%2Fbrew
[homebrew]: https://brew.sh/

### `vscode/gh/brew/devtools`

The [vscode/gh/brew/devtools][devtools] container is based on the
[vscode/gh/brew][brew] container installs a selection of development tools:

- Git
  - [GitHub CLI][gh] (`act`)
  - [act][act] (`act`)
- Formatting
  - [EditorConfig][editorconfig] (`editorconfig`)
  - [Prettier][prettier] (`prettier`)
- Docker
  - [Haskell Dockerfile Linter][hadolint] (`hadolint`)
  - [Linter and validator for Dockerfile][dockerfilelint] (`dockerfilelint`)
- Shell scripts
  - [ShellCheck][shellcheck] (`shellcheck`)
  - [checkbashisms][checkbashisms] (`checkbashisms`)
- Markdown
  - [MarkdownLint Command Line Interface][markdownlint-cli] (`markdown-link-check`)
  - [markdown-link-check][ markdown-link-check] (`markdown-link-check`)
- Natural language
  - [CSpell][cspell] (`cspell`)
  - [woke][woke] (`woke`)

<!--
> 📝&nbsp;&nbsp;**Note:**
>
> This container does not container a working installation of Homebrew. The
> Homebrew repository is removed to conserve image size.
-->

[act]: https://github.com/nektos/act
[checkbashisms]: https://sourceforge.net/projects/checkbaskisms/
[cspell]: https://streetsidesoftware.github.io/cspell/
[devtools]: https://github.com/orgs/bottle-garden/packages/container/package/vscode%2Fgh%2Fbrew%2Fdevtools
[dockerfilelint]: https://github.com/replicatedhq/dockerfilelint
[editorconfig]: https://editorconfig.org/
[gh]: https://github.com/cli/cli
[hadolint]: https://github.com/hadolint/hadolint
[markdown-link-check]: https://github.com/tcort/markdown-link-check
[markdownlint-cli]: https://github.com/igorshubovych/markdownlint-cli
[prettier]: https://prettier.io/
[shellcheck]: https://www.shellcheck.net/
[woke]: https://getwoke.tech/

## Notes

### Dependency pinning

The [Haskell Dockerfile Linter][hadolint] (`hadolint`) lint recommends
([DL3008][DL3008]) that container dependencies should be pinned to a specific
version. However, these development containers are designed to pull the latest
version of each dependency.

Because these containers are designed not for development environments, the
builds do not have to produce consistent results. All that matters is that once
published, each containers provides an identical environment for VS Code and
GitHub Actions.

[DL3008]: https://github.com/hadolint/hadolint/wiki/DL3008
