DISABLE_AUTO_TITLE="true"

export PATH="/home/gui/.local/bin:$PATH"
export PATH="/home/gui/.config/emacs/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
export TERM="screen-256color"

ZSH_THEME="robbyrussell"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
  copyfile
  copypath
  ssh-agent
)

zstyle :omz:plugins:ssh-agent identities 25519_github 25519_skey 25519_gitlab
zstyle :omz:plugins:ssh-agent quiet yes

source $ZSH/oh-my-zsh.sh

bindkey '^ ' autosuggest-accept
bindkey '^H' backward-kill-word
bindkey '5~' kill-word

alias cd..="cd .."
alias ..="cd .."
alias c="clear"

alias ll="exa -l -a --header --git --icons"
alias l="exa -l --header --git --icons"
alias ls="exa --grid --git --icons"

alias cpfile="copyfile"
alias cppath="copypath"

alias lgit="lazygit"

function v {
  if [ -n "$1" ]; then
    cd $1
  fi
  nvim $2 .
}
function vgodot {
  if [ -n "$1" ]; then
    cd $1
  fi
  nvim --listen ~/.cache/nvim/godot.pipe .
}

function mgit_setup {
  git remote add origin $1
  git branch -M main
  git add .
  git commit -m "initial commit"
  git push -u origin main
}

function mgit_init {  
  git init
  git remote add origin $1
  git branch -M main
  git add .
  git commit -m "initial commit"
  git push -u origin main
}

function mgit_user {
  git config --global user.name $1
  git config --global user.email $2
}

function mgit_ssh {
  git config --global gpg.format ssh
  git config --global user.signingKey "$*"
  git config --global commit.gpgsign true
  git config --global tag.gpgsign true
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
