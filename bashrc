#
# ~/.bashrc
#

### Global settings
# If not running interactively, don't do anything
# (prevents .bashrc configurations from breaking non-interactive scripts)
[[ $- != *i* ]] && return
# Set UTF-8 as the terminal encoding
export LANG=en_US.UTF-8
# Set prompt with absolute path (normal user)
export PS1="[\u@\h \w]\$ "
# Set LS_COLORS var (determines ls colors, dircolors is part of GNU coreutils)
if [ -f $HOME/.dircolors ]; then
        eval `dircolors -b $HOME/.dircolors`
else
        /usr/bin/dircolors -p > $HOME/.dircolors
        eval `dircolors -b $HOME/.dircolors`
fi

### Aliases
# Set ls human readable and autocolor as default
alias ls='ls -h --color'
# Use ls with the long format
alias ll='ls -l'

### VIM settings
# Use vi-like commands in the bash shell
set -o vi
# Set VIM as the default editor for all applications
export EDITOR=vim
# Disable flow control when using VIM
vim()
{
	local STTYOPTS="$(stty --save)"
	stty stop '' -ixoff
	command vim "$@"
	stty $STTYOPTS
}
