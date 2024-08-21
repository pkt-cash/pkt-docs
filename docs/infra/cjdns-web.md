# Accessing your cjdns website
For anyone to access your cjdns site they need to be on the cjdns network, either by running cjdns on their device or by connecting to one of the VPN exits that allow access to cjdns network.

Go to a browser and paste the ipv6 address after http and inside square brackets like this: `http://[your-cjdns_ipv6_address]/blog`

!!! note "NOTE" 
    Make sure to remove any leading `0` from each section of the ipv6 address. for example if your cjdns ipv6 is ending with `... :0ad2` it should be `... :ad2` in the browser.

## Set up a domain for your site
First you will need to own a domain name for example "pkt.net". Select one of the VPN exits that have a running SNI proxy and copy their IPv4 address.

Go to your domain registrar and set up the following DNS records:

* A record: pkt.net -> [VPN server IPv4 address]
* AAAA record: h.pkt.net -> [your-cjdns_ipv6_address]

!!! cite "For example"
    If the VPN server's IPv4 address is `51.79.51.242` your domain is `pkt.net` and your cjdns IPv6 address where your site is running is `vfc04:8212:c1fa:94ad:e554:7bac:1264:0ad2`

    your A record should be: 
        
        * A record: `pkt.net -> 51.79.51.242` 
    
    and your AAAA record should be: 
        
        * AAAA record: `h.pkt.net -> fc04:8212:c1fa:94ad:e554:7bac:1264:ad2`


## Register domain with VPN server
Request the VPN server operator to add your domain to their SNI proxy by editing the following command replacing it with your domain and cjdns ipv6 address and the VPN server's IPv4 address:

```
curl -X POST --H "Content-Type: application/json" -d '{"domain":"domain.com","cjdnsIpv6":"your_cjdns_ipv6_address"} http://[VPN server IPv4 address]:8099/api/0.4/server/domain/add/
```

## Set up the domain in yunohost

1. Log in into your yunohost admin panel.
2. Go to "Domains" and click on "Add domain"
3. Click on " I want to add a domain I own, or a subdomain" add your domain and click on "Add"
4. Select your newly added domain.
5. Go to tab "Certificates"
6. Click on "Ignore diagnosis checks" and then you can request a certificate for your domain by going clicking "Install Let's Encrypt certificate".