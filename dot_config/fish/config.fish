fish_add_path -g ~/.local/bin ~/.local/lib ~/scripts ~/go/bin ~/.config/emacs/bin /opt/nvim-linux-x86_64/bin ~/.cargo/bin /home/linuxbrew/.linuxbrew/bin

alias mkdir="mkdir -pv"
alias m="make"

alias dcs="docker ps -aq | xargs docker stop"
alias dcc="docker image ls -q | xargs -I {} docker image rm -f {}"
alias dcu="docker compose up"
alias dcd="docker compose down"

if status is-interactive
   set -gx SHELL fish
   set -gx EDITOR nvim
   set fish_cursor_default block
   set fish_cursor_insert block
   set fish_cursor_replace_one block 
   set fish_cursor_visual block
   keychain --eval -q -Q ~/.ssh/github ~/.ssh/skey ~/.ssh/codeberg | source

   fish_vi_key_bindings
   bind -M insert \cf accept-autosuggestion
end
