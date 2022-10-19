eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(fnm env --use-on-cd)"

set -x --global EDITOR code
set -gx HOMEBREW_AUTOREMOVE 1
set -gx HOMEBREW_NO_COMPAT 1
set -gx HOMEBREW_NO_ENV_HINTS 1
set -gx HOMEBREW_INSTALL_FROM_API 1
set -gx PNPM_HOME "$HOME/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH

alias cdd "cd $HOME/Developer"
alias p pnpm
alias px pnpx
