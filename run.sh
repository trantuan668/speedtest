rm -rf runblockspeedtest.x
clear
echo "đang chạy chặn speedtest"
echo -e ""
sleep 5
sudo apt install iptables-persistent netfilter-persistent
iptables -I INPUT -s www.fast.com -j DROP 
iptables -I INPUT -s fast.com -j DROP
iptables -I INPUT -s 23.6.64.32 -j DROP
iptables -I INPUT -s 23.62.192.32 -j DROP
iptables -I INPUT -s 23.0.25.192 -j DROP
iptables -I INPUT -s 23.198.103.141 -j DROP
iptables -I INPUT -s 23.41.68.21 -j DROP
iptables -I INPUT -s 23.199.140.37 -j DROP
iptables -I INPUT -s 23.75.3.237 -j DROP
iptables -I INPUT -s 23.206.86.51 -j DROP
iptables -I INPUT -s 104.82.233.194 -j DROP
iptables -I INPUT -s 23.2.167.210 -j DROP
iptables -I INPUT -s 23.55.9.201 -j DROP 
iptables -I INPUT -s 96.6.245.130 -j DROP
iptables -I INPUT -s 23.74.25.66 -j DROP
iptables -I INPUT -s 2.16.130.65 -j DROP
iptables -I INPUT -s 193.108.91.242 -j DROP
iptables -I INPUT -s 2.22.230.67 -j DROP
iptables -I INPUT -s 23.61.199.67 -j DROP
iptables -I INPUT -s 184.26.161.64 -j DROP
iptables -I INPUT -s 104.69.155.127 -j DROP
iptables -I INPUT -s 104.79.117.187 -j DROP
iptables -I INPUT -s 184.87.184.82 -j DROP
iptables -I INPUT -s speedtest.net -j DROP
iptables -I INPUT -s www.speedtest.net -j DROP
iptables -I INPUT -s 151.101.66.219 -j DROP
iptables -I INPUT -s 151.101.194.219 -j DROP
iptables -I INPUT -s 151.101.2.219 -j DROP
iptables -I INPUT -s 151.101.130.219 -j DROP
iptables -I INPUT -s speedtest.vn -j DROP
iptables -I INPUT -s 203.119.73.32 -j DROP
iptables -I INPUT -p tcp -m tcp --dport 22 -j ACCEPT
iptables -I INPUT -p tcp -m tcp --dport 80 -j ACCEPT
iptables -I INPUT -p tcp -m tcp --dport 443 -j ACCEPT
iptables-save  > /etc/iptables/rules.v4
systemctl start netfilter-persistent
systemctl restart netfilter-persistent
systemctl enable netfilter-persistent
systemctl status netfilter-persistent
clear
echo " chặn speedtest"
echo -e ""
sleep 3
clear
