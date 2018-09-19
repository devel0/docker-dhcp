# docker-dhcp

dhcp docker

## requirements

- [docker-ubuntu](https://github.com/devel0/docker-ubuntu)

## configure

| file | token | replace with |
|---|---|---|
| [Dockerfile](Dockerfile) | `br0` | lan interface name |
| [imgdata/dhcpd.conf](imgdata/dhcpd.conf) | `192.168.10.0` | lan network address |
| | `192.168.10.255` | lan broadcast address |
| | `192.168.10.200` | lan gateway |
| | `my.local` | default search domain name |
| | `172.18.0.2, 8.8.8.8` | dns server dispatched to dhcp clients |
| | `range 192.168.10.50 192.168.10.199` | dynamic ip allocation range |

## install

```
./build.sh
./run.sh
```
