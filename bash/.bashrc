source /usr/share/defaults/etc/profile

# Basic
alias open='xdg-open'
alias ll='ls -l'
alias ls='ls -a --color=auto'
# Git
alias gitstatus="sh ~/Git/LinuxUtil/git/gitstatus"
alias gitpull="sh ~/Git/LinuxUtil/git/gitpull"
alias gitpush="sh ~/Git/LinuxUtil/git/gitpush"
alias gitgraph="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'"


# Vim
export EDITOR=vim
export VISUAL=vim
# Set neovim as default vim editor if installed
if [ -x "$(command -v nvim)" ]; then
	export EDITOR='nvim'
	export VISUAL='nvim'
	alias vim='nvim'
	alias view='nvim -R'
fi

# Set vi keybindings in bash
set -o vi

# Add pipe to clipboard if xclip is installed
if [ -x "$(command -v xclip)" ]; then
	alias clipboard='xclip -sel clip'
fi

# Add better apt search if apt is installed
if [ -x "$(command -v apt)" ]; then
	alias apts="sh ~/Git/LinuxUtil/apt/search.sh"
fi

if [ -x "$(command -v tmux)" ]; then
	alias dmux="sh ~/Git/LinuxUtil/tmux/dmux.sh"
fi
