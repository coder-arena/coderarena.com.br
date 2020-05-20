#!/bin/sh
echo "[ Deleting old publication ]"
rm -rf public
mkdir public

echo "[ Generating Hugo website ]"
hugo --theme=casper

echo "[ Creating now alias config file ]"
echo "{
	\"name\": \"coderarena.com.br\",
	\"alias\": \"coderarena.com.br\"
}" > ./public/now.json

echo "[ Publishing to now ]"
cd ./public && now && now alias
