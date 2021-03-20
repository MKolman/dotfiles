# Dot Files

My configuration files for linux machines. Files are separated into folders by purpose.

To install these files use `stow` which can be installed on debian based machines using
```
sudo apt install stow
```
Stow creates symbolic links to files in your home directory. For example
```
stow dotfiles/vim
```
will create .vim folder in your home directory and in it a symbolic link to `./vim/vimrc`.


Folder   | Purpose
-----------------
vim      | vimrc file, vim themes and plugins
zsh      | zsh aliases, dircolors and oh-my-zsh theme
ssh      | ssh aliases and configs
regolith | regolith i3 config (https://regolith-linux.org/)
git      | git aliases and users
