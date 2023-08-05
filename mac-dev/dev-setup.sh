#!/bin/zsh

#install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


source "$HOME"/.zshrc


# install neovim
brew install neovim

# install iterm2
brew install --cask iterm2
