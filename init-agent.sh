#!/bin/bash

TMP="/tmp/matrix-wechat-agent"
DIR="/home/user/matrix-wechat-agent"

if [ ! -d "$DIR" ]; then
    echo "Create matrix wechat agent folder"
    mkdir -p $DIR
fi

mkdir -p $TMP
cd $TMP

if [ ! -f "$DIR/matrix-wechat-agent.exe" ]; then
    echo "Download agent"
    URL=$(curl -s https://api.github.com/repos/duo/matrix-wechat-agent/releases/latest | grep "browser_download_url.*exe" | cut -d : -f 2,3 | tr -d \")
    wget -q $URL
    cp *.exe $DIR
fi

if [[ ! -f "$DIR/wxDriver.dll" || ! -f "$DIR/SWeChatRobot.dll" ]]; then
    echo "Download dll"
    URL=$(curl -s https://api.github.com/repos/ljc545w/ComWeChatRobot/releases/latest | grep "browser_download_url.*zip" | cut -d : -f 2,3 | tr -d \")
    wget -q $URL
    unzip -qq *.zip
    cp http/*.dll $DIR
fi

rm -rf $TMP
