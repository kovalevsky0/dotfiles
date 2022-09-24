
# prompt
starship init fish | source

# aliases
alias vim="nvim"
alias vi="nvim"
alias oldvim="\vim"
alias chrome="open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# fish settings
alias fishset="vim ~/.config/fish/config.fish"

# fish reload config
alias fishsource="source ~/.config/fish/config.fish"

# vim settings
alias vimset="vim ~/.config/nvim/init.vim"

# coc.nvim settings
alias cocset="vim ~/.config/nvim/coc-settings.json"

# tmux settings
alias tmuxset="vim ~/.tmux.conf"

# tmux reload config
alias tmuxsource="tmux source-file ~/.tmux.conf"

# alacritty settings
alias alacrittyset="vim ~/.config/alacritty/alacritty.yml"

# nnn
alias n="nnn -de"

# dotfiles
alias dotfiles="cd ~/projects/personal/dotfiles"

# apps aliases
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias hnews='haxor-news'

# some commands
alias clr="clear"

# reset fish greetings
function fish_greeting
end

funcsave fish_greeting

export BAT_THEME="Monokai Extended Origin"

alias tmux='tmux -2'

if status --is-login
    tmux attach; and exec true
end

function code
  set location "$PWD/$argv"
  open -n -b "com.microsoft.VSCode" --args $location
end

source ~/.local/share/icons-in-terminal/icons.fish

export EDITOR=nvim

