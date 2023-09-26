REMOTE=172.17.211.11

#rdesktop -u root -p admin -r sound:off -x 0x80 -a 16 -g 1280x1000 $REMOTE
#rdesktop -u root -p admin -r sound:off -a 24 -g 1280x1024 $REMOTE

xfreerdp +clipboard /u:root /p:admin /size:1280x1024 /v:$REMOTE
