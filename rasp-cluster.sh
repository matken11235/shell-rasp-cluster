#!bin/bash

cd /Volumes/boot

touch ssh
echo 'ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=JP

network={
        ssid="Buffalo-G-B82E"
        psk="r5h5xeu4ane4h"
        key_mgmt=WPA-PSK
}
' > wpa_supplicant.conf

echo '
$ sudo apt update
$ sudo apt upgrade -y
$ sudo apt install -y vim

# static ip
$ sudo vim /etc/dhcpcd.conf
interface wlan0
static ip_address=192.168.11.40/24
static routers=192.168.11.1
static domain_name_servers=192.168.11.1

# Public-key cryptography
$ scp rasp.pub rasp:~/
pi@rasp: $ mkdir ~/.ssh
         $ cat rasp.pub >> ~/.ssh/authorized_keys
         $ chmod 700 ~/.ssh
         $ chmod 600 ~/.ssh/authorized_keys
         $ rm -f rasp.pub
         $ sudo vim /etc/ssh/sshd_config
PubkeyAuthentication yes
uthorizedKeysFile      .ssh/authorized_keys .ssh/authorized_keys2
PasswordAuthentication no
         $ sudo /etc/init.d/ssh restart
'

