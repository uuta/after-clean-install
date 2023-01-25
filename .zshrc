# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

################################
### source
### theme
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

################################
### PATH
export PATH="/usr/local/opt/bison/bin:$PATH"
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="/usr/local/opt/bzip2/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="/usr/local/opt/libiconv/bin:$PATH"
export PATH="/usr/local/opt/krb5/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/krb5/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig:$PKG_CONFIG_PATH"

# Flutter
export PATH="$PATH:`pwd`/flutter/bin"
export PATH="$PATH:~/flutter/bin"

### Added by Zinit's installer
if [[ ! -f /opt/homebrew/Cellar/zinit/3.7/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "/opt/homebrew/Cellar/zinit/3.7/zinit.zsh"
source "/opt/homebrew/Cellar/zsh-autosuggestions/0.7.0/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
# nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

### End of Zinit's installer chunk

### Color configuration
export CLICOLOR=1
export TERM=xterm-256color
source "/opt/homebrew/Cellar/zsh-syntax-highlighting/0.7.1/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

#################################
## prompt
PROMPT='%F{red}%d%f$ '

#################################
## alias

# exa (highrighter)
if [[ $(command -v exa) ]]; then
  alias ls='exa --icons --git'
  alias lt='exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'
  alias ltl='exa -T -L 3 -a -I "node_modules|.git|.cache" -l --icons'
  alias ll='exa -l -aa -h -@ -m --icons --git --time-style=long-iso --color=automatic --group-directories-first'
fi

## git
alias gs='git status'
alias gaa='git add .'
alias ga='git add'
alias gc='git checkout'
alias gm='git commit -m'
alias gps='git push'
alias gpl='git pull'
alias gr-s='git reset --soft HEAD^'
alias gr-h='git reset --hard HEAD^'
alias gd='git diff'
alias gf='git fetch'
alias gl='git log'
alias grb='git rebase'
alias gb='git branch'

## shell
dirtouch() {
    mkdir -p "$(dirname $1)"
    touch "$1"
}
alias mkf=dirtouch

## zsh
alias sz='source ~/.zshrc'
alias vz='vi ~/.zshrc'

## vim
alias sv='source ~/.vimrc'
alias vv='vi ~/.vimrc'

## nvim
alias cdnn='cd ~/.config/nvim'

## SocialDog
alias cdss='cd ~/socialdog'
alias cds='cd ~/socialdog/web'
alias cdsg='cd ~/socialdog/web/application_go'
alias cdaa='cd ~/autoscale-probot'

## Trander
alias cdt='cd ~/trander'
alias cdtf='cd ~/trander-flutter/trander_flutter/'

## After-Clean-Install
alias cda='cd ~/after-clean-install'

## react-web-extension
alias cdr='cd ~/react-web-extension'

## WezTerm
alias cdw='cd ~/.config/wezterm'

## docker tutorial
alias cdd='cd ~/docker-tutorial'

## To parent group-directoris
alias a='cd ../'
alias aa='cd ../../'
alias aaa='cd ../../../'

## gvimrc(vimの見た目)
alias sg='source ~/.gvimrc'
alias vg='vi ~/.gvimrc'

## neovim
alias nn='nvim'
alias nnv='nvim ~/.vimrc'
alias nnz='nvim ~/.zshrc'
alias nnd='nvim ~/.config/nvim/toml/dein.toml'
alias nni='nvim ~/.config/nvim/init.lua'
alias nnb='nvim ~/after-clean-install/Brewfile'

## php
alias php7.0='/Applications/MAMP/bin/php/php7.0.33/bin/php'

## peco
# search command
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey ';e' peco-history-selection

# search git derectory
alias g='cd $(ghq root)/$(ghq list | peco)'

# find_cd
function find_cd() {
    cd "$(find . -type d | peco)"
}
alias fc="find_cd"

# ssh config
alias dev-car="source ~/.dev-car.sh "
alias car-u="source ~/.car-u.sh "
alias car-a="source ~/.car-a.sh "
alias car-gw="source ~/.car-gw.sh"

# medis
alias medis="source ~/bin/medis"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## lsのカラー
autoload -U compinit
compinit

export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

alias ls="ls -GF"
alias gls="gls --color"

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"

# ChatGPT
source "$HOME/.openai_key.zsh"

# Embulk
export PATH="$HOME/.embulk/bin:$PATH"

# cloud_sql
export PATH="$HOME/cloud_sql_proxy:$PATH"

# GitHub CLI
eval "$(gh completion -s zsh)"
export PATH="/usr/local/opt/node@14/bin:$PATH"
### End of Zinit's installer chunk

eval "$(direnv hook zsh)"

# znap
source ~/app/zsh-snap/znap.zsh
znap source marlonrichert/zsh-autocomplete
eval "$(~/.rbenv/bin/rbenv init - zsh)"
eval "$(rbenv init -)"
