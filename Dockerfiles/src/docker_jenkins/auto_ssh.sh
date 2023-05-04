#!/usr/bin/expect
#./auto_ssh.sh jenkins 'jenkins' 172.19.0.4
set timeout 10
set username [lindex $argv 0]
set password [lindex $argv 1]
set hostname [lindex $argv 2]
spawn ssh-copy-id -i /var/jenkins_home/.ssh/id_rsa.pub -p 22 $username@$hostname
expect {
        #first connect, no public key in ~/.ssh/known_hosts
        "Are you sure you want to continue connecting (yes/no/\\\[fingerprint\\\])?" {
        send "yes\r"
        expect "Password:"
            send "$password\r"
        }
        #already has public key in ~/.ssh/known_hosts
        "Password:" {
            send "$password\r"
        }
        "Now try logging into the machine" {
            #it has authorized, do nothing!
        }

}
expect eof
