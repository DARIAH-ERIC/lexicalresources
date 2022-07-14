<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd" version="2.0" xmlns="http://www.w3.org/1999/xhtml"
    xpath-default-namespace="http://www.w3.org/1999/xhtml">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Apr 24, 2012</xd:p>
            <xd:p><xd:b>Author:</xd:b> mholmes</xd:p>
            <xd:p>This stylesheet is designed to post-process the TEI Guidelines HTML version in
                such a way that all id attributes on elements are provided with a tei_ prefix, and
                all href attributes linking to them are similarly tweaked to keep all the links
                working. This is worth doing because we have encountered difficulties with AdBlock
                Plus filters which have hidden elements arbitrarily on the main Guidelines site
                based on their ids; we believe that the tei_ prefix will make this less likely, and
                if it does happen, we will find it easier to convince the filter list maintainers to
                whitelist tei_ prefixed ids. </xd:p>
        </xd:desc>
    </xd:doc>
    <!-- this is hacky but easier to do than to figure out all the intricacies of TEI stylesheets
    will return to the stylesheets when time permits-->
    <xsl:output name="outputFormat" method="html" doctype-system="about:legacy-compat"/>
    <!-- List of static ids referenced in CSS files, which we're leaving unchanged for now. -->
    <xsl:variable name="staticIds"
        select="('layout', 'menu', 'banner', 'onecol', 'udm', 'container', 'accessibility', 'hdr2', 'hdr3', 'azindex', 'byMod')"/>
    <!-- Template for matching id attributes. -->
    <!--    <xsl:template match="@id">
        <xsl:choose>
            <xsl:when test=". = $staticIds">
                <xsl:copy-of select="."/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:attribute name="id" select="concat('tei_', .)"/>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>-->
    <!-- Template for matching local links. -->
    <!-- <xsl:template match="@href[matches(., '.*#.+') and not(contains(., '://'))]">
        <xsl:choose>
            <xsl:when test=". = $staticIds">
                <xsl:copy-of select="."/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:attribute name="href" select="replace(., '#', '#tei_')"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>-->
    
   <!-- <xsl:template match="div[@class='plusminus']">
        <xsl:variable name="hdng">
            <xsl:value-of select="translate(ancestor::div[matches(@class,'tocTree')][1]/div[matches(@class,'toc-heading')]
                /a/@title, ' ', '')"/>
        </xsl:variable>
        <div class='plusminus' id='menu-{$hdng}'>
            <xsl:apply-templates></xsl:apply-templates>
        </div>
    </xsl:template>-->
    
    <xsl:template match="@href[matches(., '.*#.+') and not(contains(., '://'))]">
        <xsl:choose>
            <!--<xsl:when test=". = $staticIds">
                <xsl:copy-of select="."/>
            </xsl:when>-->
            <xsl:when test="matches(., '^#specification$')">
                <xsl:attribute name="href"
                    select="replace(., '#specification', 'spec.html#specification')"/>
            </xsl:when>
            <xsl:when test="not(matches(., '^#specification$')) and matches(., '^#[^\.]+$')">
                <xsl:attribute name="href" select="replace(., '#', 'TEILex0.html#')"/>
            </xsl:when>
            <xsl:when test="matches(., '^#TEI')">
                <xsl:attribute name="href" select="replace(., '#TEI', 'spec.html#TEI')"/>
            </xsl:when>
            <xsl:when
                test="matches(., '^#index.xml-body') and ancestor::div[@id != 'specification'][@class = 'teidiv0']">
                <xsl:attribute name="href" select="replace(., '#', 'TEILex0.html#')"/>
            </xsl:when>
            <xsl:when
                test="matches(., '^#index.xml-body') and ancestor::div[@id = 'specification'][@class = 'teidiv0']">
                <xsl:attribute name="href" select="replace(., '#', 'spec.html#')"/>
            </xsl:when>
            <!--menu-->
            <xsl:when
                test="matches(., '^#index.xml-body') and ancestor::div[matches(@class, '^tocTree')][child::div[matches(@class, 'toc-heading')][child::a[matches(@href, 'specification')]]]">
                <xsl:attribute name="href" select="replace(., '#', 'spec.html#')"/>
            </xsl:when>
            <xsl:when
                test="matches(., '^#index.xml-body') and ancestor::div[matches(@class, '^tocTree')][child::div[matches(@class, 'toc-heading')][child::a[not(matches(@href, 'specification'))]]]">
                <xsl:attribute name="href" select="replace(., '#', 'TEILex0.html#')"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="div[@id = 'specification']">
        <xsl:result-document href="spec.html">
            <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
                <xsl:copy-of select="/html/head"/>
                <body>
                    <div id="layout" class="custom-layout language-xml">
                        <xsl:apply-templates
                            select="/html/body/div[@id = 'layout']/a[@id = 'menuLink']"/>
                        <xsl:apply-templates
                            select="/html/body/div[@id = 'layout']/div[@id = 'menu']"/>
                        <div id="main">
                            <div class="header">
                                <h1 lang="en" class="maintitle">TEI Lex-0</h1>
                                <h2 lang="en" class="maintitle"> — A baseline encoding for
                                    lexicographic data</h2>
                            </div>
                            <div class="content">
                                <div id="col2">
                                    <div class="teidiv0" id="specification">
                                        <xsl:apply-templates/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <xsl:copy-of select="/html/body/script"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    <!-- Identity transform. -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
