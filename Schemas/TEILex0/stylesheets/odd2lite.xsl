<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:teix="http://www.tei-c.org/ns/Examples"
    xmlns:html="http://www.w3.org/1999/xhtml" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="2.0" exclude-result-prefixes="tei teix html">

    <xsl:import href="https://www.tei-c.org/release/xml/tei/stylesheet/odds/odd2lite.xsl"/>

    <xsl:variable name="authors">
        <xsl:for-each select="//tei:fileDesc/tei:titleStmt/tei:author">
            <xsl:sort select="upper-case(tei:persName/tei:surname)"></xsl:sort>
            <item xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:copy-of select="tei:persName"></xsl:copy-of>
            </item>
        </xsl:for-each>
    </xsl:variable>
    
    <!--generate list of contributors-->

    <xsl:template match="tei:divGen[@type = 'contributors']">
        <xsl:element name="div" namespace="http://www.tei-c.org/ns/1.0">
            <head xmlns="http://www.tei-c.org/ns/1.0">Contributors</head>
        </xsl:element>

        <xsl:element name="list" namespace="http://www.tei-c.org/ns/1.0">
            <xsl:attribute name="rend">contributors</xsl:attribute>
               
            <xsl:copy-of select="$authors"></xsl:copy-of>
            <!-- <xsl:for-each select="$authors">
                <xsl:element name="item" namespace="http://www.tei-c.org/ns/1.0">
                    <xsl:value-of select="."/>
                </xsl:element>
            </xsl:for-each>-->
        </xsl:element>


    </xsl:template>

</xsl:stylesheet>
