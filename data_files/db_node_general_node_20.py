==============================
netplan commande 
  
==============================
acceder au 01-network-manager-all.yaml via cd /etc/netplan/ et le modifier avec ce contenu:
# Let NetworkManager manage all devices on this system
network:
  version: 2
  renderer: NetworkManager
  wifis:
        wlo1:
            dhcp4: no
            dhcp6: no
            addresses: [192.168.0.100/24]
            gateway4: 192.168.1.1
            nameservers:
                addresses: [8.8.4.4, 8.8.8.8]
            access-points:
                "vodafoneB44E":
                    password: "112233445566"


  
==============================
20 at  2021-10-29T15:22:52.000Z
==============================
