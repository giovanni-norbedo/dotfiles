#!/bin/bash

. ./echo_green.sh --source-only

echo_green "Installing other packages..."

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo_green "oh-my-zsh has been installed."
sleep 2
# Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo_green "powerlevel10k has been installed. Set ZSH_THEME='powerlevel10k/powerlevel10k' in .zshrc"
sleep 2
# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo_green "zsh-autosuggestions has been installed."
sleep 2
# Add zsh-autosuggestions to the plugins array in .zshrc
# Install zsh-syntax-highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
echo_green "Rust has been installed."
sleep 2
# Install Rust packages
cargo install erdtree # alternative to tree
cargo install exa # alternative to ls
cargo install fd-find # alternative to find
echo_green "Rust packages have been installed."
sleep 2

# Install Spicetify (Spotify customizer)
curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.sh | head -n -9 | sh
curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.sh | sh
spicetify restore backup apply
echo_green "Spicetify has been installed."
sleep 2

# Install GitHub CLI
sudo mkdir -p -m 755 /etc/apt/keyrings && wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y
echo_green "GitHub CLI has been installed."
sleep 2

# Install FantasqueSansM Nerd Font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FantasqueSansMono.zip
unzip FantasqueSansMono.zip -d FantasqueSansMono
cp FantasqueSansMono/*.ttf ~/.local/share/fonts
rm -rf FantasqueSansMono FantasqueSansMono.zip
# Change the font
echo_green "FantasqueSansM Nerd Font has been installed."



# FUTURE
# https://linrunner.de/tlp/introduction.html
# Install other zsh plugins
# Install pip packages
# conky neovim playerctl pv riseup nvtop 
# sudo apt install -y balena-etcher
# https://docs.flutter.dev/get-started/install/linux
# https://www.warp.dev/