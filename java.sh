#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Install Cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

brew cask install java
#brew tap caskroom/versions
#brew cask install java8
#brew cask install java7
#brew cask install java6
brew cask install intellij-idea
#brew cask install intellij-idea-ce
brew cask install visual-studio-code
brew cask install jedit
brew install groovy
brew install gradle
brew cask install visualvm
brew cask install jd-gui
#brew cask install eclipse-java
brew install maven
brew install libxml2
#brew install ant

# Remove outdated versions from the cellar.
brew cleanup
