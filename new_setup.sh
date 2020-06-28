# This will isntall Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install Google Chrome
brew cask install google-chrome
brew cask reinstall google-chrome

# Install Firefox
brew cask install firefox

# Install Vivaldi
brew cask install vivaldi

# Install Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Iterm2
brew cask install iterm2

# install htop
brew install htop