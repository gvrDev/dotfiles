if status is-interactive
    set -lx SHELL fish
    keychain --eval --agents ssh -q -Q github skey | source
    if not set -q TMUX
      tmux new -A -t homebase
    end
end

fish_add_path ~/.go/bin
fish_add_path ~/.bun/bin
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin

starship init fish | source
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
set -gx XDG_CURRENT_DESKTOP Sway

# pnpm
set -gx PNPM_HOME "/home/gui/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
