# Netwok sniffing

## 1. MAC Flooding

Used to turn switch into a hub where it broadcasts the traffic to all participants as it no longer know where which is the destination for the packets.

## 2. Switch port stealing

## 3. DHCP Starvation Attack

## 4. Rogue DHCP Server Attack

## 5. ARP Poisoning/Spoofing

Respond to ARP request pretending to be the legitimate user.

## 6. MAC Spoofing/Duplicating

## 7. IRDP (ICMP Router Discovery Protocol) Spoofing

Allow a host to discover active routers on a network to get potential routes. Attacker can advertise its own router with high level and lifetime so this route would be preffered and used by clients.

## 8. VLAN Hopping

Bypass VLAN restrictions and access traffic from different VLANs.

a. Switch spoofing - connect a rogue switch to original switch with "dynamic auto", "dynamic desirable" or "trunk" modes configured.
b. Double tagging - only possible if switch ports uses native VLANS - modify tags in Ethernet frame to allow traffic through any VLAN.

## 9. STP (Spanning Tree Protocol) Attack

Connecting a rogue switch with lowest priority (turning it into a root bridge) into the network and change operation of STP and sniff all the data in the network.

## 10. DNS Poisoning

a. Intranet DNS Spoofing

Usearpspoof/dnsspoof to spoof DNS server and direct user to malicious target site.

b. Internet DNS Spoofing

Set up a rogue DNS server with a static IP address and force user (using trojan, exploit, etc) to use rogue DNS server instead of legitimate DNS servers.

c. Proxy server DNS poisoning 

Use a trojan to set a malicious proxy on victim's settings

d. DNS Cache Poisoning

Addind forged DNS records into DNS resolver cache.

Tools: DerpNSpoof

# Countermeasures

1. Try to ping suspected machine with its IP and wrong MAC. If packet is not rejected, it means host is in promiscuous mode.
2. Detect promiscuous mode using nmap:
```
# nmap --script=sniffer-detect <target>
```