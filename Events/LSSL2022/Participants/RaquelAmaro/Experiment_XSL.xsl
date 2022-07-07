<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="html"/>
    
    <xsl:template match="teiHeader"/>
    
    <xsl:template match="entry|hom|hyph|pron|etym|re">
        <p/>
            <xsl:apply-templates/>
    </xsl:template>
    
    
    <xsl:template match="mentioned|quote">
        <i/>
            <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="sense">
        <p/><b/>
        <xsl:value-of select="@n"/>
        <span style="text-transform:bold;">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="orth">
        <b>
            <xsl:apply-templates/>
        </b>
    </xsl:template>

    
</xsl:stylesheet>