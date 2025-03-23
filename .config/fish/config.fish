fish_add_path ~/.local/bin
fish_add_path ~/scripts
fish_add_path ~/Android/Sdk/platform-tools

alias c="clear"
alias l='ls -a'
alias ll='ls -la'

alias v="nvim ."
alias mkdir="mkdir -pv"
alias update="run0 sh -c 'pacman -Syu && flatpak update && flatpak repair'"

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
