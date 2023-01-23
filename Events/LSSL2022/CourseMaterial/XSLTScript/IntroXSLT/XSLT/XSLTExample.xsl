<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">

    <xsl:output method="html" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title><xsl:apply-templates select="/TEI/teiHeader/fileDesc/titleStmt/title"/></title>
            </head>
            <body>
                <h1>Headwords</h1>
                <xsl:for-each select="descendant::entry">
                    <xsl:sort select="form[1]/orth[1]" lang="fr"/>
                    <xsl:value-of select="form[1]/orth[1]"/>
                    <xsl:text> - </xsl:text>
                </xsl:for-each>
                <h1>Diagnosis</h1>
                <h2>Entries without <gi>form</gi></h2>
                <xsl:apply-templates select="descendant::entry[not(form)]"/>
                <h2>Entries with a definition not contained within a sense.</h2>
                <xsl:apply-templates select="descendant::def[not(ancestor::sense)]/ancestor::entry"/>
                <h2>Duplicate entries</h2>
                <xsl:variable name="theDictionary" select="/"/>
                <xsl:for-each select="distinct-values(descendant::entry/form/orth)">
                    <xsl:variable name="theForm" select="."/>
                    <xsl:if test="count($theDictionary/descendant::entry[form/orth = $theForm])>1">
                        <xsl:value-of select="$theForm"/>
                        <xsl:text> - </xsl:text>
                    </xsl:if>
                </xsl:for-each>
                <h2>Different words in entries</h2>
                <xsl:variable name="wordsInDef" select="distinct-values( for $i in descendant::def return tokenize($i,' '))"/>
                <xsl:value-of select="$wordsInDef" separator="; "/>
                <h1>Entries</h1>
                <xsl:apply-templates select="descendant::body"/>
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

    <xsl:template match="cit[@type = 'example']/quote">
        <i>
            <xsl:apply-templates/>
        </i>
    </xsl:template>

    <xsl:template match="pron[not(starts-with(normalize-space(.), '[') and ends-with(normalize-space(.), ']'))]">
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
                <xsl:value-of select="count(preceding-sibling::sense)+1"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text>-</xsl:text>
        <xsl:apply-templates/>
    </xsl:template>

</xsl:stylesheet>
