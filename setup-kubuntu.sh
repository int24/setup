# update system

sudo apt -y update
sudo apt -y upgrade

# install tools and utils

sudo apt -y install apt-transport-https ca-certificates lsb-release gnupg
sudo apt -y install vim gimp git htop wget curl build-essential zsh ffmpeg

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

# install google cloud sdk

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt -y update
sudo apt -y install google-cloud-sdk

# install kubectl

sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt -y update
sudo apt -y install kubectl

# install downloaded packages

cd ~/Downloads

sudo apt -y install ./chrome.deb ./code.deb ./discord.deb

# install correct nvidia driver

sudo apt -y install nvidia-driver-470 nvidia-settings

# install oh-my-zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
