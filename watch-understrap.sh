#!/bin/bash

# make sure gulp-cli is installed
cd /app/wp-content/themes/understrap
# echo "Installing gulp"
# npm install -g gulp
echo "installing npm dependencies"
npm install -d
echo "attempting to change  permissions"
chmod a+rwx -R  /app/wp-content/themes/understrap/npm_modules
while :
do
 echo "running gulp watch"
 gulp watch-bs
 echo "oops, gulp died"
done
