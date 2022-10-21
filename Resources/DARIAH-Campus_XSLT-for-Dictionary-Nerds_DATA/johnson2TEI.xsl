<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="3.0"> 
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="entry">
        <xsl:copy>
            <xsl:comment>This is a fancy dicitonary entry.</xsl:comment>
            <xsl:apply-templates/>        
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="lemma">
        <form type="lemma">
            <orth>
                <xsl:value-of select="text()"/>
            </orth>
        </form>
    </xsl:template>
    
    <xsl:template match="pos">
        <gramGrp>
            <gram type="pos">
                <xsl:value-of select="text()"/>
            </gram>
        </gramGrp>  
    </xsl:template>
    
    <xsl:template match="etymology"/>
    
    <xsl:template match="quote">
        <cit type="example">
            <xsl:copy-of select="."/>
            <xsl:copy-of select="../author"/>      
        </cit>
    </xsl:template>     
</xsl:stylesheet>