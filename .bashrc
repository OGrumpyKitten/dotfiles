#               ______    _______   _______             _______   _______
#              (  ___ \  (  ___  ) (  ____ \ |\     /| (  ____ ) (  ____ \
#              | (   ) ) | (   ) | | (    \/ | )   ( | | (    )| | (    \/
#              | (__/ /  | (___) | | (_____  | (___) | | (____)| | |
#              |  __ (   |  ___  | (_____  ) |  ___  | |     __) | |
#              | (  \ \  | (   ) |       ) | | (   ) | | (\ (    | |
#           _  | )___) ) | )   ( | /\____) | | )   ( | | ) \ \__ | (____/\
#          (_) |/ \___/  |/     \| \_______) |/     \| |/   \__/ (_______/
#
#.bashrc by XOGK


# If not running interactively, don't do anything
[[ $- != *i* ]] && return


#ALIASES##################################
#FILE LISTING AND DISK MANAGEMENT*********
alias ls='exa -lTL 1'
alias ll='exa -lTL 2'
alias rm='rm -iv'
alias takeover='sudo chown -R ${USER} ${1:-.}'
#SUDOS************************************
alias pacman='sudo pacman'
alias snano='sudo nano'
alias nmap='sudo nmap'
#*****************************************
alias vi='nvim'
alias vim='nvim'
alias cat='bat'
alias update='sudo pacman -Syu ; trizen -Syu'
alias calc='wclac'
alias bashrc='sudo nano ~/.bashrc'
#*****************************************


#FUNCTIONS################################
#EXTRACT FILE*****************************
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

#COPY&GO**********************************
cpg (){
  if [ -d "$2" ];then
    cp $1 $2 && cd $2
  else
    cp $1 $2
  fi
}
#MOVE&GO**********************************
mvg (){
  if [ -d "$2" ];then
    mv $1 $2 && cd $2
  else
    mv $1 $2
  fi
}
#*****************************************


#HISTORY##################################
#*****************************************
export HISTFILESIZE=20000
export HISTSIZE=10000
shopt -s histappend
shopt -s cmdhist
HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"
#*****************************************


#PS1######################################
#*****************************************
YELLOW="\[\033[33;1m\]"
RESET="\[\017\]"
NORMAL="\[\033[0m\]"
WHITE="\[\033[37;1m\]"
SMILEY="${WHITE}:)${NORMAL}"
FROWNY="${RED}:(${NORMAL}"
SELECT="if [ \$? = 0 ]; then echo \"${SMILEY}\"; else echo \"${FROWNY}\"; fi"
PS1="${RESET}${YELLOW}\h${NORMAL} \`${SELECT}\` ${YELLOW}>${NORMAL} "
#*****************************************


