#!/bin/sh -x

# iTerm2 profile
defaults write com.googlecode.iterm2.plist PrefsCustomFolder $PWD/iterm2_profile/com.googlecode.iterm2.plist
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# MacOS window manager
brew install --cask rectangle

# Emacs
brew tap d12frosted/emacs-plus
brew install emacs-plus@27
brew linkapps emacs-plus
ln -s /usr/local/Cellar/emacs-plus/*/Emacs.app/ /Applications/

# clone spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

ln -s $PWD/.spacemacs ~/.spacemacs
ln -s $PWD/.emacs.d/private/snippets ~/.emacs.d/private/snippets
ln -s $PWD/.zshrc ~/.zshrc

# Hammerspoon config
ln -s $PWD/.hammerspoon/init.lua ~/.hammerspoon/init.lua


# Install fonts
brew tap caskroom/fonts
brew cask install font-source-code-pro
brew cask install font-fira-mono
brew cask install secure-pipes

# Install grep with detault names
brew install grep --with-default-names

# Install other dependencies 
brew cask install osxfuse secure-pipes zerotier-one
brew install git the_silver_searcher 

git config --global alias.co checkout

# Start emacs and install all required packages
emacs --insecure

# Nix setup
echo "Nix setup: https://www.notion.so/gini/Nix-61243c17136948ac9aae9d23adf261aa"
