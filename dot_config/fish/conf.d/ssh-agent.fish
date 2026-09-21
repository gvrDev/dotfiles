# Ensure SSH_AUTH_SOCK points to the systemd user socket if not inherited yet
if test -z "$SSH_AUTH_SOCK" -a -S "$XDG_RUNTIME_DIR/ssh-agent.socket"
    set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
end

# Interactively unlock keys once per 8h window
if status is-interactive
    if test -f "$HOME/.ssh/skey"
        set -l skey_pub "$HOME/.ssh/skey.pub"
        if test -f "$skey_pub"
            set -l key_data (awk '{print $2}' "$skey_pub" 2>/dev/null)
            if not ssh-add -L 2>/dev/null | grep -q -F "$key_data"
                ssh-add -t 8h "$HOME/.ssh/skey" "$HOME/.ssh/github" 2>/dev/null
            end
        else if not ssh-add -l 2>/dev/null | grep -q "skey"
            ssh-add -t 8h "$HOME/.ssh/skey" "$HOME/.ssh/github" 2>/dev/null
        end
    end
end
