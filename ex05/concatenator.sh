#!/bin/bash
head -n 1 ../ex03/hh_positions.csv > result.csv
ls *.csv | grep -v "result.csv" | sort | while IFS= read -r file; do
    tail -n +2 "$file" >> result.csv
done