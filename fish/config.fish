if status is-interactive
  set -lx SHELL fish
  keychain --eval --agents ssh --quiet -Q github skey | source
end

fish_add_path ~/.go/bin
fish_add_path ~/.bun/bin
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin

starship init fish | source
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
set -gx XDG_CURRENT_DESKTOP "Sway"
