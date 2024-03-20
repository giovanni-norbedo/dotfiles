#!/bin/bash

. ./echo_green.sh --source-only

echo_green "Installing Flatpak packages..."

# Flatpak basic packages
flatpak install flathub io.github.flattool.Warehouse -y # Flatpak Warehouse (Flatpak GUI)
flatpak install flathub com.github.tchx84.Flatseal -y # Flatseal (Flatpak permissions manager)
flatpak install flathub org.kde.filelight -y # Filelight (Disk usage analyzer)
flatpak install flathub org.gnome.World.PikaBackup -y # Pika Backup (Backup tool)
echo_green "Flatpak basic packages have been installed (Warehouse, Flatseal, Filelight, Pika Backup)."
sleep 3
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
echo_green "Flatpak utilities have been installed (AppImage Pool, qBittorrent, TorrHunt, LibreOffice, VLC, Moosync, Cheese, LibreMenuEditor, Dolphin)."
sleep 3
# Browsers
flatpak install flathub org.mozilla.firefox -y # Firefox
flatpak install flathub org.torproject.torbrowser-launcher -y # Tor Browser
flatpak install flathub org.chromium.Chromium -y # Chromium
flatpak install flathub com.google.Chrome -y # Google Chrome
flatpak install flathub com.google.ChromeDev -y # Google Chrome Dev
echo_green "Flatpak browsers have been installed (Firefox, Tor Browser, Chromium, Google Chrome, Google Chrome Dev)."
sleep 3
# Development
flatpak install flathub com.visualstudio.code -y # VSCode
flatpak install flathub com.jetbrains.PyCharm-Professional -y # PyCharm
flatpak install flathub com.google.AndroidStudio -y # Android Studio
flatpak install flathub com.github.huluti.Curtail -y # Curtail (Image compressor)
flatpak install flathub com.github.gijsgoudzwaard.image-optimizer -y # Image Optimizer
flatpak install flathub io.emeric.toolblex -y # toolBLEx (BLE scanner)
flatpak install flathub com.github.sdv43.whaler -y # Whaler (Docker GUI)
echo_green "Flatpak development tools have been installed (VSCode, PyCharm, Android Studio, Curtail, Image Optimizer, toolBLEx, Whaler)."
sleep 3
# Note taking
flatpak install flathub com.github.xournalpp.xournalpp -y # Xournal++ (PDF annotator)
flatpak install flathub net.ankiweb.Anki -y # Anki (Flashcards)
flatpak install flathub io.appflowy.AppFlowy -y # AppFlowy (Note taking app)
flatpak install flathub net.giuspen.cherrytree -y # CherryTree (Note taking app)
flatpak install flathub net.sourceforge.jpdftweak.jPdfTweak -y # jPdfTweak (PDF editor)
echo_green "Flatpak note taking apps have been installed (Xournal++, Anki, AppFlowy, CherryTree, jPdfTweak)."
sleep 3
# Social
flatpak install flathub com.github.IsmaelMartinez.teams_for_linux -y # Microsoft Teams
flatpak install flathub com.discordapp.Discord -y # Discord
flatpak install flathub org.telegram.desktop -y # Telegram
echo_green "Flatpak social apps have been installed (Microsoft Teams, Discord, Telegram)."
sleep 3
flatpak install flathub com.spotify.Client -y # Spotify
# Hacking
flatpak install flathub org.wireshark.Wireshark -y # Wireshark
flatpak install flathub org.nmap.Zenmap -y # Zenmap
flatpak install flathub org.zaproxy.ZAP -y # OWASP ZAP
flatpak install flathub net.werwolv.ImHex -y # ImHex (Hex editor)
flatpak install flathub com.openwall.John -y # John the Ripper (Password cracker)
flatpak install flathub org.ghidra_sre.Ghidra -y # Ghidra (Reverse engineering)
echo_green "Flatpak hacking tools have been installed (Wireshark, Zenmap, OWASP ZAP, ImHex, John the Ripper, Ghidra)."
sleep 3
# Other
flatpak install flathub com.rafaelmardojai.Blanket -y # Blanket (Background noise app)
flatpak install flathub com.github.miguelmota.Cointop -y # Cointop (Cryptocurrency tracker)
flatpak install flathub org.raspberrypi.rpi-imager -y # Raspberry Pi Imager
echo_green "Flatpak other apps have been installed (Blanket, Cointop, Raspberry Pi Imager)."
echo_green "All Flatpak packages have been installed."