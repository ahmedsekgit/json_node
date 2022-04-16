==============================
modification de fichier  /etc/network/interfaces  
==============================

# interfaces(5) file used by ifup(8) and ifdown(8)
# Include files from /etc/network/interfaces.d:
source-directory /etc/network/interfaces.d
# Interface Name #

auto wlo1
# Static IP Address #
iface wlo1 inet static

# IP Address #

address 192.168.1.100

# Netmask #

netmask 255.255.255.0

# Gateway #

gateway 192.168.1.1

# DNS Servers #

dns-nameservers 192.168.1.1
dns-nameservers 208.67.222.222
#dns-nameservers 208.67.220.220
#dns-nameservers 8.8.8.8
#dns-nameservers 8.8.4.4
  
==============================
17 at  2021-10-29T15:22:52.000Z
==============================
