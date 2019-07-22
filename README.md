# Cloudflare DDNS

Use terraform to manage your cloudflare DNS records.

## Setup

- Install terraform (Download the latest release and drop it in your $PATH): https://www.terraform.io/downloads.html

## Usage

### Initial Run

You will need to run this once by hand before you can use a cron job

```shell
git clone git@github.com:MaT1g3R/cloudflare-ddns.git
cd cloudflare-ddns
cp variables.example.json variables.json
vim variables.json  # Edit the variables
terraform init
# You might run into an error in the apply step saying record already exist.
# You can delete all of your existing DNS records and let terraform to create them.
# You can also try to import the existing records into your tfstate if you are adventurous.
# https://www.terraform.io/docs/import/index.html
terraform apply -var external_ip=$(./scripts/get-external-ip) -var-file=variables.json
```

### Cronjob

Example crontab entry (update ip every 30 minutes),
note the `-input=false` is required to skip interactive approval of plan before applying.
```cron
*/30 * * * * cd /home/me/terraform-cloudflare && terraform apply -input=false -var external_ip=$(./scripts/get-external-ip) -var-file variables.json
```
