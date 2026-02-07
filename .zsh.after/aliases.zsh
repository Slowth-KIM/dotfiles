# ======================
# Homebrew
# ======================
eval "$(/opt/homebrew/bin/brew shellenv)"

# ======================
# fzf setup
# ======================
eval "$(fzf --zsh)"

# --- Catppuccin Mocha fzf theme ---
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

# --- Use fd instead of fzf default ---
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

# ======================
# bat - Catppuccin Mocha theme
# ======================
export BAT_THEME="Catppuccin Mocha"

# ======================
# vivid - LS_COLORS with Catppuccin Mocha
# ======================
export LS_COLORS="$(vivid generate catppuccin-mocha)"

# ======================
# eza aliases
# ======================
alias ls="eza --color=always --icons=always -a -1 --git"
alias ll="eza --color=always --long --git --icons=always --no-user --no-permissions -s modified"

# ======================
# Core aliases
# ======================
alias vi='nvim'
alias cat='bat --plain --wrap character'
alias ta='tmux attach'
alias rm='trash'
alias cl='claude'
alias brewu='brew upgrade; brew cleanup'

# ======================
# fd/rg enhanced
# ======================
alias fdm='fd --hidden --no-ignore'
alias rgm='rg --no-ignore --hidden'

# ======================
# Zoxide (better cd)
# ======================
eval "$(zoxide init zsh)"

# ======================
# TheFuck
# ======================
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# ======================
# pyenv
# ======================
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv &>/dev/null; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
  if which pyenv-virtualenv-init > /dev/null 2>&1; then
    eval "$(pyenv virtualenv-init -)"
  fi
fi

# ======================
# NVM
# ======================
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ======================
# autojump
# ======================
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# ======================
# History
# ======================
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# ======================
# Vi mode
# ======================
set -o vi

# ======================
# Locale
# ======================
export LANG=ko_KR.UTF-8
export LC_ALL=ko_KR.UTF-8

# ======================
# Claude Code - dynamic MCP loading
# ======================
export ENABLE_TOOL_SEARCH=true
