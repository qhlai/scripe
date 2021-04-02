#!/bin/bash
# Varibles

# Install the kde

if [ `id -u` == 0 ]; then
	echo "Don't running this use root(sudo)."
	exit 0
fi

sudo apt-get update
sudo apt install kubuntu-desktop
echo "使用上下键选择 sddm，然后回车确定。如果未弹出上图界面，尝试输入以下该指令后，重新进行操作。"
echo "sudo apt --fix-broken install“


echo "--Finish"
