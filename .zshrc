# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

################################
### source
### zplugin
source ~/.zinit/bin/zplugin.zsh
### theme
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

################################
### PATH
# phpenv
export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"
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
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

#################################
## plugin
# 入力途中に候補をうっすら表示
zplugin light zsh-users/zsh-autosuggestions
# 補完を更に強化する
# pacman や yaourt のパッケージリストも補完するようになる
zplugin light zsh-users/zsh-completions
# シンタックスハイライト
zplugin light zsh-users/zsh-syntax-highlighting
# history関係
zplugin light zsh-users/zsh-history-substring-search
# タイプ補完
zplugin light "zsh-users/zsh-autosuggestions"
zplugin light "zsh-users/zsh-completions"
zplugin light "chrissicool/zsh-256color"
zplugin light "peterhurford/git-aliases.zsh"
# Git補完
zplugin light "woefe/git-prompt.zsh"
# コマンド時間
zplugin light "popstas/zsh-command-time"
# ディレクトリカラー
zplugin light "joel-porquet/zsh-dircolors-solarized"

#################################
## prompt
PROMPT='%F{red}%d%f$ '

#################################
## alias

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

## shell
alias ll='ls -la'
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
alias cds='cd ~/socialdog/web'

## Trander
alias cdt='cd ~/trander'
alias cdtf='cd ~/trander-flutter/trander_flutter/'

## After-Clean-Install
alias cda='cd ~/after-clean-install'

## gvimrc(vimの見た目)
alias sg='source ~/.gvimrc'
alias vg='vi ~/.gvimrc'

## neovim
alias nn='nvim'
alias nnv='nvim ~/.vimrc'
alias nnz='nvim ~/.zshrc'
alias nnd='nvim ~/.config/nvim/toml/dein.toml'
alias nni='nvim ~/.config/nvim/init.lua'

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
bindkey '^R' peco-history-selection

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
source ~/.phpbrew/bashrc

export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"

# Embulk
export PATH="$HOME/.embulk/bin:$PATH"

# cloud_sql
export PATH="$HOME/cloud_sql_proxy:$PATH"

# GitHub CLI
eval "$(gh completion -s zsh)"
export PATH="/usr/local/opt/node@14/bin:$PATH"