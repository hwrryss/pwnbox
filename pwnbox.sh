#!/bin/bash

filename="$1"

sanename=$(echo "$filename" | rev | cut -d'/' -f 1 | rev)
contname=$(echo "$sanename" | head -c 12 | tr -d ".")
randomed=$(shuf -er -n12  {A..Z} {a..z} {0..9} | tr -d '\n')

if [ "$#" -lt 1 ]; then
    echo "usage: pwnbox filename/folder"
elif [[ "$2" == "--rm" ]]; then
    docker run --rm --privileged --cap-add "SYS_PTRACE" --name "pwnbox-$contname-$randomed" -v "$PWD/$filename:/box/$sanename" -it "pwnbox" "/bin/zsh"
else
    docker run --privileged --cap-add "SYS_PTRACE" --name "pwnbox-$contname-$randomed" -v "$PWD/$filename:/box/$sanename" -it "pwnbox" "/bin/zsh"
fi
