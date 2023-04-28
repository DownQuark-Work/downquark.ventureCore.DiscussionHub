ec2-user@ip-172-31-1-196 bin]$ ./questdb.sh 

  ___                  _   ____  ____
 / _ \ _   _  ___  ___| |_|  _ \| __ )
| | | | | | |/ _ \/ __| __| | | |  _ \
| |_| | |_| |  __/\__ \ |_| |_| | |_) |
 \__\_\\__,_|\___||___/\__|____/|____/
                        www.questdb.io

Usage: ./questdb.sh start|status|stop [-f] [-d path] [-t tag]

[ec2-user@ip-172-31-1-196 bin]$ ./questdb.sh start

  ___                  _   ____  ____
 / _ \ _   _  ___  ___| |_|  _ \| __ )
| | | | | | |/ _ \/ __| __| | | |  _ \
| |_| | |_| |  __/\__ \ |_| |_| | |_) |
 \__\_\\__,_|\___||___/\__|____/|____/
                        www.questdb.io

JAVA: ./java
Created QuestDB ROOT directory: /home/ec2-user/.questdb
Reading log configuration from /home/ec2-user/.questdb/conf/log.conf
[ec2-user@ip-172-31-1-196 bin]$ ./questdb.sh status

  ___                  _   ____  ____
 / _ \ _   _  ___  ___| |_|  _ \| __ )
| | | | | | |/ _ \/ __| __| | | |  _ \
| |_| | |_| |  __/\__ \ |_| |_| | |_) |
 \__\_\\__,_|\___||___/\__|____/|____/
                        www.questdb.io

PID: 17026
[ec2-user@ip-172-31-1-196 bin]$ ./questdb.sh stop

  ___                  _   ____  ____
 / _ \ _   _  ___  ___| |_|  _ \| __ )
| | | | | | |/ _ \/ __| __| | | |  _ \
| |_| | |_| |  __/\__ \ |_| |_| | |_) |
 \__\_\\__,_|\___||___/\__|____/|____/
                        www.questdb.io

Stopping 17026
QuestDB is shutting down...
Pre-touch magic number: 0
QuestDB is shutdown.
Stopped 17026
[ec2-user@ip-172-31-1-196 bin]$ ./questdb.sh status

  ___                  _   ____  ____
 / _ \ _   _  ___  ___| |_|  _ \| __ )
| | | | | | |/ _ \/ __| __| | | |  _ \
| |_| | |_| |  __/\__ \ |_| |_| | |_) |
 \__\_\\__,_|\___||___/\__|____/|____/
                        www.questdb.io

Not running
[ec2-user@ip-172-31-1-196 bin]$ pwd
/etc/yum.repos.d/questdb/questdb-7.1-rt-linux-amd64/bin
[ec2-user@ip-172-31-1-196 bin]$ 
