#!/bin/bash

# how many people ordered stuff?
grep "Steak Burrito" orders.tsv | wc -l

# find all items with chips and salsa
grep "Chips and" orders.tsv | cut -f 3 # -f 3 == field/column 3

# how many different kinds of salsa are there?
# uniq -c will collapse similar lines together, and requres its input be sorted
# uniq will also count the occurrences of those similar lines.
# the last sort command sorts the output numerically in reverse order, putting
# the largest on top. 
grep "Chips and" orders.tsv | cut -f3 | sort | uniq -c | sort -n -r

# this leaves us with the problem of counting Tomatillo-Green and Tomatillo 
# Green as separate entries. We need to flatten them out. There are probs loads
# of ways to do this, but I chose to do string replacement with sed (replace -
# with a space).
grep "Chips and" orders.tsv | cut -f3 | sed 's/-/ /g' | sort | uniq -c | sort -n -r

