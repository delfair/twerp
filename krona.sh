#!/bin/bash
 
# Script to run Krona (ktImportTaxonomy)
# Requires:     Kraken output files from Nullarbor
#               isolates.txt output file from Nullarbor
#               KronaTools (https://github.com/marbl/Krona/wiki/KronaTools) installed and in path
# Usage: Copy krona.sh to Nullarbor OUTDIR and run
# Author: Derek Fairley under GPL v2.x+

#================================================================================

# Check input file exists

input="./isolates.txt"
if [[ -f "$input" ]]
then

# Output directory

mkdir ./krona

# Parse isolate IDs and copy files to output directory

while IFS= read -r line
        do
        echo "$line"
        cp ./"$line"/kraken.tab ./krona/"$line".kraken.tab
done < "$input"

# Run ktImportTaxonomy

cd ./krona
ktImportTaxonomy -o kraken.krona.html -t 5 -m 3 *.tab

# Optionally ... copy the report somewhere

# cp kraken.krona.html /your/directory/here

cd ..

else
echo "isolates.txt file not found"
fi

