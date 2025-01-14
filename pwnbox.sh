#!/bin/bash

filename="$1"

if [ "$#" -lt 1 ]; then
    echo "usage: pwnbox filename/folder"
else
    docker run --privileged --cap-add "SYS_PTRACE" --name "pwnbox-$filename" -v "$PWD/$filename:/box/$filename"  -it "pwnbox" "/bin/zsh"
fi
