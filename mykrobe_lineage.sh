#!python

#!/usr/bin/env python3

import json
import os
import sys
from snakemake.utils import report

path = sys.argv[1]

# filepath from commandline
# print(path)

def load_json(filepath: str) -> dict:
    with open(filepath, 'r') as infile:
        data = json.load(infile)
    return data

# check we can open json object as dictionary
# mykrobe_data = load_json(path)
# print(mykrobe_data)

# methods to parse dictionary:

def get_phylo_group_string(d):
    s = []
    depth=[]
    per_cov=[]
    for k, v in d.get("phylogenetics", {}).get("phylo_group", {}).items():
        s.append(k)
        depth.append(str(v.get("median_depth")))
        per_cov.append(str(v.get("percent_coverage")))
    return ";".join(s), ";".join(per_cov), ";".join(depth)

def get_species_string(d):
    s = []
    depth=[]
    per_cov=[]
    for k, v in d.get("phylogenetics", {}).get("species", {}).items():
        s.append(k)
        depth.append(str(v.get("median_depth")))
        per_cov.append(str(v.get("percent_coverage")))
    return ";".join(s), ";".join(per_cov), ";".join(depth)

def get_lineage_string(d):
    s = []
    depth=[]
    per_cov=[]
    for k, v in d.get("phylogenetics", {}).get("lineage", {}).items():
        s.append(k)
        depth.append(str(v.get("median_depth")))
        per_cov.append(str(v.get("percent_coverage")))
    return ";".join(s), ";".join(per_cov), ";".join(depth)

def get_susceptibility(d):
    drug = []
    predict = []
    called_by = []
    for k, v in d.get("susceptibility", {}).items():
        drug.append(k)
        predict.append(str(v.get("predict")))
    return ";".join(drug), ";".join(predict)

mykrobe_data = load_json(path)
key = list(mykrobe_data.keys())[0]
#print(key)
print(mykrobe_data.keys())
keydata = mykrobe_data[key]
#print(keydata)

print(get_susceptibility(keydata))

print(get_phylo_group_string(keydata))
#prettier printing of returned values:
phylo_group, _, __ = get_phylo_group_string(keydata)
print(phylo_group, _, __)
species, _, __ = get_species_string(keydata)
print(species, _, __)
lineage, _, __ = get_lineage_string(keydata)
print(lineage, _, __)
