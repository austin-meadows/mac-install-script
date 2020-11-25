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

############################################## File Operations
echo "\n${info}Creating folders/files and copying over settings${nocolor}\n"
# File/Folder creation
mkdir -p ~/Git
mkdir -p ~/Library/Application\ Support/Code/User/

# Settings downloads
curl -o ~/.zshrc https://raw.githubusercontent.com/austin-meadows/mac-install-script/main/.zshrc
cd ~/Library/Application\ Support/Code/User && { curl -O https://raw.githubusercontent.com/austin-meadows/mac-install-script/main/settings.json ; cd -; }
cd ~/Library/Application\ Support/Code/User && { curl -O https://raw.githubusercontent.com/austin-meadows/mac-install-script/main/keybindings.json ; cd -; }

############################################## Brew
echo "\n${info}Installing brew and applications${nocolor}\n"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# non-casks
brew install node
brew install yarn
# casks
brew cask install cleanmymac
brew cask install discord
brew cask install homebrew/cask-fonts/font-fira-code
brew cask install slack
brew cask install visual-studio-code


############################################## System
echo "\n${info}Changing system settings${nocolor}\n"
## Some items from https://github.com/gricard/new-mac/blob/master/setup.sh

# Don't write DS_STORE on Network or USBs
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Expanded file dialog by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true && \
defaults write com.apple.Safari IncludeDevelopMenu -bool true && \
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true && \
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true && \
defaults write -g WebKitDeveloperExtras -bool true

# Disable Auto-arrange spaces
defaults write com.apple.dock mru-spaces -bool false

# Set default search scope to current folder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Default new finder window location to ~
defaults write com.apple.finder NewWindowTarget -string "PfLo" && \
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

# Change screenshot location to ~/Pictures
defaults write com.apple.screencapture location ~/Pictures

# Kill to refresh
killall Dock
killall Finder
killall SystemUIServer

############################################## Special
echo "\n${info}Doing a few extra things${nocolor}\n"
# Update zsh
brew install zsh && \
sudo sh -c 'echo $(brew --prefix)/bin/zsh >> /etc/shells' && \
chsh -s $(brew --prefix)/bin/zsh

echo "\n${info}${bold}Please take a moment to open / allow VSCode to run.${normal}\t${blue}↩ ${nocolor}\n"
read

# VSCode extensions
code --install-extension dbaeumer.vscode-eslint
code --install-extension equinusocio.vsc-material-theme
code --install-extension equinusocio.vsc-material-theme-icons
code --install-extension esbenp.prettier-vscode
code --install-extension gruntfuggly.activitusbar
code --install-extension iocave.customize-ui
code --install-extension octref.vetur
code --install-extension richie5um2.vscode-sort-json


############################################## Cleanup
brew cleanup --prune=0
echo "\n${info}Done!${nocolor}\n"
