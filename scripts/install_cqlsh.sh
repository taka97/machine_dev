#!/bin/bash

VERISON=5.1.34
FILE_NAME=cqlsh-$VERISON
TAR_FILE_NAME=$FILE_NAME-bin.tar.gz

curl https://downloads.datastax.com/enterprise/cqlsh-$VERISON-bin.tar.gz -o /tmp/$TAR_FILE_NAME
tar -xzvf /tmp/$TAR_FILE_NAME -C /tmp
rm -rf /tmp/$TAR_FILE_NAME

sudo mv /tmp/$FILE_NAME /usr/local/$FILE_NAME
sudo chown -R root:root /usr/local/$FILE_NAME

sudo ln -s /usr/local/$FILE_NAME/bin/cqlsh /usr/local/bin/cqlsh
