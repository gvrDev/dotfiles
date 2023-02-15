export PATH="/home/gui/.local/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"

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

alias v="nvim ."
alias vim="nvim"

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


alias nnn="nnn -e"
alias ls="nnn -de"
n ()
{
    # Block nesting of nnn in subshells
    if [[ "${NNNLVL:-0}" -ge 1 ]]; then
        echo "nnn is already running"
        return
    fi

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The backslash allows one to alias n to nnn if desired without making an
    # infinitely recursive alias
    \nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}
