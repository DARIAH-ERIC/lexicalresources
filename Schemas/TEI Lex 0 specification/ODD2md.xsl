<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <xsl:output method="text" encoding="utf-8" indent="no" />
    <xsl:strip-space elements="*"/>
    
   

    
    <xsl:template match="/TEI/teiHeader/fileDesc/titleStmt">
        <xsl:text>#</xsl:text>
        <xsl:value-of select="./title[1]"/>
        <xsl:text>: </xsl:text>
        <xsl:value-of select="./title[2]"/>
    </xsl:template>
    
    <!--Create table of contents-->
    
    
    
    <xsl:template match="text()"/>
    
</xsl:stylesheet>