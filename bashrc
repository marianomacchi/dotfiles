#
# ~/.bashrc
#

### Global settings
# If not running interactively, don't do anything
# (prevents .bashrc configurations from breaking non-interactive scripts)
[[ $- != *i* ]] && return
# Use arch linux default prompt with absolute path (normal user)
export PS1="[\u@\h \w]\$ "

### Aliases
# Set ls human readable and autocolor as default
alias ls='ls -h --color'
# Use ls with the long format
alias ll='ls -l'

### VIM settings
# Use vi-like commands in the bash shell
set -o vi
# Disable flow control when using VIM
vim()
{
	local STTYOPTS="$(stty --save)"
	stty stop '' -ixoff
	command vim "$@"
	stty $STTYOPTS
}
