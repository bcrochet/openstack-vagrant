# VIPs
network=$1
iface=$2

for i in {00..12}
do
cat > /etc/sysconfig/network-scripts/ifcfg-${iface}:${i} <<EOF
NM_CONTROLLED=no
BOOTPROTO=none
ONBOOT=yes
IPADDR=${network}.2${i}
NETMASK=255.255.255.0
DEVICE=${iface}:${i}
PEERDNS=no
EOF
  ifup ${iface}:${i}
done
