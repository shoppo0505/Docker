#!/usr/bin/expect

#下面几行后面不能添加注释，否则会异常
# send "exit\r" - exit命令：会退出root账号，成为普通用户
# shellcheck disable=SC2117
spawn su - root
expect {
        "Password:" {
          send "root\r"
          send "exit\r"
        }

}
expect eof
