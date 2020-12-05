printf '\33c\e[3J'

export EDITOR=code-exploration
export HOMEBREW_NO_AUTO_UPDATE=1
export PATH=./node_modules/.bin:$HOME/bin:/usr/local/bin:$PATH

alias clean="rm -rf node_modules"
alias code="$EDITOR"
alias mongo="mongod --config /usr/local/etc/mongod.conf"

PROMPT="\$ "
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

unsetopt PROMPT_SP
