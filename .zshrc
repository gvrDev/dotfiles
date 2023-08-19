DISABLE_AUTO_TITLE="true"

export PATH="$HOME/.config/emacs/bin:$HOME/.local/bin:$HOME/dotfiles/bin:$HOME/go/bin:$PATH"
export TERM="xterm-256color"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  ssh-agent
  zsh-autosuggestions
  zsh-syntax-highlighting
)

zstyle :omz:plugins:ssh-agent identities github skey
zstyle :omz:plugins:ssh-agent quiet yes

source $ZSH/oh-my-zsh.sh

bindkey '^ ' autosuggest-accept
bindkey '^H' backward-kill-word
bindkey '5~' kill-word

alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias 3.="cd ../../.."
alias 4.="cd ../../../../"
alias 5.="cd ../../../../../"

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

function mgit_ssh {
  git config --global gpg.format ssh
  git config --global user.signingKey "$*"
  git config --global commit.gpgsign true
  git config --global tag.gpgsign true
}

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias container_stop="sudo docker ps -aq | xargs sudo docker stop | xargs sudo docker rm"
alias container_clean="sudo docker image ls -q | xargs -I {} sudo docker image rm -f {}"
alias container_start="sudo docker compose up"

export EDITOR="nvim"
export EDITOR_PIPE="editor_pipe_zellij"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
