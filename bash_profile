#
# ~/.bash_profile
#

### Environment variables
# Use arch linux default prompt with absolute path (normal user)
export PS1="[\u@\h \w]\$ "
# Set UTF-8 as the terminal encoding
export LANG=en_US.UTF-8
# Set LS_COLORS var (determines ls colors, dircolors is part of GNU coreutils)
if [ -f $HOME/.dircolors ]; then
	eval `dircolors -b $HOME/.dircolors`
else
	/usr/bin/dircolors -p > $HOME/.dircolors
	eval `dircolors -b $HOME/.dircolors`
fi
# Set VIM as the default editor for all applications
export EDITOR=vim
