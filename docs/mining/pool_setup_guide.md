# **Setting up a Pool**

### Expectations

 - General knowledge of Linux
 - General knowledge of git
 - General knowledge of networking
 - General knowledge of blockchain
 - Access to at least 3 machines running ***Ubuntu 18.04 LTS*** or ***20.04 LTS***, to deploy the following services.
	 - **Machine 1**: PKT node, Master, Paymaker & Blkhander
	 - **Machine 2**: Blkminer & AnnHandler
	 - **Machine 3**: AnnMiner

It can be done all on a single machine, you just need to pay attention to ports etc.

### Block mining & running a pool

Starting your own pool requires setting up a number of services:

-   **_pktd node_**  (one or more) - One pktd instance is required for the Master to function, each of the  _Block Handlers_  may optionally use separate pktd nodes.
-   **_Master_**  (one) - This node coordinates all of the others and provides work files and configuration
-   **_Ann Handler_**  (one or more) - These are high performance nodes which accept announcements from the announcement miners in the network, they also provide announcements to the block miners. As you scale up the amount of bandwidth in the pool, you will need to add more Ann handlers.
-   **_Block Miner_**  (one or more) - These nodes download announcements from the announcement handlers and use them in the mining process to mine blocks.
-   **_Block Handlers_**  (one or more) - These nodes receive "block shares" from the block miners and submit blocks if
-   **_Paymaker_**  (one) - This node receives updates from the Ann Handlers and Block Handlers and keeps track of who should be paid. The Paymaker sends configuration to the pktd node which is used by the Master in order to make the pool pay out the announcement and block miners

# General Information
### Repository Information:
The following repositories hold the required programs to run a pool:

|Repository  | Tools |
|--|--|
| packetcrypt_rs:  https://github.com/cjdelisle/packetcrypt_rs| AnnHandler, Blkminer, AnnMiner |
| PacketCrypt: https://github.com/cjdelisle/PacketCrypt/ | Master, Paymaker, BlkHandler |
| pktd: https://github.com/pkt-cash/pktd | pktd |

### Assumed Local Port Ranges:
| Service | Machine | Port/Port Ranges|
|--|--|--|
| Master | Machine 1 | 8080 |
|Paymaker|Machine 1|8081|
|BlkHandlers| Machine 1| 8100-8200
|AnnHandlers| Machine 3| 8201-8300

# Installation

## *Machine 1*

### PKTD node:
40GB of storage is required at a **minimum** to run the pktd node

 1. Install Golang
	 
```
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update
sudo apt install golang-go
```
2. Install git

```
sudo apt install git
```
3. Install the pktd node
```
git clone https://github.com/pkt-cash/pktd 
cd pktd 
./do
```
The output should show the following:
```
Everything looks good - use ./bin/pktd to launch
```

### Master | Paymaker | BlkHandler:
1. Install the required tools:
```
cd ~
sudo add-apt-repository universe
sudo apt install git
sudo apt install npm
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
```
Restart your shell ### Add here how to get latest stable version of node


2. Clone the source code:
```
git clone https://github.com/cjdelisle/PacketCrypt
```
3. Build the PacketCrypt code
```
cd PacketCrypt
npm install
```

## *Machine 2 & 3*

### BlkMiner | AnnHandler | AnnMiner:

1. Install the Required tools:
```
sudo apt install gcc git
sudo apt install curl
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
2. Clone packetcrypt_rs
```
git clone https://github.com/cjdelisle/packetcrypt_rs
```
3. Compile PacketCrypt
```
cd packetcrypt_rs 
~/.cargo/bin/cargo build --release --features jemalloc
```

# Config of pool.js

***Information:*** 

 - pool.js is located at: ```~/PacketCrypt/pool.example.js```
 - You need to edit this file, then run: ```cp ~/PacketCrypt/pool.example.js ~/PacketCrypt/pool.js```
---
### config.privateSeed

Yeah, just mention that signing of announcements is rarely used, it breaks people mining into multiple pools, and you should set it to null unless "you know what you're doing"

This seed is used for deriving keys which will be used for signing announcements.

Setting this value to an alphanumeric value e.g 
```
oHk8TXpbtRRZGtaYYMnIFAzYMrVh6vA8XzKWWXcKbzCThuFLIJ234bHN5peddQFzR2TtQyo58gcFRP7bKg9BeXZirSqp9gVpjBWp
```

In general, this value should be set to the null, as signing announcements is rarely used, and breaks Announcement mining with multiple pools if you have your pool externally accessable, and should only be set if you have a strong understanding and knowledge of what you are doing.

```config.privateSeed = null```

If you aren't bothered by, or don't require your announcements to be signed .

--------------
### config.paymakerHttpPasswd
Anyone who has this password can make http posts to the paymaker (claim that shares were won)
You should make this random and also firewall the paymaker from the public.
The upload will be done using Authorization Basic with a username of "x" and this as the password


```
config.paymakerHttpPasswd = 'anyone with this password can post results to the paymaker';
```
You can put the paymaker behind an http proxy if you wish.

----------
### config.masterUrl

This is used by the paymaker and block handler when running them with pool.js, it is used to resolve where the master is.

You can either set this as a locally host or put your master behind a nginx proxy
```
config.masterUrl = 'http://localhost:8080';
```
or if you have your instance public, and you want to have it be resolvable publically, ***replace the url with your own.***
```
config.masterUrl = 'http://pool.pktpool.io';
```


---------
### config.rpc

The username and password set here, should be the same username and password used at the end of this guide for when you configure the pktd service.
```
user:  'x',
pass:  'x',
```
-----
### config.annHandlers
***Information:*** 

- config.annHandlers is a list of json object, with an object for each individual annhandler you would like to run, each ann handler will require it's own individual port.
- As the AnnHandler will be run on the same machine as the BlkMiner you need to make sure there are no over-lapping port bindings. 
- If you plan to allow external AnnMiners (AnnMiners not on your LAN to mine against your pool, the url's placed in the AnnHandlers list, should be externally resolvable.


The address that is advertized for accessing this ann handler (external address)

If running locally use:
```
url:  'http://localhost:8081',
```
If allowing external annminers use a resolved address suchas:
```
url: 'http://ann1.pktpool.io
```
***Replace the url with your own.***

-----
### config.blkHandlers
***Information:*** 

- config.blkHandlers is a list of json object, with an object for each individual annhandler you would like to run, each ann handler will require it's own individual port.
- BlockHandlers are low-effort high-volume single-threaded workers.


What address should be advertized for accessing this BlkHander, again make sure there are no overlapping ports.

If you are wanting to support external blockminers, this address should be externally resolvable
```
url:  'http://localhost:8100',
```
This is the port that the blkHandler will bind to.
```
port:  8082,
```
This is the host that the blkHandler will bind to.
```
host:  '::',
```
This is  how many requests a blkHandler can queue before the handler starts rejecting requests
```
maxConnections:  50,
```
```
root:  config
```

------
### config.master

Which port to run the master on
```
port:  8080,
```
 What address to bind to, set to localhost if proxying
```
host:  '::',
```
  

Minimum work for an announcement.
This number is effectively a bandwidth divisor, every time you double this number you will reduce your bandwidth by a factor of two.
```
annMinWork:  Util.annWorkToTarget(128),
```
Average number of shares per block, reducing this number will reduce load on your block handlers, 
but increasing it will allow payment to be spread more evenly between block miners.

This wants to be set to a higher number than one, for the purpose of constantly testing that the block miners are making valid shares. You may have a block miner sitting for hours without a share and then when it wins one, it can become invalid because of misconfiguration 

```
shareWorkDivisor:  4,
```

Which versions of announcements we will accept
```
annVersions: [1],
```  

Request that ann miners mine announcements that are this many blocks old.
  
Announcements contain a commitment of the most recent block hash but they need 3 blocks to "mature" before they can be used

The point of this is so that PacketCrypt is about bandwidth, not latency.

But there is a risk: If there is a surge then you are going to be starved for announcements

When you are starved, you will have few usable anns which causes a slow-down in mining and the announcements which are being submitted are not usable.

When you win a few blocks, those announcements become usable and you surge, which causes you to go back into starvation again.

This should be set to either:

 - 0 Which means the announcements you are receiving are used instantly
 - 3 Which means you are waiting for the announcements to mature before using them.

If running your own AnnMiners, it is advisable to set this to 0, and add the ``--mineold 3`` to ***some*** of your AnnMiner startups on the CLI.

This helps to keep a balance between keeping your pool as powerful as possible, along with having AnnMiners to help out in the case of a starvation
```
mineOldAnns:  0,
```
---
### config.payMaker

How the miners should access the paymaker (external address), ***replace the url with your own.***
```
url:  'pool.pktpool.io',
```

Which port to run the paymaker on
```
port:  8081,
```

What address to bind to, set to localhost if proxying
```
host:  '::',
```

Seconds between sending updates to pktd.
If this set to zero, the payMaker will accept log uploads but will
not send any changes of payout data to pktd.

```
updateCycle:  120,
```
```updateCycle: 0``` to disable

How many seconds backward to keep history in memory
```
historyDepth:  60 * 60 * 24 * 30,
```

Maximum number of simultanious connections to accept before sending 500 errors
```
maxConnections:  200,
```
  
---
#### annCompressor

Store data in 1 minute aggregations
```
timespanMs:  1000 * 60,
```
  
Allow data to be submitted to any of the last 10 aggregations
```
slotsToKeepEvents:  10,
```
---
What fraction of the payout to pay to block miners (the rest will be paid to ann miners) ([Pay per last N shares](https://bitcointalk.org/index.php?topic=39832))
```
blockPayoutFraction:  0.5,
```

What percent of the total winnings should be taken for pool management

```
poolFee:  0.40,
```

The address which should be paid the pool fee
```
poolFeeAddress:  "pkt1qyc9dkhca7uc84zn3vlgd0h0fxr3twwn34qgeqe",
```
This constant will affect how far back into history we pay our announcement miners ([Pay per last N shares](https://bitcointalk.org/index.php?topic=39832))
```
pplnsAnnConstantX:  0.125,
```
 
This constant will affect how far back into history we pay our block miners ([Pay per last N shares](https://bitcointalk.org/index.php?topic=39832))
```
pplnsBlkConstantX:  2,
``` 

When there are not enough shares to fairly spread out the winnings, pay what is left over to this address.
```
defaultAddress:  "pkt1q6hqsqhqdgqfd8t3xwgceulu7k9d9w5t2amath0qxyfjlvl3s3u4sjza2g2",
```  

When something goes wrong, direct pktd to send all coins here, if this is different
from the defaultAddress then it is possible to account for and pay out to the miners
later when the problem is fixed.
```
errorAddress:  "pkt1q6hqsqhqdgqfd8t3xwgceulu7k9d9w5t2amath0qxyfjlvl3s3u4sjza2g2",
```


# Config of pool.toml

***Information:*** 
 - pool.example.toml is located at: ```~/packetcrypt_rs/pool.example.toml```
 - You need to edit this file, then run: ```~/packetcrypt_rs/pool.example.toml ~/packetcrypt_rs/pool.toml```
---


Password used by your paymaker to post logs for payment, the same as ```config.paymakerHttpPasswd```
```
paymaker_http_password = "you'll want this to be a secret"
```

URL of the pool master, used for getting configuration and work, the same as:
***Replace the url with your own.***
```
master_url = "http://pool.pktpool.io"
```


#### ann_handler.ah*
You can have multiple ann_handlers (Ideally one on each BlkMiner machine), you can do this by defining each one such as:

```
[ann_handler.ah0]
	"parameters"
[ann_handler.ah1]
	"parameters"
```
These can all be in a single file to be used by each annhandler, when starting the annhandlers, you would start them with on each respective machine:
```
packetcrypt ah --config /path/to/config.toml ah0
packetcrypt ah --config /path/to/config.toml ah1
```

Number of threads to dedicate to the AnnHandler
```
num_workers = 8
```
Length of the input queue, keeping this low will create back-pressure and prevent miners from posting too many announcements when the server is in fact overloaded
```
input_queue_len = 256
```

The public url of the annhandler, this should match what is set in your pool.js
***Replace the url with your own.***
```
public_url = "http://ann1.pktpool.io/submit"
```
Bind to this port
```
bind_port = 80
```
#### NOTE: To bind low ports with non-root user run:
```sudo setcap CAP_NET_BIND_SERVICE=+eip $(which packetcrypt)```


Keep this many of the newest ann files
```files_to_keep = 500```

# Running Manually

## *Machine 1*
***Information:*** 

 - These tasks need to be run in the order they are presented
 - PKTD needs to have downloaded the full chain first, you will know when the node is upto date when ***height*** is equal to the current block on the [explorer](https://explorer.pkt.cash/) It can take 12+ hours to fully sync to the current block height

### PKTD
``--rpcuser`` and ``--rpcpass`` should match the values set in pool.js under config.rpc 
```

./pktd/bin/pktd --rpcuser=XXX --rpcpass=XXX --miningaddr <your PKT wallet address>
```
### Master
```
node ./pool.js --master
```
### Paymaker
```
node ./pool.js --payMaker
```

### BlkHandler(s)
Launch the **BlkHandler** nodes, specify `--blk0` for the first **BlkHandler**, `--blk1` for the second, and so forth
```
cd PacketCrypt
node ./pool.js --blk0
node ./pool.js --blk1
```


## *Machine 2*

### BlkMiner

``--threads`` is the number of threads you want to dedicate to the Blkminer
``--paymentaddr`` is the wallet you want your coins to be mined into, it is advisable to not use the electrum wallet for this.
``<Master address of pool>`` is the masterUrl of your pool
```
cd packetcrypt_rs
./target/release/packetcrypt blk <Master Address of Pool> --paymentaddr <your PKT wallet address> --threads 5 --memorysizemb 2300
```

### AnnHandler
```
cd packetcrypt_rs
./target/release/packetcrypt ah --config /path/to/pool.toml ah0
```

## *Machine 3*

### AnnMiner
```
./target/release/packetcrypt ann http://pool.pktpool.io --paymentaddr <your PKT wallet address>
```





# NGINX Setup (For allowing external AnnMining)

## *Machine 1*
Update system and install Nginx
```
sudo apt update
sudo apt install nginx
```
Unlink default nginx site
```
unlink /etc/nginx/sites-enabled/default
cd /etc/nginx/sites-available
```
Create and edit the reverse-proxy.conf file
```
vim reverse-proxy.conf
```

The config for the services:

```
server { 
	listen 80; 
	listen [::]:80; 
	server_name <masterURL>; 
	location / { 
		proxy_pass http://localhost:8080/; 
		} 
}

server { 
	listen 80; 
	listen [::]:80; 
	server_name paymaker.pktpool.io; 
	location / { 
		proxy_pass http://localhost:8081/; 
		} 
}
```
Link new file to sites-enabled
```
ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf
```
Remove default config
```
rm default
```
Check reverse proxy config is correct
```
nginx -t
```
Reload nginx to pick up config changes.
```
sudo systemctl reload nginx
```
## *Machine 2*

```
unlink /etc/nginx/sites-enabled/default
cd /etc/nginx/sites-available
```
```
server { 
    listen 80; 
    listen [::]:80; 
    server_name ann1.pktpool.io; 
    location / { 
        proxy_pass http://localhost:8081/; 
    } 
}
```

Link new file to sites-enabled
```
ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf
```
Remove default config
```
rm default
```
Check reverse proxy config is correct
```
nginx -t
```
Reload nginx to pick up config changes.
```
sudo systemctl reload nginx
```
