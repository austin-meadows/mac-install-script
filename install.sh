#!/usr/bin/env bash

printf '\33c\e[3J'
cd $HOME

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
mkdir -p $HOME/Developer

curl -o $HOME/.config/fish/config.fish https://raw.githubusercontent.com/austin-meadows/mac-install-script/main/config.fish

############################################## Brew
echo "\n${info}Installing brew and applications${nocolor}\n"

export HOMEBREW_INSTALL_FROM_API=1
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install fish
brew install git
brew install visual-studio-code

############################################## System
echo "\n${info}Changing settings${nocolor}\n"

# Change screenshot dir
defaults write com.apple.screencapture location $HOME/Pictures

# Change screenshot type
defaults write com.apple.screencapture type GIF

# (Hopefully) disable .DS_STORE on USB
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# .DS_STORE for network drives?
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

git config --global user.name "Austin Meadows"
git config --global user.email "austin@slowp.ke"

sudo bash -c 'echo $(which fish) >> /etc/shells'
chsh -s $(which fish)

############################################## Cleanup
brew cleanup --prune=all

echo "\n${info}Done!${nocolor}\n"
