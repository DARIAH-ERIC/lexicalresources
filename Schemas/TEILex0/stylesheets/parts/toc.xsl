<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:teix="http://www.tei-c.org/ns/Examples" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0"
    exclude-result-prefixes="tei teix">
    
    <xsl:function name="tei:tocRevealClass">
        <xsl:param name="tocLevel" as="xs:integer"></xsl:param>
        <xsl:choose>
            <xsl:when test="$tocLevel eq 0 ">
                <xsl:value-of select="'pure-u-2-24'"/>
            </xsl:when>
            <xsl:when test="$tocLevel eq 1 ">
                <xsl:value-of select="'pure-u-2-24'"/>
            </xsl:when>
            <xsl:when test="$tocLevel eq 2 ">
                <xsl:value-of select="''"/>
            </xsl:when>
        </xsl:choose>
    </xsl:function>
    
    <xsl:function name="tei:calcTocIndentClass">
        <xsl:param name="tocLevel" as="xs:integer"></xsl:param>
        <xsl:choose>
            <xsl:when test="$tocLevel eq 0 ">
                <xsl:value-of select="'pure-u-1-24'"/>
            </xsl:when>
            <xsl:when test="$tocLevel eq 1 ">
                <xsl:value-of select="'pure-u-3-24'"/>
            </xsl:when>
            <xsl:when test="$tocLevel eq 2 ">
                <xsl:value-of select="'pure-u-6-24'"/>
            </xsl:when>
        </xsl:choose>
    </xsl:function>

    
    <xsl:function name="tei:calcHeadingNumberClass">
        <xsl:param name="tocLevel" as="xs:integer"></xsl:param>
        <xsl:choose>
            <xsl:when test="$tocLevel eq 0 ">
                <xsl:value-of select="'pure-u-3-24'"/>
            </xsl:when>
            <xsl:when test="$tocLevel eq 1 ">
                <xsl:value-of select="'pure-u-4-24'"/>
            </xsl:when>
            <xsl:when test="$tocLevel eq 2 ">
                <xsl:value-of select="'pure-u-5-24'"/>
            </xsl:when>
        </xsl:choose>
    </xsl:function>
    
    <xsl:function name="tei:calcHeadingClass">
        <xsl:param name="tocLevel" as="xs:integer"></xsl:param>
        <xsl:choose>
            <xsl:when test="$tocLevel eq 0 ">
                <xsl:value-of select="'pure-u-18-24'"/>
            </xsl:when>
            <xsl:when test="$tocLevel eq 1 ">
                <xsl:value-of select="'pure-u-15-24'"/>
            </xsl:when>
            <xsl:when test="$tocLevel eq 2 ">
                <xsl:value-of select="'pure-u-13-24'"/>
            </xsl:when>
        </xsl:choose>
    </xsl:function>
    
    <xsl:template name="partTOC">
        <xsl:param name="part"/>
        <xsl:param name="force"/>
        <xsl:if test="tei:div | tei:div1 | tei:div2 | tei:div3 | tei:div4 | tei:div5 | tei:div6">
            <div class="toc{$force} toc_{$part}" xmlns="http://www.w3.org/1999/xhtml">
                <xsl:apply-templates mode="maketoc"
                    select="tei:div | tei:div1 | tei:div2 | tei:div3 | tei:div4 | tei:div5 | tei:div6">
                    <xsl:with-param name="forcedepth" select="$force"/>
                </xsl:apply-templates>
            </div>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="continuedToc">
        <xsl:if test="div">
            <div class="continuedtoc pure-u-24-24" xmlns="http://www.w3.org/1999/xhtml">
                <xsl:apply-templates mode="maketoc" select="div"/>
            </div>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="oddTocEntry">
        <xsl:variable name="linkname"
            select="concat(tei:createSpecPrefix(.), tei:createSpecName(.))"/>
        
        <xsl:variable name="loc">
            <xsl:choose>
                <xsl:when test="number($splitLevel) = -1 or $STDOUT = 'true'">
                    <xsl:text>#</xsl:text>
                    <xsl:value-of select="@ident"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>ref-</xsl:text>
                    <xsl:value-of select="$linkname"/>
                    <xsl:value-of select="$outputSuffix"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <div class="oddTocEntry" xmlns="http://www.w3.org/1999/xhtml">
            <a href="{$loc}" class="pure-menu-link">
                <xsl:value-of select="$linkname"/>
            </a>
        </div>
    </xsl:template>
    
    
    
    <xsl:template match="div" mode="maketoc">
        <xsl:param name="forcedepth"/>
        <xsl:variable name="myName">
            <xsl:value-of select="local-name(.)"/>
        </xsl:variable>
        <xsl:if test="head or $autoHead = 'true'">
            <xsl:variable name="Depth">
                <xsl:choose>
                    <xsl:when test="not($forcedepth = '')">
                        <xsl:value-of select="$forcedepth"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$tocDepth"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="thislevel">
                <xsl:value-of select="count(ancestor::div)"/>
            </xsl:variable>
            <xsl:variable name="pointer">
                <xsl:apply-templates mode="generateLink" select="."/>
            </xsl:variable>
          
            <div xmlns="http://www.w3.org/1999/xhtml">
                <xsl:choose>
                    <xsl:when test="not(ancestor::div) and child::div">
                        <xsl:attribute name="class">
                            <xsl:text>tocTree pure-g</xsl:text>
                        </xsl:attribute>
                        <xsl:variable name="tocLevel">
                            <xsl:value-of select="number(count(ancestor::tei:div))"/>
                        </xsl:variable>
                        <div class="{tei:calcTocIndentClass($tocLevel)}" xmlns="http://www.w3.org/1999/xhtml"></div>
                       <!-- <div class="{$tocRevealClass} toc-showhide">
                           <div class="plusminus"></div>   
                        </div>-->
                        
                    </xsl:when>
                    <xsl:when test="child::div">
                        <xsl:attribute name="class">
                            <xsl:text>tocTree pure-g</xsl:text>
                        </xsl:attribute>
                        <xsl:variable name="tocLevel">
                            <xsl:value-of select="number(count(ancestor::tei:div))"/>
                        </xsl:variable>
                        <div class="{tei:calcTocIndentClass($tocLevel)}" xmlns="http://www.w3.org/1999/xhtml"></div>
                      
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="class">
                            <xsl:text>toc pure-g</xsl:text>
                        </xsl:attribute>
                        <xsl:variable name="tocLevel">
                            <xsl:value-of select="number(count(ancestor::tei:div))"/>
                        </xsl:variable>
                        <div class="{tei:calcTocIndentClass($tocLevel)}" xmlns="http://www.w3.org/1999/xhtml"></div>
                       <!-- <div class="{$tocRevealClass} toc-showhide">
                            <xsl:text>&#160;&#160;</xsl:text>
                        </div>-->
                    </xsl:otherwise>
                </xsl:choose>
                
                <xsl:call-template name="header">
                    <xsl:with-param name="toc" select="$pointer"/>
                    <xsl:with-param name="minimal">false</xsl:with-param>
                    <xsl:with-param name="display">plain</xsl:with-param>
                </xsl:call-template>
         
                
                <xsl:if test="$thislevel &lt; $Depth">
                    <xsl:call-template name="continuedToc"/>
                </xsl:if>
            </div>
        </xsl:if>
    </xsl:template>
    
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>[common] Making a heading for something <param name="minimal">whether to display
            headings</param>
            <param name="toc">whether this is making a TOC entry</param>
            <param name="display">detail of display (full, simple, plain), ie whether markup is
                followed</param>
        </desc>
    </doc>
    <xsl:template name="header">
        <xsl:param name="minimal">false</xsl:param>
        <xsl:param name="toc"/>
        <xsl:param name="display">full</xsl:param>
        <xsl:variable name="depth">
            <xsl:apply-templates mode="depth" select="."/>
        </xsl:variable>
        <xsl:variable name="headingNumber">
            <xsl:call-template name="formatHeadingNumber">
                <xsl:with-param name="toc">
                    <xsl:value-of select="$toc"/>
                </xsl:with-param>
                <xsl:with-param name="text">
                    <xsl:choose>
                        <xsl:when test="local-name(.) = 'TEI'">
                            <xsl:if test="@n">
                                <xsl:value-of select="@n"/>
                            </xsl:if>
                        </xsl:when>
                        <xsl:when test="$depth &gt; $numberHeadingsDepth"> </xsl:when>
                        <xsl:when test="self::tei:text">
                            <xsl:number/>
                            <xsl:call-template name="headingNumberSuffix"/>
                        </xsl:when>
                        <xsl:when test="ancestor::tei:back">
                            <xsl:if test="not($numberBackHeadings = '')">
                                <xsl:sequence select="tei:i18n('appendixWords')"/>
                                <xsl:text> </xsl:text>
                                <xsl:call-template name="numberBackDiv"/>
                                <xsl:if test="$minimal = 'false'">
                                    <xsl:value-of select="$numberSpacer"/>
                                </xsl:if>
                            </xsl:if>
                        </xsl:when>
                        <xsl:when test="ancestor::tei:front">
                            <xsl:if test="not($numberFrontHeadings = '')">
                                <xsl:call-template name="numberFrontDiv">
                                    <xsl:with-param name="minimal">
                                        <xsl:value-of select="$minimal"/>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </xsl:if>
                        </xsl:when>
                        <xsl:when test="$numberHeadings = 'true'">
                            <xsl:choose>
                                <xsl:when test="$prenumberedHeadings = 'true'">
                                    <xsl:value-of select="@n"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="numberBodyDiv"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:if test="$minimal = 'false'">
                                <xsl:call-template name="headingNumberSuffix"/>
                            </xsl:if>
                        </xsl:when>
                    </xsl:choose>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="tocLevel">
            <xsl:value-of select="count(ancestor::tei:div)"/>
        </xsl:variable>
        <xsl:if test="$toc">
            <div class="{tei:calcHeadingNumberClass($tocLevel)} toc-heading-number" xmlns="http://www.w3.org/1999/xhtml">
                <xsl:copy-of select="$headingNumber"/>
            </div>
        </xsl:if>
        <xsl:if test="not($toc)">
            <xsl:copy-of select="$headingNumber"/>
            <xsl:apply-templates mode="plain" select="tei:head"/>
        </xsl:if>
     
        <xsl:if test="$minimal = 'false' and $toc">
            <div class="{tei:calcHeadingClass($tocLevel)} toc-heading" xmlns="http://www.w3.org/1999/xhtml">
                <xsl:choose>
                    <xsl:when test="local-name(.) = 'TEI'">
                        <xsl:apply-templates
                            select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[1]"/>
                    </xsl:when>
                    <xsl:when test="not($toc = '')">
                        <xsl:call-template name="makeInternalLink">
                            <xsl:with-param name="dest">
                                <xsl:value-of select="$toc"/>
                            </xsl:with-param>
                            <xsl:with-param name="class">
                                <xsl:value-of select="$class_toc"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="($class_toc, $depth)" separator="_"/>
                            </xsl:with-param>
                            <xsl:with-param name="body">
                                <xsl:choose>
                                    <xsl:when test="self::tei:text">
                                        <xsl:value-of
                                            select="
                                            if (@n) then
                                            @n
                                            else
                                            concat('[', position(), ']')"
                                        />
                                    </xsl:when>
                                    <xsl:when test="not(tei:head) and tei:front/tei:head">
                                        <xsl:apply-templates mode="plain" select="tei:front/tei:head"/>
                                    </xsl:when>
                                    <xsl:when test="not(tei:head) and tei:body/tei:head">
                                        <xsl:apply-templates mode="plain" select="tei:body/tei:head"/>
                                    </xsl:when>
                                    <xsl:when
                                        test="not(tei:head) and tei:front//tei:titlePart/tei:title">
                                        <xsl:apply-templates mode="plain"
                                            select="tei:front//tei:titlePart/tei:title"/>
                                    </xsl:when>
                                    <xsl:when
                                        test="tei:head and count(tei:head/*) = 1 and tei:head/tei:figure">
                                        <xsl:text>[</xsl:text>
                                        <xsl:sequence select="tei:i18n('figureWord')"/>
                                        <xsl:text>]</xsl:text>
                                    </xsl:when>
                                    <xsl:when
                                        test="
                                        tei:head[not(. = '')] and
                                        not(tei:head[count(*) = 1 and
                                        tei:figure])">
                                        <xsl:apply-templates mode="plain" select="tei:head"/>
                                    </xsl:when>
                                    <xsl:when test="@type = 'title_page'">Title page</xsl:when>
                                    <xsl:when test="@type = 'index'">Index</xsl:when>
                                    <xsl:when test="@type = 'section'">§</xsl:when>
                                    <xsl:when test="$autoHead = 'true'">
                                        <xsl:call-template name="autoMakeHead">
                                            <xsl:with-param name="display" select="$display"/>
                                        </xsl:call-template>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:number/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="tei:head and ($display = 'plain' or $display = 'simple')">
                        <xsl:for-each select="tei:head">
                            <xsl:apply-templates mode="plain"/>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when test="tei:head">
                        <xsl:apply-templates mode="makeheading" select="tei:head"/>
                    </xsl:when>          
                    <xsl:when test="tei:front/tei:head">
                        
                        <xsl:apply-templates mode="plain" select="tei:front/tei:head"/>
                        
                    </xsl:when>               
                    <xsl:when test="tei:body/tei:head">
                        <xsl:apply-templates mode="plain" select="tei:body/tei:head"/>
                    </xsl:when>
                    <xsl:when test="self::tei:index">
                        <xsl:value-of select="substring(tei:term, 1, 10)"/>
                        <xsl:text>…</xsl:text>
                    </xsl:when>
                    <xsl:when test="$autoHead = 'true'">
                        <xsl:call-template name="autoMakeHead">
                            <xsl:with-param name="display" select="$display"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="not(self::tei:div) and $headingNumber = ''">
                        <xsl:value-of select="(normalize-space(substring(., 1, 20)), '…')"/>
                    </xsl:when>
                </xsl:choose>
            
            </div>
            
            <xsl:if test="$toc">
                <div class="{tei:tocRevealClass($tocLevel)} toc-showhide" xmlns="http://www.w3.org/1999/xhtml">
                    <xsl:choose>
                        <xsl:when test="child::div and $toc">
                            <div class="plusminus"></div>
                        </xsl:when>
                        <xsl:otherwise>
                            
                        </xsl:otherwise>
                    </xsl:choose>
                </div>
            </xsl:if>
            
            
            
            
           
            
        </xsl:if>
        
    </xsl:template>
    
    
    
</xsl:stylesheet>