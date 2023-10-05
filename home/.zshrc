# GPG, editor and language configuration
#--------------------------------------
export GPG_TTY=$(tty)
export EDITOR=nvim

# language variables
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# setup emacs keybindings
bindkey -e
bindkey "^[[3~" delete-char
# mac keyboard
#stty intr '^X@sT'

# Theme and prompt configuration
#--------------------------------------
eval "$(starship init zsh)"

# ZSH completion
#--------------------------------------
source /usr/share/fzf/completion.zsh && source /usr/share/fzf/key-bindings.zsh

# load zsh completion from brew
#  chmod go-w /usr/local/share (remove insecure warning)
if type brew &>/dev/null; then
  FPATH=/usr/local/share/zsh-completions:$FPATH
fi

# load completions and fzf key bindings
autoload -Uz compinit up-line-or-beginning-search down-line-or-beginning-search
compinit -i

# Do menu-driven completion.
zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-colors ''
zstyle ':completion::complete:*' gain-privileges 1

# configure fzf
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# History
#--------------------------------------
HISTFILE=~/.histfile
HISTSIZE=500
SAVEHIST=50000
export HISTIGNORE="&:[bf]g:exit:history:top:clear:cd:cd ..:cd.."
setopt INC_APPEND_HISTORY HIST_IGNORE_ALL_DUPS HIST_REDUCE_BLANKS HIST_SAVE_NO_DUPS HIST_IGNORE_SPACE NO_BANG_HIST

# LS and directory colors configuration
#--------------------------------------
LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
export LS_COLORS

# ls customizations
alias ls='exa --color auto -G'
#alias ls='ls -G'
# List directory contents
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

alias cat='bat'
alias vim='nvim'
# Programing and language configuration
#--------------------------------------
export REPO="${HOME}/work"

# python
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Golang
export GOPATH=/home/gamunu/work
export PATH=$PATH:$GOPATH/bin

# Node environment
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# kubernetes
#--------------------------------------
alias k=kubectl
alias kctx=kubectx

source <(kubectl completion zsh)
source ~/.kubectl_fzf.plugin.zsh
