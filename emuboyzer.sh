#let's install vim
echo 'This script need to run as user , not root.'
echo 'updating apt database'
sudo apt-get update > /dev/null 
echo 'installing vim,zsh,git,screen,gtkterm,htop,powertop'
sudo apt-get -y install vim zsh git-core screen gtkterm build-essential htop powertop libxss1 libappindicator1 libindicator7 vlc openssh-server > /dev/null
echo 'installing oh-my-zsh'
wget -q https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh 
chsh -s `which zsh`
echo 'installing custom color theme'
wget -q https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.256dark > /dev/null
echo 'setting custom color'
sudo mv dircolors.256dark /etc/dircolors > /dev/null
echo 'install google chrome'
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 
sudo dpkg -i google-chrome*.deb > /dev/null
rm google-chrome-stable_current_amd64.deb
echo 'install dropbox'
cd ~ && wget -q -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd
echo 'install spotify'
# 1. Add the Spotify repository signing key to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886

# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# 3. Update list of available packages
sudo apt-get update > /dev/null

# 4. Install Spotify
sudo apt-get -y install spotify-client > /dev/null

