#!/bin/bash
# --delete means files deleted on the source are to be deleted on the backup as well

if mount | grep /run/media/geeray/1A0B92966ADF18AC > /dev/null; then
    rsync -a --quiet --exclude ".*/" /home/geeray /run/media/geeray/1A0B92966ADF18AC/backupHome
else
    exit 1
fi
