#!/bin/bash
nasm Loader.asm -f bin -o ./dist/loader.bin
nasm ExtendedMain.asm -f bin -o ./dist/extended.bin

cd ./dist

cat loader.bin extended.bin > meowos.flp
