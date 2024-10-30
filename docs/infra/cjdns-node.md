# Setup a Cjdns Node
This guide will help you set up a cjdns node on a server.

The easiest way to get a cjdns node installed is using [cjdns.sh](https://github.com/cjdelisle/cjdns.sh).

## Requirements
A server running debian based Linux (preferably Ubuntu 22.04).

## Steps

* Determine your *Peer ID*.
<span class="cjdns-peer-id-has" style="display:none">Your Peer ID is <code class="cjdns-peer-id">MISSING</code></span>
<span class="cjdns-peer-id-missing">To get your Peer ID, first register your cjdns node on the PKT Dashboard.</span>

* Install `cjdns.sh`

    <code>
    curl https://pkt.cash/special/cjdns/cjdns.sh | CJDNS_PEERID=<span class="cjdns-peer-id">&lt;peer-id-goes-here&gt;</span> CJDNS_ADMIN_PORT=11234 CJDNS_TUN=1 sh
    </code>

* Check if you have peers working

    ```
    cjdnstool peers show
    ```

* Make sure your firewall is open. Port 3478 must be accessible from the public internet.

    `iptables-save`

    `nft list ruleset`

## Different public port

If you can't expose port `3478` to the public, you can change the port by specifying `CJDNS_PORT=<port number>` when installing cjdns.

## More information

To learn more, check out [https://github.com/cjdelisle/cjdns.sh](https://github.com/cjdelisle/cjdns.sh)