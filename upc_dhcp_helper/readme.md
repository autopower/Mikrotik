# DHCP client helper script for UPC modem 
Sometimes UPC cable modem offers local modem IP address for WAN interface. For such issues you need script on Mikrotik dhcp client to setup correct routes for UPC dynamic IP addresses.
This script checks for modem IP address, if correct IP address assigned, routes (default route and helper for route check) are created.
Please use wancheckuni script to periodically check default gateway.

## Setup
Please copy upc script to IP, DHCP Client, Advanced tab of default/primary wan interface. Copy wan2 script to secondary wan interface.

