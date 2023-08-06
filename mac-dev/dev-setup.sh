#!/bin/zsh

#!/bin/bash

function loginSudo() {
    read -rsp "Enter your sudo password: " password

    # Use the password to validate sudo credentials
    echo "$password" | sudo -Sv

    # Check the exit status to determine if the password was correct
    if [ $? -eq 0 ]; then
        echo "Sudo credentials are valid."
    else
        echo "Invalid sudo password."
    fi
}

# set sudo credentials
loginSudo

# install homebrew
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add brew path to zshrc
# BREW_INSTALL_PATH="/opt/homebrew/bin"  
BREW_INSTALL_PATH="/home/linuxbrew/.linuxbrew/bin"
getBrewShellEnv="$BREW_INSTALL_PATH/brew shellenv"
echo $getBrewShellEnv
echo "eval \$($getBrewShellEnv)" >> $HOME/.zprofile
source "$HOME"/.zprofile

brew --version

# install neovim
brew install neovim

# # install iterm2
# brew install --cask iterm2

#install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#install powerlevel10k
