#!/bin/bash

# get a file with curl, -O means create the dest file w/the src name
curl -O http://adventuresindatascience.com/data/titanic/titanic.txt

# examine w/less -S. -S means if  the line is longer than the viewport, chop it
# off, don't wrap it.
less -S titanic.txt

# pick out the probable columns in the data. 
# get an idea of the number of passengers w/wc (passengers we have info on)
wc -l titanic.txt

# cut out the 3rd column (survival stats), using a comma delimeter
cut -f 3 -d "," titanic.txt

# 0=dead, 1=live. Grep and wc for the total of survivors
cut -f 3 -d "," titanic.txt | grep 1 | wc -l

# how many first class passengers survived? (do the same for 2nd and 3rd)
grep "1st" titanic.txt | wc -l

# did people really act on the women 1st rule?
grep "female" titanic.txt | cut -f 3 -d "," | grep "1" | wc -l

# divide that by the total number of female passengers
grep "female" titanic.txt | cut -f 3 -d "," | wc -l

# do the same thing for male passengers. Not that grepping for "male" will match
# feMALE passengers as well. To get around this, match the '"' before a male
# entry.
grep "\"male" titanic.txt | cut -f 3 -d "," | grep "1" | wc -l

# and all male passengers
grep "\"male" titanic.txt | cut -f 3 -d "," | wc -l

# (a lot more women survived than men)

