# Dotfiles

macOS 개인 dotfiles. GNU Stow로 심링크 관리.

## Quick Setup

```bash
# 1. Homebrew 설치
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. 레포 클론
git clone https://github.com/Slowth-KIM/dotfiles ~/dotfiles
cd ~/dotfiles

# 3. 패키지 설치
brew bundle --file=Brewfile

# 4. Oh-My-Zsh 설치
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 5. Powerlevel10k 설치
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# 6. ZSH 플러그인 설치
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# 7. 개인 설정 파일 생성
cp .gitconfig.user.example .gitconfig.user
# .gitconfig.user에 이름/이메일 입력

# 8. dotfiles 배포
stow .

# 9. tmux 플러그인 매니저 설치
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# tmux 실행 후 prefix + I로 플러그인 설치

# 10. Neovim 실행 (LazyVim 자동 설치)
nvim
```

## 구조

| 카테고리 | 파일 | 설명 |
|----------|------|------|
| Shell | `.zshrc`, `.zprofile`, `.zshenv` | ZSH + Oh-My-Zsh + Powerlevel10k |
| Shell | `.p10k.zsh` | Powerlevel10k 프롬프트 설정 |
| Shell | `.zsh.after/aliases.zsh` | 별칭 및 환경 설정 |
| Git | `.gitconfig` | Git 전역 설정 (Delta, aliases) |
| Terminal | `.config/ghostty/config` | Ghostty 터미널 설정 |
| Multiplexer | `.tmux.conf` | tmux 설정 (Catppuccin Mocha) |
| Editor | `.config/nvim/` | Neovim LazyVim 설정 |
| Editor | `.vimrc` | Vim 폴백 설정 |
| WM | `.config/aerospace/` | AeroSpace 타일링 WM |
| Input | `.config/karabiner/` | Karabiner 키 리매핑 |
| AI | `.claude/` | Claude Code 설정 |

## 테마

전체 환경에 **Catppuccin Mocha** 다크 테마 적용:
- Ghostty: `theme = catppuccin-mocha`
- Neovim: `colorscheme = catppuccin-mocha`
- tmux: `@catppuccin_flavor 'mocha'`
- bat: `BAT_THEME=Catppuccin Mocha`
- fzf: Catppuccin Mocha 색상
- Delta: `syntax-theme = Catppuccin Mocha`
