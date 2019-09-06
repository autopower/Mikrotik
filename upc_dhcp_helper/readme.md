# DHCP client helper script for UPC modem 
Sometimes UPC cable modem offers local modem IP address for WAN interface. For such issues you need ad script on Mikrotik dhcp client to setup correct routes for UPC dynamic IP addresses.
This script checks for modem IP address, if correct IP address assigned, routes (default route and helper for route check) are created.
Please use wancheckuni script to periodically check default gateway.
