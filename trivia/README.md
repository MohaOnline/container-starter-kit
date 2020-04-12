``` bash
# 列出所有容器
docker container ls -a

# 启动容器
docker container run -d --name trivia fundamentalsofdocker/trivia:ed2

# 删除容器
docker container rm -fv trivia

# 查看容器内进程
docker container top trivia

# 巡查容器
docker container inspect trivia
docker container inspect trivia -f "{{json .State}}"
docker container inspect trivia -f "{{json .State}}" | jq .

docker container exec -it trivia /bin/sh

# Ctrl + p 紧跟 Ctrl + q 退出容器，有时无用
docker container attach trivia

# 查看容器标准输出
docker container logs trivia
```

## 容器巡查内容

``` json
[
    {
        "Id": "e625727d99d9b0fdcd09e1662b7d397b53b155a06be7638410bcb908f49c8f97",
        "Created": "2020-04-06T12:58:40.279456048Z",
        "Path": "/bin/sh",
        "Args": [
            "-c",
            "source script.sh"
        ],
        "State": {
            "Status": "running",
            "Running": true,
            "Paused": false,
            "Restarting": false,
            "OOMKilled": false,
            "Dead": false,
            "Pid": 25880,
            "ExitCode": 0,
            "Error": "",
            "StartedAt": "2020-04-06T12:58:40.56694432Z",
            "FinishedAt": "0001-01-01T00:00:00Z"
        },
        "Image": "sha256:bbc92c8f014d60507a4b6035efbee312b134e9f5c03c21cc646df9a80f25c2b6",
        "ResolvConfPath": "/var/lib/docker/containers/e625727d99d9b0fdcd09e1662b7d397b53b155a06be7638410bcb908f49c8f97/resolv.conf",
        "HostnamePath": "/var/lib/docker/containers/e625727d99d9b0fdcd09e1662b7d397b53b155a06be7638410bcb908f49c8f97/hostname",
        "HostsPath": "/var/lib/docker/containers/e625727d99d9b0fdcd09e1662b7d397b53b155a06be7638410bcb908f49c8f97/hosts",
        "LogPath": "/var/lib/docker/containers/e625727d99d9b0fdcd09e1662b7d397b53b155a06be7638410bcb908f49c8f97/e625727d99d9b0fdcd09e1662b7d397b53b155a06be7638410bcb908f49c8f97-json.log",
        "Name": "/trivia",
        "RestartCount": 0,
        "Driver": "overlay2",
        "Platform": "linux",
        "MountLabel": "",
        "ProcessLabel": "",
        "AppArmorProfile": "",
        "ExecIDs": null,
        "HostConfig": {
            "Binds": null,
            "ContainerIDFile": "",
            "LogConfig": {
                "Type": "json-file",
                "Config": {}
            },
            "NetworkMode": "default",
            "PortBindings": {},
            "RestartPolicy": {
                "Name": "no",
                "MaximumRetryCount": 0
            },
            "AutoRemove": false,
            "VolumeDriver": "",
            "VolumesFrom": null,
            "CapAdd": null,
            "CapDrop": null,
            "Capabilities": null,
            "Dns": [],
            "DnsOptions": [],
            "DnsSearch": [],
            "ExtraHosts": null,
            "GroupAdd": null,
            "IpcMode": "private",
            "Cgroup": "",
            "Links": null,
            "OomScoreAdj": 0,
            "PidMode": "",
            "Privileged": false,
            "PublishAllPorts": false,
            "ReadonlyRootfs": false,
            "SecurityOpt": null,
            "UTSMode": "",
            "UsernsMode": "",
            "ShmSize": 67108864,
            "Runtime": "runc",
            "ConsoleSize": [
                0,
                0
            ],
            "Isolation": "",
            "CpuShares": 0,
            "Memory": 0,
            "NanoCpus": 0,
            "CgroupParent": "",
            "BlkioWeight": 0,
            "BlkioWeightDevice": [],
            "BlkioDeviceReadBps": null,
            "BlkioDeviceWriteBps": null,
            "BlkioDeviceReadIOps": null,
            "BlkioDeviceWriteIOps": null,
            "CpuPeriod": 0,
            "CpuQuota": 0,
            "CpuRealtimePeriod": 0,
            "CpuRealtimeRuntime": 0,
            "CpusetCpus": "",
            "CpusetMems": "",
            "Devices": [],
            "DeviceCgroupRules": null,
            "DeviceRequests": null,
            "KernelMemory": 0,
            "KernelMemoryTCP": 0,
            "MemoryReservation": 0,
            "MemorySwap": 0,
            "MemorySwappiness": null,
            "OomKillDisable": false,
            "PidsLimit": null,
            "Ulimits": null,
            "CpuCount": 0,
            "CpuPercent": 0,
            "IOMaximumIOps": 0,
            "IOMaximumBandwidth": 0,
            "MaskedPaths": [
                "/proc/asound",
                "/proc/acpi",
                "/proc/kcore",
                "/proc/keys",
                "/proc/latency_stats",
                "/proc/timer_list",
                "/proc/timer_stats",
                "/proc/sched_debug",
                "/proc/scsi",
                "/sys/firmware"
            ],
            "ReadonlyPaths": [
                "/proc/bus",
                "/proc/fs",
                "/proc/irq",
                "/proc/sys",
                "/proc/sysrq-trigger"
            ]
        },
        "GraphDriver": {
            "Data": {
                "LowerDir": "/var/lib/docker/overlay2/20638b2b3fd317ba59d5bc284c61b1ed8174b498ec2c7441821b53b0eb7c3fc0-init/diff:/var/lib/docker/overlay2/9ae553f2ec67875208a4d0058bdb457d7a3989a00e492cb3778eb92a1777be00/diff:/var/lib/docker/overlay2/8260e80221ef32d63787eab9b65ef7f61c0b47a3cff86ff98334738dfd565fd1/diff:/var/lib/docker/overlay2/ee4d978383b006e0e6d0fbfd1352da3e384c2ecdd32261f7ea4c30ea82e46aa1/diff:/var/lib/docker/overlay2/d942dc6c888386e4609f325a27c24229693efd475743133bbc77d3586f5a9aab/diff",
                "MergedDir": "/var/lib/docker/overlay2/20638b2b3fd317ba59d5bc284c61b1ed8174b498ec2c7441821b53b0eb7c3fc0/merged",
                "UpperDir": "/var/lib/docker/overlay2/20638b2b3fd317ba59d5bc284c61b1ed8174b498ec2c7441821b53b0eb7c3fc0/diff",
                "WorkDir": "/var/lib/docker/overlay2/20638b2b3fd317ba59d5bc284c61b1ed8174b498ec2c7441821b53b0eb7c3fc0/work"
            },
            "Name": "overlay2"
        },
        "Mounts": [],
        "Config": {
            "Hostname": "e625727d99d9",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "/bin/sh",
                "-c",
                "source script.sh"
            ],
            "Image": "fundamentalsofdocker/trivia:ed2",
            "Volumes": null,
            "WorkingDir": "/app",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": {}
        },
        "NetworkSettings": {
            "Bridge": "",
            "SandboxID": "f9013685a059d99fa72927bfbeaf0f12012d7e901f043dcf953ab8ca32b61607",
            "HairpinMode": false,
            "LinkLocalIPv6Address": "",
            "LinkLocalIPv6PrefixLen": 0,
            "Ports": {},
            "SandboxKey": "/var/run/docker/netns/f9013685a059",
            "SecondaryIPAddresses": null,
            "SecondaryIPv6Addresses": null,
            "EndpointID": "1cf672215a9cfd9784e5d2445ffee41cae43b91972805cdf1239ff31286dc57a",
            "Gateway": "172.17.0.1",
            "GlobalIPv6Address": "",
            "GlobalIPv6PrefixLen": 0,
            "IPAddress": "172.17.0.2",
            "IPPrefixLen": 16,
            "IPv6Gateway": "",
            "MacAddress": "02:42:ac:11:00:02",
            "Networks": {
                "bridge": {
                    "IPAMConfig": null,
                    "Links": null,
                    "Aliases": null,
                    "NetworkID": "9d56c6b165966a7dc94d060b70130ecd6030a5ef964a009e314a7b43c74378f6",
                    "EndpointID": "1cf672215a9cfd9784e5d2445ffee41cae43b91972805cdf1239ff31286dc57a",
                    "Gateway": "172.17.0.1",
                    "IPAddress": "172.17.0.2",
                    "IPPrefixLen": 16,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "MacAddress": "02:42:ac:11:00:02",
                    "DriverOpts": null
                }
            }
        }
    }
]
```