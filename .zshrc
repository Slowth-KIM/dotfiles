# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting autojump)

source $ZSH/oh-my-zsh.sh

# Powerlevel10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Custom aliases and settings
[[ -f ~/.zsh.after/aliases.zsh ]] && source ~/.zsh.after/aliases.zsh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Node.js LTS update function
update-node-lts() {
    echo "Updating to latest LTS..."
    nvm install --lts
    nvm alias default lts/\*
    nvm use default
    echo "Node.js updated to: $(node --version)"
}

# Claude Code update function
update-claude-code() {
    echo "Updating Claude Code..."
    npm update -g @anthropic-ai/claude-code
    echo "Claude Code updated to: $(claude --version)"
}

# yazi shell wrapper - cd to last visited directory on exit
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

export EDITOR="nvim"
