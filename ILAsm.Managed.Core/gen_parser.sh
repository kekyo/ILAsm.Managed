#!/bin/sh

#wget http://mirrors.kernel.org/ubuntu/pool/universe/m/mono/mono-jay_4.6.2.7+dfsg-1ubuntu1_amd64.deb
#sudo apt install ./mono-jay_4.6.2.7+dfsg-1ubuntu1_amd64.deb

jay -ct ../mono/mcs/ilasm/parser/ILParser.jay < ../mono/mcs/jay/skeleton.cs > ILParser.cs

