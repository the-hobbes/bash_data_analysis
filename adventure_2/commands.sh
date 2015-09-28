#!/bin/bash

# How to find the max temp? (temps downloaded from NOAA and are in 10ths of
# degrees celcius.

# sort:
# -n ==> sort numerically (not alphabetically, which is by default)
# -t "," ==> the columns of our input are defined by commas
# -k 4,4 ==> specifies that we want to sort only on column 4 (3,4 would mean
# that we would want to combine the data in columns 3 and 4 for the sorting).

sort -n -t "," -k 4,4 las-vegas.csv | tail

# or instead of sorting like this and using tail, you could reverse sort:
sort -r -n -t "," -k 4,4 las-vegas.csv | head

# convert the top temp into F from 10ths of C
# bash can't do floating point arithmetic, so use awk
sort -r -n -t "," -k 4,4 las-vegas.csv | head -n 1 | cut -d "," -f4 | xargs -n 1 | while read number; do echo $number .10 9 5 32 | awk '{printf $1*$2*$3/$4+$5 "\n"}'; done
