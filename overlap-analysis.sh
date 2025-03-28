#!/bin/bash

# $# special variable for number of args passed
if [ $# -lt 2 ]; then
    echo "Must have at least 2 directories"
    exit 1
fi

echo "count,filename,initials" > overlap.csv

for directory in "$@" 
do 
    if [ ! -d "$directory" ]; then
        echo "$directory does not exist."
        exit 1
    fi

    # Flattening nested directories
    # Courtesy of https://unix.stackexchange.com/questions/52814/flattening-a-nested-directory
    find "$directory" -mindepth 2 -type f -exec mv -t "$directory" -i '{}' +
    find . -empty -type d -delete

    ls "$directory" | sed "s|^|$(basename "$directory") |" >> tmp.txt
done

sort tmp.txt | awk '
{
    count[$2]++; 
    names[$2] = (names[$2] ? names[$2] "," $1 : $1);
} 
END {
    for (key in count) 
        if (count[key] > 1) 
            print count[key] "," key "," names[key];
}' | sort -rn >> overlap.csv

# Clean up temporary file
rm -rf tmp.txt

exit 0
