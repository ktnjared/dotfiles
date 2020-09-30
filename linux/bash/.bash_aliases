# .bash_aliases for Ubuntu

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'          # List with color
    alias lsa='ls -AF --color=auto'     # List all
    alias lsd='ls -dl */'               # List visible directories
    alias ll='ls -hlsF --color=auto'    # List all in long format
    alias lla='ls -AhlsF --color=auto'  # List all directory contents in long format
    alias lld='ls -dl .*/ */'           # List all directories
    alias l.='ls -dl .*/'               # List hidden directories

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# easier directory navigation - dots variant
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# easier directory navigation - mario mushrooms variant
alias 1up="cd .."
alias 2up="cd ../.."
alias 3up="cd ../../.."
alias 4up="cd ../../../.."
alias 5up="cd ../../../../.."

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Refresh current session with new additions to .bash* files
alias newbash='source ~/.bashrc'

# apt
alias apt='sudo apt'

# dnf
alias dnf='sudo dnf'

# snap
alias snap='sudo snap'

# systemctl 
alias systemctl='sudo systemctl'

# human-readable df without snaps or tmpfs sorted by filesystem name with header retained
alias df='df -H -x squashfs -x tmpfs | (read header; echo $header; sort -d)'

# lsblk but only physical disks (excludes RAM disks (1) and Loop devices (7; used by snaps))
alias lsblkd='lsblk -e 1,7'

# Make directory; make parents if necessary
alias mkdir='mkdir -pv'

# Open files in Visual Studio Code
alias e='code'
alias edit='code'

# edit this file
alias ealias="code $HOME/.bash_aliases"
alias editalias="code $HOME/.bash_aliases"

# Open current directory in Visual Studio Code
alias edir='code .'
alias editdir='code .'

# Open current directory in file manager
alias f='xdg-open . &'

# base 64 decode/ecode a string
alias 64e='echo $1 | base64 <<<'
alias 64d='echo $1 | base64 --decode <<<'

# Get public IP Address
alias ip='curl icanhazip.com'

# Show open ports
alias ports='netstat -tulanp'

# Weather from wttr.in
alias wttr='curl wttr.in'

# Have wget auto-resume by default
alias wget='wget -c'

# Process Search
alias pssearch='ps aux | grep -v grep | grep -i -e VSZ -e'

### Functions
# easily extract multiple archive formats
function extract {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1     ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "I do not know how to extract '$1'." ;;
       esac
   else
       echo "'$1' is not a valid archive file!"
   fi
}

# find a file in the current directory
function llfind {
    ll -A -h | grep -i $1;
}

# Local time and UTC time in ISO-8601 notation
function now {
    date +"%Y-%m-%d %T %Z"      | awk '{ printf "Current Time - " $3 ": " $1 " " $2 "\n" }' ;   # Local TZ time
    date -utc +"%Y-%m-%d %T %Z" | awk '{ printf "Current Time - " $3 ": " $1 " " $2 "\n" }' ;   # UTC time
}

# show only uncommented items in a file
function ucomments {
    THE_FILE= && cat $1 | grep -Pv '^\s*#' | grep -v -e '^$' ;
}