<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
	<head>
		<title>Stanford HIVdb Drug Resistance Report</title>
	</head>
	
	<body>
		<img src="https://belfasttrust.hscni.net/wp-content/uploads/2019/02/BHSCTLogo.png" alt="BHSCT logo" width="300" height="100" style="float:left"/><br/><br/><br/><br/><br/><br/>
		<h2>HIV Drug Resistance Report</h2><br/>
		<hr/>
		<h3>Sample information</h3>

		<xsl:value-of select="DrugResistance_Interpretation/result/inputSequence/name"/><br/>

		<h3>Sequence Summary</h3>

		<xsl:for-each select="DrugResistance_Interpretation/result/geneData">
Sequence includes <xsl:value-of select="gene"/>, codons <xsl:value-of select="firstAA"/> - <xsl:value-of select="lastAA"/><br/><br/>
		</xsl:for-each>


		HIV subtype (% mixed): <b><xsl:value-of select="DrugResistance_Interpretation/result/geneData/subtype/type"/></b><br/><br/>

		<h3>Drug Resistance Summary</h3>
		<xsl:apply-templates/><br/>



<h3>Significant mutations</h3>

<xsl:for-each select=".//geneData">

<xsl:choose>
<xsl:when test="gene='HIV1PR'">
Protease inhibitor mutations<br/><br/>
</xsl:when>
<xsl:when test="gene='HIV1RT'">
Reverse transcriptase inhibitor mutations<br/><br/>
</xsl:when>
<xsl:when test="gene='HIV1IN'">
Integrase inhibitor mutations<br/><br/>
</xsl:when>
</xsl:choose>

<table>
<xsl:for-each select=".//mutation">
<xsl:choose>
<xsl:when test="classification='PI_MAJOR' or classification='PI_MINOR' or classification='NRTI' or classification='NNRTI' or classification='INI_MAJOR' or classification='INI_MINOR'">
<tr>
<td>Class</td>
<td>Mutation</td>
</tr>
<tr>
      <td><xsl:value-of select="classification"/></td>
      <td><xsl:value-of select="mutationString"/></td>
</tr>
</xsl:when>
</xsl:choose>
</xsl:for-each>
</table><br/>
</xsl:for-each>

<h3>Other mutations</h3>

<xsl:for-each select=".//geneData">
	<xsl:choose>
		<xsl:when test="gene='HIV1PR'">
		PR other mutations<br/><br/>
		</xsl:when>
		<xsl:when test="gene='HIV1RT'">
		RT other mutations<br/><br/>
		</xsl:when>
		<xsl:when test="gene='HIV1IN'">
		IN other mutations<br/><br/>
		</xsl:when>
	</xsl:choose>
<xsl:for-each select=".//mutation">
	<xsl:choose>
		<xsl:when test="classification='Other'">
		<xsl:value-of select="mutationString"/>, 
		</xsl:when>
	</xsl:choose>
</xsl:for-each>
<br/><br/>
</xsl:for-each>

<h3>Comments</h3>

<xsl:for-each select=".//comment">
	<xsl:choose>
		<xsl:when test="gene='HIV1PR'">
		PR comments<br/><br/>
		</xsl:when>
		<xsl:when test="gene='HIV1RT'">
		RT comments<br/><br/>
		</xsl:when>
		<xsl:when test="gene='HIV1IN'">
		IN comments<br/><br/>
		</xsl:when>
	</xsl:choose>
		<xsl:value-of select="grouping"/><br/>
		<xsl:value-of select="commentString"/><br/><br/>
</xsl:for-each>



		<h3>Drug resistance mutation (DRM) penalty scores and resistance interpretation</h3>

The estimated level of resistance to a drug is determined by adding up the penalty scores associated with each of the DRMs present in a submitted sequence.<br/><br/>
    
Once the total score is calculated the estimated level of resistance can be calculated as follows:<br/><br/>
        <li>Susceptible: Total score 0 to 9</li>
        <li>Potential low-level resistance: Total score 10 to 14</li>
        <li>Low-level resistance: Total score 15 to 29</li>
        <li>Intermediate resistance: Total score 30 to 59</li>
        <li>High-level resistance: Total score >= 60</li><br/>
"Susceptible" indicates no evidence of reduced ARV susceptibility compared with a wild-type virus.<br/>
"Potential low-level resistance" indicates that the sequence may contain mutations indicating previous ARV exposure or may contain mutations that are associated with drug resistance only when they occur with additional mutations.<br/>
"Low-level resistance" indicates that the virus encoded by the submitted sequence may have reduced in vitro ARV susceptibility or that patients harboring viruses with the submitted mutations may have a suboptimal virological response to treatment with the ARV.<br/>
"Intermediate resistance" indicates a high likelihood that a drug's activity will be reduced but that the drug will likely retain significant remaining antiviral activity.<br/>
"High-level resistance" indicates that the predicted level of resistance is similar to those observed in viruses with the highest levels of in vitro drug resistance or that clinical data exist demonstrating that patients infected with viruses having such mutations usually have little or no virological response to treatment with the ARV.<br/><br/>
Further information available <a href="https://hivdb.stanford.edu/page/release-notes/">here</a>.
<br/><br/><hr/><br/>
Algorithm: <xsl:value-of select="DrugResistance_Interpretation/algorithmName"/><br/>
Algorithm version: <xsl:value-of select="DrugResistance_Interpretation/algorithmVersion"/><br/>
Web Service version: <xsl:value-of select="DrugResistance_Interpretation/webServiceVersion"/><br/>
XML Schema version: <xsl:value-of select="DrugResistance_Interpretation/schemaVersion"/><br/>
XSLT Stylesheet version: 0.3<br/>
Author: D.J. Fairley<br/><br/><br/>

	</body>
</html>

</xsl:template>

<!--
table containing formatted data generated here using template match instruction
!-->

  <xsl:template match="DrugResistance_Interpretation">
    <table width="40%" border="2">
      <tr bgcolor="silver">
	       <td align="center">Drug code</td>
	       <td align="center">Generic Name</td>
	       <td align="center">Drug type</td>
	       <td align="center">Score</td>
	       <td align="center">Resistance Call</td>
      </tr>
      <xsl:for-each select="result/drugScore">
	    <tr>
	       <td><xsl:value-of select="drugCode"/></td>
	       <td><xsl:value-of select="genericName"/></td>
	       <td align="center"><xsl:value-of select="type"/></td>
	       <td align="center"><xsl:value-of select="score"/></td>
	       <td align="center"><xsl:value-of select="resistanceLevelText"/></td>
	    </tr>
      </xsl:for-each>
    </table>
  </xsl:template>

</xsl:stylesheet>

