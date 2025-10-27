#!/bin/sh -x

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install deps
xargs brew install < brew_deps.txt

# zsh
rm ~/.zshrc
ln -s $PWD/.zshrc ~/.zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Emacs
brew tap d12frosted/emacs-plus
brew install emacs-plus@30 --with-native-comp

## Doom
mv ~/.emacs.d ~/.emacs.d.bak
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d.doom
~/.emacs.d.doom/bin/doom install


git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
ln -s $PWD/.spacemacs ~/.spacemacs
ln -s $PWD/.emacs.d/private/snippets ~/.emacs.d/private/snippets

# Intelij IdeaVim plugin
ln -s $PWD/.ideavimrc ~/.ideavimrc

git config --global alias.co checkout

# Nix setup
echo "Nix setup: https://www.notion.so/gini/Nix-61243c17136948ac9aae9d23adf261aa"
