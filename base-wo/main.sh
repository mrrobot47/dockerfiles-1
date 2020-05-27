#!/usr/bin/env bash

set -ex

######################################################
######################## VARS ########################
SITE_NAME='ci.site'
SITE_ROOT="/var/www/$SITE_NAME/htdocs"
SITE_URL="http://$SITE_NAME/"
function ee() { wo "$@"; }
#####################################################

# Start required services for site creation
function start_services() {

    echo "Starting services"
    git config --global user.email "nobody@example.com"
    git config --global user.name "nobody"
    rm /etc/nginx/conf.d/stub_status.conf /etc/nginx/sites-available/22222 /etc/nginx/sites-enabled/22222
    rm -rf /var/www/22222
    ee stack start --nginx --mysql --php74
    ee stack status --nginx --mysql --php74
}

# Create, setup and populate WP site with data
function create_and_configure_site () {

    ee site create $SITE_NAME --wp --php74
    cd $SITE_ROOT
    rsync -azh /wp-content/ $SITE_ROOT/wp-content/
    echo "127.0.0.1 $SITE_NAME" >> /etc/hosts
    wp plugin list --allow-root
}

function main() {

    start_services
    create_and_configure_site
}

main
