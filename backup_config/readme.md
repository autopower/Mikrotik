# Backup Mikrotik config files
Simple script to backup Mikrotik config to `/files` and then copy it to Linux host.

## Description
You'll need public key from Linux host to use script.
On Mikrotik host script:
* create /backup directory in files
* import public key from /files
* create script for backuping both system and system config, schedule it on 22:00
You must manually schedule (via systemctl or cron) shell script on Linux host to download files created on Mikrotik host/hosts.

## Setup
* upload mt_hosts.txt and backup_config.sh to Linux host, this file contains IP addresses or names of Mikrotik host/hosts
* Please edit mt_hosts.txt with IP addresses of your mtik hosts
* please edit backup_config.sh for actual ssh port (`40022` used in script), username (`remote` used in script) and/or destination path (`/home/root/mikrotik` used)
* upload backupConfigSetup.rsc to Mikrotik host
* upload id_rsa.pub public key to Mikrotik host
* import this script on host `import backupConfigSetup.rsc`
* check script with `/system script run backupConfig`
* schedule backup_config.sh via cron or systemctl

## Download script directly to Mikrotik
`/tool fetch url="https://raw.githubusercontent.com/autopower/Mikrotik/master/backup_config/backupConfigSetup.rsc"`

## Note
If you are using other admin user as `admin`, please edit backupConfigSetup.rsc accordingly.
