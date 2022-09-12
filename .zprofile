eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(fnm env --use-on-cd)"

EDITOR=code
SHELL_SESSIONS_DISABLE=1

alias clean="rm -rf ~/.npm"
alias dev='f(){cd "$HOME/Developer/$1"};f'
