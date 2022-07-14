<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0" xmlns:eg="http://www.tei-c.org/ns/Examples">
    
    <!-- remember to deselect xml:base fixup in XML Parser Preferences in oXygen-->
    <!--    otherwise, included fragments will probably include xml:base, which we don't want-->
    
    <xsl:template match="/">
        <xsl:text>&#xa;</xsl:text><xsl:text>&#xa;</xsl:text>
        <xsl:comment>This file should not be edited manually. 
To edit examples, please use TEILex0-examples.xml, 
then transform using tei-stripper.xsl</xsl:comment>
        <xsl:text>&#xa;</xsl:text><xsl:text>&#xa;</xsl:text>
        <xsl:apply-templates></xsl:apply-templates>
    </xsl:template>
    
    <!-- template to copy elements -->
    <xsl:template match="*">
        <xsl:element name="{local-name()}" namespace="http://www.tei-c.org/ns/Examples">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:element>
    </xsl:template>
    
    <!-- template to copy attributes -->
    <xsl:template match="@* except @xml:*">
        <xsl:attribute name="{local-name()}">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="@xml:*">
        <xsl:copy></xsl:copy>
    </xsl:template>
    
    <!-- template to copy the rest of the nodes -->
    <xsl:template match="comment() | text() | processing-instruction()">
        <xsl:copy/>
    </xsl:template>
    
</xsl:stylesheet>