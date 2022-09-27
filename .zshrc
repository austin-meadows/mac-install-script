FPATH="/opt/homebrew/share/zsh/site-functions:$HOME/.zsh/typewritten:${FPATH}"
HISTSIZE=0
SAVEHIST=0

autoload -Uz compinit
compinit
autoload -U promptinit; promptinit
prompt typewritten

local cddev() {
  cd "$HOME/Developer/$1"
}
local _cddev() {
  _files -/ -W "$HOME/Developer"
}
compdef _cddev cddev

alias dev="cddev $1"
alias p="pnpm"
alias px="pnpx"
