# 1. Host Interface 
HOST_IF="wlp0s20f3"
# 2. BB Interface 
BBB_IF="enxb894d905e967"


echo "---- CONFIGURING INTERFACE ----"
echo "Host Interface: $HOST_IF"
echo "Boars Interface: $BBB_IF"


echo "Enabling IP Forwarding..."
sudo sysctl net.ipv4.ip_forward=1 


echo "Enable NAT..."
echo "Outgoing traffic Configuration"
sudo iptables --table nat --append POSTROUTING --out-interface "$HOST_IF" -j MASQUERADE

echo "Incoming traffic Configuration"
sudo iptables --append FORWARD --in-interface "$BBB_IF" -j ACCEPT

echo "---- DONE !!! ----"