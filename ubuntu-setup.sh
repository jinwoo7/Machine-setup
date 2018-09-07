# Script by Jinwoo

# System Update
echo " [x] System update"
sudo apt update -y &>> results.txt

# System Upgrade
echo " [x] System upgrade"
sudo apt upgrade -y &>> results.txt

# Packages
echo " [x] Installing pakages"
sudo apt install vim gdebi-core vlc snap cscope emacs gdb git gcc htop python3 tig tmux net-tools wget netcat build-essential -y &>> results.txt

# Setting up vim
echo " [x] Getting vim settings"
cp configs/.vimrc ~/.vimrc &>> results.txt

# Setting up ssh keys
echo " [x] Setting up ssh keys - TODO"




# Creating temp directory
echo " [x] Creating and moving to directory \"temp\""
rm -rf temp &>> results.txt
mkdir temp
cd temp

# Install - Chrome
echo " [x] Installing Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -q &>> results.txt

sudo gdebi google-chrome-stable_current_amd64.deb --n &>> results.txt

# Install - Spotify
echo " [x] Installing Spotify"
snap install spotify --no-wait &>> results.txt

# Application dock setup
echo " [x] Setting up dock favorites"
dconf write /org/gnome/shell/favorite-apps "['google-chrome.desktop', 'org.gnome.Nautilus.desktop', 'libreoffice-writer.desktop', 'libreoffice-calc.desktop', 'org.gnome.Terminal.desktop', 'gnome-control-center.desktop', 'spotify_spotify.desktop', 'vlc.desktop']"

# Removing temp directory
echo " [x] Removing directory \"~/Downloads/temp\""
rm -rf temp &>> results.txt

# Message
echo " [x] Results saved in \"~/Downloads/results.txt\""

