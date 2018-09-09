<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"  xpath-default-namespace="http://www.tei-c.org/ns/1.0"
  exclude-result-prefixes="xs"
    version="2.0">
    
 <!--   all this styling is really superflous for our purposes-->
    <xsl:template match="@rend[starts-with(., 'underline')]"></xsl:template>
    
    <xsl:template match="@rend[starts-with(., 'color')]"></xsl:template>
    
    <xsl:template match="@rend[starts-with(., 'bold')]"></xsl:template>
    
    <xsl:template match="@rend[starts-with(., 'italic')]"></xsl:template>
    
    <xsl:template match="@rend[starts-with(., 'background')]"></xsl:template>
    
   <!-- merge consecutive hi elements to increase legibility of the xml-->
    <xsl:template match="hi[preceding-sibling::*[1][self::hi]]">
 <xsl:apply-templates></xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="hi[following-sibling::*[1][self::hi]][not(preceding-sibling::*[1][self::hi])]">
      <xsl:apply-templates></xsl:apply-templates>
    </xsl:template>
    
<!--    we don't care about the dates  when comments were posted to the google doc-->
    <xsl:template match="note/date"></xsl:template>
    
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>