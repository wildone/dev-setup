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

# Upgrade any already-installed formulae.
brew upgrade

#add java early to meet dependencies
brew cask install homebrew/cask-versions/java8

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install Bash 4.
brew install bash
brew install bash-completion2
# We installed the new shell, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells"
# Prompts for password
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell, prompts for password
chsh -s /usr/local/bin/bash

# Install `wget` with IRI support.
brew install wget

# Install RingoJS and Narwhal.
# Note that the order in which these are installed is important;
# see http://git.io/brew-narwhal-ringo.
brew install ringojs
brew install narwhal

# Install Python
brew install python
brew install python3

# Install more recent versions of some OS X tools.
#brew install vim
brew install grep
brew install openssh
brew install screen
#brew install homebrew/php/php55 --with-gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

brew tap caskroom/fonts
brew cask install \
  font-anonymous-pro \
  font-dejavu-sans-mono-for-powerline \
  font-droid-sans-mono font-droid-sans-mono-for-powerline \
  font-meslo-lg font-input \
  font-inconsolata font-inconsolata-for-powerline \
  font-liberation-mono font-liberation-mono-for-powerline \
  font-liberation-sans \
  font-meslo-lg \
  font-nixie-one \
  font-office-code-pro \
  font-pt-mono \
  font-roboto \
  font-source-code-pro font-source-code-pro-for-powerline \
  font-source-sans-pro \
  font-ubuntu font-ubuntu-mono-powerline

# Install Cask
brew tap caskroom/versions
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

#Core System Casks
brew cask install java
#brew cask install java7
brew cask install xquartz

# Install ruby-build and rbenv
brew install ruby-build
brew install rbenv
LINE='eval "$(rbenv init -)"'
grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

#install rbenv and bundler
export RUBY_CONFIGURE_OPTS=--with-readline-dir="$(brew --prefix readline)"
rbenv install 2.6.1
rbenv global 2.6.1
gem install bundler


# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng #needs java 1.7+
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf #needs xquartz
brew install xz

# Install other useful binaries.
brew install ack
brew install dark-mode
#brew install exiv2
brew install git
brew install git-lfs
git lfs install
brew install git-flow
brew install git-extras
brew install hub
brew install librsvg
brew install imagemagick --with-webp --with-librsvg
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rhino
brew install speedtest_cli
brew install ssh-copy-id
brew install tree
brew install webkit2png
brew install zopfli
brew install pkg-config libffi
brew install pandoc

# Lxml and Libxslt
brew install libxml2
brew install libxslt
brew link libxml2 --force
brew link libxslt --force

# Install Heroku
brew install heroku/brew/heroku
heroku update

#Readline
brew install readline

# Core casks
#brew cask install alfred
brew cask install quicksilver
#brew cask install sizeup
brew cask install --appdir="~/Applications" iterm2

# Development tool casks
brew cask install sublime-text
#brew cask install atom
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew install qemu
#brew cask install vagrant
#brew cask install macdown
#brew cask install brackets
#brew install ansible #install using python in your after you run workon
#brew cask install mitmproxy

# Misc casks
brew cask install google-chrome
brew cask install firefox
brew cask install opera
brew cask install torbrowser
brew cask install skype
brew cask install slack
brew cask install dropbox
brew cask install google-backup-and-sync
#brew cask install evernote
brew cask install 1password
#brew cask install gimp
#brew cask install inkscape

brew cask install macid
brew cask install licecap

#dev social
brew cask install gitter
brew cask install hipchat
brew cask install adium
brew cask install microsoft-lync
brew cask install telegram

#media
brew cask install spotify
brew cask install spotify-notifications
brew cask install vlc
brew install ffmpeg


##tools
brew cask install betterzip
#brew cask install keka
#brew cask install omnigraffle
#brew cask install sitesucker
brew cask install unetbootin
brew install asciinema
gem install showterm
brew cask install cord

#web viewers
brew cask install webex-nbr-player

#setup app store api
brew install mas
#install memory clean
#mas install 451444120

#brew cask install tg-pro #sha256 mismatch
brew cask install charles
#brew cask install transmit
brew cask install jdownloader
#setup jdownloader
open -a "JDownloader Installer"
#brew cask install utorrent
#setup utorrent
#open -a "uTorrent"
brew cask install vuze
brew install openvpn
brew cask install tunnelblick
#seup little snitch
brew cask install little-snitch
open -a "Little Snitch Installer"

#dev source
#brew cask install sourcetree
brew cask install github
#brew cask install versions

#Remove comment to install LaTeX distribution MacTeX
#brew cask install mactex

# Link cask apps to Alfred
#brew cask alfred link

#Add calibre
brew cask install --appdir="~/Applications" calibre

# Install Docker
brew case install docker
brew install bash-completion
brew install docker-completion
brew install docker-compose-completion
brew install docker-machine-completion
#brew install docker
#brew install boot2docker

# add mouse drivers
brew cask install logitech-gaming-software

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzip qlimagesize webpquicklook suspicious-package quicklookase qlvideo

# Remove outdated versions from the cellar.
brew cleanup
