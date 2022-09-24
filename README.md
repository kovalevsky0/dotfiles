# dotfiles

My terminal setup:

- [Kitty Terminal](https://sw.kovidgoyal.net/kitty/)
- - colorscheme: [Tokyo Night](https://github.com/folke/tokyonight.nvim)
- - font: [Iosevka (Nerd Fonts)](https://www.nerdfonts.com/font-downloads)
- [neovim (0.5+)](https://github.com/neovim/neovim)
- [nnn](https://github.com/jarun/nnn)
- [Zsh](https://github.com/zsh-users/zsh)
- [starship prompt](https://github.com/starship/starship)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [glow](https://github.com/ellisonleao/glow.nvim) - markdown terminal viewer
- [exa](https://github.com/ogham/exa) - a modern alternative to **ls** command

## Neovim

```
ln -s ~/projects/personal/dotfiles/nvim ~/.config/nvim
```

## zsh

```
ln -s ~/projects/personal/dotfiles/.zshrc ~/.zshrc
```

### zsh plugins

```
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```


## starship

**Installation**

```
brew install starship
```

## fzf

**Installation**

```
brew install fzf
```

## ripgrep

search-tool

[[GitHub](https://github.com/BurntSushi/ripgrep)]

```
brew install ripgrep
```

## bat

[cat](https://en.wikipedia.org/wiki/Cat_(Unix)) clone with syntax hightlighting

> need for syntax hightlighting in fzf preview

```
brew install bat
```

### Configuration

```
ln -s ~/projects/personal/dotfiles/batconfig ~/.config/bat/config
```


**tmux neovim colors fix**

```
tmux attach
tmux set-option -ga terminal-overrides ",xterm-256color:Tc"
tmux detach
tmux attach
```


------

## Old setup

## tmux

for controling sessions in terminal

[[GitHub](https://github.com/tmux/tmux)]

**Installation**

Just install from source instead of using brew

**setup config**

```
ln -s /path/dotfiles/.tmux.conf ~/.tmux.conf
```

[Using Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

update tmux config:

```
tmux source ~/.tmux.conf
```

or

```
tmuxsource
```

## Alacritty

**Installation**

```
brew cask install alacritty
```

**setup config**

```
ln -s /path/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
```

## fish-shell

**Installation**

```
brew install fish
```

**setup config**

```
ln -s /path/dotfiles/.config.fish ~/.config/fish/config.fish
```


# Dependencies (Homebrew)

The list of required binaries that should be installed (Homebrew)

- neovim
- bat
- starship
- fzf
- ripgrep
- bat
- tmux
- alacritty
- lua-language-server


