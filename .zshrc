export EDITOR="nvim"
export PATH="/opt/nvim/bin:/opt/sf/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
HYPHEN_INSENSITIVE="true"
zstyle ":omz:update" mode auto
source $ZSH/oh-my-zsh.sh
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd/mm/yyyy"
SF_AC_ZSH_SETUP_PATH="$HOME/.cache/sf/autocomplete/zsh_setup && test -f $SF_AC_ZSH_SETUP_PATH && omz reload" 
plugins=(git starship)

# Aliases
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

# Functions
function sf_retrieve() {
	sf project retrieve start -d "$1" --ignore-conflicts
}
function sf_deploy() {
	sf project deploy start -d "$1" --ignore-conflicts
}

eval "$(starship init zsh)"
