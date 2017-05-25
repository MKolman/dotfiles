# Alias definitions.
# called from ~/.bashrc
# enable color support of ls and also add handy aliases
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
alias ll='ls -halt'
alias la='ls -a'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# apt-get
alias update='sudo pacman -Syyu'
alias get='sudo pacman -S'
alias search='pacman -Ss'
alias aur='yaourt'

# unziping
alias extract='dtrx'

# GUI open
alias go='xdg-open'

# Python virtualenv named venv
alias venv='. venv/bin/activate'

# find files in this subdirectory
alias ff='find . -iname'

# Count lines
alias count_lines='grep -cve "^\s*$"'

# run c++ programs
alias g+="crun"
alias g++="g++ -Wall -Wextra -pedantic --std=c++14"

# Use installed time command not bash's command
alias time="time"
alias timer="/usr/bin/time -f '%e %U %S'"
