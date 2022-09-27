eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(fnm env --use-on-cd)"

export SHELL_SESSIONS_DISABLE=1
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
export EDITOR=code
