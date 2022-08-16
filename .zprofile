eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(fnm env --use-on-cd)"

export EDITOR=code
export FPATH="/opt/homebrew/share/zsh/site-functions:$HOME/.zsh/typewritten:${FPATH}"
export SHELL_SESSIONS_DISABLE=1

alias clean="rm -rf ~/.npm"
alias dev="cd ~/Developer"
