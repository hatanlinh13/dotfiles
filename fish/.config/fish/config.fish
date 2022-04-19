if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting
    set SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
	alias vim="nvim"
    # startx at login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end
