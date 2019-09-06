#!/bin/bash
filename='/home/root/mikrotik/mt_hosts.txt'
filelines=`cat $filename`
for line in $filelines ; do
    echo "Connecting to $line..."
    scp -i ~/.ssh/id_rsa -rp -P 40022 remote@$line:/backup/ /home/root/mikrotik/
done
