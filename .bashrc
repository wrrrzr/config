#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias pysrc='source venv/bin/activate'
alias senv='source .env'
alias neo='ssh neo@192.168.192.125'
export PATH=~/.local/bin:$PATH
PS1='\u@\h:\w\$ '
