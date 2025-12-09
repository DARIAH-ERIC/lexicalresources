<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="#all"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Dec 9, 2025</xd:p>
            <xd:p><xd:b>Author:</xd:b> Boris</xd:p>
            <xd:p>Removes the <xd:b>xml:base</xd:b> attributes and empty <xd:b>xml:lang</xd:b> attributes from the results of the <xd:b>p:include</xd:b> step in the oXygen XML Editor.</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template match="@xml:base" priority="2" />
    <xsl:template match="@xml:lang[. = '']" priority="2" />
    
</xsl:stylesheet>