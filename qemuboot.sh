#!/bin/bash
cd dist

echo "MeowOS Boot Script"
echo "Starting qemu-kvm.."
/usr/libexec/qemu-kvm -m 512M -cpu host -smp sockets=1,cores=1,threads=1 -fda meowos.flp

echo "Stopped!"
