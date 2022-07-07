<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="html"/>

    <xsl:template match="teiHeader"/>

    <xsl:template match="entry">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="orth">
        <b>
            <xsl:apply-templates/>
        </b>
    </xsl:template>
    
    <xsl:template match="sense">
        <p><xsl:value-of select="@n"/> <xsl:apply-templates/></p>
    </xsl:template>

</xsl:stylesheet>
