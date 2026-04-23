#!/bin/bash
awk -F ',' 'NR>1 {print substr($2, 2, 10)}' ../ex03/hh_positions.csv | sort | uniq | 
while IFS= read -r line; do
    if [ ! -f "$line.csv" ]; then
        head -n 1 ../ex03/hh_positions.csv > "$line.csv"
    fi
    awk -F ',' "(\$2 ~ /$line/)" ../ex03/hh_positions.csv >> "$line.csv"
done 
