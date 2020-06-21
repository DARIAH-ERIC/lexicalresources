<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd" version="2.0" xmlns="http://www.w3.org/1999/xhtml"
    xpath-default-namespace="http://www.w3.org/1999/xhtml">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> June 21, 2020</xd:p>
            <xd:p><xd:b>Author:</xd:b> ttasovac</xd:p>
            <xd:p>Hacky test... will explain later </xd:p>
        </xd:desc>
    </xd:doc>


    <xsl:template match="div[@id = 'specification']">
        <xsl:copy-of select="."/>
    </xsl:template>


    <!-- Nothing -->
    <xsl:template match="@* | node()">
        <xsl:apply-templates select="@* | node()"/>
    </xsl:template>

</xsl:stylesheet>
