#!/bin/bash

set -xe


sudo firewall-cmd --permanent --add-service=rdp
sudo firewall-cmd --reload

