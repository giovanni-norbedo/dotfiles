# Update the system
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove
sudo apt clean

# Set journalctl to use less space
sudo journalctl --vacuum-time=3d

# Install the basic packages
sudo apt install -y build-essential procps curl file git wget htop net-tools nmap brightnessctl suckless-tools tree autorandr openssh-server

# Install the basic development packages
sudo apt install -y python3 python3-pip python-is-python3 docker jq nodejs npm pandoc texlive texlive-xetex

# Install utils/ricing packages
sudo apt install -y bat bspwm btop cava cmatrix fdupes feh gh neofetch kitty picom polybar pulsemixer ranger rofi sxhkd tmux tty-clock vim zsh

# Flatpak set up
sudo apt install -y flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Install flatpak packages
# Flatpak basic packages
flatpak install flathub io.github.flattool.Warehouse -y # Flatpak Warehouse (Flatpak GUI)
flatpak install flathub com.github.tchx84.Flatseal -y # Flatseal (Flatpak permissions manager)
flatpak install flathub org.kde.filelight -y # Filelight (Disk usage analyzer)
# Utilities
flatpak install flathub io.github.prateekmedia.appimagepool -y # AppImage Pool (AppImage manager)
flatpak install flathub org.qbitorrent.qBittorrent -y # qBittorrent
flatpak install flathub com.ktechpit.torrhunt -y # TorrHunt (Torrent search)
flatpak install flathub org.libreoffice.LibreOffice -y # LibreOffice
flatpak install flathub org.videolan.VLC -y # VLC
flatpak install flathub app.moosync.moosync -y # Moosync (Music player)
flatpak install flathub org.gnome.Cheese -y # Cheese (Webcam app)
flatpak install flathub page.codeberg.libre_menu_editor.LibreMenuEditor -y # LibreMenuEditor (Menu editor)
flatpak install flathub org.kde.dolphin -y # Dolphin (File manager)
# Browsers
flatpak install flathub org.mozilla.firefox -y # Firefox
flatpak install flathub org.torproject.torbrowser-launcher -y # Tor Browser
flatpak install flathub org.onionshare.OnionShare -y # OnionShare
flatpak install flathub org.chromium.Chromium -y # Chromium
flatpak install flathub com.google.Chrome -y # Google Chrome
flatpak install flathub com.google.ChromeDev -y # Google Chrome Dev
# Development
flatpak install flathub com.visualstudio.code -y # VSCode
flatpak install flathub com.jetbrains.PyCharm-Professional -y # PyCharm
flatpak install flathub com.google.AndroidStudio -y # Android Studio
flatpak install flathub com.github.huluti.Curtail -y # Curtail (Image compressor)
flatpak install flathub com.github.gijsgoudzwaard.image-optimizer -y # Image Optimizer
flatpak install flathub io.emeric.toolblex -y # toolBLEx (BLE scanner)
# Note taking
flatpak install flathub com.github.xournalpp.xournalpp -y # Xournal++ (PDF annotator)
flatpak install flathub net.ankiweb.Anki -y # Anki (Flashcards)
flatpak install flathub io.appflowy.AppFlowy -y # AppFlowy (Note taking app)
flatpak install flathub net.giuspen.cherrytree -y # CherryTree (Note taking app)
flatpak install flathub net.sourceforge.jpdftweak.jPdfTweak -y # jPdfTweak (PDF editor)
# Other
flatpak install flathub com.rafaelmardojai.Blanket -y # Blanket (Background noise app)
flatpak install flathub com.github.miguelmota.Cointop -y # Cointop (Cryptocurrency tracker)
flatpak install flathub org.raspberrypi.rpi-imager -y # Raspberry Pi Imager
# Social
flatpak install flathub com.github.IsmaelMartinez.teams_for_linux -y # Microsoft Teams
flatpak install flathub com.discordapp.Discord -y # Discord
flatpak install flathub org.telegram.desktop -y # Telegram
flatpak install flathub com.spotify.Client -y # Spotify
# Hacking
flatpak install flathub org.wireshark.Wireshark -y # Wireshark
flatpak install flathub org.nmap.Zenmap -y # Zenmap
flatpak install flathub org.zaproxy.ZAP -y # OWASP ZAP
flatpak install flathub net.werwolv.ImHex -y # ImHex (Hex editor)
flatpak install flathub com.openwall.John -y # John the Ripper (Password cracker)
flatpak install flathub org.ghidra_sre.Ghidra -y # Ghidra (Reverse engineering)

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Install Rust packages
cargo install erdtree # alternative to tree
cargo install exa # alternative to ls
cargo install fd-find # alternative to find

# Install Spicetify (Spotify customizer)
curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.sh | sh
curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.sh | sh

# Install lazydocker (Docker GUI)
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

# Install from GitHub repositories
mkdir cloned && cd cloned

# Install fzf (fuzzy finder)
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Add zsh-autosuggestions to the plugins array in .zshrc

# Install zsh-syntax-highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md

# Install GitHub CLI
sudo mkdir -p -m 755 /etc/apt/keyrings && wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y


# FUTURE
# Install other zsh plugins
# Install Node.js packages
# Install fonts 
# FantasqueSansM Nerd Font
# conky neovim playerctl pv riseup nvtop 
# sudo apt install -y balena-etcher
# https://www.kali.org/tools/
# https://docs.flutter.dev/get-started/install/linux
# https://go.dev/doc/install
# VSCode extensions
# VSCode settings
# themes
# oh-my-zsh