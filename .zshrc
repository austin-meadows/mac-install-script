FPATH="/opt/homebrew/share/zsh/site-functions:$HOME/.zsh/typewritten:${FPATH}"
HISTSIZE=0
SAVEHIST=0

autoload -Uz compinit
compinit
autoload -U promptinit; promptinit
prompt typewritten
