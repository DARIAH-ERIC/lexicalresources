<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output method="html"/>

    <xsl:template match="teiHeader"/>

    <xsl:template match="body/entry/gramGrp"/>

    <xsl:template match="entry">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="syll">
        <p>
            <b>
                <xsl:apply-templates/>
            </b>
        </p>
    </xsl:template>
    <xsl:template match="form[@type = 'lemma']/orth">
        <h1>
            <xsl:apply-templates/>
        </h1>
        <p>
            <b>
                <xsl:value-of select="form[@type = 'lemma']/orth"/>
                <xsl:apply-templates/>
            </b>
            <xsl:text> | </xsl:text>
            <i>
                <xsl:value-of select="../../gramGrp"/>
            </i>
        </p>
    </xsl:template>
    <xsl:template match="gramGrp">
        <i>
            <xsl:apply-templates/>
        </i>
    </xsl:template>
    <xsl:template match="usg">
        <xsl:text>[</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>]</xsl:text>
    </xsl:template>
    <xsl:template match="sense">
        <p>
            <xsl:value-of select="@n"/>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="xr[@type = 'syn']">
        <xsl:text>= </xsl:text>
        <span style="text-transform:uppercase;">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="xr[@type = 'cf']">
        <xsl:text>Confrontar: </xsl:text>
        <xsl:apply-templates/>
    </xsl:template>
</xsl:stylesheet>
