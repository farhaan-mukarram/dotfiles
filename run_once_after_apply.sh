#!/bin/bash

# Install zsh and set it as the default shell
sudo apt install zsh
chsh -s $(which zsh)

# Download powerlevel 10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Download plugins for oh-my-zsh
# zsh-syntax-hightlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

# Download and install nerd fonts
FONT_URLS=(
    "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"
    "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf"
    "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf"
    "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"
)
FONT_DIR="$HOME/.fonts"

# Create the font directory if it doesn't exist
mkdir -p "$FONT_DIR"

# Download and install fonts
for URL in "${FONT_URLS[@]}"; do
    FONT_FILE=$(basename "$URL")
    wget -q "$URL" -O "$FONT_DIR/$FONT_FILE"
done

# Install font-config package
sudo apt install fontconfig

# Refresh the font cache
fc-cache -fv

