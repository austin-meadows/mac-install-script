printf '\33c\e[3J'

export EDITOR=code
export HOMEBREW_NO_AUTO_UPDATE=1
export PATH=/opt/homebrew/bin:./node_modules/.bin:$PATH

alias mongo="mongod --config /opt/homebrew/etc/mongod.conf"

PROMPT="\$ "

unsetopt PROMPT_SP
