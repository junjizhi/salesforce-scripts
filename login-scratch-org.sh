#!/bin/bash
set -euo pipefail

cd $SALESFORCE_REPO

tmpfile=/tmp/scrach-org-creds
sfdx force:user:display > $tmpfile

username=$(cat $tmpfile |grep Username | awk '{ print $2 }')
password=$(cat $tmpfile |grep Password | awk '{ print $2 }')
url=$(cat $tmpfile |grep "Instance Url" | awk '{ print $3 }')

echo "Username: $username"
echo "Password: $password"
echo "Url: $url"

echo "Launching Chromium browser..."

cd -

node ./login.js $username $password $url
