# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
      if [ -f ~/.dircolors ]; then
        eval `dircolors ~/.dircolors`
      fi
    	# We have color support; assume it's compliant with Ecma-48
    	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    	# a case would tend to support setf rather than setaf.)
    	color_prompt=yes
    else
	    color_prompt=
    fi
fi

prompt_command() {
  RET=$?
  RED="\[\033[31m\]"
  GREEN="\[\033[01;32m\]"
  WHITE="\[\033[00m\]"
  BLUE="\[\033[0;34m\]"
  YELLOW="\[\033[0;33m\]"
  if [[ $RET == 0 ]]; then
    PS1=$GREEN
  else
    PS1=$RED
  fi
  # Normal prompt
  PS1="$PS1\u@\h${WHITE}:${BLUE}\w"
  # If not master show git branch
  BRANCH=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  if [[ $BRANCH ]] && [[ $BRANCH != 'master' ]]; then
    PS1="$PS1 ${YELLOW}[${BRANCH}]"
  fi
  # Last $

  if [[ $RET == 0 ]]; then
    PS1="$PS1$WHITE\$ "
  else
    PS1="$PS1$RED\$$WHITE "
  fi

  case "$TERM" in xterm*|rxvt*)
      PS1="$PS1\[\e]0;\u@\h: \`PWD\`\a\]"
  esac
}

PROMPT_COMMAND="prompt_command"

if [ "$color_prompt" = yes ]; then
    # Normal prompt
    PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[0;34m\]\w\[\033[00m\]\$ "
else
    PS1="\u@\h:\w\$ "
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in xterm*|rxvt*)
    function PWD {
      pwd | awk -F\/ '{print $(NF-1)"/"$(NF)}'
    }
    PS1="$PS1\[\e]0;\u@\h: \`PWD\`\a\]"
    ;;
*)
    ;;
esac

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Add custom commands into path
if [ -d ~/.bin ]; then
  export PATH=$PATH:~/.bin
fi

# Print out logo (if any)
if [ -f ~/.bin/logo ]; then
  bash ~/.bin/logo
fi
