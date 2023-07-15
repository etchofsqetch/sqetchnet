#!/bin/sh
#PS1="%Fg{red}%*%fg%Fg{cyan}]%n[%fg%Fg{magenta}%1~%fg%Fg{cyan}]%fg%Fg{normal}%fg %# "
PS1="\e[33m\]\t\e[36m\]]\u[\e[034m\]\W\e[36m\]]\e[m\] \\$ "

alias vi="vim"
alias ls="ls --color=always -AF"
alias l="ls --color=always -AFhls"
alias ll="ls --color=always -AFhls"
alias up="cd .. && ls --color=always -AFhls"
alias uu="cd ../.. && ls --color=always -AFhls"
alias uuu="cd ../../.. && ls --color=always -AFhls"
alias upup="cd ../../../.. && ls --color=always -AFhls"
alias gor="cd /var/root && ls --color=always -AFhls"
alias golog="cd /var/log && ls --color=always -AFhls"
alias gow="cd /var/www/html && ls --color=always -AFhls"
alias chl="cat >> /Users/etch/bin/notes\ commands\ etc\ sqtch << END"

go() {
	ls --color=always -AFhls "$1"; cd "$1";
}

#sqtch() {
#	touch /Users/etch/bin/"$1"; cat >> /Users/etch/bin/"$1" << END;
#}
