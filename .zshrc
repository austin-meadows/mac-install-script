printf '\33c\e[3J'

export EDITOR=code
export HOMEBREW_NO_AUTO_UPDATE=1
export PATH=./node_modules/.bin:$HOME/bin:/usr/local/bin:$PATH

alias clean="rm -rf node_modules"

function random_emoji {
  echo -n "$EMOJI[$RANDOM%$#EMOJI+1]"
}
PROMPT="\$ "

unsetopt PROMPT_SP
