# Setup a Cjdns Node
This guide will help you set up a cjdns node on a server.

!!! danger "Requirements"
    A server running debian based Linux (preferably Ubuntu 22.04)


## Steps

The easiest way to get a cjdns node installed is using `cjdns.sh`.

### 1. Determine your *Peer ID*.
To get your Peer ID, first register your cjdns node by choose __"Add Unit +"__ on the PKT Dashboard under the Infrastructure tab.

### 2. Install cjdns.sh
You must replace `<peer-id-goes-here>` with your actual Peer ID that was provided when you registered your cjdns node in Step 1.

```
apt update
apt upgrade -y
apt install jq curl -у
curl https://pkt.cash/special/cjdns/cjdns.sh | CJDNS_PEERID=<peer-id-goes-here> sh CJDNS_TUN=false sh
```

### 3. Check if you have peers working

```
cjdnstool peers show
Iptables-save
nft list ruleset
```

### 4. Make sure your firewall is open

Port `3478` must be accessible from the public internet.

### 5. Check the tester

Your node should appear on [The Cjdns Peer Tester](https://vinny.cjdns.fr/ptest/){:target="_blank"}.

* It should appear within 5 minutes of being started, and should be tested after 10-20 minutes.
* It will be identified by its Peer ID.

`OK` means your node passed the test, `ConnectTimeout`, or other error message means your node could not be reached.

If your node is not showing up enter this command and wait 5 minutes before repeating __Step 3__:

```
systemctl restart cjdns-sh.service
```

This will restart the cjdns node.

### 6. Wait for the dashboard to update

After the tester has approved your node, the dashboard should update soon after and display status `OK` in green. This means your node is all set to begin yielding.

## Different public port

If you can't expose port `3478` to the public, you can change the port by specifying `CJDNS_PORT=<port number>` when installing cjdns.

## More information

To learn more, check out [https://github.com/cjdelisle/cjdns.sh](https://github.com/cjdelisle/cjdns.sh){:target="_blank"}.