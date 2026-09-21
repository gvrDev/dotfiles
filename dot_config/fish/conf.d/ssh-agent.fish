# Ensure SSH_AUTH_SOCK points to the systemd user socket if not inherited yet
if test -z "$SSH_AUTH_SOCK" -a -S "$XDG_RUNTIME_DIR/ssh-agent.socket"
    set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
end

# Interactively unlock keys once per 8h window
if status is-interactive
    if test -f "$HOME/.ssh/skey"
        # Check if the signing key is loaded; if missing, prompt once for both keys
        if not ssh-add -l 2>/dev/null | grep -q "skey"
            ssh-add -t 8h "$HOME/.ssh/skey" "$HOME/.ssh/github" 2>/dev/null
        end
    end
end
