printf '\33c\e[3J'

export EDITOR=code
export HOMEBREW_NO_AUTO_UPDATE=1
export VOLTA_HOME=$HOME/.volta

export PATH=/opt/homebrew/bin:./node_modules/.bin:$VOLTA_HOME/bin:$PATH

PROMPT="\$ "
