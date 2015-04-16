#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

### Environment variables and startup programs
# Set UTF-8 as the terminal encoding
export LANG=en_US.UTF-8
# Set LS_COLORS (determines ls colors, dircolors is part of GNU coreutils)
if [ -f $HOME/.dircolors ]; then
	eval `dircolors -b $HOME/.dircolors`
else
	/usr/bin/dircolors -p > $HOME/.dircolors
	eval `dircolors -b $HOME/.dircolors`
fi
