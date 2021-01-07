#!/bin/bash

# NOTE: This scripts reverts the last upgrade of packages


# Change to the package cache directory
cd /var/cache/pacman/pkg

# Date of the last removed package. Format: 2021-01-07T14:43
dateLastUpgraded=$(grep -iE "upgraded" /var/log/pacman.log | \
    tail -1 | \
    grep -iEo "([0-9]{4}-[0-9]{2}-[0-9]{2})")

lastUpgraded=$(grep -iE "$dateLastUpgraded.+upgraded" /var/log/pacman.log | cut -d " " -f4)


for package in $lastUpgraded; do
    pacman -U --noconfirm $(ls -lt $package* | sed -n 2p | rev | cut -d " " -f1 | rev)
done
