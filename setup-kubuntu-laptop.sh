 
# update system

sudo apt -y update
sudo apt -y upgrade

# install tools and utils

sudo apt -y install apt-transport-https ca-certificates lsb-release gnupg
sudo apt -y install vim gimp git htop wget curl build-essential zsh ffmpeg automake autoconf gnome-keyring

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

# setup docker permissions

# sudo groupadd docker
sudo usermod -aG docker $USER
# newgrp docker

# install google cloud sdk

# echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
# curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
# sudo apt -y update
# sudo apt -y install google-cloud-sdk

# install kubectl

# sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
# echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
# sudo apt -y update
# sudo apt -y install kubectl

# autoremove packages

sudo apt -y autoremove

# install other packages

cd ~/Downloads

wget -O discord.deb "https://discord.com/api/download?platform=linux&format=deb"
wget -O 1password.deb "https://downloads.1password.com/linux/debian/amd64/stable/1password-latest.deb"
wget -O chrome.deb "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
wget -O code.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"

sudo apt -y install ./chrome.deb ./code.deb ./discord.deb ./1password.deb

# install correct nvidia driver

sudo apt -y install nvidia-driver-510 nvidia-settings
sudo prime-select nvidia

# install oh-my-zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
