#!/bin/bash



echo "开始安装nvim..."
add-apt-repository ppa:neovim-ppa/unstable
apt-get update
apt-get install -y neovim
apt-get install -y git

if [[ ! -d ~/.config ]]
then
    mkdir ~/.config
fi

if [[ -d ~/.config/nvim ]]
then
if [[ -d ~/.config/nvim.backup ]]
then
    rm  ~/.config/nvim.backup
fi
    echo "mv ~/.config/nvim ~/.config/nvim.backup"
    mv ~/.config/nvim ~/.config/nvim.backup
fi

cp -r /tmp/nvim ~/.config/nvim

if [[ ! -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]]
then
    echo "git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim"
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi


echo "安装各种language-server"
echo "先安装npm"

mkdir -p /etc/apt/keyrings/
apt-get update &&  apt-get install -y ca-certificates curl gnupg
rm /etc/apt/keyrings/nodesource.gpg
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key |  gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" |  tee /etc/apt/sources.list.d/nodesource.list
apt-get update &&  apt-get install nodejs -y

npm install -g bash-language-server pyright vscode-langservers-extracted typescript typescript-language-server
apt-get install clangd-15;  update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-15 100
apt-get install clang-15;  update-alternatives --install /usr/bin/clang clangd /usr/bin/clang-15 100

echo "alias vi='nvim -u ~/.config/nvim/init.lua'" >> ~/.bashrc
