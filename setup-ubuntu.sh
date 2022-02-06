# update system

sudo apt -y update
sudo apt -y upgrade

# install tools and utils

sudo apt -y install ca-certificates lsb-release gnupg
sudo apt -y install vim gimp git htop wget curl build-essential zsh inkscape x11-apps libcanberra-gtk-module ffmpeg

# install nodejs

curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt -y install nodejs

# install yarn

sudo npm i -g yarn

# install docker

sudo apt -y remove docker docker-engine docker.io containerd runc
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt -y update
sudo apt -y install docker-ce docker-ce-cli containerd.io

# install downloaded packages

cd ~/Downloads

sudo apt -y install ./chrome.deb ./code.deb ./discord.deb

# build and install cursors

cd ~
git clone https://github.com/keeferrourke/capitaine-cursors
cd capitaine-cursors
mkdir -p ~/.icons
./build.sh -p unix -t dark -d tv
cp -r dist/dark ~/.icons/capitain-cursors

# install icons

cd ~/.icons
git clone https://github.com/keeferrourke/la-capitaine-icon-theme.git

cd ~

# replace gnome with unity

sudo apt -y install ubuntu-unity-desktop unity-tweak-tool
sudo apt -y purge gnome-shell thunderbird firefox
sudo apt -y autoremove

# install theme

sudo apt -y install arc-theme

# install correct nvidia driver

sudo apt -y install nvidia-driver-470 nvidia-settings

# install oh-my-zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
