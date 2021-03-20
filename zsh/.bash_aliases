# Alias definitions.
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

# Python virtualenv named venv
alias venv='. venv/bin/activate'

# run c++ programs
alias g++="g++ -Wall -Wextra -pedantic --std=c++17"

# Use installed time command not bash's command
alias time="time"
alias timer="/usr/bin/time -f '%e %U %S'"
