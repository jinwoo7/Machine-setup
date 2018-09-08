# Script by Jinwoo

# Initializing results.txt
echo " [x] Initializing results.txt"
rm -f results.txt
touch results.txt
chmod 666 results.txt

# System Update
echo " [x] System update"
sudo apt update -y >> results.txt 2>&1

# System Upgrade
echo " [x] System upgrade"
sudo apt upgrade -y >> results.txt 2>&1

# Packages
echo " [x] Installing pakages"
sudo apt install vim gdebi-core vlc snap cscope emacs gdb git gcc htop python3 tig tmux net-tools wget netcat build-essential gpg -y >> results.txt 2>&1

# Setting up vim
echo " [x] Getting vim settings"
cp configs/.vimrc ~/.vimrc >> results.txt 2>&1

# Opening up secret folder
echo " [x] Opening secret folder"
gpg configs/secrets.tar.gz.gpg
tar -zxvf configs/secrets.tar.gz >> results.txt 2>&1

# Setting up ssh keys
echo " [x] Setting up ssh keys"
rm -rf ~/.ssh
mv sdirectory/.ssh ~/.ssh

# Setting up the server connection folder
echo " [x] Setting up the server connection folder"
rm -rf ~/servers
mv sdirectory/servers ~/servers

# Setting up git account
echo " [x] Setting up git"
git config --global user.name "Jinwoo Yom"
git config --global user.email "jinwoo7@vt.edu"
git config --global core.editor vim

# Creating temp directory
echo " [x] Creating and moving to directory \"temp\""
rm -rf temp
mkdir temp
cd temp

# Install - Chrome
echo " [x] Installing Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -q >> ../results.txt 2>&1

sudo gdebi google-chrome-stable_current_amd64.deb --n >> ../results.txt 2>&1

# Install - Spotify
echo " [x] Installing Spotify"
snap install spotify --no-wait >> ../results.txt 2>&1

# Cleaning up directory
echo " [x] Removing directory \"temp\""
cd ..
rm -rf temp >> results.txt 2>&1
rm -rf sdirectory >> results.txt 2>&1
rm -f configs/secrets.tar.gz >> results.txt 2>&1

# Application dock setup
echo " [x] Setting up dock favorites"
dconf write /org/gnome/shell/favorite-apps "['google-chrome.desktop', 'org.gnome.Nautilus.desktop', 'libreoffice-writer.desktop', 'libreoffice-calc.desktop', 'org.gnome.Terminal.desktop', 'gnome-control-center.desktop', 'spotify_spotify.desktop', 'vlc.desktop']"

# Making gitProjects folder
echo " [x] Setting up gitProject directory"
rm -rf ~/gitProject
mkdir ~/gitProject

# Message
echo " [x] Results saved in \"~/Downloads/results.txt\""

