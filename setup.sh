#!/bin/sh -x

# iTerm2 profile
defaults write com.googlecode.iterm2.plist PrefsCustomFolder $PWD/iterm2_profile/com.googlecode.iterm2.plist
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Brew taps
brew tap d12frosted/emacs-plus
brew tap homebrew/cask-fonts


# Window management
ln -s $PWD/com.knollsoft.Rectangle.plist ~/Library/Preferences/com.knollsoft.Rectangle.plist

# Install deps
brew install \
     git \
     the_silver_searcher \
     ispell \
     zsh-syntax-highlighting \
     spectacle \

# zsh
rm ~/.zshrc
ln -s $PWD/.zshrc ~/.zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Emacs
brew install emacs-plus@28 --with-native-comp

## Doom
mv ~/.emacs.d ~/.emacs.d.bak
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d.doom
~/.emacs.d.doom/bin/doom install


git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
ln -s $PWD/.spacemacs ~/.spacemacs
ln -s $PWD/.emacs.d/private/snippets ~/.emacs.d/private/snippets

# Intelij IdeaVim plugin
ln -s $PWD/.ideavimrc ~/.ideavimrc

# Install cask deps
brew install --cask \
     osxfuse \
     secure-pipes \
     zerotier-one \
     font-source-code-pro \
     font-fira-mono \
     dropbox \
     vivaldi \
     zoom 

git config --global alias.co checkout

# Start emacs and install all required packages
echo "emacs --insecure"

# Nix setup
echo "Nix setup: https://www.notion.so/gini/Nix-61243c17136948ac9aae9d23adf261aa"
