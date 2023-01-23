<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">

    <xsl:output method="html"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:apply-templates select="descendant::titleStmt/title"/>
                </title>
            </head>
            <body>

                <!--<h1>Nomes:</h1>
                <xsl:apply-templates select="descendant::body/entry[gramGrp/pos/@norm='noun']"/>
                <h1>Verbos:</h1>
                <xsl:apply-templates select="descendant::body/entry[gramGrp/pos/@norm='verb']"/>
                <!-\- categorises entries by POS -\->-->

                <h1>Priberam Dictionary Entries in TEI</h1>
                <h2>Sumário:</h2>
                <xsl:for-each select="descendant::body/entry">
                    <xsl:sort/>
                    <a href="#{@xml:id}"><xsl:value-of select="form[@type = 'lemma']/orth[1]"/></a>
                    <br/>
                </xsl:for-each>
    
                <br/>
                <b>
                    <xsl:text>Classes de palavras normalizadas: </xsl:text>
                </b>
                <xsl:value-of select="distinct-values(descendant::body/entry/gramGrp/pos/@norm)"
                    separator=" | "/>
                <br/>
                
                <!--  shows the distinct normalised values of pos with a | separator -->
                <xsl:apply-templates select="descendant::body/entry">
                    <xsl:sort select="form[@type = 'lemma']/orth[1]" order="ascending" lang="pt"/>
                </xsl:apply-templates>
                <!--alphabetises entries in Portuguese by ascending order (default) of the first orth form of the lemmas-->
            </body>
        </html>
    </xsl:template>

    <xsl:template match="teiHeader"/>

    <xsl:template match="body/entry/gramGrp"/>

    <xsl:template match="body/entry">
        <hr id="{@xml:id}">
            <p>
                <xsl:apply-templates/>
            </p>
        </hr>
    </xsl:template>
    <xsl:template match="syll">
        <p>
            <b>
                <xsl:apply-templates/>
            </b>
        </p>
    </xsl:template>
    <xsl:template match="form[@type = 'lemma']/orth">
        <h2>
            <xsl:apply-templates/>
        </h2>
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
