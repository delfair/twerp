#!/bin/bash
 
# Script to parse Stanford HIVdb XML reports using XSLT 1.0
#
# Assumes: 	Required sequence/sample name was used in header for HIVdb query
#
# Requires:	Valid Stanford HIVdb XML report
#		Schema: https://hivdb.stanford.edu/DR/schema/sierra.xsd
#		XLST 1.0 stylesheet
#		xlstproc installed and in user's Path
#		xpath installed and in user's Path
#		wkhtmltopdf installed and in user's Path
#
# Usage: 	./xlst_wrapper.sh XML_report.xml XSLT_stylesheet.xsl
#
# Output	Formatted XHTML file named according to sequence/sample name
#		Logfile named according to sequence/sample name
#		PDF file generated from XHTML file named according to sequence/sample name
#
# Author:	Derek Fairley under GPL v2.x+

#================================================================================

# To do:
# XML format and validity checks
# error handling
# strip whitespace from sequence name if present (HIVdb may do this)
# add CSS

xml="$1"
xslt="$2"

# Check input files both exist
if [[ -f "$xml" && -f "$xslt" ]]

then
	# Parse sequence name from inputSequence element of input XML file using xpath
	var=$(xpath -e "//DrugResistance_Interpretation/result/inputSequence/name/text()" $xml)
	echo "$var"
	
	# Create logfile with file info
	echo "XML file "$xml" parsed by XSLT "$xslt"" &> "$var".log
	echo &>> "$var".log
	
	# run xlstproc and append STDOUT to logfile
	xsltproc -v -o "$var".html "$xslt" "$xml" &>> "$var".log
	echo "XML file "$xml" parsed by XSLT "$xslt"" 
	echo "Output file "$var".html created in this directory"
	echo "See logfile "$var".log for record of XSLT transform"
	
	# run wkhtmltopdf to create PDF report
	wkhtmltopdf "$var".html "$var".pdf
	echo "PDF report "$var".pdf created in this directory"
	
else
	echo "Input file/s not found"
fi

