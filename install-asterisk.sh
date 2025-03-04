sudo apt update && sudo apt upgrade
sudo apt install wget build-essential subversion
cd /usr/src/
sudo wget https://downloads.asterisk.org/pub/telephony/asterisk/asterisk-19-current.tar.gz
sudo tar zxf asterisk-19-current.tar.gz
cd asterisk-19.*/
sudo contrib/scripts/get_mp3_source.sh
sudo contrib/scripts/install_prereq install
sudo ./configure


sudo make menuselect
sudo make -j2
sudo make install
sudo make samples
sudo make config
sudo ldconfig

sudo systemctl start asterisk
sudo asterisk -vvvr

sudo ufw allow 5060/udp
