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

