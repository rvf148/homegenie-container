#!/bin/bash
echo "Starting SSH"
/usr/sbin/sshd
echo "Starting HomeGenie"
/usr/bin/mono /usr/local/bin/homegenie/HomeGenie.exe