<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" version="2.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output method="html"/>

    <xsl:template match="teiHeader"/>

    <xsl:template match="entry">
        <p>
            <xsl:apply-templates/>
            <!-- select="descendant::form" -->
        </p>
    </xsl:template>

    <xsl:template match="orth">
        <b>
            <xsl:apply-templates/>
        </b>
    </xsl:template>

    <xsl:template match="form/pron">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="gramGrp/pos">
        <p>
            <b>
                <span style="text-transform:uppercase;">
                    <xsl:apply-templates/>
                </span>
            </b>
        </p>
    </xsl:template>

    <xsl:template match="sense/subc">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="usg[@type = 'geo']">
        <!--  -->
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="usg[@type = 'reg']">
        <!--  -->
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="sense">
        <p>
            <xsl:value-of select="@n"/>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="sense/def">
        <br/>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="cit[@type = 'example']/quote">
        <p>
            <i>
                <xsl:apply-templates/>
            </i>
        </p>
    </xsl:template>

    <xsl:template match="etym">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

</xsl:stylesheet>
