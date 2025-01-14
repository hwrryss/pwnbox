#!/bin/bash

filename="$1"

contname=$(echo "$filename" | tr "/" "-" | tr -d ".")


if [ "$#" -lt 1 ]; then
    echo "usage: pwnbox filename/folder"
else
    docker run --privileged --cap-add "SYS_PTRACE" --name "pwnbox-$contname" -v "$PWD/$filename:/box/$filename"  -it "pwnbox" "/bin/zsh"
fi
