# Cloudflare IPv6 Updater
A bash script to update ipv6 using cloudflare API
## How to set up to automatically update IP
- Open terminal and enter ``crontab -e`` command and paste this `` * * * * * bash /path_to_the_folder/cloudflare-ipv6-updater/update.sh``
- This command is using to update IP every 1 minute. You can customize it by using some tool like https://crontab-generator.org
## How to find API Key
- Go to https://dash.cloudflare.com/profile/api-tokens
- In API Keys > Global API Key, choose **View**. It will be shown
## How to find Zone ID
- Go to domain dashboard, you will see it. Example: 

![untitled](https://user-images.githubusercontent.com/127763796/225525144-ff50183b-8c56-476a-90cb-33e82d072239.png)
