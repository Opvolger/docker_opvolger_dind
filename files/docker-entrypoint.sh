#!/bin/bash

if [ ! -f "/usr/bin/docker" ]; then
    echo "Creating symbolic link for Jenkins/ Java"
    ln -s /usr/local/bin/docker /usr/bin/docker
fi

echo Creating the user: $USER
addgroup docker && \
adduser -D $USER -Gdocker -s /bin/bash > /dev/null 2>&1
echo "$USER:$PASSWORD" | chpasswd > /dev/null 2>&1

echo Generating ssh host keys...
ssh-keygen -A > /dev/null 2>&1
echo Start the supervisord
supervisord -c /etc/supervisord.conf