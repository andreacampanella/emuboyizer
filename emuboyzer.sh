#let's install vim

if [ "$(whoami)" = "root" ]; then
	echo 'This script need to run as user , not root.'
	exit 1
fi

echo 'Updating apt database'
sudo apt-get update   

echo 'Installing base system packages'
sudo apt-get -y install inkscape vim zsh git-core screen arduino terminator gtkterm build-essential htop powertop libxss1 libappindicator1 libindicator7 vlc openssh-server   

echo 'Installing oh-my-zsh'
wget -q https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh 
chsh -s `which zsh`

echo 'Installing custom color theme'
wget -q https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.256dark   

echo 'Setting custom colours'
sudo mv dircolors.256dark /etc/dircolors   

echo 'Installing Google Chrome'
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 
sudo dpkg -i google-chrome*.deb   
rm google-chrome-stable_current_amd64.deb

echo 'Install Dropbox'

sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E   
if [ ! -f "/etc/apt/sources.list.d/dropbox.list" ];then
	print "Seems like you already got dropbox's repo installed."
    sudo sh -c 'echo "deb http://linux.dropbox.com/ubuntu/ xenial main" >> /etc/apt/sources.list.d/dropbox.list' 
fi

sudo apt-get update 
sudo apt-get -y install dropbox 

echo 'Install Spotify'
# 1. Add the Spotify repository signing key to be able to verify downloaded packages
sudo snap install spotify
#install kodi
sudo add-apt-repository ppa:team-xbmc/ppa    
sudo apt-get update    
sudo apt-get -y install kodi     
