fish_add_path ~/.local/bin
fish_add_path ~/scripts
fish_add_path ~/go/bin

if test (uname -s) = 'Darwin'
    set -x JAVA_HOME (/usr/libexec/java_home -v 17)
    set -x ANDROID_HOME $HOME/Library/Android/sdk

    fish_add_path /opt/homebrew/bin
    fish_add_path /opt/homebrew/opt/ruby@3.3/bin
    fish_add_path /opt/homebrew/lib/ruby/gems/3.3.0/bin
    fish_add_path $ANDROID_HOME/platform-tools
else
    fish_add_path ~/Android/Sdk/platform-tools

    alias update="run0 sh -c 'pacman -Syu && flatpak update && flatpak repair'"
end

alias c="clear"
alias l='ls -a'
alias ll='ls -la'

alias v="nvim ."
alias mkdir="mkdir -pv"

alias dcs="docker ps -aq | xargs docker stop"
alias dcc="docker image ls -q | xargs -I {} docker image rm -f {}"
alias dcu="docker-compose up"

alias gfa="git fetch --all && git pull"

if status is-interactive
    set -lx SHELL fish
    set fish_cursor_default block
    set fish_cursor_insert block
    set fish_cursor_replace_one block 
    set fish_cursor_visual block
    keychain --eval --agents ssh -q -Q github skey | source
    if not set -q TMUX
      tmux new -A -s homebase
    end

    fzf --fish | source
    zoxide init fish | source
    starship init fish | source
    fish_vi_key_bindings
    bind -M insert \cf accept-autosuggestion
end

if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
# asdf end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
# bun end

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
