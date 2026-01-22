set -x npm_config_prefix "$HOME/.local"
set --export BUN_INSTALL "$HOME/.bun"
set -gx PNPM_HOME "$HOME/.local/share/pnpm"

set --export PATH $BUN_INSTALL/bin $PNPM_HOME $PATH
