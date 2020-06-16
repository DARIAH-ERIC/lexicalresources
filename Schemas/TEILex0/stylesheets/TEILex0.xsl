<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:teix="http://www.tei-c.org/ns/Examples"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0"
    exclude-result-prefixes="tei teix">
    
    <xsl:output method="html" doctype-system="about:legacy-compat"/>
    
    <!--<xsl:import href="https://www.tei-c.org/release/xml/tei/stylesheet/odds/odd2odd.xsl"/>-->
    <!--<xsl:import href="https://www.tei-c.org/release/xml/tei/stylesheet/odds/odd2lite.xsl"/>-->
    <xsl:import href="https://www.tei-c.org/release/xml/tei/stylesheet/html/html.xsl"/>
    <xsl:import href="parts/layout.xsl"/>
    <xsl:import href="parts/pageHeader.xsl"/>
    <xsl:import href="parts/toc.xsl"></xsl:import>
    <xsl:import href="parts/examples.xsl"></xsl:import>
    <xsl:import href="parts/references.xsl"></xsl:import>
    <xsl:import href="parts/graphic.xsl"></xsl:import>
    
    <!--   <xsl:param name="outputTarget">html</xsl:param>
    <xsl:param name="doctypeSystem">about:legacy-compat</xsl:param>
   <!-\- <xsl:param name="doctypePublic"></xsl:param>-\->-->
    <xsl:param name="cssSecondaryFile" select="'css/tei.lex0.web.css'"/>
    <xsl:param name="cssFile" select="'https://unpkg.com/purecss@2.0.3/build/pure-min.css'"/>
    <xsl:param name="cssPrintFile" select="'css/tei-print.css'"/>
    <xsl:param name="pageLayout">Complex</xsl:param>
    <xsl:param name="institution" select="'DARIAH Working Group on Lexical Resources'"/>
    <xsl:param name="defaultSource"
        select="'https://www.tei-c.org/release/xml/tei/xml/tei/odd/p5subset.xml'"/>
    <xsl:param name="headInXref">false</xsl:param>
    <xsl:param name="contentStructure" select="'all'"/>
    <xsl:param name="verbose" select="'true'"/>
    
    <xsl:param name="minimalCrossRef">true</xsl:param>
    
    <!--  <xsl:param name="forceWrap">false</xsl:param>
    <xsl:param name="wrapLength">65</xsl:param>-->
    <xsl:param name="attLength">80</xsl:param>
    
    
    
    <!--<xsl:param name="logoFile">images/logo.png</xsl:param>
    <xsl:param name="cssFile">https://www.tei-c.org/release/xml/tei/stylesheet/tei.css</xsl:param>
    <xsl:param name="cssSecondaryFile">css/tei.lex0.web.css</xsl:param>
    <xsl:param name="pageLayout">Complex</xsl:param>
    <xsl:param name="outputMethod">html</xsl:param>
    <xsl:param name="parentWords">The Punch Project</xsl:param>
    <xsl:param name="institution">The University of Punch</xsl:param>-->
    
    <!--    <xsl:param name="directory">.</xsl:param>
    <xsl:param name="outputDir"><xsl:value-of select="$directory"/>/OPS</xsl:param>
    <xsl:key name="EXAMPLES" match="teix:*[ancestor::teix:egXML]"
        use="concat(ancestor::tei:div[last()]/@xml:id, local-name())"/>
    <xsl:key name="HEADS" match="tei:head" use="concat(@xml:lang, @corresp)"/>
    <xsl:key name="BACKLINKS" match="teix:egXML[@corresp]" use="substring(@corresp, 2)"/>
    <xsl:key name="BACKLINKS" match="teix:egXML[@source]" use="substring(@source, 2)"/>
    <xsl:key name="BACKLINKS" match="tei:ref[@type = 'cit']" use="substring(@target, 2)"/>
-->
    <xsl:template name="javascriptHook">
        
        
        
        
        
        
        
        <!--      <script type="text/javascript" src="js/popupFootnotes.js" xmlns="http://www.w3.org/1999/xhtml">
        <xsl:comment>popupfootnotes</xsl:comment>
    </script>-->
        <!--<xsl:call-template name="jsForOdds"/>-->
    </xsl:template>
    
    <xsl:template name="bodyJavascriptHook">
        <!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.2.6/jquery.min.js" xmlns="http://www.w3.org/1999/xhtml">
            <xsl:comment>JQuery</xsl:comment>
        </script>-->
        
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/lazysizes/5.2.1-rc2/lazysizes.min.js" xmlns="http://www.w3.org/1999/xhtml">
            <xsl:comment>lazysizes</xsl:comment>
        </script>
        <script type="text/javascript" src="js/teilex0.js" xmlns="http://www.w3.org/1999/xhtml">
            <xsl:comment>teilexjs</xsl:comment>
        </script>
        <script type="text/javascript" src="js/ui.js" xmlns="http://www.w3.org/1999/xhtml">
            <xsl:comment>uijs</xsl:comment>
        </script>
        <script type="text/javascript" src="js/prism.js" xmlns="http://www.w3.org/1999/xhtml">
            <xsl:comment>prism</xsl:comment>
        </script>
        <script type="text/javascript" src="js/prism-xpath.js" xmlns="http://www.w3.org/1999/xhtml">
            <xsl:comment>prism-xpath</xsl:comment>
        </script>
        <!--<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.6/clipboard.min.js">
            <xsl:comment>clipboard</xsl:comment>
        </script>-->
        
    </xsl:template>
    
    
    <xsl:template match="ab[@xml:space='preserve']">
        <pre xmlns="http://www.w3.org/1999/xhtml"><code>
            <xsl:value-of select="." disable-output-escaping="yes" />
        </code></pre>
    </xsl:template>
    
    <xsl:template match="eg[@xml:space='preserve']">
        <pre xmlns="http://www.w3.org/1999/xhtml"><code>
            <xsl:value-of select="." disable-output-escaping="yes" />
        </code></pre>
    </xsl:template>
    
    <!--double indentation of xml in egXML-->
    <xsl:template name="verbatim-makeIndent">
        <xsl:if
            test="not(ancestor::*[@xml:space][1]/@xml:space='preserve')">
            <xsl:variable name="depth" select="count(ancestor::*[not(namespace-uri()='http://www.tei-c.org/ns/1.0')])-1"/>
            <xsl:sequence select="for $i in 1 to $depth return concat($spaceCharacter,$spaceCharacter)"/>
        </xsl:if>
    </xsl:template>
    
    
    
    <!-- link from bibl back to egXML -->
    <!-- <xsl:template match="tei:listBibl/tei:biblStruct | tei:listBibl/tei:bibl">
        <xsl:apply-templates/>
        <xsl:variable name="id" select="@xml:id"/>
        <xsl:for-each select="key('BACKLINKS', @xml:id)">
            <!-\- XML code examples within tei:exemplum -\->
            <xsl:if test="self::teix:egXML and parent::tei:exemplum">
                <!-\- The following xsl:choose switch is taken from the <xsl:template match="tei:exemplum" mode="doc"> template from common_tagdocs.xsl -\->
                <!-\- Those two switches should most probably stay in sync -\->
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
                        <!-\- will need to generalize this if other langs come along like chinese -\->
                        <xsl:call-template name="backLink"/>
                    </xsl:when>
                    <xsl:when test="parent::tei:exemplum[@xml:lang = $documentationLanguage]">
                        <xsl:call-template name="backLink"/>
                    </xsl:when>
                    <!-\-<xsl:when
            test="not(parent::tei:exemplum[@xml:lang = $documentationLanguage]) and (@xml:lang = 'en' or @xml:lang = 'und' or @xml:lang = 'mul')">
            <xsl:call-template name="backLink"/>
          </xsl:when>-\->
                </xsl:choose>
            </xsl:if>

            <!-\- XML code examples within tei:remarks -\->
            <xsl:if test="self::teix:egXML and ancestor::tei:remarks">
                <!-\- The following <xsl:choose> is a modification of the <xsl:if test="self::teix:egXML and parent::tei:exemplum"> clause, above -\->
                <!-\- These two switches should most probably stay in sync -\->
                <xsl:choose>
                    <xsl:when test="ancestor::tei:remarks[not(@xml:lang)]">
                        <xsl:call-template name="backLink"/>
                    </xsl:when>
                    <xsl:when test="ancestor::tei:remarks[@xml:lang = 'und']">
                        <xsl:call-template name="backLink"/>
                    </xsl:when>
                    <xsl:when
                        test="ancestor::tei:remarks[@xml:lang = 'mul'] and not($documentationLanguage = 'zh-TW')">
                        <!-\- will need to generalize this if other langs come along like chinese -\->
                        <xsl:call-template name="backLink"/>
                    </xsl:when>
                    <xsl:when test="ancestor::tei:remarks[@xml:lang = $documentationLanguage]">
                        <xsl:call-template name="backLink"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:if>

            <!-\- XML code examples within running text(?) -\->
            <xsl:if
                test="self::teix:egXML and not(ancestor::tei:exemplum) and not(ancestor::tei:remarks)">
                <xsl:call-template name="backLink"/>
            </xsl:if>

            <!-\-references in running text-\->
            <xsl:if test="self::tei:ref[@type = 'cit']">
                <xsl:call-template name="backLink"/>
            </xsl:if>

        </xsl:for-each>
    </xsl:template>-->
    
    <!--  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
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
    </xsl:template>-->
    
    <xsl:template name="egXMLReferencePopup">
        <xsl:param name="id"></xsl:param>
        <xsl:apply-templates select="ancestor::tei:TEI//biblStruct[@xml:id=$id]"></xsl:apply-templates>  
    </xsl:template>
    
    
    
    <!--<xsl:template name="figureHook">
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
    </xsl:template>-->
    
    <!-- Handling of <egXML> elements in the TEI example namespace. -->
    <!--  <xsl:template match="teix:egXML">
        <pre class="teiCode">
       <xsl:apply-templates/>
     </pre>
    </xsl:template>-->
    
    <!-- Escaping all tags and attributes within the teix (examples) 
namespace except for
the containing egXML. -->
    <!--    <xsl:template match="teix:*[not(local-name(.) = 'egXML')]">
        <!-\- Indent based on the number of ancestor elements.   -\->
        <xsl:variable name="indent">
            <xsl:for-each select="ancestor::teix:*"> </xsl:for-each>
        </xsl:variable>
        <!-\- Indent before every opening tag if not inside a paragraph. -\->
        <xsl:if test="not(ancestor::teix:p)">
            <xsl:value-of select="$indent"/>
        </xsl:if>
        <!-\- Opening tag, including any attributes. -\->
        <span class="xmlTag">&lt;<xsl:value-of select="name()"/></span>
        <xsl:for-each select="@*">
            <span class="xmlAttName"><xsl:text> </xsl:text><xsl:value-of select="name()"/>=</span>
            <span class="xmlAttVal">"<xsl:value-of select="."/>"</span>
        </xsl:for-each>
        <span class="xmlTag">&gt;</span>
        <!-\- Return before processing content, if not inside a p. -\->
        <xsl:if test="not(ancestor::teix:p)">
            <xsl:text>
</xsl:text>
        </xsl:if>
        <xsl:apply-templates select="* | text() | comment()"/>
        <!-\- Closing tag, following indent if not in a p. -\->
        <xsl:if test="not(ancestor::teix:p)">
            <xsl:value-of select="$indent"/>
        </xsl:if>
        <span class="xmlTag">&lt;/<xsl:value-of select="local-name()"/>&gt;</span>
        <!-\- Return after closing tag, if not in a p. -\->
        <xsl:if test="not(ancestor::teix:p)">
            <xsl:text>
</xsl:text>
        </xsl:if>
    </xsl:template>-->
    
    <!-- For good-looking tree output, we need to include a return after any 
text content, assuming
       we're not inside a paragraph tag. -->
    <!--    <xsl:template match="teix:*/text()">
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
    </xsl:template>-->
    
</xsl:stylesheet>
