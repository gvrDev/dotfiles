# Ensure SSH_AUTH_SOCK points to the systemd user socket if not inherited yet
if test -z "$SSH_AUTH_SOCK" -a -S "$XDG_RUNTIME_DIR/ssh-agent.socket"
    set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
end
