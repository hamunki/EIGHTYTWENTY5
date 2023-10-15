#!/usr/bin/bash
filename="$1"
while read -r line; do
    name="$line"
    echo "Name read from file - $name"
    echo "$name" | ./hamunki_cwwav -f 800 -w 15 -F 10 -e 0.0 -o "audio/$name.wav"
done < "$filename"
