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

PATH="/home/newuser/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/newuser/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/newuser/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/newuser/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/newuser/perl5"; export PERL_MM_OPT;
