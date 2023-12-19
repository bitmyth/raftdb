# Exercise

## Node 1 (59.110.46.247 ) as master node

```shell
root@iZ2zeijiz5yh3ggdt5hvsxZ:/tmp# cat /etc/hosts
59.110.46.247   raft-cluster-host-01
124.220.152.158 raft-cluster-host-02
8.218.52.13     raft-cluster-host-03

root@iZ2zeijiz5yh3ggdt5hvsxZ:/tmp# ./raftdb2 -id node01  -haddr :8091 -raddr raft-cluster-host-01:8089 ~/.raftdb
2023-12-18T14:49:28.109+0800 [INFO]  raft: initial configuration: index=0 servers=[]
[store] 2023/12/18 14:49:28 /Users/gsh/projects/raftdb/pkg/store/store.go:156: bootstrap needed
2023-12-18T14:49:28.110+0800 [INFO]  raft: entering follower state: follower="Node at 59.110.46.247:8089 [Follower]" leader=
2023/12/18 14:49:28 no join addresses set
2023-12-18T14:49:29.947+0800 [WARN]  raft: heartbeat timeout reached, starting election: last-leader=
2023-12-18T14:49:29.947+0800 [INFO]  raft: entering candidate state: node="Node at 59.110.46.247:8089 [Candidate]" term=2
2023-12-18T14:49:29.949+0800 [DEBUG] raft: votes: needed=1
2023-12-18T14:49:29.949+0800 [DEBUG] raft: vote granted: from=node01 term=2 tally=1
2023-12-18T14:49:29.949+0800 [INFO]  raft: election won: tally=1
2023-12-18T14:49:29.949+0800 [INFO]  raft: entering leader state: leader="Node at 59.110.46.247:8089 [Leader]"
[store] 2023/12/18 14:49:30 /Users/gsh/projects/raftdb/pkg/store/store.go:219: waiting for up to 2m0s for application of initial logs
2023/12/18 14:49:30 raftdb started successfully


[store] 2023/12/18 14:49:44 /Users/gsh/projects/raftdb/pkg/store/store.go:311: received join request for remote node node02 at raft-cluster-host-02:8089
2023-12-18T14:49:44.058+0800 [INFO]  raft: updating configuration: command=AddStaging server-id=node02 server-addr=raft-cluster-host-02:8089 servers="[{Suffrage:Voter ID:node01 Address:59.110.46.247:8089} {Suffrage:Voter ID:node02 Address:raft-cluster-host-02:8089}]"
2023-12-18T14:49:44.059+0800 [INFO]  raft: added peer, starting replication: peer=node02
2023-12-18T14:49:44.134+0800 [WARN]  raft: appendEntries rejected, sending older logs: peer="{Voter node02 raft-cluster-host-02:8089}" next=1
2023-12-18T14:49:44.173+0800 [INFO]  raft: pipelining replication: peer="{Voter node02 raft-cluster-host-02:8089}"
[store] 2023/12/18 14:49:44 /Users/gsh/projects/raftdb/pkg/store/store.go:347: node node02 at raft-cluster-host-02:8089 joined successfully


[store] 2023/12/18 14:50:39 /Users/gsh/projects/raftdb/pkg/store/store.go:311: received join request for remote node node03 at raft-cluster-host-03:8089
2023-12-18T14:50:39.086+0800 [INFO]  raft: updating configuration: command=AddStaging server-id=node03 server-addr=raft-cluster-host-03:8089 servers="[{Suffrage:Voter ID:node01 Address:59.110.46.247:8089} {Suffrage:Voter ID:node02 Address:raft-cluster-host-02:8089} {Suffrage:Voter ID:node03 Address:raft-cluster-host-03:8089}]"
2023-12-18T14:50:39.087+0800 [INFO]  raft: added peer, starting replication: peer=node03
[store] 2023/12/18 14:50:39 /Users/gsh/projects/raftdb/pkg/store/store.go:347: node node03 at raft-cluster-host-03:8089 joined successfully
2023-12-18T14:50:39.174+0800 [WARN]  raft: appendEntries rejected, sending older logs: peer="{Voter node03 raft-cluster-host-03:8089}" next=1
2023-12-18T14:50:39.218+0800 [INFO]  raft: pipelining replication: peer="{Voter node03 raft-cluster-host-03:8089}"

```

## Node 2

```shell
ubuntu@VM-0-15-ubuntu:/tmp$ ./raftdb2 -id node02 -haddr :8091 -raddr raft-cluster-host-02:8089 -join raft-cluster-host-01:8091 ~/.raftdb
2023-12-18T14:49:44.003+0800 [INFO]  raft: initial configuration: index=0 servers=[]
[store] 2023/12/18 14:49:44 /Users/gsh/projects/raftdb/pkg/store/store.go:167: no bootstrap needed
2023-12-18T14:49:44.003+0800 [INFO]  raft: entering follower state: follower="Node at 124.220.152.158:8089 [Follower]" leader=
2023-12-18T14:49:44.112+0800 [WARN]  raft: failed to get previous log: previous-index=4 last-index=0 error="log not found"
[store] 2023/12/18 14:49:44 /Users/gsh/projects/raftdb/pkg/store/store.go:219: waiting for up to 2m0s for application of initial logs
2023/12/18 14:49:44 raftdb started successfully
```

## Node 3

```shell
ubuntu@iZj6c27m1p1atz7dv6jmmmZ:/tmp$ ./raftdb2 -id node03 -haddr :8091 -raddr raft-cluster-host-03:8089 -join raft-cluster-host-01:8091 ~/.raftdb
2023-12-18T14:50:39.020+0800 [INFO]  raft: initial configuration: index=0 servers=[]
[store] 2023/12/18 14:50:39 /Users/gsh/projects/raftdb/pkg/store/store.go:167: no bootstrap needed
2023-12-18T14:50:39.020+0800 [INFO]  raft: entering follower state: follower="Node at 8.218.52.13:8089 [Follower]" leader=
2023-12-18T14:50:39.155+0800 [WARN]  raft: failed to get previous log: previous-index=6 last-index=0 error="log not found"
[store] 2023/12/18 14:50:39 /Users/gsh/projects/raftdb/pkg/store/store.go:219: waiting for up to 2m0s for application of initial logs
2023/12/18 14:50:39 raftdb started successfully
```
