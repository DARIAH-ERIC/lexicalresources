<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:teix="http://www.tei-c.org/ns/Examples"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0"
    exclude-result-prefixes="tei teix">
    
   <xsl:template match="tei:head[parent::tei:figure]">
       <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
          <xsl:if test="parent::tei:figure[@type='gallery']">
              <xsl:attribute name="class">
                  <xsl:value-of select="'caption pure-u-1-1'"/>
              </xsl:attribute>
          </xsl:if>
           <xsl:if test="parent::tei:figure[not(@type='gallery')]">
               <xsl:attribute name="class">
                   <xsl:value-of select="'caption'"/>
               </xsl:attribute>
           </xsl:if>
           <xsl:text>Figure </xsl:text>
           <xsl:number count="tei:head[parent::tei:figure]" level="any"/>
           <xsl:text>: </xsl:text>
           <xsl:apply-templates></xsl:apply-templates>
       </xsl:element>
   </xsl:template>
    
   
    <xsl:template match="tei:figure">
        <xsl:choose>
            <xsl:when test="@type='gallery'">
                <div class="pure-g gallery" xmlns="http://www.w3.org/1999/xhtml">
                    <xsl:if test="@xml:id">
                        <xsl:attribute name="id">
                            <xsl:value-of select="@xml:id"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates></xsl:apply-templates>              
                </div>
            </xsl:when>
            <xsl:when test="@type='thumbnail'">
                <div class="thumbnail" xmlns="http://www.w3.org/1999/xhtml">
                    <xsl:if test="@xml:id">
                        <xsl:attribute name="id">
                            <xsl:value-of select="@xml:id"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:apply-templates></xsl:apply-templates>              
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div class="figure" xmlns="http://www.w3.org/1999/xhtml">
                    <xsl:if test="@xml:id">
                        <xsl:attribute name="id">
                            <xsl:value-of select="@xml:id"/>
                        </xsl:attribute>
                    </xsl:if>
                <xsl:apply-templates></xsl:apply-templates>
                </div>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="tei:graphic[parent::tei:figure[@type='gallery']]">
        <div xmlns="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="class">
                <xsl:value-of select="concat(@rend, ' imgwrapper pure-img-responsive lazyload')"/>
            </xsl:attribute>
            <img class="pure-img-responsive lazyload" xmlns="http://www.w3.org/1999/xhtml">
                <xsl:attribute name="data-src">
                    <xsl:value-of select="@url"/>
                </xsl:attribute>
                <xsl:if test="@height">
                    <xsl:attribute name="style">
                        <xsl:value-of select="concat('height: ', @height, ' !important;')"/>
                    </xsl:attribute>
                </xsl:if>
            </img>
        </div>
    </xsl:template>
    
    <xsl:template match="tei:graphic[parent::tei:figure[not(@type='gallery')]]">  
            <img class="pure-img-responsive lazyload" xmlns="http://www.w3.org/1999/xhtml">
                <xsl:attribute name="data-src">
                    <xsl:value-of select="@url"/>
                </xsl:attribute>
                <xsl:if test="@height">
                    <xsl:attribute name="style">
                        <xsl:value-of select="concat('height: ', @height, ' !important;')"/>
                    </xsl:attribute>
                </xsl:if>
            </img>
    </xsl:template>
    
   
</xsl:stylesheet>