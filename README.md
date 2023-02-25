# MeowOS
meowos is an electronic cat written in kernel for AMD64 systems.

meowos is written in Netwide Assembler and C++ on Linux.

# How to Build
You can build meowos with included shell script. 

First, Install NASM and gcc-c++ on your Linux Computer. 

Next, clone the code, and type "sh buildasm.sh". If compile is successful, Shell script will quit without error messages.

Finaly, some Binary files and Floppy image file will be generated on "dist" directory.


# How to Boot
If you have qemu-kvm and compiled MeowOS on your system, You can boot by typing "sh qemuboot.sh". 

On qemu-kvm became ready, You can connect to display with VNC 127.0.0.1:5900.

I recommend TigerVNC for display.


# On Windows
Build Script and Boot Script for Windows are be provided soon.


# Progress
MeowOS is under heavy development. Almost all functions of MeowOS is not working now.
