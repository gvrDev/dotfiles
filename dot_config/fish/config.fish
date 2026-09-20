set -g fish_greeting

fish_add_path -g ~/.local/bin ~/.local/lib ~/go/bin ~/.cargo/bin ~/.local/share/mise/shims ~/.npm-global/bin ~/.bun/bin
fish_add_path -a /home/linuxbrew/.linuxbrew/bin

if status is-interactive
    set -gx SHELL fish
    set -gx EDITOR nvim
    set -g fish_key_bindings fish_vi_key_bindings
    set fish_cursor_default block
    set fish_cursor_insert block
    set fish_cursor_replace_one block
    set fish_cursor_visual block

    bind -M insert \cf accept-autosuggestion

    zoxide init fish | source
    fzf --fish | source
end
