#!/usr/bin/env bash
hipreport="$(dirname "$0")/hipreport.sh"
sudo openconnect --protocol=gp --csd-wrapper="$hipreport" --user=mkelley https://vpn-nyc3.digitalocean.com/ssl-vpn
