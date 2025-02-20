#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias pysrc='source venv/bin/activate'
alias senv='source .env'
alias neo='ssh neo@neo'
alias neos='scp -r src/ neo@neo:/home/neo/tgsd/'
export PATH=~/.local/bin:$PATH
export EDITOR=vim
PS1='\u@\h:\w\$ '
