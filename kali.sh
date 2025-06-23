#!/bin/bash

# chmod +x "dosyaismi".sh ile çalıştırılabilir yap.
# sudo ./dosyaismi.sh ile çalıştır.

echo "🔧 [1/10] Sistem güncelleniyor..."
sudo apt update && sudo apt upgrade -y

echo "🎨 [2/10] GNOME masaüstü kuruluyor..."
sudo apt install kali-desktop-gnome gnome-core gnome-tweaks gnome-shell-extensions -y

echo "🎮 [3/10] NVIDIA sürücüleri kuruluyor..."
sudo apt install nvidia-driver nvidia-settings -y

echo "🧰 [4/10] Lutris, Steam, Wine, Vulkan, DXVK kuruluyor..."
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install steam lutris wine winetricks wine32 wine64 libwine:i386 fonts-wine \
vulkan-tools mesa-vulkan-drivers dxvk -y

echo "🎮 [5/10] MangoHUD (FPS göstergesi) kuruluyor..."
sudo apt install mangohud -y

echo "🧠 [6/10] Pentest araçları yükleniyor..."
sudo apt install kali-linux-top10 kali-tools-web kali-tools-wireless kali-tools-exploitation -y

echo "📝 [7/10] VSCode kuruluyor..."
sudo apt install code -y

echo "📢 [8/10] Discord + ekran paylaşımı (PipeWire) kuruluyor..."
wget -O discord.deb "https://discord.com/api/download?platform=linux&format=deb"
sudo apt install ./discord.deb -y
sudo apt install pipewire wireplumber -y

echo "⚙️ [9/10] Performans ayarları yapılıyor..."
sudo apt install linux-cpupower -y
sudo cpupower frequency-set -g performance
echo \"vm.swappiness=10\" | sudo tee -a /etc/sysctl.conf

echo "✨ [10/10] GNOME görsel ayarları uygulanıyor..."
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface enable-animations true

echo "✅ Kurulum tamamlandı. Şimdi sistemi yeniden başlatmanız önerilir."
