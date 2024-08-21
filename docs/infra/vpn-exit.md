# VPN Exit
30% of all yields will go to VPN exits which provide internet access to people in the network.

1. You will be able to assign up to $5,000 worth of yield credits per VPN exit.
2. Allocation based on yield credits, grandfather rule, and weekly testing is the same as cjdns nodes.
3. Geographical distribution bonuses and uptime multiplier are exactly the same as for a cjdns node
4. In case of doubt, a cjdns node and a VPN exit are considered distinct entities, even if running on the same IP address, so configuring a device as both a cjdns node and a VPN exit will allow you to assign and yield off of $10,000 worth of yield credits.
5. VPN exits have no affiliate code credits.

## Domains Nodes
15% of all yields will go to the holders of PKT domains.

1. A PKT domain must be pkt.`<any TLD>`, for example pkt.com or pkt.us
2. There is no limit on how many yield credits can be assigned to one domain, but there is a severe constraint on pkt domains because there is only one possible pkt domain per [top level domain](https://www.iana.org/domains/root/db).
3. Every week, domains are tested to verify that they are resolving to registered and functioning Nameservers. If a domain fails the test then it will not yield until the following week. If a domain has a DNSSEC DS record (required if the domain owner also operates a Nameserver) then the signed updated zone file must be available at all times.
4. In order to encourage jurisdictional diversity of domains, domains will get a yield bonus if they are registered with different registrars, different TLD operators, and in different countries. Your effective yield credits equal your real assigned yield credits TIMES:
    - One, plus
    - One over the number of pkt domains registered with your REGISTRAR (registrars are companies such as Godaddy and Namecheap), plus
    - One over the number of pkt domains registered with the same DOMAIN AUTHORITY. For example, .com and .net are both operated by VeriSign Global Registry Services, plus
    - One over the number of pkt domains with the same domicile country
    !!! note
        If the registrar and the domain authority are in the same country, this is the domicile country. If they are different, then the domicile county is the WORSE yielding out of the two.

## Nameserver
10% of all yields go to operators of Nameservers.

1. There is no limit to the number of yield credits that can be assigned to one nameserver, but you must have a pkt domain in order to run one.
2. Every nameserver must serve the entire PKT decentralized zone for every registered domain, this means if FAST.PKT has been claimed on the PKT blockchain, and community members have registered PKT.US and PKT.COM, a nameserver must correctly resolve FAST.PKT.US and FAST.PKT.COM to the entry made by the owner of FAST.PKT.
3. Every nameserver must publish, no less than hourly, a DNSSEC signed zone file for their pkt domain such that other nameservers can correctly serve it as DNSSEC.
4. Every nameserver must pull from all other nameservers the DNSSEC signed zone files for their relevant pkt domains and serve them as well.
5. Geographical distribution bonuses are exactly the same as for a cjdns node, however there are no uptime multipliers, ANY observed downtime for a nameserver will cause loss of all yields for that week.

## Route Servers
5% of all yields go to the operators of Route Servers

1. There is no limit to the number of yield credits that can be assigned to one route server, but you must have a nameserver (and thus a pkt domain) in order to run one.
2. Every route server must be correctly and continuously operational and up to date. Any significant downtime or misbehavior of a route server will result in loss of yields for that week.