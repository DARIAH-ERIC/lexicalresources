<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0" xmlns:dc="bla">
    <xsl:output method="xml"/>
    <!--<xsl:strip-space elements="*"/>-->
    <xsl:key name="synsetid" match="//Synset" use="@id"/>
    <xsl:template match="/">
        <TEI>
            <text>
                <body>
                    <xsl:apply-templates select="//LexicalEntry"/>
                </body>
            </text>
        </TEI>
    </xsl:template>
    <xsl:template match="LexicalEntry">
        <entry xml:id="{@id}">
            <xsl:apply-templates/>
        </entry>
    </xsl:template>
    <xsl:template match="Lemma">
        <form type="lemma">
            <orth xml:lang="bg">
                <xsl:value-of select="@writtenForm"/>
            </orth>
            <pos>
                <xsl:value-of select="@partOfSpeech"/>
            </pos>
        </form>
    </xsl:template>
    <xsl:template match="Sense">
        <sense xml:id="{@id}">
            <xsl:variable name="currentsynsetid" select="@synset"/>
            <xsl:variable name="theSynset" select="key('synsetid', $currentsynsetid)"/>
            <xsl:attribute name="cert" select="$theSynset/@confidenceScore"/>
            <idno type="ili">
                <xsl:value-of select="$theSynset/@ili"/>
            </idno>
            <idno type="synsetId">
                <xsl:value-of select="$theSynset/@id"/>
            </idno>
<!--<xsl:copy-of select="key('synsetid', $currentsynsetid)/@confidenceScore"/>-->
<!--<xsl:apply-templates select="/descendant::Synset[@id = $currentsynsetid]"/>-->
            <xsl:apply-templates select="key('synsetid', $currentsynsetid)"/>
        </sense>
    </xsl:template>
    <xsl:template match="Definition">
        <def xml:lang="{@language}" cert="{@confidenceScore}">
            <!--<xsl:copy-of select="@*"></xsl:copy-of>-->
            <xsl:apply-templates/>
        </def>
    </xsl:template>
    <xsl:template match="Example">
        <cit type="example">
            <quote xml:lang="{@language}" cert="{@confidenceScore}">
                <xsl:if test="@dc:source">
                    <xsl:attribute name="source" select="@dc:source"/>
                </xsl:if>
                <!--<xsl:copy-of select="@*"></xsl:copy-of>-->
                <xsl:apply-templates/>
            </quote>
        </cit>
    </xsl:template>

</xsl:stylesheet>
