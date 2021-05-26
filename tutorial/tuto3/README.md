# Tutorial 3 - Router Bridge  
  
Following tutorial was done with Raspbian 10 Buster and hostapd 2.7  
  
  
  
**Recommendation:**  
  
DO NOT use your main system disk (sdCard), instead, use a fresh system  
or some "learn/lab/test" system to makes theses tutorials/experiments.  
After completing all set of 3 tutorials you should be able to have  
a good basic understanding of the whole matter, and should be able  
to know the best way to use the knowledge...  
  
Text Editor:  
Use the text editor of your preference, like  
Geany (GUI based) or Nano (terminal based), etc.  
  
  
  
**A3.1.0 WiFi between 2 peers (or more) w/ automatic IP Address.**  
  
  
**A3.1.1 Install hostapd software**  
  
	sudo apt install hostapd  
  
Temporarilly shutdown hostapd service  
  
	sudo service hostapd stop  
  
Unmask (unlock) hostapd service  
  
	sudo systemctl unmask hostapd.service  
	sudo systemctl enable hostapd.service  
  
  
**A3.1.2 Create/Modify hostapd configuration file (/etc/hostapd/hostapd.conf)**  
  
	sudo  nano  /etc/hostapd/hostapd.conf  
  
Copy and Paste the following text  
  
```
interface=wlan0  

#  The following line is new to the config.
#  This line does not existed in the tuto1 and tuto2...
bridge=br0

driver=nl80211  
hw_mode=g  
channel=6  
wmm_enabled=0  
macaddr_acl=0  
auth_algs=1  
ignore_broadcast_ssid=0  
wpa=2  
wpa_key_mgmt=WPA-PSK  
wpa_pairwise=TKIP  
rsn_pairwise=CCMP  
ssid=YOUR-SSID  
wpa_passphrase=YOUR-PASSPHRASE-PASSWORD  
```
  
  
  
**A3.1.3 Edit the file /etc/default/hostapd, modify the variable "DAEMON_CONF".**  
  
Find the line with "#DAEMON_CONF=",   
Remove any "#" sign at the beginning of the line, if it exist.  
add the following value:  
  
```
DAEMON_CONF="/etc/hostapd/hostapd.conf"  
```
  
  
  
**A3.1.4 Edit the file /etc/dhcpcd.conf, give the WIFI an static IP Address**  
  
  
	sudo  nano  /etc/dhcpcd.conf  
  
Add the following lines at the end of the file.  
  
```
interface wlan0  
static ip_address=192.168.50.1/24  
nohook wpa_supplicant  
```
  
  
  
**A3.1.5 Start/Restart hostapd service**  
  
  
	sudo service hostapd start  
  
  
  
**A3.1.6 Reboot the system**  
  
  
Reboot the system, so that you can use the installed software.   
  
  
  
.

**A3.2.0 Add Internet Routing to the peers (iptables rules)**  
  
THIS STEP IS NOT USED IN THIS TUTORIAL 3!  
  
THIS STEP IS NOT USED IN THIS TUTORIAL 3! No iptables rules are used.  
  
Please, move to the next step 3.3.0  
  
  
  
**A3.3.0 Install and Configure Bridge Software**  
  
  
**A3.3.1 Install bridge-utils**  
  
	sudo apt install bridge-utils
  
  
  
**A3.3.2 Configure system  /etc/network/interfaces**  
  
	sudo nano  /etc/network/interfaces  
  
Add the following 3 lines at the end:  
  
```
auto br0
iface br0 inet manual
bridge_ports eth0 wlan0
```
  
  
  
**A3.3.3 Just Reminder, Modify  /etc/hostapd/hostapd.conf**  
  
This step just repeat what the step 3.1.2 did, so it is a repetition...  
  
If you have NOT done so, then you need to add the following line  
to the  /etc/hostapd/hostapd.conf  file:  
  
	sudo  nano  /etc/hostapd/hostapd.conf  
  
Add the following line:  
  
```
bridge=br0
```
  
  
This step is already described in the step 3.1.2, above.  
If you already have done so, you DO NOT need to do it again (twice).  
  
  
  
**A3.3.4 Reboot the system**  
  
	sudo  reboot  
  
  
Congratulation, with this tutorial 3 perfomed, you have MANY different  
options to create mini-networks, wifi-groups, net sharing groups, etc...  
  
We already live in an AGE OF MULTIPLE DEVICES per person, and,  
an AGE of INTERNET OF EVERYTHING, so, to make a really good use  
of all these devices we will need to have/create many different  
networks/groups setups for many different needs.  
  
I hope these 3 small tutorials help you to start getting important  
knowledge about such an important subject. From here, daily needs  
and your imagination are enough to lead you to further exploration.  
  
  
  
.
