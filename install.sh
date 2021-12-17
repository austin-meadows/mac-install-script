#!/usr/bin/env sh

printf '\33c\e[3J'
cd ~

bold=$(tput bold)
normal=$(tput sgr0)
blue='\033[0;34m'
red='\033[0;31m'
info='\033[0;90m'
nocolor='\033[0m'
code='\033[37;48;5;255m'

echo "${info}Press ${blue}↩${info} to continue or ${red}⌃C${normal}${info} to quit.${nocolor}\n"
read

############################################## Prerequisites
echo "\n${info}Installing prerequisites${nocolor}\n"
xcode-select --install

############################################## File Operations
echo "\n${info}Creating folders/files and copying over settings${nocolor}\n"
mkdir -p ~/Developer

curl -o ~/.zshrc https://raw.githubusercontent.com/austin-meadows/mac-install-script/main/.zshrc

############################################## Brew
echo "\n${info}Installing brew and applications${nocolor}\n"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install adguard
brew install cleanmymac
brew install fish
brew install git
brew install homebrew/cask-fonts/font-fira-code
brew install homebrew/cask-versions/discord-ptb
brew install slack
brew install visual-studio-code
brew install volta

############################################## System
echo "\n${info}Changing settings${nocolor}\n"

# Change screenshot dir
defaults write com.apple.screencapture location $HOME/Pictures

# (Hopefully) disable .DS_STORE on USB
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# .DS_STORE for network drives?
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

git config --global user.name "Austin Meadows"
git config --global user.email "austin-meadows@users.noreply.github.com"

sudo bash -c 'echo /opt/homebrew/bin/fish >> /etc/shells'
chsh -s /opt/homebrew/bin/fish

############################################## Cleanup
brew cleanup --prune=0

killall Dock
killall Finder
killall SystemUIServer

echo "\n${info}Done!${nocolor}\n"
