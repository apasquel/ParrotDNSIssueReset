#!/bin/bash
#Running will reset and restart DNS service on Parrot OS due to issues with AnonSurf.
#Source:  https://askubuntu.com/questions/1106659/how-to-reset-dns-settings-to-the-defaults  

sudo rm /etc/resolv.conf && sudo ln -s /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

systemctl status systemd-resolved.service | if ! grep -q 'active (running)'; then 
    echo "Restarting DNS Service"
    systemctl enable systemd-resolved.service && systemctl start systemd-resolved.service
else
    echo "DNS Service Enabled"
fi
