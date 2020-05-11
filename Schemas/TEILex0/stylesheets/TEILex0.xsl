<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:teix="http://www.tei-c.org/ns/Examples"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0"
    exclude-result-prefixes="tei teix">
    <!--<xsl:import href="https://www.tei-c.org/release/xml/tei/stylesheet/odds/odd2odd.xsl"/>-->
    <!--<xsl:import href="https://www.tei-c.org/release/xml/tei/stylesheet/odds/odd2lite.xsl"/>-->
    <xsl:import href="https://www.tei-c.org/release/xml/tei/stylesheet/html/html.xsl"/>

    <!--  <xsl:param name="logoFile">images/logo.png</xsl:param>
    <xsl:param name="cssFile">https://www.tei-c.org/release/xml/tei/stylesheet/tei.css</xsl:param>
    <xsl:param name="cssSecondaryFile">css/tei.lex0.web.css</xsl:param>
    <xsl:param name="pageLayout">Complex</xsl:param>
    <xsl:param name="outputMethod">html</xsl:param>
    <xsl:param name="parentWords">The Punch Project</xsl:param>
    <xsl:param name="institution">The University of Punch</xsl:param>
-->
    <xsl:param name="directory">.</xsl:param>
    <xsl:param name="outputDir"><xsl:value-of select="$directory"/>/OPS</xsl:param>
    <xsl:key name="EXAMPLES" match="teix:*[ancestor::teix:egXML]"
        use="concat(ancestor::tei:div[last()]/@xml:id, local-name())"/>
    <xsl:key name="HEADS" match="tei:head" use="concat(@xml:lang, @corresp)"/>
    <xsl:key name="BACKLINKS" match="teix:egXML[@corresp]" use="substring(@corresp, 2)"/>
    <xsl:key name="BACKLINKS" match="teix:egXML[@source]" use="substring(@source, 2)"/>
    <xsl:key name="BACKLINKS" match="tei:ref[@type = 'cit']" use="substring(@target, 2)"/>

    <xsl:template name="javascriptHook">
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.2.6/jquery.min.js" xmlns="http://www.w3.org/1999/xhtml">
            <xsl:comment>JQuery</xsl:comment>
        </script>
        <script type="text/javascript" src="js/teilex0.js" xmlns="http://www.w3.org/1999/xhtml">
          <xsl:comment>teilexjs</xsl:comment>
      </script>
        <script type="text/javascript" src="js/popupFootnotes.js" xmlns="http://www.w3.org/1999/xhtml">
        <xsl:comment>popupfootnotes</xsl:comment>
    </script>
        <!--<xsl:call-template name="jsForOdds"/>-->
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
        <div class="oddTocEntry">
            <a href="{$loc}">
                <xsl:value-of select="$linkname"/> sdsds </a>
        </div>
    </xsl:template>



    <xsl:template name="continuedToc">
        <xsl:if test="div">
            <ul class="continuedtoc">
                <xsl:apply-templates mode="maketoc" select="div"/>
            </ul>
        </xsl:if>
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
            <li>
                <xsl:choose>
                    <xsl:when test="$outputTarget = 'epub' or $outputTarget = 'epub3'"/>
                    <xsl:when test="not(ancestor::div) and child::div">
                        <xsl:attribute name="class">
                            <xsl:text>tocTree</xsl:text>
                        </xsl:attribute>
                        <span class="showhide">
                            <span class="tocShow">
                                <img alt="+" src="images/plus.gif"/>
                            </span>
                            <span class="tocHide">
                                <img alt="-" src="images/minus.gif"/>
                            </span>
                        </span>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="class">
                            <xsl:text>toc</xsl:text>
                        </xsl:attribute>
                        <span class="notshowhide">
                            <xsl:text>&#160;&#160;</xsl:text>
                        </span>
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
            </li>
        </xsl:if>
    </xsl:template>

    <!-- link from bibl back to egXML -->
    <xsl:template match="tei:listBibl/tei:biblStruct | tei:listBibl/tei:bibl">
        <xsl:apply-templates/>
        <xsl:variable name="id" select="@xml:id"/>
        <xsl:for-each select="key('BACKLINKS', @xml:id)">
            <!-- XML code examples within tei:exemplum -->
            <xsl:if test="self::teix:egXML and parent::tei:exemplum">
                <!-- The following xsl:choose switch is taken from the <xsl:template match="tei:exemplum" mode="doc"> template from common_tagdocs.xsl -->
                <!-- Those two switches should most probably stay in sync -->
                <xsl:choose>
                    <xsl:when test="count(ancestor::tei:exemplum) gt 1">
                        <xsl:call-template name="backLink"/>
                    </xsl:when>
                    <xsl:when test="parent::tei:exemplum[not(@xml:lang)]">
                        <xsl:call-template name="backLink"/>
                    </xsl:when>
                    <xsl:when test="parent::tei:exemplum[@xml:lang = 'und']">
                        <xsl:call-template name="backLink"/>
                    </xsl:when>
                    <xsl:when
                        test="parent::tei:exemplum[@xml:lang = 'mul'] and not($documentationLanguage = 'zh-TW')">
                        <!-- will need to generalize this if other langs come along like chinese -->
                        <xsl:call-template name="backLink"/>
                    </xsl:when>
                    <xsl:when test="parent::tei:exemplum[@xml:lang = $documentationLanguage]">
                        <xsl:call-template name="backLink"/>
                    </xsl:when>
                    <!--<xsl:when
            test="not(parent::tei:exemplum[@xml:lang = $documentationLanguage]) and (@xml:lang = 'en' or @xml:lang = 'und' or @xml:lang = 'mul')">
            <xsl:call-template name="backLink"/>
          </xsl:when>-->
                </xsl:choose>
            </xsl:if>

            <!-- XML code examples within tei:remarks -->
            <xsl:if test="self::teix:egXML and ancestor::tei:remarks">
                <!-- The following <xsl:choose> is a modification of the <xsl:if test="self::teix:egXML and parent::tei:exemplum"> clause, above -->
                <!-- These two switches should most probably stay in sync -->
                <xsl:choose>
                    <xsl:when test="ancestor::tei:remarks[not(@xml:lang)]">
                        <xsl:call-template name="backLink"/>
                    </xsl:when>
                    <xsl:when test="ancestor::tei:remarks[@xml:lang = 'und']">
                        <xsl:call-template name="backLink"/>
                    </xsl:when>
                    <xsl:when
                        test="ancestor::tei:remarks[@xml:lang = 'mul'] and not($documentationLanguage = 'zh-TW')">
                        <!-- will need to generalize this if other langs come along like chinese -->
                        <xsl:call-template name="backLink"/>
                    </xsl:when>
                    <xsl:when test="ancestor::tei:remarks[@xml:lang = $documentationLanguage]">
                        <xsl:call-template name="backLink"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:if>

            <!-- XML code examples within running text(?) -->
            <xsl:if
                test="self::teix:egXML and not(ancestor::tei:exemplum) and not(ancestor::tei:remarks)">
                <xsl:call-template name="backLink"/>
            </xsl:if>

            <!--references in running text-->
            <xsl:if test="self::tei:ref[@type = 'cit']">
                <xsl:call-template name="backLink"/>
            </xsl:if>

        </xsl:for-each>
    </xsl:template>

    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>Helper template for creating an html:a backlink</desc>
    </doc>
    <xsl:template name="backLink">
        <xsl:text> </xsl:text>
        <a class="link_return" title="Go back to text">
            <xsl:attribute name="href">
                <xsl:apply-templates select="." mode="generateLink"/>
            </xsl:attribute>
            <xsl:text>↵</xsl:text>
        </a>
    </xsl:template>

    <xsl:template name="egXMLEndHook">
        <xsl:choose>
            <xsl:when test="@corresp and id(substring(@corresp, 2))">
                <div style="float: right;">
                    <a>
                        <xsl:attribute name="href">
                            <xsl:apply-templates mode="generateLink"
                                select="id(substring(@corresp, 2))"/>
                        </xsl:attribute>
                        <xsl:text>bibliography</xsl:text>
                        <!--	  <span class="citLink">&#x270d;</span>-->
                    </a>
                    <xsl:text>&#160;</xsl:text>
                </div>
            </xsl:when>
            <xsl:when test="@source and id(substring(@source, 2))">
                <div style="float: right;">
                    <a>
                        <xsl:attribute name="href">
                            <xsl:apply-templates mode="generateLink"
                                select="id(substring(@source, 2))"/>
                        </xsl:attribute>
                        <xsl:text>bibliography</xsl:text>
                        <!--	  <span class="citLink">&#x270d;</span>-->
                    </a>
                    <xsl:text>&#160;</xsl:text>
                </div>
            </xsl:when>
        </xsl:choose>
        <xsl:for-each select="ancestor::tei:elementSpec">
            <div style="float: right;">
                <a href="examples-{@ident}.html">
                    <xsl:sequence select="tei:i18n('Show all')"/>
                </a>
                <xsl:text>&#160;</xsl:text>
            </div>
        </xsl:for-each>
    </xsl:template>

 <xsl:template name="figureHook">
        <xsl:if test="@corresp and id(substring(@corresp, 2))">
            <div style="float: right;">
                <a>
                    <xsl:attribute name="href">
                        <xsl:apply-templates mode="generateLink" select="id(substring(@corresp, 2))"
                        />
                    </xsl:attribute>
                    <xsl:text>bibliography</xsl:text>
                </a>
            </div>
        </xsl:if>
    </xsl:template>

    <!-- Handling of <egXML> elements in the TEI example namespace. -->
    <xsl:template match="teix:egXML">
        <pre class="teiCode">
       <xsl:apply-templates/>
     </pre>y
    </xsl:template>

    <!-- Escaping all tags and attributes within the teix (examples) 
namespace except for
the containing egXML. -->
    <xsl:template match="teix:*[not(local-name(.) = 'egXML')]">
        <!-- Indent based on the number of ancestor elements.   -->
        <xsl:variable name="indent">
            <xsl:for-each select="ancestor::teix:*"> </xsl:for-each>
        </xsl:variable>
        <!-- Indent before every opening tag if not inside a paragraph. -->
        <xsl:if test="not(ancestor::teix:p)">
            <xsl:value-of select="$indent"/>
        </xsl:if>
        <!-- Opening tag, including any attributes. -->
        <span class="xmlTag">&lt;<xsl:value-of select="name()"/></span>
        <xsl:for-each select="@*">
            <span class="xmlAttName"><xsl:text> </xsl:text><xsl:value-of select="name()"/>=</span>
            <span class="xmlAttVal">"<xsl:value-of select="."/>"</span>
        </xsl:for-each>
        <span class="xmlTag">&gt;</span>
        <!-- Return before processing content, if not inside a p. -->
        <xsl:if test="not(ancestor::teix:p)">
            <xsl:text>
</xsl:text>
        </xsl:if>
        <xsl:apply-templates select="* | text() | comment()"/>
        <!-- Closing tag, following indent if not in a p. -->
        <xsl:if test="not(ancestor::teix:p)">
            <xsl:value-of select="$indent"/>
        </xsl:if>
        <span class="xmlTag">&lt;/<xsl:value-of select="local-name()"/>&gt;</span>
        <!-- Return after closing tag, if not in a p. -->
        <xsl:if test="not(ancestor::teix:p)">
            <xsl:text>
</xsl:text>
        </xsl:if>
    </xsl:template>

    <!-- For good-looking tree output, we need to include a return after any 
text content, assuming
       we're not inside a paragraph tag. -->
    <xsl:template match="teix:*/text()">
        <xsl:if test="not(ancestor::teix:p)">
            <xsl:for-each select="ancestor::teix:*"> </xsl:for-each>
        </xsl:if>
        <xsl:value-of select="replace(., '&amp;', '&amp;amp;')"/>
        <xsl:if
            test="
                not(ancestor::teix:p) or
                not(following-sibling::* or following-sibling::text())">
            <xsl:text>
</xsl:text>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
