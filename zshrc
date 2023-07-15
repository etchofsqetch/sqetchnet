#!/bin/zsh
# COMPLETIONS ZSH -------------------------------------------------------- {{{
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/Users/etch/.zshrc'

autoload -Uz compinit
compinit
source <(hugo completion zsh); compdef _hugo hugo

# End of lines added by compinstall..

# This is from some random file, so I'm commenting out the ones that are redundant..
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

#autoload -U compinit
#compinit

# allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

# keep background processes at full speed
setopt NOBGNICE
# restart running processes on exit
setopt HUP

# history
setopt APPEND_HISTORY
# for sharing history between zsh processes
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# never ever beep ever
setopt NO_BEEP

# automatically decide when to page a list of completions
LISTMAX=0

# disable mail checking
MAILCHECK=0

autoload -U colors
colors
# ------------------------------------------------------------------------ }}}

# DEFAULTS --------------------------------------------------------------- {{{
# Copied from the System-wide profile for interactive zsh(1) shells.

# Setup user specific overrides for this in ~/.zshrc. See zshbuiltins(1)
# and zshoptions(1) for more details.

# Correctly display UTF-8 with combining characters.
if [[ "$(locale LC_CTYPE)" == "UTF-8" ]]; then
    setopt COMBINING_CHARS
fi

# Disable the log builtin, so we don't conflict with /usr/bin/log
disable log

# Save command history
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=2000
SAVEHIST=1000

# Don't Beep on error
setopt NOBEEP

# Use keycodes (generated via zkbd) if present, otherwise fallback on
# values from terminfo
if [[ -r ${ZDOTDIR:-$HOME}/.zkbd/${TERM}-${VENDOR} ]] ; then
    source ${ZDOTDIR:-$HOME}/.zkbd/${TERM}-${VENDOR}
else
    typeset -g -A key

    [[ -n "$terminfo[kf1]" ]] && key[F1]=$terminfo[kf1]
    [[ -n "$terminfo[kf2]" ]] && key[F2]=$terminfo[kf2]
    [[ -n "$terminfo[kf3]" ]] && key[F3]=$terminfo[kf3]
    [[ -n "$terminfo[kf4]" ]] && key[F4]=$terminfo[kf4]
    [[ -n "$terminfo[kf5]" ]] && key[F5]=$terminfo[kf5]
    [[ -n "$terminfo[kf6]" ]] && key[F6]=$terminfo[kf6]
    [[ -n "$terminfo[kf7]" ]] && key[F7]=$terminfo[kf7]
    [[ -n "$terminfo[kf8]" ]] && key[F8]=$terminfo[kf8]
    [[ -n "$terminfo[kf9]" ]] && key[F9]=$terminfo[kf9]
    [[ -n "$terminfo[kf10]" ]] && key[F10]=$terminfo[kf10]
    [[ -n "$terminfo[kf11]" ]] && key[F11]=$terminfo[kf11]
    [[ -n "$terminfo[kf12]" ]] && key[F12]=$terminfo[kf12]
    [[ -n "$terminfo[kf13]" ]] && key[F13]=$terminfo[kf13]
    [[ -n "$terminfo[kf14]" ]] && key[F14]=$terminfo[kf14]
    [[ -n "$terminfo[kf15]" ]] && key[F15]=$terminfo[kf15]
    [[ -n "$terminfo[kf16]" ]] && key[F16]=$terminfo[kf16]
    [[ -n "$terminfo[kf17]" ]] && key[F17]=$terminfo[kf17]
    [[ -n "$terminfo[kf18]" ]] && key[F18]=$terminfo[kf18]
    [[ -n "$terminfo[kf19]" ]] && key[F19]=$terminfo[kf19]
    [[ -n "$terminfo[kf20]" ]] && key[F20]=$terminfo[kf20]
    [[ -n "$terminfo[kbs]" ]] && key[Backspace]=$terminfo[kbs]
    [[ -n "$terminfo[kich1]" ]] && key[Insert]=$terminfo[kich1]
    [[ -n "$terminfo[kdch1]" ]] && key[Delete]=$terminfo[kdch1]
    [[ -n "$terminfo[khome]" ]] && key[Home]=$terminfo[khome]
    [[ -n "$terminfo[kend]" ]] && key[End]=$terminfo[kend]
    [[ -n "$terminfo[kpp]" ]] && key[PageUp]=$terminfo[kpp]
    [[ -n "$terminfo[knp]" ]] && key[PageDown]=$terminfo[knp]
    [[ -n "$terminfo[kcuu1]" ]] && key[Up]=$terminfo[kcuu1]
    [[ -n "$terminfo[kcub1]" ]] && key[Left]=$terminfo[kcub1]
    [[ -n "$terminfo[kcud1]" ]] && key[Down]=$terminfo[kcud1]
    [[ -n "$terminfo[kcuf1]" ]] && key[Right]=$terminfo[kcuf1]
fi

# Default key bindings
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search

# Use vi commands in the prompt
set -o vi

# Useful support for interacting with Terminal.app or other terminal programs
[ -r "/etc/zshrc_$TERM_PROGRAM" ] && . "/etc/zshrc_$TERM_PROGRAM"
# ------------------------------------------------------------------------ }}}

# PERSONAL CONFIGURATIONS ------------------------------------------------ {{{
# Default Prompt
#PS1="%n@%m %1~ %# "
PS1="%F{red}%*%f%F{cyan}]%n@%m[%f%F{magenta}%1~%f%F{cyan}]%f%F{normal}%f %# "

# This is for .bashrc..
#PS1="\e[33m\]\t\e[36m\]]\u[\e[034m\]\W\e[36m\]]\e[m\]\\$ "

# Personal Aliases
alias vi="vim"
alias ls="ls --color=always -CF"
alias l="ls --color=always -AFhls"
alias ll="ls --color=always -AFhls"
alias mv="mv -i"
alias up="cd .."
alias uu="cd ../.."
alias uuu="cd ../../.."
alias upup="cd ../../../.."
alias gor="cd /var/root"
alias golog="cd /var/log"
alias gow="cd /var/www/html"
alias ssl="ssh etch@10.0.5.13"
alias ssr="ssh -p 8700 etch@sqetch.net"
alias sml="ssh etch@10.0.5.20"
alias sgsq="ssh -p 18765 u1626-zetcsmau4khi@us186.siteground.us"
alias sgki="ssh -p 18765 u916-jdd3u85afpuc@giowm1089.siteground.biz"
alias sgkr="ssh -p 18765 u1284-7ilbfragghcg@us7.siteground.us"
alias sgtmp1="ssh -p 18765 u1921-pdcw7uweultl@giowm1251.siteground.biz"
alias synq="/Users/etch/.backup"
alias 7z="/Users/etch/bin/bin/p7zip_16.02/bin/7za"
alias ms="du -sh *"
alias msfbinscan="/opt/metasploit-framework/bin/msfbinscan"
alias msfdb="/opt/metasploit-framework/bin/msfdb"
alias msfpescan="/opt/metasploit-framework/bin/msfpescan"
alias msfrpc="/opt/metasploit-framework/bin/msfrpc"
alias msfvenom="/opt/metasploit-framework/bin/msfvenom"
alias msfconsole="/opt/metasploit-framework/bin/msfconsole"
alias msfelfscan="/opt/metasploit-framework/bin/msfelfscan"
alias msfremove="/opt/metasploit-framework/bin/msfremove"
alias msfrpcd="/opt/metasploit-framework/bin/msfrpcd"
alias msfd="/opt/metasploit-framework/bin/msfd"
alias msfmachscan="/opt/metasploit-framework/bin/msfmachscan"
alias msfrop="/opt/metasploit-framework/bin/msfrop"
alias msfupdate="/opt/metasploit-framework/bin/msfupdate"

#alias mvpics="scp /Users/etch/Desktop/sitepics/* etch@10.0.5.13:sitepics/"
mvpics() {scp /Users/etch/Desktop/sitepics/* etch@10.0.5.13:sitepics/; rm /Users/etch/Desktop/sitepics/*;} 

#chl() {echo "$1" "$2" "$3" "$4" "$5" >> /Users/etch/.chlfile}
chl() {echo "$@" >> /Users/etch/.chlfile}
ncmd() {echo "$@" >> /Users/etch/bin/notes\ commands\ etc\ sqtch}
pingtest() {echo "" >> "$1"; echo "APPLE" >> "$1"; ping -c 3 apple.com >> "$1";
			echo "" >> "$1"; echo "iCLOUD" >> "$1"; ping -c 3 icloud.com >> "$1";
			echo "" >> "$1"; echo "KAHUAINSTITUTE.COM" >> "$1"; ping -c 3 kahuainstitute.com >> "$1";
			echo "" >> "$1"; echo "KAHUARECORDS.COM" >> "$1"; ping -c 3 kahuarecords.com >> "$1";
			echo "" >> "$1"; echo "MAUIECORETREAT.COM" >> "$1"; ping -c 3 mauiecoretreat.com >> "$1";
			echo "" >> "$1"; echo "KABURA.WEBSITEWELCOME.COM" >> "$1"; ping -c 3 kabura.websitewelcome.com >> "$1";
			echo "" >> "$1"; echo "SQETCH.NET" >> "$1"; ping -c 3 sqetch.net >> "$1";
			echo "" >> "$1"; echo "GOOGLE.COM" >> "$1"; ping -c 3 google.com >> "$1";
			echo "" >> "$1"; echo "FACEBOOK.COM" >> "$1"; ping -c 3 facebook.com >> "$1";
			echo "" >> "$1"; echo "TARGET.COM" >> "$1"; ping -c 3 target.com >> "$1";
			echo "" >> "$1"; echo "CLOUDFLARE.COM" >> "$1"; ping -c 3 cloudflare.com >> "$1";
			echo "" >> "$1"; cat "$1";}

resource() {source ~/.profile;}

# This will only work in zsh, or shells that have chdir.. sh doesn't have the chdir command built in..
alias cd="goto"
goto() {ls -Ahls "$1"; chdir "$1";}
# run "which go" and it will all make sense..

sbakl() {scp -rp root@10.0.5.13:/var/www/html/sqtch.net/assets /Users/etch/bin/backup/sqetchBox/sqtch.net;
		scp -rp root@10.0.5.13:/var/www/html/sqtch.net/encoding /Users/etch/bin/backup/sqetchBox/sqtch.net;
		scp -p root@10.0.5.13:/var/www/html/sqtch.net/index.html /Users/etch/bin/backup/sqetchBox/sqtch.net;
		scp -rp root@10.0.5.13:/var/www/html/sqtch.net/members /Users/etch/bin/backup/sqetchBox/sqtch.net;
		scp -rp root@10.0.5.13:/var/www/html/sqtch.net/pages /Users/etch/bin/backup/sqetchBox/sqtch.net;
		scp -rp root@10.0.5.13:/var/www/html/sqtch.net/sandbox /Users/etch/bin/backup/sqetchBox/sqtch.net;
		scp -rp root@10.0.5.13:/var/www/html/sqtch.net/src /Users/etch/bin/backup/sqetchBox/sqtch.net;
		scp -rp root@10.0.5.13:/var/www/html/sqtch.net/templates /Users/etch/bin/backup/sqetchBox/sqtch.net;}
sbakr() {scp -rpP 8700 root@sqetch.net:/var/www/html/sqtch.net/assets /Users/etch/bin/backup/sqetchBox/sqtch.net;
		scp -rpP 8700 root@sqetch.net:/var/www/html/sqtch.net/encoding /Users/etch/bin/backup/sqetchBox/sqtch.net;
		scp -pP 8700 root@sqetch.net:/var/www/html/sqtch.net/index.html /Users/etch/bin/backup/sqetchBox/sqtch.net;
		scp -rpP 8700 root@sqetch.net:/var/www/html/sqtch.net/members /Users/etch/bin/backup/sqetchBox/sqtch.net;
		scp -rpP 8700 root@sqetch.net:/var/www/html/sqtch.net/pages /Users/etch/bin/backup/sqetchBox/sqtch.net;
		scp -rpP 8700 root@sqetch.net:/var/www/html/sqtch.net/sandbox /Users/etch/bin/backup/sqetchBox/sqtch.net;
		scp -rpP 8700 root@sqetch.net:/var/www/html/sqtch.net/src /Users/etch/bin/backup/sqetchBox/sqtch.net;
		scp -rpP 8700 root@sqetch.net:/var/www/html/sqtch.net/templates /Users/etch/bin/backup/sqetchBox/sqtch.net;}

# PATH flags..
export PATH="~/bin/test:$PATH"
export GOROOT=$HOME/go
export PATH=$PATH:$GOROOT/bin

# EXAMPLE of setting Flags for Libraries
#export CPPFLAGS="/usr/local/bin/ncursesw6-config"
export CPPFLAGS="/usr/local/bin/gpg-error"
#export LDFLAGS="/System/Volumes/Data/usr/local/lib/libncursesw.dylib"
export LDFLAGS="/System/Volumes/Data/usr/local/lib/libgpg-error.dylib"
# ------------------------------------------------------------------------ }}}
