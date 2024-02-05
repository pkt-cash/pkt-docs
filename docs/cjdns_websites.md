# Setup your website on cjdns network

1. Install Yunohost by following the detailed instructions provided [here](https://yunohost.org/en/install).
2. Once the installation is complete, log in as an administrator at `yunohost.local`. Perform a system update, which may take some time.
3. Navigate to Tools -> Yunohost Settings -> Security, and under NGINX, disable "Force HTTPS." Click Save to apply the changes.
4. Reboot your Yunohost server to make the tun device available. Navigate to Tools->Shutdown and click Reboot.
5. Return to `yunohost.local` after the update and navigate to the Applications menu. Click on Install, search for "wordpress," select it, and proceed with the installation.
6. Go back to the Applications menu, select "All apps" next to the search bar and then search for "cjdns", select it and install it. Once cjdns has installed your cjdns ipv6 will be displayed, Copy it.
7. Ssh into your yunohost and edit your nginx configuration
   
   `nano /etc/nginx/conf.d/[domain.com].conf`

   there under the `server` section add your cjdns ipv6 as a `server_name`, make sure to put it with in square brackets `[]` and also remove any leading zeros from each section if there are any.

   For example:

   `fc3d:2895:0b0c:cf4a:3d3b:216f:7268:a34a` becomes `[fc3d:2895:b0c:cf4a:3d3b:216f:7268:a34a]`
   
   Save the conf file and run
   `nginx -t`
   
    to check for any errors and then
   
    `systemctl restart nginx`
   
    to restart the server.
8. Congratulations now you have your new website available for everyone in the cjdns network.
   You can access it by using a browser and go to http://[your-cjdns-ipv6]/blog
   
   For example:

    `http://[fc3d:2895:b0c:cf4a:3d3b:216f:7268:a34a]/blog`
