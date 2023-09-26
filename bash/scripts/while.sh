#!/usr/bin/expect

set host [lrange $argv 0 0]
set user root
set pass admin

spawn telnet $host

expect -re "ogin:"
sleep 0.2

send "$user\r"

expect -re "assword:"
sleep 0.2

send "$pass\r"
sleep 0.2

expect -re "# "
sleep 0.2

send "enable\r"
sleep 0.2

expect -re "# "
sleep 0.2

send "configure terminal\r"
sleep 1

expect -re "# "
sleep 0.5

send "interface ge21\r"
expect -re "# "

while { true } {
	send "shutdown\r"
	expect -re "# "
	sleep 1

	send "no shutdown\r"
	expect -re "# "
	sleep 11

	send "do sh udld status\r"
	expect -re "# "
	sleep 1

	send "do sh udld neighbors\r"
	expect -re "# "
	sleep 1
}

