#!/bin/zsh

ZSHRC_PATH=$HOME/.zshrc

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
if sudo -v ; then
    echo "Sudo credentials already setup."
else
    loginSudo
fi

#install oh my zsh
if [ ! -d "$HOME/.oh-my-zsh" ]
then
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "oh-my-zsh is already installed."
fi

# install zsh-autosuggestions & zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

plugins="(git docker zsh-autosuggestions zsh-syntax-highlighting web-search)"
sed -i "s|^plugins=.*|plugins=$plugins|g" "$ZSHRC_PATH"
echo "oh my zsh plugins: $plugins are set up successfully."

# install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"
sed -i "s|^ZSH_THEME=.*|ZSH_THEME=$ZSH_THEME|g" "$ZSHRC_PATH"
echo "set up zsh theme to $ZSH_THEME successfully."
source $ZSHRC_PATH

## install homebrew
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#
## Add brew path to zshrc
#BREW_INSTALL_PATH="/opt/homebrew/bin"
#getBrewShellEnv="$BREW_INSTALL_PATH/brew shellenv"
#echo "eval \$($getBrewShellEnv)" >> "$HOME"/.zprofile
#source "$HOME"/.zprofile
#brew --version

## install neovim
#brew install neovim

# # install iterm2
# brew install --cask iterm2


## install docker (Apple Silicon)
#DOCKER_INSTALLATION_DMG="Docker.dmg"
#DOCKER_DOWNLOAD_URL="https://desktop.docker.com/mac/main/arm64/Docker.dmg"
#wget -O "$DOCKER_INSTALLATION_DMG" "$DOCKER_DOWNLOAD_URL"
#sudo hdiutil attach Docker.dmg
#sudo /Volumes/Docker/Docker.app/Contents/MacOS/install --accept-license
#sudo hdiutil detach /Volumes/Docker
#rm $DOCKER_INSTALLATION_DMG
