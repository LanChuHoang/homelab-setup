## Instructions

1. Make the script executable by running `chmod +x <path_to_the_script>`
   Ex:

   ```bash
   chmod +x ./wireguard_update_ip/script.sh
   ```

2. (Optional) Change `NOTIFY=0` to `NOTIFY=1` in the script to enable notifications.
   _Note_: This only works on WSL2 and requires the package `BurntToast` to be installed on the Window 11 host. To install the package, run the following command in PowerShell:

   - Open PowerShell as an administrator and run the following command:

   ```powershell
   Set-ExecutionPolicy RemoteSigned
   Install-Module -Name BurntToast
   ```

   - Press A for every prompt.

   - Test the package by running the following command:

   ```powershell
   New-BurntToastNotification -Text "Hello, World!"
   ```

3. Test the script by running `<path_to_the_script> <ip_to_ping>`
   The `<ip_to_ping>` should be the IP address of the Wireguard server.
   Ex:

   ```bash
   ./wireguard_update_ip/script.sh 10.0.0.1
   ```

   If the script runs successfully, the ouput should be similar to:

   ```bash
   Success
   ```

   Else, it will throw an error message like:

   ```bash
   Failed to ping 10.0.0.1
   ```

4. Add the script to the crontab to run it periodically. Run `crontab -e` and add the following line:

   ```bash
   * * * * * /bin/bash <path_to_the_script> <ip_to_ping>
   ```

   Ex:

   ```bash
   * * * * * /bin/bash /home/user/wireguard_update_ip/script.sh 10.0.0.1
   ```

   or this for logging and automatic log truncation for every hour:

   ```bash
    * * * * * /bin/bash /home/user/wireguard_update_ip/script.sh 10.0.0.1 >> /home/user/wireguard_update_ip/log.log 2>&1
    0 * * * * truncate -s 0 /home/user/wireguard_update_ip/log.log
   ```

   _Note_: Make sure to create the log file before running the script.
