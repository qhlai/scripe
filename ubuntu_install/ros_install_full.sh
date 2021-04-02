#!/bin/bash
sudo ubuntu-drivers autoinstall #install GeForce GTX for gazebo
sudo apt-get install ubuntu-restricted-extras #for html5 vedio player
# Varibles
rosversion="kinetic"
# Install the ros

if [ `id -u` == 0 ]; then
	echo "Don't running this use root(sudo)."
	exit 0
fi

echo "Start to install the ros, http://wiki.ros.org/$rosversion/Installation/Ubuntu"
echo "Update the software list"
sudo sh -c '. /etc/lsb-release && echo "deb http://mirrors.ustc.edu.cn/ros/ubuntu/ $DISTRIB_CODENAME main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt-get update

echo "Install the ros from apt" 
sudo apt-get install ros-$rosversion-desktop-full -y
sudo apt-get upgrade ros-$rosversion-desktop-full -y
sudo rosdep init
rosdep update

echo "Setup the ROS environment variables"
echo -e "if [ -f /opt/ros/kinetic/setup.bash ]; then\n\tsource /opt/ros/kinetic/setup.bash\nfi" >> ~/.bashrc
echo "source ~/racecar/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc

echo "Install the rosinstall"
sudo apt-get install python-rosinstall -y

echo "Install the ssh"
sudo apt-get install ssh -y

echo "Install the ntpdate"
sudo apt-get install ntpdate -y

echo "Install the chrony"
sudo apt-get install chrony -y

# Install gazebo Ubuntu 16.04
echo "Install the gazebo only for Ubuntu 16.04 if slow pls passwall"

sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
sudo apt-get remove gazebo7 gazebo7-common gazebo7-plugin-base libgazebo7:amd64 libgazebo7-dev:amd64 -y
sudo apt-get install gazebo7 -y
sudo apt-get install libgazebo7-dev -y

# Install the dependecies for the project 
echo "Start to config for the project"

#echo "Install the python dependecies"
sudo apt-get install python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose -y

#echo "Install the eigen3"
#sudo apt install libeigen3-dev -y

#echo "Install the nlopt"
#sudo apt install libnlopt* -y



echo "Install the ROS package for art_racecar"
sudo apt-get install ros-$rosversion-joy -y
sudo apt-get install ros-$rosversion-move-base -y
sudo apt-get install ros-$rosversion-mrpt* -y
sudo apt-get install ros-$rosversion-geographic-msgs -y
sudo apt-get install ros-$rosversion-map-server -y
sudo apt-get install ros-$rosversion-gmapping -y
sudo apt-get install ros-$rosversion-amcl -y
sudo apt-get install ros-$rosversion-rviz-imu-plugin -y
sudo apt-get install ros-$rosversion-dwa-local-planner -y
sudo apt-get install ros-$rosversion-controller-manager -y
sudo apt-get install ros-$rosversion-gazebo-ros-control -y
sudo apt-get install ros-$rosversion-effort-controllers -y
sudo apt-get install ros-$rosversion-joint-state-controller -y
sudo apt-get install ros-$rosversion-driver-base -y
sudo apt-get install ros-$rosversion-rtabmap-ros -y
sudo apt-get install ros-$rosversion-ackermann-msgs -y
sudo apt-get install ros-$rosversion-teb-local-planner -y
sudo apt-get install ros-$rosversion-open-karto -y
sudo apt-get install ros-$rosversion-slam-karto -y

echo "--Finish"
