## About Section
function about() {
cat <<EOF
####################################
# DracOS Bashrc                    #
# Inspired by ultimate bashrc      #
# By: randalltux || @randalltux    #
#                                  #
# license:                         #
# This program is free software;   #
# You can redistribute it and/or   #
# modify it under the terms of the #
# GNU General Public License       #
#                                  #
# 2016 - rndtx | DracOS Dev Team   #
# ================================ #
# Credits:                         #
# 	- RANDALLTUX               #
#	- ZEE EICHEL		   #
#	- CYBERKING		   #
####################################
EOF
}

# bashrc config
# copyright (c) 2016 - Randall Tux <rndtx@grombyang.or.id>
# inspired by bashrc ultimate

# if not running, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history
HISTCONTROL=ignoredups:ignorespace

# append to the history file
shopt -s histappend

# for setting history length
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command
shopt -s checkwinsize

# make less more friendly
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot = $(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color)
case "$TERM" in
	xterm-color)
		color_prompt = yes;;
esac

if [ -n "$force_color_prompt" ]; then
	 if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		 color_prompt = yes
	 else
		 color_prompt = 
	 fi
 fi

 if [ "$color_prompt" = yes ]; then
	 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
 else
	 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# if this is an xterm and set the title to user@host:dir
case "$TERM" in
	xterm*|rxvt*)
		PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
		;;
	*)
		;;
esac

# enable color support of ls and also add handly aliases
if [ -x /usr/bin/dircolors ]; then
	 test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	 alias ls='ls --color=auto'
	 #alias dir='dir --color=auto'
	 #alias vdir='vdir --color=auto'

	 alias grep='grep --color=auto'
	 alias fgrep='fgrep --color=auto'
	 alias egrep='egrep --color=auto'
 fi

 # some more ls aliases
 alias ll='ls -alF'
 alias la='ls -A'
 alias l='ls -CF'

 #   sleep 10; alert
 alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

 # ~/.bash_aliases, instead of adding them here directly.
 if [ -f ~/.bash_aliases ]; then
	 . ~/.bash_aliases
 fi

 # enable programmable completion features (you don't need to enable
 if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
	 . /etc/bash_completion
 fi

 # color chart

 txtblk='\e[0;30m' # Black - Regular
 txtred='\e[0;31m' # Red
 txtgrn='\e[0;32m' # Green
 txtylw='\e[0;33m' # Yellow
 txtblu='\e[0;34m' # Blue
 txtpur='\e[0;35m' # Purple
 txtcyn='\e[0;36m' # Cyan
 txtwht='\e[0;37m' # White
 bldblk='\e[1;30m' # Black - Bold
 bldred='\e[1;31m' # Red
 bldgrn='\e[1;32m' # Green
 bldylw='\e[1;33m' # Yellow
 bldblu='\e[1;34m' # Blue
 bldpur='\e[1;35m' # Purple
 bldcyn='\e[1;36m' # Cyan
 bldwht='\e[1;37m' # White
 unkblk='\e[4;30m' # Black - Underline
 undred='\e[4;31m' # Red
 undgrn='\e[4;32m' # Green
 undylw='\e[4;33m' # Yellow
 undblu='\e[4;34m' # Blue
 undpur='\e[4;35m' # Purple
 undcyn='\e[4;36m' # Cyan
 undwht='\e[4;37m' # White
 bakblk='\e[40m'   # Black - Background
 bakred='\e[41m'   # Red
 badgrn='\e[42m'   # Green
 bakylw='\e[43m'   # Yellow
 bakblu='\e[44m'   # Blue
 bakpur='\e[45m'   # Purple
 bakcyn='\e[46m'   # Cyan
 bakwht='\e[47m'   # White
 txtrst='\e[0m'    # Text Reset

 # prompt

# PS1='\[\033]0;\w\007\]\[\e[35;1m\]\u\[\e[0m\]\[\e[32m\]@\h\[\e[34m\]\w \[\e[33m\]\$ \[\e[0m\]'
# PS1='\[\033[01;31m\]\u\[\033[01;36m\]@\[\033[01;32m\]\h\[\033[01;33m\]:\[\033[01;33m\]\w\n\[\033[01;31m\]\$ \[\033[00;32m\]'
# PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] "
# PS1="\[\033[0;31m\][\u] [ \w ] \[\033[0m\] \n # "
# PS1="\[\033[0;33m\][\!]\`if [[ \$? = "0" ]]; then echo "\\[\\033[32m\\]"; else echo "\\[\\033[31m\\]"; fi\`[\u.\h: \`if [[ `pwd|wc -c|tr -d " "` > 18 ]]; then echo "\\W"; else echo "\\w"; fi\`]\$\[\033[0m\] "; echo -ne "\033]0;`hostname -s`:`pwd`\007"
# PS1="\[\033[0;33m\][\!]\`if [[ \$? = "0" ]]; then echo "\\[\\033[32m\\]"; else echo "\\[\\033[31m\\]"; fi\`[\u.\h: \`if [[ `pwd|wc -c|tr -d " "` > 18 ]]; then echo "\\W"; else echo "\\w"; fi\`]\$\[\033[0m\] "; echo -ne "\033]0;`hostname -s`:`pwd`\007"
# PS1="\[\033[0;34m\][\u] \[\033[0;0m\]\w \[\033[0m\]$ "
# PS1="\[\033[0;34m\][\u] \[\033[0;31m\][ \w ] \[\033[0m\] \n >> "
# PS1="\[\033[0;34m\][\u] \[\033[0;33m\][ \t ] \[\033[0;31m\][ \w ] \[\033[0m\] \n >> "
# PS1='\[\033[1;30m\][\[\033[0;37m\]${PIPESTATUS}\[\033[1;30m\]:\[\033[0;37m\]${SHLVL}\[\033[1;30m\]:\[\033[0;37m\]\j\[\033[1;30m\]][\[\033[1;34m\]\u\[\033[0;34m\]@\[\033[1;34m\]\h\[\033[1;30m\]:\[\033[0;37m\]`tty | sed s/\\\\\/dev\\\\\/\//g`\[\033[1;30m\]]\[\033[0;37m\][\[\033[1;37m\]\W\[\033[0;37m\]]\[\033[1;30m\] \$\[\033[00m\] '
# PS1="[\[\033[1;34m\]\u\[\033[0m\]@\h \W]\\$ "
# PS1="[\!] \033[1;36m[ \u@\h ]\033[1;32m\] [ \t ] [ \d ]\n\033[1;33m\[[ \w ] \033[00m\\n\[\e[30;1m\](\[\e[32;1m\]\$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files, \$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')b\[\e[30;1m\]) \[\e[0m\] $: "
# PS1="[\[\033[32m\]\w]\[\033[0m\]\n\[\033[1;36m\]\u\[\033[1;33m\]-> \[\033[0m\]"
# PS1="\[\033[34m\]   \u@\h `tty | sed 's/\/dev\///'` \t \d \[\033[35m\]\w/ \n\[\033[34m\] $\[\033[0m\] "
# PS1="\[\033[35m\]\t\[\033[m\]-\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
# PS1="\[\033[35m\]\t\[\033[m\]-\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
# PS1="\[\033[36m\]   \u@\h `tty | sed 's/\/dev\///'` \t \d \[\033[32m\]\w/ \n\[\033[36m\] $\[\033[0m\] "
# PS1=">\[\033[s\]\[\033[1;\$((COLUMNS-4))f\]\$(date +%H:%M)\[\033[u\]"
# PS1='C:${PWD//\//\\\}>' # Windows Command Prompt :p
# PS1='${debian_chroot:+($debian_chroot)}\[[ \033[01;31m\]\w\[\033[00m\]] '
# PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]\[\e[0;32m\]'
# PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
# PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\]'
# PS1='\e[1;31;47m\u \e[1;32;47mon \h \e[1;35;47m\d \@\e[0;0m\n\e[1;31m[dir.= \w] \# > \e[0;0m'
# PS1='\[\e[1;31m\][\[\e[0;37m\]\u\[\e[1;31m\]@\[\e[0;37m\]\h \W\[\e[1;31m\]]\$\[\e[0m\] '
# PS1='\[\e[1;31m\][\u@\h \W]\$\[\e[0m\] '
# PS1='\[\e[1;32m\]\u@\H:\[\e[m\] \[\e[1;37m\]\w\[\e[m\]\n\[\e[1;33m\]hist:\! \[\e[0;33m\] \[\e[1;31m\]jobs:\j \$\[\e[m\] '
PS1='\[\e[1;32m\]\u@\H:\[\e[m\] \[\e[1;37m\]\w\[\e[m\]\n\[\e[1;33m\]hist:\! \[\e[0;33m\] \[\e[1;31m\]jobs:\j \$\[\e[m\] '
# PS1='\e[1;33;47m\u \e[1;32;47mon \h \e[1;35;47m\d \@\e[0;0m\n\e[1;34m[dir.= \w] \# > \e[0;0m'
# PS1="\[\e[1;33m\] > \[\033[0m\]"
# PS1='\[\e[1m\]\h:\w\$\[\e[0m\] '
# PS1="\[\e]2;\u@\H \w\a\e[30;1m\]>\[\e[0m\] "
# PS1="\[\e[30;1m\]\w> \[\e[0m\]"
# PS1="\[\e[37;1m\]-{\[\e[34;1m\]\u@\h\[\e[37;1m\]}-\n\[\e[37;1m\](\[\e[34;1m\]\w: \$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files, \$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')b\[\e[37;1m\])\n--> \[\e[0m\]"
# PS1='\[\e[41m\]\[\e[1;37m\] \u \[\e[47m\]\[\e[1;30m\] \W \[\e[0m\]\[\e[1;37m\]\[\e[42m\] # \[\033[0m\] '
# PS1='\[\e[45m\]\[\e[1;37m\] \u@\h \[\e[47m\]\[\e[1;30m\] \W \[\e[0m\]\[\e[1;37m\]\[\e[42m\] > \[\033[0m\] '
# PS1='\[\e[m\n\e[0;33m\][$$:$PPID \j:\!\[\e[0;33m\]]\[\e[0;36m\] \T \d \[\e[1;34m\][\[\e[1;34m\]\u@\H\[\e[1;31m\]:\[\e[0;37m\]${SSH_TTY} \[\e[0;32m\]+${SHLVL}\[\e[1;30m\]] \[\e[1;31m\]\w\[\e[0;30m\] \n($SHLVL:\!)\$ '
# PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\`[\u@\h:\w]\\$ "
# PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\`[\u@\h:\w]\\$ "
# PS1="\n\[\033[32;1m\]It's \t\[\033[33;1m\] Currently browsing \[\033[1;36m\]\w \[\033[33;1m\]directory\n\[\033[34;1m\]\`if [ \$? = 0 ]; then echo \[\e[37m\]Last Command Was Successfully Executed \[\e[32m\]^_^\[\e[0m\]; else echo \[\e[37m\]Smeggin Hell !!! Last Command Was Unknown \[\e[32m\]O_O\[\e[0m\]; fi\` \n\[\033[31m\]What is thy bidding, my master? \n\n\[\033[34;1m\]"

# Saves terminal commands in history file in real time (for use with 'shopt -s histappend')
if [ ! -f $HOME/.bash_history ];then
	touch $HOME/.bash_history;
fi


# bash settings

# autoload -U compinit
# compinit
export BLOCKSIZE=K
export BROWSER='firefox'
export CDDIR="$HOME"
export EDITOR='vim'
export VISUAL='vim'
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE='&:bg:fg:ll:h'
export HISTSIZE=10000
export HISTTIMEFORMAT='%H:%M > '
export HISTTIMEFORMAT='%Y-%m-%d_%H:%M:%S_%a  '
export HOSTFILE=$HOME/.hosts
export LESS='-i -N -w  -z-4 -g -e -M -X -F -R -P%t?f%f \'
export LESSOPEN='|/usr/bin/lesspipe.sh %s 2>&-'
export PAGER='less -e'
export TERM='screen-256color'
export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'
export TMOUT=600
set -b
set -o notify
shopt -s cdable_vars
shopt -s cdspell
shopt -s checkhash
shopt -s checkwinsize
shopt -s cmdhist
shopt -s extglob
shopt -s histappend histreedit histverify
shopt -s nocaseglob
shopt -s no_empty_cmd_completion
shopt -s sourcepath

if [ "$TERM" = "screen" ]; then
    export TERM=$TERMINAL
fi

function get_xserver()
{
    case $TERM in
       xterm )
            XSERVER=$(who am i | awk '{print $NF}' | tr -d ')''(' )
            # Ane-Pieter Wieringa suggests the following alternative:
            # I_AM=$(who am i)
            # SERVER=${I_AM#*(}
            # SERVER=${SERVER%*)}
            XSERVER=${XSERVER%%:*}
            ;;
        aterm | rxvt)
        # Find some code that works here. ...
            ;;
    esac
}
if [ -z ${DISPLAY:=""} ]; then
    get_xserver
    if [[ -z ${XSERVER}  || ${XSERVER} == $(hostname) || \
      ${XSERVER} == "unix" ]]; then
        DISPLAY=":0.0"          # Display on local host.
    else
        DISPLAY=${XSERVER}:0.0  # Display on remote host.
    fi
fi
export DISPLAY

# paths

# ~/bin
if [ -d "$HOME/bin" ];
    then PATH="$HOME/bin:$PATH"
fi

# /usr/local/bin
if [ -d "/usr/local/bin" ];
    then PATH="/usr/local/bin:$PATH"
fi

# /usr/bin
if [ -d "/usr/bin" ];
    then PATH="/usr/bin:$PATH"
fi

# /usr/sbin
if [ -d "/usr/sbin" ];
    then PATH="/usr/sbin:$PATH"
fi

# remove duplicate path entries
export PATH=$(echo $PATH | awk -F: '
{ for (i = 1; i <= NF; i++) arr[$i]; }
END { for (i in arr) printf "%s:" , i; printf "\n"; } ')

# autocomplete ssh commands
complete -W "$(echo `cat ~/.bash_history | egrep '^ssh ' | sort | uniq | sed 's/^ssh //'`;)" ssh

# avoid tilde expansion from the bash_completion script
function _expand()
{
    [ "$cur" != "${cur%\\}" ] && cur="$cur\\";
    if [[ "$cur" == \~*/* ]]; then
        #eval cur=$cur;
		:;
    else
        if [[ "$cur" == \~* ]]; then
            cur=${cur#\~};
            COMPREPLY=($( compgen -P '~' -u $cur ));
            return ${#COMPREPLY[@]};
        fi;
    fi
}

function _get_longopts()
{
    # $1 --help | sed  -e '/--/!d' -e 's/.*--\([^[:space:].,]*\).*/--\1/'| \
# grep ^"$2" |sort -u ;
    $1 --help | grep -o -e "--[^[:space:].,]*" | grep -e "$2" |sort -u
}

function _killall()
{
    local cur prev
    COMPREPLY=()
    cur=${COMP_WORDS[COMP_CWORD]}
    # get a list of processes (the first sed evaluation
    # takes care of swapped out processes, the second
    # takes care of getting the basename of the process)
    COMPREPLY=( $( /usr/bin/ps -u $USER -o comm  | \
        sed -e '1,1d' -e 's#[]\[]##g' -e 's#^.*/##'| \
        awk '{if ($0 ~ /^'$cur'/) print $0}' ))
    return 0
}
complete -F _killall killall killps

function _longopts()
{
    local cur
    cur=${COMP_WORDS[COMP_CWORD]}
    case "${cur:-*}" in
       -*)      ;;
        *)      return ;;
    esac
    case "$1" in
      \~*)      eval cmd="$1" ;;
        *)      cmd="$1" ;;
    esac
    COMPREPLY=( $(_get_longopts ${1} ${cur} ) )
}
complete  -o default -F _longopts configure bash
complete  -o default -F _longopts wget id info a2ps ls recode

function _make()
{
    local mdef makef makef_dir="." makef_inc gcmd cur prev i;
    COMPREPLY=();
    cur=${COMP_WORDS[COMP_CWORD]};
    prev=${COMP_WORDS[COMP_CWORD-1]};
    case "$prev" in
        -*f)
            COMPREPLY=($(compgen -f $cur ));
            return 0
        ;;
    esac;
    case "$cur" in
        -*)
            COMPREPLY=($(_get_longopts $1 $cur ));
            return 0
        ;;
    esac;
    # make reads `GNUmakefile', then `makefile', then `Makefile'
    if [ -f ${makef_dir}/GNUmakefile ]; then
        makef=${makef_dir}/GNUmakefile
    elif [ -f ${makef_dir}/makefile ]; then
        makef=${makef_dir}/makefile
    elif [ -f ${makef_dir}/Makefile ]; then
        makef=${makef_dir}/Makefile
    else
        makef=${makef_dir}/*.mk        # Local convention.
    fi
    # Before we scan for targets, see if a Makefile name was
    # specified with -f ...
    for (( i=0; i < ${#COMP_WORDS[@]}; i++ )); do
        if [[ ${COMP_WORDS[i]} == -f ]]; then
           # eval for tilde expansion
           eval makef=${COMP_WORDS[i+1]}
           break
        fi
    done
    [ ! -f $makef ] && return 0
    # deal with included Makefiles
    makef_inc=$( grep -E '^-?include' $makef | \
    sed -e "s,^.* ,"$makef_dir"/," )
    for file in $makef_inc; do
        [ -f $file ] && makef="$makef $file"
    done
    # If we have a partial word to complete, restrict completions to
    # matches of that word.
    if [ -n "$cur" ]; then gcmd='grep "^$cur"' ; else gcmd=cat ; fi
    COMPREPLY=( $( awk -F':' '/^[a-zA-Z0-9][^$#\/\t=]*:([^=]|$)/ \
                                {split($1,A,/ /);for(i in A)print A[i]}' \
                                $makef 2>/dev/null | eval $gcmd  ))
}
complete -F _make -X '+($*|*.[cho])' make gmake pmake\

# A meta-command completion function for commands like sudo(8)
function _meta_comp()
{
    local cur func cline cspec
    COMPREPLY=()
    cur=${COMP_WORDS[COMP_CWORD]}
    cmdline=${COMP_WORDS[@]}
    if [ $COMP_CWORD = 1 ]; then
         COMPREPLY=( $( compgen -c $cur ) )
    else
        cmd=${COMP_WORDS[1]}            # Find command.
        cspec=$( complete -p ${cmd} )   # Find spec of that command.
        # COMP_CWORD and COMP_WORDS() are not read-only,
        # so we can set them before handing off to regular
        # completion routine:
        # Get current command line minus initial command,
        cline="${COMP_LINE#$1 }"
        # split current command line tokens into array,
        COMP_WORDS=( $cline )
        # set current token number to 1 less than now.
        COMP_CWORD=$(( $COMP_CWORD - 1 ))
        # If current arg is empty, add it to COMP_WORDS array
        # (otherwise that information will be lost).
        if [ -z $cur ]; then COMP_WORDS[COMP_CWORD]=""  ; fi
        if [ "${cspec%%-F *}" != "${cspec}" ]; then
      # if -F then get function:
            func=${cspec#*-F }
            func=${func%% *}
            eval $func $cline   # Evaluate it.
        else
            func=$( echo $cspec | sed -e 's/^complete//' -e 's/[^ ]*$//' )
            COMPREPLY=( $( eval compgen $func $cur ) )
        fi
    fi
}
complete -o default -F _meta_comp nohup \
eval exec trace truss strace sotruss gdb
complete -o default -F _meta_comp command type which man nice time

function _tar()
{
    local cur ext regex tar untar
    COMPREPLY=()
    cur=${COMP_WORDS[COMP_CWORD]}
    # If we want an option, return the possible long options.
    case "$cur" in
        -*)     COMPREPLY=( $(_get_longopts $1 $cur ) ); return 0;;
    esac
    if [ $COMP_CWORD -eq 1 ]; then
        COMPREPLY=( $( compgen -W 'c t x u r d A' -- $cur ) )
        return 0
    fi
    case "${COMP_WORDS[1]}" in
        ?(-)c*f)
            COMPREPLY=( $( compgen -f $cur ) )
            return 0
            ;;
            +([^Izjy])f)
            ext='tar'
            regex=$ext
            ;;
        *z*f)
            ext='tar.gz'
            regex='t\(ar\.\)\(gz\|Z\)'
            ;;
        *[Ijy]*f)
            ext='t?(ar.)bz?(2)'
            regex='t\(ar\.\)bz2\?'
            ;;
        *)
            COMPREPLY=( $( compgen -f $cur ) )
            return 0
            ;;
    esac
    if [[ "$COMP_LINE" == tar*.$ext' '* ]]; then
        # Complete on files in tar file.
        #
        # Get name of tar file from command line.
        tar=$( echo "$COMP_LINE" | \
               sed -e 's|^.* \([^ ]*'$regex'\) .*$|\1|' )
        # Devise how to untar and list it.
        untar=t${COMP_WORDS[1]//[^Izjyf]/}
        COMPREPLY=( $( compgen -W "$( echo $( tar $untar $tar \
                    2>/dev/null ) )" -- "$cur" ) )
        return 0

    else
        # File completion on relevant files.
        COMPREPLY=( $( compgen -G $cur\*.$ext ) )
    fi
    return 0
}
complete -F _tar -o default tar
