PS1=$'\e[0;02m%n@%m %1d %# \e[0m'
HISTSIZE=20
SAVEHIST=0

if type brew &>/dev/null
then
  export FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi

alias bu="brew update && brew upgrade && brew cleanup"
alias p="pnpm"
alias px="pnpm exec"

cd $HOME/Developer
