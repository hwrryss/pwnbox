#!/bin/bash

filename="$1"

contname=$(echo "$filename" | tr "/" "-" | tr -d ".")
sanename=$(echo "$filename" | rev | cut -d'/' -f 1 | rev)

if [ "$#" -lt 1 ]; then
    echo "usage: pwnbox filename/folder"
elif [[ "$2" == "--rm" ]]; then
    docker run --rm --privileged --cap-add "SYS_PTRACE" --name "pwnbox-$contname" -v "$PWD/$filename:/box/$sanename" -it "pwnbox" "/bin/zsh"
else
    docker run --privileged --cap-add "SYS_PTRACE" --name "pwnbox-$contname" -v "$PWD/$filename:/box/$sanename" -it "pwnbox" "/bin/zsh"
fi
