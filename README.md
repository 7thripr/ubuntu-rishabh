# ubuntu-rishabh
Script to install GUI on Ubuntu Server iso (LTS/non-LTS). Minimalism is upto tasksel. Because Windows 11 wants Secure boot and I want goodness of server and use my desktop power when i am not at home.


### Download Ubuntu Server

Download from <https://ubuntu.com/download/server> and install the ISO using any imaging tool, eg- (Ventoy, BalenaEtcher, Rufus). 

### Installation Guide

```
git clone
cd ubuntu-rishabh
sudo ./install.sh
```

### Installing nVidia driver network issue fix

```
sudo systemctl stop NetworkManager
sudo systemctl disable NetworkManager
sudo systemctl mask NetworkManager
sudo systemctl unmask systemd-networkd.service
sudo systemctl enable systemd-networkd.service
sudo systemctl start systemd-networkd.service
```

Then open 00-installer-config.yaml file

```
sudo nano /etc/netplan/00-installer-config.yaml
```

Add this to the file
```
network:
  version: 2
  renderer: networkd
  ethernets:
  enp0s3:
  dhcp4: yes
```

Credits:

@ChrisTitusTech

Linux forums for the network fix
