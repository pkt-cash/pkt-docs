# Build a Website in Packet Network

## How to set up a self-hosted website on cjdns
The following setup has been tested on a Raspberry Pi 4.

1. Go to [https://yunohost.org/en/install](https://yunohost.org/en/install){:target="_blank"}
2. Select Raspberry Pi
3. Download the YunoHost image
4. Go to [https://www.raspberrypi.com/news/raspberry-pi-imager-imaging-utility/](https://www.raspberrypi.com/news/raspberry-pi-imager-imaging-utility/){:target="_blank"}
5. Download Pi Imager
6. Flash the YunoHost image to your SD card using the Pi Imager
7. Then insert the SD card into your Raspberry Pi and boot it up.
8. Access the YunoHost admin panel by going to [https://yunohost.local](https://yunohost.local){:target="_blank"}
9. Start the post-installation process
10. In the Set main-domain select _"I want a domain for local usage / test only"_
11. Complete the post-installation process
12. Once the post-installation process is complete, go to the YunoHost admin panel and log in
13. Select the __"Applications"__ tab and click on "Install"
14. Search for __"wordpress"__, select it.
15. Scroll down and select "administrator for this site"
16. Click on __"Install"__
17. Upon completion go to "Applications" and click __"Install"__ again
18. Scroll down on "Install custom app" and paste the following link: `https://github.com/dkoukoul/cjdns_ynh`
19. Click on __"Install"__
20. On completion your cjdns ipv6 address will be displayed, copy it.