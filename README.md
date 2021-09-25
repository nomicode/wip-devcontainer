# Base Development Container

This container is derived from the [Ubuntu][ubuntu] development container
provided by [Visual Studio Code][vscode] (VS Code) and has the usual `vscode`
user with passwordless `sudo` privileges.

In addition, this container has a `runner` user with no `sudo` privileges. You
can use this to run [GitHub Actions][actions] workflow [jobs][job] inside the
same container you use for development without the need to to configure any
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

[actions]: https://docs.github.com/en/actions
[container]: https://docs.github.com/en/actions/learn-github-actions/workflow-syntax-for-github-actions#jobsjob_idcontainer
[devcontainer]: https://code.visualstudio.com/docs/remote/containers
[job]: https://docs.github.com/en/actions/learn-github-actions/workflow-syntax-for-github-actions#jobsjob_id
[runner]: https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners
[steps]: https://docs.github.com/en/actions/learn-github-actions/workflow-syntax-for-github-actions#jobsjob_idsteps
[ubuntu]: https://github.com/microsoft/vscode-dev-containers/tree/main/containers/ubuntu
[vscode]: https://code.visualstudio.com/
