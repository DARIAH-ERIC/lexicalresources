<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="3.0"> 
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="/">
        <xsl:text>Total number of entries: </xsl:text>
        <xsl:value-of select="count(//entry)"/>
        <xsl:text>&#xa;</xsl:text>
        <xsl:text>Total number of first-level senses: </xsl:text>
        <xsl:value-of select="count(//sense[not(parent::sense)])"/>
        <xsl:text>&#xa;</xsl:text>
        <xsl:text>Total number of second-level senses: </xsl:text>
        <xsl:value-of select="count(//sense[parent::sense])"/>
    </xsl:template>
  
    

</xsl:stylesheet>