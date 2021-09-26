# GitHub VS Code Development Containers

<!-- markdownlint-disable-next-line MD036 -->
_Development containers for simultaneous use with VS Code and GitHub Actions_

- [Containers](#containers)
  - [`github-devcontainer/base`](#github-devcontainerbase)
  - [`github-devcontainer/homebrew`](#github-devcontainerhomebrew)

## Containers

### `github-devcontainer/base`

This [github-devcontainer/base][base] container is based on the
[Ubuntu][ubuntu] development container provided by [Visual Studio Code][vscode]
(VS Code) and has the usual `vscode` user with passwordless `sudo` privileges.

In addition, this container has a `runner` user with no `sudo` privileges. You
can use this setup to run [GitHub Actions][actions] workflow [jobs][job] inside
the same container you use for development without the need to to configure any
special permissions for the [GitHub-hosted runner][runner].

For example:

```yaml
jobs:
  example:
    runs-on: ubuntu-latest
    container:
      image: ghcr.io/bottle-garden/devcontainer/base:main
      options: --user runner
```

The GitHub-hosted runner will execute any subsequent [steps][steps] in this
`example` job as the `runner` user.

### `github-devcontainer/homebrew`

The [github-devcontainer/homebrew][homebrew] container is based on the
[github-devcontainer/base][base] container and comes with a full
[Homebrew][brew] installation.

[actions]: https://docs.github.com/en/actions
[base]: https://github.com/orgs/bottle-garden/packages/container/package/github-devcontainer%2Fbase
[container]: https://docs.github.com/en/actions/learn-github-actions/workflow-syntax-for-github-actions#jobsjob_idcontainer
[devcontainer]: https://code.visualstudio.com/docs/remote/containers
[homebrew]: https://github.com/orgs/bottle-garden/packages/container/package/github-devcontainer%2Fhomebrew
[job]: https://docs.github.com/en/actions/learn-github-actions/workflow-syntax-for-github-actions#jobsjob_id
[runner]: https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners
[steps]: https://docs.github.com/en/actions/learn-github-actions/workflow-syntax-for-github-actions#jobsjob_idsteps
[ubuntu]: https://github.com/microsoft/vscode-dev-containers/tree/main/containers/ubuntu
[vscode]: https://code.visualstudio.com/
[brew]: https://brew.sh/