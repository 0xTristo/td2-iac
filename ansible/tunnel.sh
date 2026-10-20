#!/bin/bash
FIP=$(cd ~/td2/terraform && terraform output -raw floating_ip)
pkill -f "ssh.*6443:127.0.0.1:6443" 2>/dev/null || true
sleep 1
ssh -f -N -i ~/.ssh/asl-key -o StrictHostKeyChecking=no -o ExitOnForwardFailure=yes \
  -L 6443:127.0.0.1:6443 ubuntu@"$FIP"
