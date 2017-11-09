#!/bin/bash

# make sure gulp-cli is installed
cd /app/wp-content/themes/dev-theme/
echo "Installing gulp"
# npm install -g gulp
echo "installing npm dependencies"
npm install -d
echo "attempting to change  permissions"
chmod a+rw -R  /app/wp-content/themes/dev-theme/
while :
do
 echo "running gulp watch"
 gulp watch
 echo "oops, gulp died"
done
