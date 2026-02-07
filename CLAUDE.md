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

Repository root maps to `~/` via `stow -t ~ .`. Files in `.stow-local-ignore` are excluded from symlinking.

**주의**: 이 레포는 `~/workspace/dotfiles`에 위치하므로 반드시 `-t ~` 옵션을 붙여야 한다. 없으면 `~/workspace/`에 심링크가 생긴다.

```bash
# 올바른 사용법
cd ~/workspace/dotfiles
stow -t ~ .

# 잘못된 심링크 제거 후 재배포
stow -D .
stow -t ~ .
```

## Theme

Catppuccin Mocha dark theme applied consistently across all tools.

## 설정 변경 시 주의사항

### 기존 환경을 반드시 먼저 확인할 것

레퍼런스나 외부 설정을 적용하기 전에, 현재 사용자의 기존 설정 파일 내용을 반드시 읽고 비교해야 한다. 기존 동작을 깨뜨리지 않는 것이 최우선.

### Karabiner는 심링크 불가

Karabiner-Elements는 설정 파일을 직접 읽고 쓰기 때문에 심링크로 관리하면 안 된다. `~/.config/karabiner/karabiner.json`은 실제 파일이어야 하며, dotfiles 레포의 파일은 레퍼런스 용도로만 보관한다.

변경 시: dotfiles에서 편집 → `cp ~/workspace/dotfiles/.config/karabiner/karabiner.json ~/.config/karabiner/karabiner.json`

### p10k.zsh는 개인 설정

`.p10k.zsh`는 `p10k configure` 위저드로 생성되는 개인 취향 파일이다. 다른 사람의 설정을 그대로 복사하면 안 되고, 본인이 직접 생성한 파일을 유지해야 한다.

### 배포 순서

1. `brew bundle` (의존 패키지 먼저 설치)
2. Oh-My-Zsh + 플러그인 설치 확인
3. 기존 파일 백업 (`~/dotfiles-backup/`)
4. 충돌 파일 제거
5. `stow -t ~ .` (심링크 배포)
6. Karabiner는 별도로 `cp`
