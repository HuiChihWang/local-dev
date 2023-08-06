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

#install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


source "$HOME"/.zshrc


# install neovim
brew install neovim

# install iterm2
brew install --cask iterm2
