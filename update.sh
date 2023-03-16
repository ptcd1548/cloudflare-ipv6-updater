#!/bin/bash

# Set your Cloudflare API credentials and subdomain name
EMAIL="your_email@example.com" # Put your Cloudflare account email
API_KEY="your_global_api_key" # Put your global API Key
ZONE_ID="your_zone_id" # Put your Zone ID Here
SUBDOMAIN="subdomain.example.com" # Put your subdomain here

# Get the current IPv6 address of the machine
IPV6=$(curl -s 'https://ipv6.whatismyip.akamai.com' | grep -oE '([a-f0-9]{0,4}:){7}[a-f0-9]{0,4}')

# Get the DNS record ID of the subdomain
RECORD_ID=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/${ZONE_ID}/dns_records?type=AAAA&name=${SUBDOMAIN}" \
  -H "X-Auth-Email: ${EMAIL}" \
  -H "X-Auth-Key: ${API_KEY}" \
  -H "Content-Type: application/json" | jq -r '.result[0].id')

# Update the DNS record with the new IPv6 address
curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/${ZONE_ID}/dns_records/${RECORD_ID}" \
  -H "X-Auth-Email: ${EMAIL}" \
  -H "X-Auth-Key: ${API_KEY}" \
  -H "Content-Type: application/json" \
  --data '{"type":"AAAA","name":"'${SUBDOMAIN}'","content":"'${IPV6}'","ttl":1,"proxied":false}'
