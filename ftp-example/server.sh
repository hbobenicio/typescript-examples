#!/bin/bash

rm -f foo
sudo rm -fr /tmp/ftp
sudo mkdir -p /tmp/ftp/myuser/DIVAT/
sudo sh -c 'echo "CONTEUDO PVT.ROOT" >> /tmp/ftp/myuser/PVT.ROOT'
sudo sh -c 'echo "DVT.ABC LINHA 1" >> /tmp/ftp/myuser/DIVAT/DVT.ABC'
sudo sh -c 'echo "DVT.ABC LINHA 2" >> /tmp/ftp/myuser/DIVAT/DVT.ABC'
sudo sh -c 'echo "DVT.ABD LINHA 1" >> /tmp/ftp/myuser/DIVAT/DVT.ABD'
sudo sh -c 'echo "DVT.ABD LINHA 2 áàâãüç,.;#$%&-_=+[]{}()" >> /tmp/ftp/myuser/DIVAT/DVT.ABD'
sudo sh -c 'echo "DVT.BDE LINHA 1" >> /tmp/ftp/myuser/DIVAT/DVT.BDE'
sudo sh -c 'echo "PVT.FOO LINHA 1" >> /tmp/ftp/myuser/DIVAT/PVT.FOO'

docker run --rm \
  -v /tmp/ftp:/home/vsftpd \
  -p 20:20 -p 21:21 -p 21100-21110:21100-21110 \
  -e FTP_USER=myuser \
  -e FTP_PASS=mypass \
  -e PASV_ADDRESS=127.0.0.1 \
  -e PASV_MIN_PORT=21100 \
  -e PASV_MAX_PORT=21110 \
  --name vsftpd \
  fauria/vsftpd
