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

The purpose of this container is to provide an identical environment for
[Visual Studio Code][vscode] (VS Code) and [GitHub Actions][actions] workflows.

This [vscode/gh][gh] container is based on the stock VS Code [Ubuntu][ubuntu]
development container and provides the usual `vscode` user account with
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

> **Note:**&nbsp;&nbsp;📝
>
> After removing the Homebrew repository, you will no longer be able to use
> Homebrew to install any more packages inside your container.

### `vscode/gh/brew/devtools`

The [vscode/gh/brew/devtools][devtools] container is based on the
[vscode/gh/brew][brew] container and uses Homebrew to install the following
development tools:

- foo

## Notes

### Dependency versions

The [Haskell Dockerfile Linter][hadolint] (`hadolint`) lint recommends
([DL3008][DL3008]) that container dependencies should be pinned to a specific
version. However, these development containers are designed to pull the latest
version of each dependency.

Because these containers are designed not for development environments, the
builds do not have to produce consistent results. All that matters is that once
published, each containers provides an identical environment for VS Code and
GitHub Actions.

<!-- Link references, sorted alphabetically ascending -->

[actions]: https://docs.github.com/en/actions
[brew]: https://github.com/orgs/bottle-garden/packages/container/package/vscode%2Fgh%2Fbrew
[container]: https://docs.github.com/en/actions/learn-github-actions/workflow-syntax-for-github-actions#jobsjob_idcontainer
[devcontainer]: https://code.visualstudio.com/docs/remote/containers
[devtools]: https://github.com/orgs/bottle-garden/packages/container/package/vscode%2Fgh%2Fbrew%2Fdevtools
[DL3008]: https://github.com/hadolint/hadolint/wiki/DL3008
[gh]: https://github.com/orgs/bottle-garden/packages/container/package/vscode%2Fgh
[hadolint]: https://github.com/hadolint/hadolint
[homebrew]: https://brew.sh/
[job]: https://docs.github.com/en/actions/learn-github-actions/workflow-syntax-for-github-actions#jobsjob_id
[runner]: https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners
[steps]: https://docs.github.com/en/actions/learn-github-actions/workflow-syntax-for-github-actions#jobsjob_idsteps
[ubuntu]: https://github.com/microsoft/vscode-dev-containers/tree/main/containers/ubuntu
[vscode]: https://code.visualstudio.com/
