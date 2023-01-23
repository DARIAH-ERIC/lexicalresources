<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="html"/>
    
    <xsl:template match="/">
        <html>
            <body>
                <h1>
                    <xsl:apply-templates select="TEI/teiHeader/fileDesc/titleStmt/title"/>
                </h1>
                <p>
                    <xsl:variable name="theLemmas" select="distinct-values(descendant::orth)"/>
                    <xsl:value-of select="$theLemmas" separator=", "/>
                </p>
              <xsl:apply-templates select="descendant::entry">
                  <xsl:sort select="form[1]/orth[1]"/>
              </xsl:apply-templates>  
            </body>
        </html>
    </xsl:template>
    
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
    
    <xsl:template match="cit[@type='example']/quote">
        <i>
            <xsl:apply-templates/>
        </i>
    </xsl:template>
    
   <!-- <xsl:template match="pron">
        <xsl:text>[</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>]</xsl:text>
    </xsl:template>
    -->
    <xsl:template match="pron[not(starts-with(.,'['))]">
        <xsl:text>[</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>]</xsl:text>
    </xsl:template>
    
    <xsl:template match="sense">
        <br/>
        <xsl:choose>
            <xsl:when test="@n">
                <xsl:value-of select="@n"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="count(preceding-sibling::sense) + 1"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text> - </xsl:text>
        <xsl:apply-templates/>
    </xsl:template>
    
   
</xsl:stylesheet>