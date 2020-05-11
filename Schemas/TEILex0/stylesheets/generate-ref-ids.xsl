<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:teix="http://www.tei-c.org/ns/Examples" xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0" exclude-result-prefixes="tei teix">
   
   <xsl:template match="tei:ref[@type='cit'][not(@xml:id)]">
      <xsl:copy>
          <xsl:attribute name="xml:id">
              <xsl:value-of select="generate-id()"/>
          </xsl:attribute>
          <xsl:apply-templates select="@*|node()" />
      </xsl:copy>
      
   </xsl:template>
    
  <!--  temporary hack for base uri fix with xinclude and xproc-->
    <xsl:template match="@xml:base"></xsl:template>
    <xsl:template match="@xml:lang">
        <xsl:if test="string-length(.)>0">
            <xsl:copy/>
        </xsl:if>
    </xsl:template>
   
   <xsl:template match="node() | @*">
       <xsl:copy>
           <xsl:apply-templates select="node() | @*"/>
       </xsl:copy>
   </xsl:template>
    
    
</xsl:stylesheet>