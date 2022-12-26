if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
  copyfile
  copypath
)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi

bindkey '^ ' autosuggest-accept
bindkey '^H' backward-kill-word
bindkey '5~' kill-word

alias zshconfig="$EDITOR ~/.my-dotfiles/.zshrc"
alias autostartconfig="$EDITOR ~/.my-dotfiles/my-autostart.sh"
alias i3config="$EDITOR ~/.my-dotfiles/i3/"
alias nvimconfig="$EDITOR ~/.my-dotfiles/nvim/"
alias kittyconfig="$EDITOR ~/.my-dotfiles/kitty/kitty.conf"
alias dotfilesconfig="$EDITOR ~/.my-dotfiles/"
alias setupconfig="$EDITOR ~/dev/bash/scripts/setup.sh"

alias cd..="cd .."
alias ..="cd .."
alias c="clear"

alias ll="exa -l -a --header --git --icons"
alias l="exa -l --header --git --icons"
alias ls="exa --grid --git --icons"

alias cpfile="copyfile"
alias cppath="copypath"

alias lgit="lazygit"

function gsetup {
  git remote add origin $1
  git branch -M main
  git add .
  git commit -m "initial commit"
  git push -u origin main
}

function ginit {  
  git init
  git remote add origin $1
  git branch -M main
  git add .
  git commit -m "initial commit"
  git push -u origin main
}

function guser {
  git config user.name $1
  git config user.email $2
}

function guserg {
  git config --global user.name $1
  git config --global user.email $2
}

function gssh {
  git config --global gpg.format ssh
  git config --global user.signingKey "$*"
  git config --global commit.gpgsign true
  git config --global tag.gpgsign true
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
