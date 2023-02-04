# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "Bruv you must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

username=$(id -u -n 1000)
builddir=$(pwd)

#Deactivate Snapd(Fr no one likes it)
apt purge snapd
apt-mark hold snapd

# Update packages list and update system
apt update
apt upgrade -y

# Install nala(cat glittering installer)
apt install nala -y

# Tasksel to install required GUI(deal with this ik it installs loads of useless games)
nala install tasksel -y

# Install brave-browser(someone start making orion for linux I dont want this)
sudo nala install apt-transport-https curl -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo nala update
sudo nala install brave-browser -y

#Set target to graphical
systemctl set-default graphical.target
