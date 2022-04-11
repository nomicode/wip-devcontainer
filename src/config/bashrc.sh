# Aliases
alias ls='ls --color'

# Remove background colors
# eval "$(dircolors -p |
#     sed 's/ 4[0-9];/ 01;/; s/;4[0-9];/;01;/g; s/;4[0-9] /;01 /' |
#     dircolors /dev/stdin)" || true

# Git configuration
git config --global pull.rebase true
git config --global push.default current

# Bash completion
. /usr/share/bash-completion/bash_completion
