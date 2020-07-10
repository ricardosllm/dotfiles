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
ln -s $PWD/.zshrc ~/.zshrc

# Hammerspoon config
ln -s $PWD/.hammerspoon/init.lua ~/.hammerspoon/init.lua

# Install clj-kondo
bash <(curl -s https://raw.githubusercontent.com/borkdude/clj-kondo/master/script/install-clj-kondo)
# brew install borkdude/brew/clj-kondo


# Install fonts
brew tap caskroom/fonts
brew cask install font-source-code-pro
brew cask install font-fira-mono
brew cask install secure-pipes

# Install grep with detault names
brew install grep --with-default-names

# Install other dependencies 
brew cask install osxfuse
brew install git encfs the_silver_searcher

git config --global alias.co checkout

sh -c '. "$HOME"/.nix-profile/etc/profile.d/nix.sh && nix run nixpkgs.coreutils -c install -m 644 -D "$(nix-build \'<nixpkgs>\' -A fish-foreign-env)"/share/fish-foreign-env/functions/*.fish -t "$HOME"/.config/fish/functions'
echo 'fenv source ~/.nix-profile/etc/profile.d/nix.sh' > ~/.config/fish/conf.d/00-nixify.fish


# Start emacs and install all required packages
emacs --insecure


# TODO
# [] - Make it work with nix pkg manager
# [] - Make it work on an EC2 env
