#!/bin/sh

sudo apt update && sudo apt upgrade -y

sudo apt install -t ${VERSION_CODENAME}-backports cockpit -y