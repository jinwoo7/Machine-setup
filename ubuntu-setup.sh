echo " [x] Creating directory \"~/Downloads/temp\""
cd ~/Downloads
echo "Install result" > ~/Downloads/results.txt
mkdir temp
cd temp

# System Update
echo " [x] System update"
sudo apt update -y &>> ~/Downloads/results.txt

# System Upgrade
echo " [x] System upgrade"
sudo apt upgrade -y &>> ~/Downloads/results.txt

# Packages
echo " [x] Installing pakages"
sudo apt install vim gdebi-core vlc snap cscope emacs gdb git gcc htop python3 tig tmux net-tools wget netcat build-essential -y &>> ~/Downloads/results.txt

# Install - Chrome
echo " [x] Installing Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -q &>> ~/Downloads/results.txt

sudo gdebi google-chrome-stable_current_amd64.deb --n &>> ~/Downloads/results.txt

# Install - Spotify
echo " [x] Installing Spotify"
snap install spotify &>> ~/Downloads/results.txt

# Removing temp directroy
echo " [x] Removing directory \"~/Downloads/temp\""
rm -rf ~/Downloads/temp &>> ~/Downloads/results.txt

# Message
echo " [x] Results saved in \"~/Downloads/results.txt\""

