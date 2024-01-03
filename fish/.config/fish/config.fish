if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting
    alias ssh-github="ssh-add $HOME/.ssh/github"

    # Git aliases
    alias ga="git add"
    alias gb="git branch"
    alias gc="git clone"
    alias gd="git diff"
    alias gi="git init"
    alias gl="git log"
    alias gm="git merge"
    alias gr="git reset"
    alias gs="git status"
    alias gcm="git commit"
    alias gco="git checkout"
    alias gcp="git cherry-pick"
    alias gmv="git mv"
    alias grb="git rebase"
    alias grm="git rm"
    alias grs="git restore"
    alias gpull="git pull"
    alias gpush="git push"
    alias gfetch="git fetch"
end
