# Basic options
# =============
export HISTCONTROL=ignoredups
export COLORFGBG='default;default'

# Aliases
# =======

# Basic aliases
# -------------
alias ls='ls -h --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias tree='tree -C'
alias tmux='tmux -2'
alias vom='vim'

# Accessing my public
# -------------------
alias pub='cd ~/../../public/carreau'
alias chpub='chmod -R 775 ~/../../public/carreau/*'

# VIM related stuff
# -----------------
alias vimdot='vim ~/.vim/rcfiles'
# source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh" # conflict with scp

# Convert all EPS files to PDF in the current directory
# -----------------------------------------------------
alias etp='find . -name "*.eps" -exec epstopdf {} ";" && rm *.eps'
alias etpf='find . -name "*.eps" -exec epstopdf {} ";" && rm -f *.eps'

# SSH
# ---
alias lab='ssh -X carreau@caeubuntu.in2p3.fr'

# NSEoS related stuff
# -------------------
alias getnseos='git clone https://github.com/thomascarreau/NSEoS'
alias lib='cd ~/NSEoS/source/nseos'
alias bayes='cd ~/NSEoS/source/apps/bayesian_analysis'

# Prompt
# ======
PS1='\[\e[01;34m\][\u\[\e[36m\]@\h\[\e[34m]\] \[\e[30m\]\w\[\e[33m\] > \[\e[m\]'
