<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="html"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title><xsl:apply-templates select="descendant::titleStmt/title"/></title>
            </head>
            <body>
                <xsl:apply-templates select="descendant::gramGrp/pos"/>
                <br/>
                <!--<xsl:value-of select="distinct-values(descendant::gramGrp/pos)" separator=" - "/>
                -->
                <!--<h1>Verbs</h1>
                <xsl:apply-templates select="descendant::entry[gramGrp/pos ='v' or gramGrp/pos ='v.']"/>
                <h1>Nouns</h1>
                <xsl:apply-templates select="descendant::entry[gramGrp/pos ='n']"/>
                ...-->
                <!--<xsl:apply-templates select="descendant::entry"/>-->
                
                <xsl:apply-templates select="descendant::entry">
                    <xsl:sort select="form[@type='lemma']/orth[1]"/> 
                </xsl:apply-templates>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="teiHeader"/>

    <xsl:template match="entry">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
   <!-- <xsl:template match="form">
        <xsl:apply-templates select="pron"/>
        <xsl:text>, </xsl:text>
        <xsl:apply-templates select="orth"/>
    </xsl:template>
-->
    <xsl:template match="orth">
        <b>
            <xsl:apply-templates/>
        </b>
    </xsl:template>
    
    <xsl:template match="sense">
        <p><xsl:value-of select="@n"/> <xsl:apply-templates/></p>
    </xsl:template>

</xsl:stylesheet>
