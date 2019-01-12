# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory
# Expire duplicate entries first when trimming history
setopt HIST_EXPIRE_DUPS_FIRST
# Do not record an entry that was just recorded again
setopt HIST_IGNORE_DUPS
# Delete old recorded entry if new entry is a duplicate
setopt HIST_IGNORE_ALL_DUPS
# Do not display a line previously found
setopt HIST_FIND_NO_DUPS
# Do not record an entry starting with a space
setopt HIST_IGNORE_SPACE
# Do not write duplicate entries in the history file
setopt HIST_SAVE_NO_DUPS
# Remove superfluous blanks before recording entry
setopt HIST_REDUCE_BLANKS
unsetopt autocd beep extendedglob nomatch notify

# Custom
bindkey -e
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/hatanlinh13/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"
#ZSH_THEME="hyperzsh-mod"

# Spaceship theme specific settings
if [[ "$ZSH_THEME" == "spaceship" ]]
then
	SPACESHIP_PROMPT_ORDER=(
		dir           # Current directory section
		jobs          # Background jobs indicator
		line_sep      # Line break
		char          # Prompt character
	)

	SPACESHIP_RPROMPT_ORDER=(
		git_status
		git_branch
		user          # Username section
	)

	SPACESHIP_PROMPT_ADD_NEWLINE=false
	SPACESHIP_PROMPT_SEPARATE_LINE=false
	SPACESHIP_PROMPT_DEFAULT_PREFIX=""
	SPACESHIP_PROMPT_DEFAULT_SUFFIX=""

	SPACESHIP_CHAR_PREFIX=" "
	SPACESHIP_CHAR_SUFFIX=""
	SPACESHIP_CHAR_COLOR_SUCCESS=yellow
	SPACESHIP_CHAR_COLOR_FAILURE=red
	SPACESHIP_CHAR_COLOR_SECONDARY=green
	
	SPACESHIP_USER_SHOW=always
	SPACESHIP_USER_COLOR=green
	SPACESHIP_USER_PREFIX="  "
	SPACESHIP_USER_SUFFIX=""

	SPACESHIP_DIR_COLOR=blue
	SPACESHIP_DIR_TRUNC_PREFIX=".../"

	SPACESHIP_JOBS_PREFIX=" "
	SPACESHIP_JOBS_SUFFIX=""
	SPACESHIP_JOBS_COLOR=red
	SPACESHIP_JOBS_AMOUNT_THRESHOLD=1

	SPACESHIP_GIT_BRANCH_PREFIX=" \ue0a0 "
fi

# Tmux autostart
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=false

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git tmux)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Add fuzzy like completion to zsh
# 0 -- vanilla completion (abc => abc)
# 1 -- smart case completion (abc => Abc)
# 2 -- word flex completion (abc => A-big-Car)
# 3 -- full flex completion (abc => ABraCadabra)
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'

# disable ctrl-q and ctrl-s
stty -ixon
# force tmux to use 256 colors
alias tmux="tmux -2"
