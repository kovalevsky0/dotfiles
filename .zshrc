
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  #source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

export ZSH=/Users/max/.oh-my-zsh

eval "$(starship init zsh)"

# ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	zsh-completions
	zsh-syntax-highlighting
	zsh-autosuggestions
  zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh

export GOPATH=$HOME/golang
export GOROOT=/opt/homebrew/opt/go/libexec
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PERSONALDIR=$HOME/projects/personal
export NOTESDIR=$PERSONALDIR/notes
export PUBNOTESDIR=$NOTESPATH/spaces/public
export GROKKINGDIR=$NOTESPATH/spaces/grokking
export DOTFILESDIR=$PERSONALDIR/dotfiles
export WEBSITENAME=maxoid.io
export WEBSITEPATH=$PERSONALDIR/$WEBSITENAME

# aliases
alias vim="nvim"
alias clr=clear
alias alacrittyconfig='vim ~/.config/alacritty/alacritty.yml'
alias zshreload='source ~/.zshrc'
alias zshconfig='vim ~/.zshrc'
alias vimset='vim ~/.config/nvim/init.vim'
alias vimplugs='vim ~/.config/nvim/lua/main/plugins.lua'
alias vimopts='vim ~/.config/nvim/lua/main/options.lua'
alias vimconfigs='cd $DOTFILESDIR/nvim/lua/'
alias vimkeys='vim ~/.config/nvim/lua/main/keymaps-list.lua'
alias vimcolors='vim ~/.config/nvim/lua/main/colorscheme.lua'
#alias vimbinds='vim ~/.config/nvim/lua/binds.lua'
alias kittyset='vim ~/.config/kitty/kitty.conf'
alias tmuxconfig='vim $HOME/.tmux.conf'
alias tmuxreload='tmux source-file $HOME/.tmux.conf'
alias v=vim
alias g=git
alias lgit=lazygit
alias cat=bat
alias notes='cd $NOTESPATH'
alias grokking='cd $GROKKINGPATH'
alias pubnotes='cd $PUBNOTESPATH'
alias todaynote='notes && now=$(date +%Y-%m-%d) && vim "${now}.md"'
alias dietlog='notes && now=$(date +%Y-%m-%d) && touch "Diet Log ${now}.md" && datetime=$(date +"%Y-%m-%d %H:%M:%S") && echo "---\ndate: \"${datetime}\"\ntags:\n\t- diet\n\t- food\n\t- dietlog\n---\n\n# 🍎 🥦 Diet Log ${now}\n\n- \n" >> "Diet Log ${now}.md" && vim +11 "Diet Log ${now}.md"'
alias dotfiles='cd $DOTFILESDIR'
alias website='cd $WEBSITEPATH'
alias ls="exa -al"
alias personal='cd ~/projects/personal'
alias work='cd ~/projects/work'
# alias fzfvim="nvr --remote `fzf`"
alias autocommitpush='watch -n 900 "git pull origin main && (git ls-files --modified --others --exclude-standard | grep . > /dev/null) && { git add . ; git commit -m \"auto-commit\" ; git push origin main; }"'

# create md file with name as <title>.md and content '# <title>'
# and open the file in vim
note() {
  if [ "$1" != "" ]
  then
    title=$1 && cd $NOTESPATH && datetime=$(date +"%Y-%m-%d %H:%M:%S") && echo "---\ntitle: \"${title}\"\ndate: \"${datetime}\"\ntags:\n---\n\n# ${title}\n\n" >> "$1.md" && vim "$1.md"
  else
    echo "the title of note is required"
  fi
}

# dietlog() {
#   notes
#   local now=$(date +%Y-%m-%d)
#   local datetime=$(date +"%Y-%m-%d %H:%M:%S")
#   local DIETLOGFILE="Diet Log ${now}.md"

#   if [ -f "$DIETLOGFILE" ]; then
#       vim +11 "$DIETLOGFILE"
#       return 0
#   fi

#   touch "Diet Log ${now}.md"
#   echo "---\ndate: \"${datetime}\"\ntags:\n\t- diet\n\t- food\n\t- dietlog\n---\n\n# 🍎 🥦 Diet Log ${now}\n\n- \n" >> "$DIETLOGFILE"
#   vim +11 "$DIETLOGFILE"
# }


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# vscode 
function code {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        local argPath="$1"
        [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
        open -a "Visual Studio Code" "$argPath"
    fi
}

# tmux
# starting tmux when open terminal and run zsh env
# if [ "$TMUX" = "" ]; then tmux; fi

# nvm (node version manager)

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# fzf ctrl-r and alt-c behavior
export FZF_BASE="/usr/local/bin/fzf"
# export FZF_CTRL_F_COMMAND="fd --hidden --follow . $HOME"
# export FZF_ALT_C_COMMAND="fd -t d --hidden --follow . $HOME"
export FZF_DEFAULT_OPTS="\
  --preview 'bat --theme=Catppuccin-macchiato --style numbers,changes --color=always {} | head -500'
"
#export FZF_DEFAULT_COMMAND="fd --hidden --follow . $HOME"

# fzf single quote tab completion behavior
export FZF_COMPLETION_TRIGGER="'"
_fzf_compgen_path() {
  fd --type f --hidden --follow --exclude .git . "$1"
}
_fzf_compgen_dir() {
  fd --type d . "$1"
}


