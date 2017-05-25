# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd notify
bindkey -v
# Delete key
bindkey "\e[3~" delete-char
# History binding keys
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey '^R' history-incremental-search-backward
# Home and end keys
bindkey "\e[7~" beginning-of-line
bindkey "\e[4~" end-of-line
# Jump words with ctrl+arrow key
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/maks/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# If this is an xterm set the title to user@host:dir
case "$TERM" in xterm*|rxvt*)
    function PWDS {
      pwd | awk -F\/ '{print $(NF-1)"/"$(NF)}'
    }
    PS1="$PS1\[\e]0;\u@\h: \`PWDS\`\a\]"
    ;;
*)
    ;;
esac

precmd() {
  RET=$?
  RED="%b%F{red}"
  GREEN="%B%F{green}"
  WHITE="%b%F{white}"
  BLUE="%b%F{blue}"
  YELLOW="%b%F{yellow}"

  PS1=""
  # Display virtualenv
  if [[ $VIRTUAL_ENV != "" ]]
      then
        # Strip out the path and just leave the env name
        PS1="$WHITE(${VIRTUAL_ENV##*/})"
  fi

  if [[ $RET == 0 ]]; then
    PS1=$PS1$GREEN
  else
    PS1=$PS1$RED
  fi
  # Normal prompt
  PS1="$PS1%n@%m${WHITE}:${BLUE}%~"
  # If not master show git branch
  BRANCH=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  if [[ $BRANCH ]] && [[ $BRANCH != 'master' ]]; then
    PS1="$PS1 ${YELLOW}[${BRANCH}]"
  fi
  # Last $

  if [[ $RET == 0 ]]; then
    PS1="$PS1$WHITE\$ "
  else
    PS1="$PS1$RED $RET\$$WHITE "
  fi
  case "$TERM" in xterm*|rxvt*)
      #PS1="$PS1\[\e]0;\u@\h: \`PWD\`\a\]"
      print -Pn "\e]0;%n@%m: "
      PWDS
      print -n "\a"
  esac
}

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Add custom commands into path
if [ -d ~/.bin ]; then
  export PATH=$PATH:~/.bin
fi

# Print out logo (if any)
if [ -f ~/.bin/logo ]; then
  bash ~/.bin/logo
fi
