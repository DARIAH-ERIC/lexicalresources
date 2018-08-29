<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0" xmlns:eg="http://www.tei-c.org/ns/Examples"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">

    <xsl:output method="html"/>

    <xsl:param name="specificationFileName" select="'./TEILex0-ODD.xml'"/>

    <!-- Not used yet - to be tested to accelerate the stylesheet -->
    <xsl:key name="examples" match="eg:egXML" use="descendant::*/name()"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>ODD specification Diagnosis</title>
                <style>
                    table {
                        border-collapse: collapse;
                    }
                    table,
                    th,
                    td {
                        border: 1px solid black;
                    }
                    tr:hover {
                        background-color: #f5f5f5
                    }
                    th {
                        background-color: #4CAF50;
                        color: white;
                    }</style>
            </head>
            <body>
                <xsl:choose>
                    <xsl:when test="doc-available($specificationFileName)">
                        <xsl:variable name="specification" select="doc($specificationFileName)"/>
                        <xsl:variable name="allElementNames" select="distinct-values($specification/descendant::eg:egXML/descendant::*/name())"/>
                        <h1>Index</h1>
                        <xsl:text>Number of used elements: </xsl:text>
                        <xsl:value-of select="count($allElementNames)"/>
                        <br/>
                        <xsl:for-each select="$allElementNames">
                            <xsl:sort lang="en"/>
                            <a href="#{.}">
                                <xsl:value-of select="."/>
                            </a>
                            <xsl:if test="position() != last()">
                                <xsl:text> - </xsl:text>
                            </xsl:if>
                        </xsl:for-each>
                        <xsl:for-each select="$allElementNames">
                            <xsl:variable name="theElementName" select="."/>
                            <h2 id="{.}">
                                <xsl:value-of select="$theElementName"/>
                            </h2>
                            <xsl:choose>
                                <xsl:when test="$specification/descendant::elementSpec/@ident = $theElementName">
                                    <h3>Customisation for <xsl:value-of select="$theElementName"/></h3>
                                    <xsl:apply-templates select="$specification/descendant::elementSpec[@ident = $theElementName]"/>
                                </xsl:when>
                                <xsl:otherwise>No specific customisation for <xsl:value-of select="$theElementName"/></xsl:otherwise>
                            </xsl:choose>
                            <h3>Content models for <xsl:value-of select="$theElementName"/></h3>
                            <table>
                                <thead>
                                    <tr>
                                        <th>Specification</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <xsl:value-of select="distinct-values($specification/descendant::eg:egXML/descendant::*[name() = $theElementName]/*/name())" separator=", "/>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <h3>Attributes for <xsl:value-of select="$theElementName"/></h3>
                            <xsl:choose>
                                <xsl:when test="$specification/descendant::eg:egXML/descendant::*[name() = $theElementName]/@*">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Attribute</th>
                                                <th>Specification</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <xsl:for-each select="distinct-values($specification/descendant::eg:egXML/descendant::*[name() = $theElementName]/@*/name())">
                                                <tr>
                                                    <td>
                                                        <xsl:value-of select="."/>
                                                    </td>
                                                    <td>
                                                        <xsl:variable name="sortedSpecificationValues">
                                                            <xsl:perform-sort
                                                                select="distinct-values($specification/descendant::eg:egXML/descendant::*[name() = $theElementName]/@*[name() = current()])">
                                                                <xsl:sort select="."/>
                                                            </xsl:perform-sort>
                                                        </xsl:variable>
                                                        <xsl:value-of select="$sortedSpecificationValues" separator=", "/>
                                                    </td>
                                                </tr>
                                            </xsl:for-each>
                                        </tbody>
                                    </table>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>No attribute for this element</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:message>Fichier non lu: <xsl:value-of select="$specificationFileName"/></xsl:message>
                    </xsl:otherwise>
                </xsl:choose>
            </body>
        </html>
    </xsl:template>

    <!-- Templates for parsing elementSpec -->

    <xsl:template match="description">
        <p>New description: <xsl:value-of select="."/></p>
    </xsl:template>

    <xsl:template match="attDef">
        <xsl:choose>
            <xsl:when test="@mode = 'replace'">
                <p>New definition for attribute <b><xsl:value-of select="@ident"/></b></p>
            </xsl:when>
            <xsl:otherwise>
                <p>Missing template to deal with mode: <xsl:value-of select="@mode"/></p>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
