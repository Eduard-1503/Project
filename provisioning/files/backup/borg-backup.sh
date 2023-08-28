#!/bin/bash
# clear
# set -x

# Script for backup folders "/var/log/rsyslog" using Borg

# Create VARS
Backup="/bin/borg create --stats --progress "
Check="/bin/borg check "
Pr="/bin/borg prune  -v --list "
Date_B=`date '+%Y-%m-%d_%H:%M:%S'`
Date_L=`date '+%Y-%m-%d'`
Time_L=`date '+%H:%M:%S'`
Data="::rsyslog-$Date_B "
Repos="borg@192.168.0.10:/var/backup/SrvLog"
Target="/var/log/rsyslog"
Log="/var/log/borg_backup.log"
Comp="/bin/borg compact "


# Create backup
echo " " >> $Log
echo " " >> $Log
echo "    $Time_L" >> $Log
echo "    Backup started" >> $Log
$Backup$Repos$Data$Target >> $Log 2>&1

# Check backup
$Check$Repos

# Purification backups
echo " " >> $Log
echo " " >> $Log
echo "    Prune started" >> $Log
$Pr --keep-hourly=2 --keep-daily=90 --keep-monthly=12 --keep-yearly=1 $Repos >> $Log 2>&1
echo " " >> $Log
$Comp$Repos $Log 2>&1

# Rotation logs for borg_backup
find /var/log -name "borg_backup-*" -type f -mtime +7 -delete
