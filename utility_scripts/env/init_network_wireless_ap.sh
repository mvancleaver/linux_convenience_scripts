#!/bin/bash
############## Initilize Wireless Access Point
sudo apt install -y hostapd dnsmasq
# Create dnsmasq
sudo cp /etc/dnsmasq.conf /etc/dnsmasq.conf.orig
echo "interface=wlan0" >> dnsmasq.conf 
echo "dhcp-range=11.0.0.1,11.0.0.10" >> dnsmasq.conf 
echo "no-hosts" >> dnsmasq.conf 
sudo mv dnsmasq.conf  /etc/
sudo service dnsmasq restart
echo "------------> Created dnsmasq Config"
# Create hostapd Daemon
echo "DAEMON_CONF=/etc/hostapd/hostapd.conf" >> hostapd
sudo mv hostapd /etc/default/
echo "------------> Created hostapd Daemon"
# Create Config File 
echo "interface=wlan0" >> hostapd.conf
echo "driver=nl80211" >> hostapd.conf
echo "ssid=xcm_ap" >> hostapd.conf
echo "channel=6" >> hostapd.conf
echo "macaddr_acl=0" >> hostapd.conf
echo "auth_algs=1" >> hostapd.conf
echo "ignore_broadcast_ssid=0" >> hostapd.conf
echo "wpa=3" >> hostapd.conf
echo "wpa_passphrase=X.C.M.wireless.ap.connect" >> hostapd.conf
echo "wpa_key_mgmt=WPA-PSK" >> hostapd.conf
echo "wpa_pairwise=TKIP" >> hostapd.conf
echo "rsn_pairwise=CCMP" >> hostapd.conf
sudo mv hostapd.conf /etc/hostapd/
sudo hostapd -B /etc/hostapd/hostapd.conf
echo "------------> Created hostapd Configuration File"