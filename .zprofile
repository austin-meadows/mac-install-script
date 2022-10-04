eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(fnm env --use-on-cd)"

export SHELL_SESSIONS_DISABLE=1
export HOMEBREW_AUTOREMOVE=1
export HOMEBREW_NO_COMPAT=1
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_INSTALL_FROM_API=0
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
export EDITOR=code
