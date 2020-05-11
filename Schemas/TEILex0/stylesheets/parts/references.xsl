<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:teix="http://www.tei-c.org/ns/Examples"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0"
    exclude-result-prefixes="tei teix">



    <xsl:template match="tei:analytic" mode="teilex0">
        <xsl:variable name="howManyAuthors" select="count(tei:author)"/>
        <xsl:choose>
            <xsl:when test="$howManyAuthors eq 1">
                <xsl:value-of select="tei:author/tei:persName/tei:surname"/>
                <xsl:text>, </xsl:text>
                <xsl:value-of select="tei:author/tei:persName/tei:forename"/>
                <xsl:text>. </xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="author">
                    <xsl:choose>
                        <xsl:when test="position() eq 1">
                            <xsl:value-of select="tei:persName/tei:surname"/>
                            <xsl:text>, </xsl:text>
                            <xsl:value-of select="tei:persName/tei:forename"/>
                            <xsl:if test="$howManyAuthors > 2">
                                <xsl:text>, </xsl:text>
                            </xsl:if>
                        </xsl:when>
                        <xsl:when test="position() eq last()">
                            <xsl:text> and </xsl:text>
                            <xsl:value-of select="tei:persName/tei:forename"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="tei:persName/tei:surname"/>
                            <xsl:text>. </xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="tei:persName/tei:forename"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="tei:persName/tei:surname"/>
                            <xsl:if test="position() != ($howManyAuthors - 1)">
                                <xsl:text>, </xsl:text>
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>

        <xsl:value-of select="following-sibling::*[1][self::tei:monogr]/tei:imprint/tei:date"/>
        <xsl:text>. </xsl:text>
        <xsl:text>"</xsl:text>
        <xsl:choose>
            <xsl:when test="tei:title[@ref]">
                <xsl:element name="a" xmlns="http://www.w3.org/1999/xhtml">
                    <xsl:attribute name="href">
                        <xsl:value-of select="tei:title/@ref"/>
                    </xsl:attribute>
                    <xsl:value-of select="tei:title"/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="tei:title"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text>." </xsl:text>
        <xsl:apply-templates select="following-sibling::*[1][self::tei:monogr]"
            mode="teilex0-journal"/>
        <xsl:if test="tei:idno">
            <xsl:text> </xsl:text>
            <xsl:if test="tei:idno/@type">
                <xsl:value-of select="tei:idno/@type"/>
                <xsl:text>: </xsl:text>
            </xsl:if>
            <xsl:apply-templates select="tei:idno"></xsl:apply-templates>
            <xsl:text>.</xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="tei:monogr" mode="teilex0-journal">
        <i>
            <xsl:value-of select="tei:title"/>
        </i>

        <xsl:choose> 
            <xsl:when test="tei:imprint/tei:biblScope[@unit = 'volume'] and tei:imprint/tei:biblScope[@unit = 'page']">
                <xsl:text> </xsl:text>
                <xsl:value-of select="tei:imprint/tei:biblScope[@unit = 'volume']"/>
                <xsl:text>: </xsl:text>
                <xsl:value-of select="tei:imprint/tei:biblScope[@unit = 'page']"/>
                <xsl:text>. </xsl:text>
            </xsl:when>
            <xsl:when test="tei:imprint/tei:biblScope[@unit = 'page']">
                <xsl:text>, </xsl:text>
                <xsl:value-of select="tei:imprint/tei:biblScope[@unit = 'page']"/>
                <xsl:text>. </xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>.</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
        

    </xsl:template>

    <xsl:template match="tei:monogr"/>
    <xsl:template match="tei:monogr" mode="teilex0-monogr">
        <!--this is for monographs, like dicts, without analytic-->
        <xsl:if test="tei:author/tei:orgName">
            <xsl:value-of select="tei:author/tei:orgName"/>
        </xsl:if>
        <xsl:if test="tei:author/tei:persName">
           <!-- this needs to be extended to include multiple authors
            TODO create a separate template for puncutation and "ands" when listing authors-->
            <xsl:value-of select="tei:author/tei:persName/tei:surname"/>
            <xsl:text>, </xsl:text>
            <xsl:value-of select="tei:author/tei:persName/tei:forename"/>
        </xsl:if>
        <xsl:text>. </xsl:text>
        <xsl:value-of select="tei:imprint/tei:date"/>
        <xsl:text>. </xsl:text>
        <i>
            <xsl:choose> 
            <xsl:when test="tei:title[@ref]">
                <xsl:element name="a" xmlns="http://www.w3.org/1999/xhtml">
                    <xsl:attribute name="href">
                        <xsl:value-of select="tei:title/@ref"/>
                    </xsl:attribute>
                    <xsl:value-of select="tei:title"/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="tei:title"/>
            </xsl:otherwise>
            </xsl:choose>
            <xsl:text>. </xsl:text>
        </i>
        <xsl:if test="tei:imprint/tei:publisher">
            <xsl:value-of select="tei:imprint/tei:publisher"/>
            <xsl:choose>
                <xsl:when test="tei:imprint/tei:pubPlace">
                    <xsl:text>: </xsl:text>
                    <xsl:value-of select="tei:imprint/tei:pubPlace"/>
                    <xsl:text>.</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>.</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
        <xsl:if test="tei:idno">
            <xsl:text> </xsl:text>
            <xsl:if test="tei:idno/@type">
                <xsl:value-of select="tei:idno/@type"/>
                <xsl:text>: </xsl:text>
            </xsl:if>
            <xsl:apply-templates select="tei:idno"></xsl:apply-templates>
            <xsl:text>.</xsl:text>
        </xsl:if>
    </xsl:template>

    <!--formatting ref-->
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>Process element listBibl</desc>
    </doc>
    <xsl:template match="tei:listBibl">
        <xsl:if test="tei:head">
            <xsl:element name="{if (not(tei:isInline(.))) then 'div' else 'span' }">
                <xsl:attribute name="class">listhead</xsl:attribute>
                <xsl:apply-templates select="tei:head"/>
            </xsl:element>
        </xsl:if>
        <xsl:choose>
            <xsl:when test="tei:biblStruct and $biblioStyle = 'mla'">
                <div type="listBibl" xmlns="http://www.w3.org/1999/xhtml">
                    <xsl:for-each select="tei:biblStruct">
                        <p class="hang" xmlns="http://www.w3.org/1999/xhtml">
                            <xsl:call-template name="makeAnchor"/>
                            <xsl:apply-templates select="tei:analytic" mode="mla"/>
                            <xsl:apply-templates select="tei:monogr" mode="mla"/>
                            <xsl:apply-templates select="tei:relatedItem" mode="mla"/>
                            <xsl:choose>
                                <xsl:when test="tei:note">
                                    <xsl:apply-templates select="tei:note"/>
                                </xsl:when>
                                <xsl:when
                                    test="*//tei:ref/@target and not(contains(*//tei:ref/@target, '#'))">
                                    <xsl:text>Web.&#10;</xsl:text>
                                    <xsl:if test="*//tei:imprint/tei:date/@type = 'access'">
                                        <xsl:value-of
                                            select="*//tei:imprint/tei:date[@type = 'access']"/>
                                        <xsl:text>.</xsl:text>
                                    </xsl:if>
                                </xsl:when>
                                <xsl:when
                                    test="tei:analytic/tei:title[@level = 'u'] or tei:monogr/tei:title[@level = 'u']"/>
                                <xsl:otherwise>Print.&#10;</xsl:otherwise>
                            </xsl:choose>
                            <xsl:if test="tei:monogr/tei:imprint/tei:extent"><xsl:value-of
                                    select="tei:monogr/tei:imprint/tei:extent"/>. </xsl:if>
                            <xsl:if test="tei:series/tei:title[@level = 's']">
                                <xsl:apply-templates select="tei:series/tei:title[@level = 's']"/>
                                <xsl:text>. </xsl:text>
                            </xsl:if>
                        </p>
                    </xsl:for-each>
                </div>
            </xsl:when>
            <xsl:when test="tei:biblStruct and not(tei:bibl)">
                <ol class="listBibl {$biblioStyle}">
                    <xsl:for-each select="tei:biblStruct">
                        <xsl:sort
                            select="
                                lower-case(normalize-space((@sortKey, tei:*[1]/tei:author/tei:persName/tei:surname
                                , tei:*[1]/tei:author/tei:surname
                                , tei:*[1]/tei:author/tei:orgName
                                , tei:*[1]/tei:author/tei:name
                                , tei:*[1]/tei:author
                                , tei:*[1]/tei:editor/tei:surname
                                , tei:*[1]/tei:editor/tei:name
                                , tei:*[1]/tei:editor
                                , tei:*[1]/tei:title[1])[1]))"/>
                        <xsl:sort
                            select="
                                lower-case(normalize-space((
                                tei:*[1]/tei:author/tei:persName/tei:forename
                                , tei:*[1]/tei:editor/tei:persName/tei:forename
                                , '')[1]))"/>
                        <xsl:sort select="tei:monogr/tei:imprint/tei:date"/>
                        <li>
                            <xsl:call-template name="makeAnchor"/>
                            <!--         <xsl:apply-templates select="tei:analytic" mode="mla"/>
                            <xsl:apply-templates select="tei:monogr" mode="mla"/>-->
                            
                            <xsl:apply-templates select="."></xsl:apply-templates>
                        </li>
                    </xsl:for-each>
                </ol>
            </xsl:when>
            <xsl:otherwise>
                <ol class="listBibl">
                    <xsl:for-each select="*[not(self::tei:head)]">
                        <li>
                            <xsl:call-template name="makeAnchor">
                                <xsl:with-param name="name">
                                    <xsl:apply-templates mode="ident" select="."/>
                                </xsl:with-param>
                            </xsl:call-template>
                            <xsl:apply-templates select="."/>
                        </li>
                    </xsl:for-each>
                </ol>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="tei:biblStruct">

        <xsl:choose>
            <xsl:when test="tei:analytic">
                <xsl:apply-templates select="tei:analytic" mode="teilex0"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="tei:monogr" mode="teilex0-monogr"/>


            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>
    
    <xsl:template match="tei:idno[ lower-case( @type ) = 'arxiv']">
        <xsl:text> </xsl:text>
        <xsl:call-template name="makeExternalLink">
            <xsl:with-param name="ptr" select="false()"/>
            <xsl:with-param name="dest">
                <xsl:value-of select="concat( 'https://arxiv.org/abs/', normalize-space(.) )"/>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="tei:idno[ lower-case( @type ) = 'isbn']">
        <xsl:text> </xsl:text>
        <xsl:call-template name="makeExternalLink">
            <xsl:with-param name="ptr" select="false()"/>
            <xsl:with-param name="dest">
                <xsl:value-of select="concat( 'https://www.worldcat.org/search?q=bn%3A', normalize-space(.) )"/>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="tei:idno[ lower-case( @type ) = 'hal']">
        <xsl:text> </xsl:text>
        <xsl:call-template name="makeExternalLink">
            <xsl:with-param name="ptr" select="false()"/>
            <xsl:with-param name="dest">
                <xsl:value-of select="concat( 'https://hal.inria.fr/', normalize-space(.) )"/>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>



    <!--internal rink from text to ref-->

    <xsl:template name="makeInternalLink">
        <xsl:param name="target"/>
        <xsl:param name="ptr" as="xs:boolean" select="false()"/>
        <xsl:param name="dest"/>
        <xsl:param name="body"/>
        <xsl:param name="class">
           
            <xsl:text>link_</xsl:text>
            <xsl:value-of select="local-name(.)"/>
        </xsl:param>
        <xsl:variable name="W">
            <xsl:choose>
                <xsl:when test="$target">
                    <xsl:value-of select="$target"/>
                </xsl:when>
                <xsl:when test="contains($dest, '#')">
                    <xsl:value-of select="substring-after($dest, '#')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$dest"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:choose>
            <xsl:when test="$dest = ''">
                <xsl:choose>
                    <xsl:when test="not($body = '')">
                        <xsl:value-of select="$body"/>
                    </xsl:when>
                    <xsl:when test="$ptr">
                        <xsl:apply-templates mode="xref" select="id($W)">
                            <xsl:with-param name="minimal" select="$minimalCrossRef"/>
                        </xsl:apply-templates>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="eventualtarget">
                    <xsl:choose>
                        <xsl:when
                            test="starts-with($dest, '#') or contains($dest, $outputSuffix) or contains($dest, 'ID=')">
                            <xsl:value-of select="$dest"/>
                        </xsl:when>
                        <xsl:when test="id($W)"/>
                        <xsl:otherwise>
                            <xsl:apply-templates mode="generateLink" select="id($W)"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="linktext">
                    <xsl:choose>
                        <xsl:when test="not($body = '')">
                            <xsl:value-of select="$body"/>
                        </xsl:when>
                        <xsl:when test="$ptr and @type = 'footnote'">
                            <xsl:text>(</xsl:text>
                            <xsl:number level="any"/>
                            <xsl:text>)</xsl:text>
                        </xsl:when>
                        <xsl:when test="$ptr and id($W)">
                            <xsl:apply-templates mode="xref" select="id($W)">
                                <xsl:with-param name="minimal" select="$minimalCrossRef"/>
                            </xsl:apply-templates>
                        </xsl:when>
                        <xsl:when test="$ptr">
                            <xsl:value-of select="$dest"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="$eventualtarget = ''">
                        <xsl:copy-of select="$linktext"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:element name="{$linkElement}" namespace="{$linkElementNamespace}">
                            <xsl:if test="(self::tei:ptr or self::tei:ref) and @xml:id">
                                <xsl:attribute name="id" select="@xml:id"/>
                            </xsl:if>
                            <xsl:call-template name="makeRendition">
                                <xsl:with-param name="default" select="$class"/>
                            </xsl:call-template>
                            <xsl:if test="$outputTarget = 'odt'">
                                <xsl:attribute name="type" namespace="{$linkAttributeNamespace}"
                                    >simple</xsl:attribute>
                            </xsl:if>
                            <xsl:attribute name="{$linkAttribute}"
                                namespace="{$linkAttributeNamespace}" select="$eventualtarget"/>
                            <xsl:call-template name="htmlAttributes"/>
                            <xsl:for-each select="id($W)">
                                <xsl:attribute name="title" namespace="{$linkAttributeNamespace}">
                                    <xsl:choose>
                                        <xsl:when test="@n">
                                            <xsl:value-of select="@n"/>
                                        </xsl:when>
                                        <xsl:when
                                            test="starts-with(local-name(.), 'div') and tei:head">
                                            <xsl:value-of select="tei:sanitize(tei:head)"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="tei:sanitize(./string())"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                            </xsl:for-each>
                            <xsl:copy-of select="$linktext"/>
                        </xsl:element>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

  
</xsl:stylesheet>
