#!/usr/bin/expect 
spawn telnet 172.17.211.230
expect -re "ogin: " 
#sleep 1 
send "root\r" 
expect -re "assword: " 
#sleep 1 
send "admin\r" 
expect -re "> " 
send "en\r" 

expect -re "# " 
send "conf t\r" 

expect -re "# " 
send "int vlan100\r" 

expect -re "# " 
send "shutdown\r" 
interact 
