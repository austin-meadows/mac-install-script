export HOMEBREW_AUTOREMOVE=1
export HOMEBREW_INSTALL_FROM_API=1
export HOMEBREW_NO_COMPAT=1
export HOMEBREW_NO_ENV_HINTS=1
export PNPM_HOME="$HOME/.pnpm"
export PATH="$PNPM_HOME:$PATH"
HISTSIZE=10
SAVEHIST=0

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(fnm env --use-on-cd)"

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit -i
fi

alias bu="brew update && brew upgrade && brew cleanup"
alias bf="sudo chgrp -R brew $(brew --prefix)/*;sudo chmod -R g+w $(brew --prefix)/*"
alias p="pnpm"
alias px="pnpm exec"

cd $HOME/Developer
