#!/bin/bash

echo "MeowOS Build Script"
echo "Build Destination Clean.."
rm -rd -f ./dist
mkdir dist

echo "NASM Compile Working.."
nasm Loader.asm -f bin -o ./dist/loader.bin
nasm ExtendedMain.asm -f bin -o ./dist/extended.bin

echo "Merging binaries to floppy image.."
cd ./dist
cat loader.bin extended.bin > meowos.flp
