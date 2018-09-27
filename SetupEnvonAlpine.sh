#!/bin/bash

echo Update repository and install icu...
apk update
apk add icu-dev

CURRENT_PWD=$PWD
echo Create [downloads] folder and download dotnet sdk into [downloads] folder 
mkdir -p $HOME/downloads
cd $HOME/downloads
curl -sSL -o dotnetsdk.tar.gz https://download.microsoft.com/download/8/A/7/8A765126-50CA-4C6F-890B-19AE47961E4B/dotnet-sdk-2.1.402-linux-musl-x64.tar.gz

echo Create [dotnet] folder and extract dotnet sdk into [dotnet] folder
mkdir -p $HOME/dotnet
tar zxf dotnetsdk.tar.gz -C $HOME/dotnet

echo Setup DOTNET environ variables into [.bash_profile]
echo 'export DOTNET_ROOT=$HOME/dotnet' >> $HOME/.bash_profile
echo 'export PATH=$PATH:$DOTNET_ROOT' >> $HOME/.bash_profile
source $HOME/.bash_profile

cd $CURRENT_PWD
