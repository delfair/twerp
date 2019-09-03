#!python

#!/usr/bin/env python3

import json
import os
import sys
from json2html import *

path = sys.argv[1]

# filepath from commandline
# print(path)

def load_json(filepath: str) -> dict:
    with open(filepath, 'r') as infile:
        data = json.load(infile)
    return data

#print(json2html.convert(json=load_json(path), table_attributes="id=\"info-table\" class=\"table table-bordered table-hover\""))
print(json2html.convert(json=load_json(path)))

# check we can open json object as dictionary
# mykrobe_data = load_json(path)
# print(mykrobe_data)
