/system script
add dont-require-permissions=no name=backupConfig owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/fi\
    le remove [find where name~\".backup\"]\r\
    \n/file remove [find where name~\".rsc\"]\r\
    \n:local backupresult [/file find where name=\"/backup\"]\r\
    \n:if (\$backupresult = \"\") do={\r\
    \n  /ip smb shares add name=backup\
    \n\r\
    \n  /ip smb shares remove [find where name=backup]\r\
    \n}\r\
    \n:local cfgfile (\"/backup/\".[/system identity get name].\"-\".[:pick [/sy\
    stem clock get date] 4 6].[:pick [/system clock get date] 0 3].[:pick [/syst\
    em clock get date] 7 11])\r\
    \n/export file=\$cfgfile\r\
    \n:log info \"System configuration export created.\"\r\
    \n/system backup save name=\$cfgfile\r\
    \n:log info \"System backup created.\"\r\
    \n"
/user group
add name=remote policy="local,ssh,ftp,read,sensitive,!telnet,!reboot,!write,!pol\
    icy,!test,!winbox,!password,!web,!sniff,!api,!romon,!dude,!tikapp"
/user
add group=remote name=remote
/user ssh-keys import user=remote public-key-file=id_rsa.pub
/ip smb shares add name=backup
/ip smb shares remove [find where name=backup]
/system scheduler
add interval=1d name=DailyBackupConfig on-event=\
    "/system script run backupConfig" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=aug/23/2019 start-time=22:00:00
