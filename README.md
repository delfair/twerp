# twerp

A collection of simple utility scripts for pathogen genomics and typing. 

These allow reformatting and analyis of output files from software such as Nullarbor (https://github.com/tseemann/nullarbor) and Mykrobe (https://github.com/Mykrobe-tools/mykrobe), using tools such as Krona (https://github.com/marbl/Krona/wiki) and json2html (https://pypi.org/project/json2html/).

### Nullarbor outfiles

Krona.sh runs KronaTools ktImportTaxonomy on Nullarbor/Kraken classifier output files and generates a Krona HTML5 report.

### Mykrobe outfiles

Scripts to parse Mykrobe (JSON) output files and convert to formatted HTML tables, or text/HTML output of selected fields.

To do:

Script to run Mykrobe predict on multiple samples.</br>
Script to check software dependencies & versions.</br>
Scripts to generate PDF report(s) for end-users (LaTeX, rst2pdf, ReportLab...).</br>

### Stanford HIVdb

stanford_HIVdb_xml_parser.xsl is an XSLT stylesheet to transform Stanford HIVdb XML reports </br>
xslt_wrapper.sh is a shell script to run XSLT transform on Stanford HIVdb XML reports and handle file operations, renaming etc. </br>

#

#### Etymology

twerp [<i>twurp</i>]

https://www.dictionary.com/browse/twerp

noun Slang.</br>
"an insignificant or despicable fellow"</br>
(also a term of endearment used by Scottish mothers - especially mine - for their naughty offspring)

#
