#!/bin/sh -x

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# clone spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

# install fish
brew install fish

rm ~/.config/fish/config.fish

ln -s $PWD/.config/fish/config.fish ~/.config/fish/config.fish
ln -s $PWD/.spacemacs ~/.spacemacs
ln -s $PWD/.emacs.d/private/snippets ~/.emacs.d/private/snippets

emacs --insecure 

# Source code font 
# https//github.com/adobe-fonts/source-code-pro
