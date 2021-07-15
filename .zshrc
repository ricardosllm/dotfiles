if [ -e /Users/ricardo/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/ricardo/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

eval "$(direnv hook zsh)"

export PATH=/opt/homebrew/bin:$PATH
export PATH=/Users/ricardo/.emacs.d.doom/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/ricardo/.oh-my-zsh"
export EDITOR='vim'
# export VISUAL='emacsclient -n'

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
DISABLE_UPDATE_PROMPT="true"
# eval "$(starship init zsh)" # TODO


plugins=(
    osx
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# ^W deletes only 1 segment backwards in paths
# https://unix.stackexchange.com/a/258661/55172
autoload -U select-word-style
select-word-style bash

# User configuration

alias ls='/bin/ls -G'
alias ll='ls -lah'
alias e="emacsclient -n -s $(cat ~/.config/chemacs/profile)"
alias et="emacsclient -nw -s $(cat ~/.config/chemacs/profile)"

alias finder='open -a "Finder"'

# Git
alias gitpp='git stash; git pull --rebase; git push; git stash pop'
alias gg='git grep'
alias gp='git pull --rebase'
alias gitc='git checkout'
alias gits='git status'
alias gitd='git diff'
alias gitp='git stash; git pull --rebase; git stash pop'

# source "/Users/ricardo/.oh-my-zsh/custom/themes/spaceship.zsh-theme"

PROMPT='%{$fg[yellow]%}[%D{%f/%m/%y} %D{%L:%M:%S}] '$PROMPT
