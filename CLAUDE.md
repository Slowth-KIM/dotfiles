# CLAUDE.md

This file provides guidance to Claude Code when working with this repository.

## Repository Overview

Personal dotfiles repository for macOS. Uses GNU Stow for symlink management.

## Common Commands

```bash
# 패키지 설치
brew bundle --file=Brewfile

# Dotfiles 배포
stow .

# Brewfile 업데이트
brew bundle dump --force
```

## Architecture

- **Shell**: `.zshrc`, `.zprofile`, `.zshenv` - ZSH + Oh-My-Zsh + Powerlevel10k
- **Terminal**: `.config/ghostty/` - Ghostty terminal
- **Editor**: `.config/nvim/` - Neovim with LazyVim, `.vimrc` - Vim fallback
- **Multiplexer**: `.tmux.conf` - tmux with Catppuccin
- **Window Manager**: `.config/aerospace/` - AeroSpace tiling WM
- **Input**: `.config/karabiner/` - Karabiner-Elements key remapping
- **Git**: `.gitconfig` - Git with Delta pager
- **AI**: `.claude/` - Claude Code configurations

## Stow Integration

Repository root maps to `~/` via `stow .`. Files in `.stow-local-ignore` are excluded from symlinking.

## Theme

Catppuccin Mocha dark theme applied consistently across all tools.
