# Backup Mikrotik config files
Simple script to backup Mikrotik config files from Linux host

## Description
Script create on Mikrotik host:
* /backup directory in files
* import public key from /files
* script and schedule for backupin both system and system config

Schedule (via systemctl or cron) shell script on linux host to download files created on Mikrotik host/hosts

## Setup
* upload mt_hosts.txt and backup_config.sh to Linux host
* Please edit mt_hosts.txt with IP addresses of your mtik hosts
* please edit backup_config.sh for actual ssh port
* upload backupConfigSetup.rsc to Mikrotik host
* upload id_rsa.pub public key to Mikrotik host
* import this script on host `import backupConfigSetup.rsc`
* check script with `/system script run backupConfig`

## Download directly to Mikrotik
`/tool fetch url="https://raw.githubusercontent.com/autopower/Mikrotik/master/backup_config/backupConfigSetup.rsc"`

## Note
If you are using other admin user as `admin`, please edit backupConfigSetup.rsc accordingly.

