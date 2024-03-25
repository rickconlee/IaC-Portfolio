#!/bin/bash

# Check if "LabNAT" exists
if VBoxManage list natnetworks | grep -q "LabNAT"; then
    echo "LabNAT exists."
else
    echo "LabNAT does not exist. Creating it..."
    VBoxManage natnetwork add --netname LabNAT --network "10.230.10.0/24" --enable --dhcp off
    echo "LabNAT created with subnet 10.230.10.0/24 without DHCP server."
fi