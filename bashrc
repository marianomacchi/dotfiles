#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### Prompt settings
# Arch linux default prompt (w/ absolute path)
export PS1="[\u@\h \w]\$ "

### Aliases
# Set ls human readable and autocolor as default
alias ls='ls -h --color'

### VIM settings
# use vi-like commands in the bash shell
set -o vi
# Disable flow control when using VIM
vim()
{
	local STTYOPTS="$(stty --save)"
	stty stop '' -ixoff
	command vim "$@"
	stty $STTYOPTS
}
