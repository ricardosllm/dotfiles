#!/bin/sh -x

# iTerm2 profile
defaults write com.googlecode.iterm2.plist PrefsCustomFolder $PWD/iterm2_profile/com.googlecode.iterm2.plist
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Emacs
brew tap d12frosted/emacs-plus
brew install emacs-plus
brew linkapps emacs-plus
ln -s /usr/local/Cellar/emacs-plus/*/Emacs.app/ /Applications/
# clone spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

# install fish
brew install fish

rm ~/.config/fish/config.fish

ln -s $PWD/.config/fish/config.fish ~/.config/fish/config.fish
ln -s $PWD/.spacemacs ~/.spacemacs
ln -s $PWD/.emacs.d/private/snippets ~/.emacs.d/private/snippets

# Hammerspoon config
ln -s $PWD/.hammerspoon/init.lua ~/.hammerspoon/init.lua

emacs --insecure 

# Install fonts
brew tap caskroom/fonts
brew cask install font-source-code-pro
brew cask install font-fira-mono

# Install grep with detault names
brew install grep --with-default-names

# Install other dependencies 
brew cask install osxfuse
brew install git encfs the_silver_searcher

git config --global alias.co checkout
