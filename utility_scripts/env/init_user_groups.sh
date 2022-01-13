#!/bin/bash

sudo gpasswd -a $USER i2c
sudo gpasswd -a $USER dialout
sudo gpasswd -a $USER tty

echo "------------> Configured User Groups"
