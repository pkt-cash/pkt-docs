# Set up your own VPN Server 

This guide will help you set up a CJDNS node with PKT wallet and the following services:
* AnodeVPN server
* IKEv2 Ipsec VPN server
* OpenVPN server
* SNI proxy

## Requirements
* A server running debian based Linux (preferrably Ubuntu 22.04) with docker installed

## Steps

1. Create a data directory where the server configuration will be stored.

```mkdir vpn_data```

2. Configure the server by running the following command:

```docker run -it --rm -v $(pwd)/vpn_data:/data pkteer/pkt-server /configure.sh```

3. Configure various service by running the following command:

```./vpn_data/setup.sh```

The script will prompt you to set up various flags and values needed for setting up the services the first time.

4. Run the server by running the following commands:

```./vpn_data/start-vpn.sh```

**NOTE**: It can take a few minutes on the first run for the server to set up all the services.

## Monitoring the server

You can view the progress of the server by running:

```docker logs -f pkt-server```

You can also check the status of all services by running:

```./vpn_data/status.sh```
