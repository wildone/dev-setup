#!/usr/bin/env bash

# Install devops tools using Homebrew. We recommend running the brew.sh script, as some
# basic tools are there.

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

# Upgrade any already-installed formulae.
brew upgrade

brew install screen
brew install tmux

brew install kubernetes-cli
brew install terraform
brew cask install google-cloud-sdk

# Install Docker, which requires virtualbox
brew install docker
brew cask install minikube
# Installing aws client
pip3 install awscli --upgrade --user






# Remove outdated versions from the cellar.
brew cleanup
