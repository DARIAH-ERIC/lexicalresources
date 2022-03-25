<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:teix="http://www.tei-c.org/ns/Examples"
    xmlns:html="http://www.w3.org/1999/xhtml" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="2.0" exclude-result-prefixes="tei teix html">
    <xsl:variable name="contributorsList">
        <!--sorted alphabetically-->
        <xsl:for-each select="//tei:fileDesc/tei:titleStmt/tei:author">
            <xsl:sort select="upper-case(tei:persName/tei:surname)"/>
            <item xmlns="http://www.tei-c.org/ns/1.0">
                <xsl:attribute name="type">
                    <xsl:value-of select="@role"/>
                </xsl:attribute>
                <xsl:copy-of select="tei:persName"/>
            </item>
        </xsl:for-each>
    </xsl:variable>
    <xsl:variable name="mainAuthors">
        <!--used in short citation-->
        <xsl:for-each select="//tei:fileDesc/tei:titleStmt/tei:author[@role = 'main']">
            <xsl:value-of select="tei:persName/tei:forename"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="tei:persName/tei:surname"/>
            <xsl:if test="position() != last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:variable>
    <xsl:variable name="formattedAuthors">
        <!--used in long citation-->
        <xsl:for-each select="//tei:fileDesc/tei:titleStmt/tei:author[@role = 'main']">
            <xsl:value-of select="tei:persName/tei:forename"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="tei:persName/tei:surname"/>
            <xsl:text>, </xsl:text>
        </xsl:for-each>
        <xsl:for-each select="//tei:fileDesc/tei:titleStmt/tei:author[@role = 'contributing']">
            <xsl:sort select="upper-case(tei:persName/tei:surname)"/>
            <xsl:if test="position() eq last()">
                <xsl:text> and </xsl:text>
            </xsl:if>
            <xsl:value-of select="tei:persName/tei:forename"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="tei:persName/tei:surname"/>
            <xsl:if test="position() != last() and position() != (last() - 1)">
                <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:if test="position() eq last()">
                <xsl:text>. </xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:variable>
    <xsl:variable name="version" select="//tei:fileDesc/tei:editionStmt/tei:edition/@n"/>
    <xsl:variable name="url" select="//tei:fileDesc/tei:publicationStmt/tei:ptr/@target"/>
    <xsl:variable name="date" select="//tei:fileDesc/tei:publicationStmt/tei:date/@when"/>
    <xsl:variable name="title">
        <xsl:value-of select="//tei:fileDesc/tei:titleStmt/tei:title[not(@type)]"/>
        <xsl:text>: </xsl:text>
        <xsl:value-of select="//tei:fileDesc/tei:titleStmt/tei:title[@type = 'subordinate']"/>
        <xsl:text>. </xsl:text>
    </xsl:variable>
    <xsl:variable name="publisher" select="//tei:fileDesc/tei:publicationStmt/tei:authority"/>
    <!--generate list of all contributors-->
    <xsl:template match="tei:divGen[@type = 'contributors']">
        <xsl:element name="div" namespace="http://www.tei-c.org/ns/1.0">
            <head xmlns="http://www.tei-c.org/ns/1.0">Contributors</head>
        </xsl:element>
        <xsl:element name="list" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:attribute name="rend">contributors</xsl:attribute>
            <xsl:copy-of select="$contributorsList"/>
        </xsl:element>
    </xsl:template>
    <!--generate how to cite guidelines -->
    <xsl:template match="tei:divGen[@type = 'how-to-cite']">
        <xsl:element name="div" namespace="http://www.tei-c.org/ns/1.0">
            <head xmlns="http://www.tei-c.org/ns/1.0">How to cite these guidelines</head>
            <hi xmlns="http://www.tei-c.org/ns/1.0" rend="underline">Full citation</hi>
            <xsl:element name="p" xmlns="http://www.tei-c.org/ns/1.0">
                <xsl:value-of select="$formattedAuthors"/>
                <xsl:value-of select="$date"/>
                <xsl:text>. </xsl:text>
                <xsl:element name="hi" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:attribute name="rend">italic</xsl:attribute>
                    <xsl:value-of select="$title"/>
                </xsl:element>
                <xsl:text>Version </xsl:text>
                <xsl:value-of select="$version"/>
                <xsl:text>. </xsl:text>
                <xsl:value-of select="$publisher"/>
                <xsl:text>. </xsl:text>
                <xsl:value-of select="$url"/>
                <xsl:text>. </xsl:text>
            </xsl:element>
            <hi xmlns="http://www.tei-c.org/ns/1.0" rend="underline">Short citation</hi>
            <xsl:element name="p" xmlns="http://www.tei-c.org/ns/1.0">
                <xsl:value-of select="$mainAuthors"/>
                <xsl:text> et al. </xsl:text>
                <xsl:value-of select="$date"/>
                <xsl:text>. </xsl:text>
                <xsl:element name="hi" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:attribute name="rend">italic</xsl:attribute>
                    <xsl:value-of select="$title"/>
                </xsl:element>
                <xsl:text>Version </xsl:text>
                <xsl:value-of select="$version"/>
                <xsl:text>. </xsl:text>
                <xsl:text>DARIAH Working Group on Lexical Resources. </xsl:text>
                <xsl:value-of select="$url"/>
                <xsl:text>. </xsl:text>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <!--generate how to cite guidelines -->
    <xsl:template match="tei:divGen[@type = 'revision-history']">
        <xsl:element name="div" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:attribute name="xml:id">revisionHistory</xsl:attribute>
            <head xmlns="http://www.tei-c.org/ns/1.0">Revision history</head>
            <xsl:element name="p" namespace="http://www.tei-c.org/ns/1.0"> Changes to the TEI Lex-0
                specification up to version 0.8.6 were included in comments inside the ODD file
                itself. Starting with version 0.9.0, we're listing a summary of the changes in this
                list for easier reference. </xsl:element>
            <xsl:for-each select="/tei:TEI/tei:teiHeader/tei:revisionDesc/tei:listChange">
                <xsl:for-each select="./tei:listChange">
                    <xsl:element name="list" namespace="http://www.tei-c.org/ns/1.0">
                        <xsl:element name="head" namespace="http://www.tei-c.org/ns/1.0">
                            <xsl:element name="hi" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:attribute name="rend">underline</xsl:attribute>
                                <xsl:text>Version: </xsl:text>
                                <xsl:value-of select="@n"/>
                            </xsl:element>
                            <xsl:text> (</xsl:text>
                            <xsl:value-of select="change[1]/@when"/>
                            <xsl:text>)</xsl:text>
                        </xsl:element>
                        <xsl:for-each select="tei:change">
                            <xsl:element name="item" namespace="http://www.tei-c.org/ns/1.0">
                                <xsl:element name="label" namespace="http://www.tei-c.org/ns/1.0">
                                    <xsl:value-of select="@type"/>
                                </xsl:element>
                                <xsl:apply-templates/>
                            </xsl:element>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
