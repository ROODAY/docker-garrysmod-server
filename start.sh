#!/bin/bash

if [ ! -f .env ]
then
	export $(cat .env | xargs)
fi

	#-p 27000-27015:27000-27015/udp -p 1200:1200/udp -p 27030-27039:27030-27039/tcp -p 27020:27020/udp -p 27015:27015/tcp \
docker run -it -d --name gmod --restart always \
	-p 27015:27015/udp -p 27015:27015/tcp \
	-v $PWD/garrysmod:/gmodserv/garrysmod/ \
	gmod-server -port 27015 -tickrate 60 -maxplayers 20 \
	+gamemode terrortown +map ttt_67thway_v6 \
	+host_workshop_collection 1413001823 \
	+sv_setsteamaccount $GSLT
