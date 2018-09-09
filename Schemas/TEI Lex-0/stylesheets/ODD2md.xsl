<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:html="http://www.w3.org/1999/xhtml"
    xmlns:my="xx"
    xmlns:eg="http://www.tei-c.org/ns/Examples"
    xpath-default-namespace="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs tei html eg"
    version="2.0">
    
    <xsl:output method="html" encoding="utf-8" indent="yes"  />
   <!-- use-character-maps="opangle clangle"-->
<!--    <xsl:character-map name="opangle">
        <xsl:output-character character="&lt;" string="&amp;lt;" />
    </xsl:character-map>
    <xsl:character-map name="clangle">
        <xsl:output-character character="&gt;" string="&amp;gt;" />
    </xsl:character-map>-->
    <xsl:strip-space elements="*"/>
    
    <xsl:variable name="examples" select="doc('TEILex0-ODD.xml')//eg:egXML">
    </xsl:variable>
    
    <xsl:function name="my:striporama">
        <xsl:param name="stuff"></xsl:param>
        <xsl:value-of select="replace($stuff, '\s+', ' ')"/>
    </xsl:function>
    
    <xsl:function name="my:anchorify">
        <xsl:param name="title"></xsl:param>
        <!--<xsl:value-of select="replace(lower-case(replace(my:striporama($title), '[\.\s]', '-')), '\W', '')"/>-->
        <xsl:value-of select="replace(replace(my:striporama(lower-case($title)), '[\.,;:\(\)/]', ''), '\s', '-')"/>
    </xsl:function>
    
    <xsl:function name="my:countLevel">
        <xsl:param name="headingNumber"></xsl:param>
        
    </xsl:function>
    
    <xsl:template match="//comment()"/>

    <xsl:template match="/html">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="body">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="div[starts-with(@class,'stdheader')]"></xsl:template>
    
    <xsl:template match="/html/head">
        <xsl:text># </xsl:text>
        <xsl:value-of select="./title"/>
        <xsl:text>&#xA;&#xA;</xsl:text>
    </xsl:template>
    
    <!-- table of contents-->
    
    <xsl:template match="//body/div[@class='tei_toc']">
        <xsl:value-of select="h2"/>
        <xsl:text>&#xA;&#xA;</xsl:text>
        <xsl:call-template name="toc_body">
            <xsl:with-param name="topul" select="ul"></xsl:with-param> 
        </xsl:call-template>
    </xsl:template>
    
    
    <xsl:template name="toc_body">
        <xsl:param name="topul"></xsl:param>
     
        <xsl:for-each select="$topul/li">
            <xsl:variable name="level">
                <xsl:value-of select="substring-after(a/@class, '_')"/>
            </xsl:variable>
            <xsl:choose>
                <xsl:when test="$level = 0">
                    <xsl:text>* </xsl:text>
                </xsl:when>
                <xsl:when test="$level = 1">
                    <xsl:text>  * </xsl:text>
                </xsl:when>
                <xsl:when test="$level = 2">
                    <xsl:text>    * </xsl:text>
                </xsl:when>
                <xsl:when test="$level = 3">
                    <xsl:text>      * </xsl:text>
                </xsl:when>
                <xsl:when test="$level = 4">
                    <xsl:text>        * </xsl:text>
                </xsl:when>
            </xsl:choose>
            
            
            
            <xsl:text>[</xsl:text>
            <xsl:value-of select="span"/>
            <xsl:value-of select="my:striporama(a)"/>
            <xsl:text>](#</xsl:text>
            <xsl:value-of select="my:anchorify(replace(span, '\D', ''))"/>
            <xsl:text>-</xsl:text>
            <xsl:value-of select="my:anchorify(a)"/>
            <xsl:text>)</xsl:text>
            <xsl:text>&#xA;</xsl:text>
            <xsl:call-template name="toc_body">
                <xsl:with-param name="topul" select="ul"></xsl:with-param>
   
            </xsl:call-template>
        </xsl:for-each>
   
        
    </xsl:template>
    
    <xsl:template match="div[@class='teidiv0' or @class='teidiv1' or @class='teidiv2']">
        <xsl:apply-templates></xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="div[@class='teidiv0']/h2">
        <xsl:text>## </xsl:text>
        <xsl:value-of select="my:striporama(.)"/>
        <xsl:text>&#xA;</xsl:text>
        
    </xsl:template>
    
    <xsl:template match="div[@class='teidiv1']/h3">
        <xsl:text>### </xsl:text>
        <xsl:value-of select="my:striporama(.)"/>
        <xsl:text>&#xA;</xsl:text>

    </xsl:template>
    <xsl:template match="div[@class='teidiv2']/h4">
        <xsl:text>#### </xsl:text>
        <xsl:value-of select="my:striporama(.)"/>
        <xsl:text>&#xA;</xsl:text>
        
    </xsl:template>
    
    
    <xsl:template match="p">  
            <xsl:apply-templates></xsl:apply-templates>
        <xsl:text>&#xA;&#xA;</xsl:text>
    </xsl:template>
    
    <xsl:template match="div[@class='pre egXML_valid']">
        <xsl:variable name="htmlid" select="@id"/>
        <xsl:choose>
          
            <xsl:when test="starts-with($htmlid, 'index')">
                <xsl:copy-of select="."></xsl:copy-of>
                <xsl:text>NOTE: please add a unique xml:id to the above example in the ODD file. We need it for the proper transformation to Markdown.</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>&#xA;```xml</xsl:text>
                <xsl:copy-of select="$examples[@xml:id=$htmlid]/child::*" copy-namespaces="no"></xsl:copy-of>
                <xsl:text>&#xA;```&#xA;&#xA;</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="span[@class='element']">
        <span class='element' xmlns='http://www.w3.org/1999/xhtml' style="font-weight: bold;color: black;"> 
        </span>
    </xsl:template>
    
    <xsl:template match="span[@class='attribute']">
        <span class='attribute' xmlns='http://www.w3.org/1999/xhtml' style="color: #222288;"> 
        </span>
    </xsl:template>
    
  <xsl:template match="text()">
      <xsl:value-of select="my:striporama(.)"/>
  </xsl:template>
    
    <!--do not show schema until fixed, it chokes up the markdown processor -->
    
    <xsl:template match="div[@class='specification']">
       <xsl:copy-of select="."></xsl:copy-of>
        <!--<xsl:text> SPECIFICATION missing -\- Markdown issues to be fixed </xsl:text>-->
    </xsl:template>
    
    
    <xsl:template match="@*|node() except text()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>