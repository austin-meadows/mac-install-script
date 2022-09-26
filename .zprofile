eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(fnm env --use-on-cd)"

alias dev='f(){cd "$HOME/Developer/$1"};f'
alias npm="pnpm"

EDITOR=code
SHELL_SESSIONS_DISABLE=1
