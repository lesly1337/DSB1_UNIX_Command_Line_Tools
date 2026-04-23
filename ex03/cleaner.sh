#!/bin/bash
head -n 1 ../ex02/hh_sorted.csv > hh_positions.csv
awk -F '",' '{
    if ( NR >= 2 ) {
        result = ""
        if ($3 ~ /Junior/) {
            result = "\"Junior"
            if ($3 ~ /Middle/) {
                result = result "/Middle"
            }
            if ($3 ~ /Senior/) {
                result = result "/Senior"
            } 
        } else if ($3 ~ /Middle/) {
            result = "\"Middle"
            if ($3 ~ /Senior/) {
                result = result "/Senior"
            }
            if ($3 ~ /Junior/) {
                result = result "/Junior"
            } 
        } else if ($3 ~ /Senior/)  {
            result = "\"Senior"
            if ($3 ~ /Middle/) {
                result = result "/Middle"
            }
            if ($3 ~ /Junior/) {
                result = result "/Junior"
            } 
        }
        if (result == "") {
            result = "\"-"
        }
        $3 = result
        print
    }
'} OFS='",' ../ex02/hh_sorted.csv >> hh_positions.csv