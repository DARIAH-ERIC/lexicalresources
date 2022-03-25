<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:teix="http://www.tei-c.org/ns/Examples"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="2.0" exclude-result-prefixes="tei teix xhtml">
    
    
    
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>Process elements teix:egXML</desc>
    </doc>
    <xsl:template name="processExample">
        <xsl:param name="simple"/>
        <xsl:param name="highlight"/>
        <pre xmlns="http://www.w3.org/1999/xhtml">
            <code>
            <xsl:attribute name="id">
                <xsl:apply-templates mode="ident" select="."/>
            </xsl:attribute>
            <xsl:attribute name="class">
                <xsl:text>pre</xsl:text>
                <xsl:if test="not(*)">
                    <xsl:text> cdata</xsl:text>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="@valid = 'feasible'">
                        <xsl:text> egXML_feasible</xsl:text>
                    </xsl:when>
                    <xsl:when test="@valid = 'false'">
                        <xsl:text> egXML_invalid</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text> egXML_valid</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
                <xsl:choose>
                    <xsl:when test="$simple = 'true'">
                        <xsl:apply-templates mode="verbatim">
                            <xsl:with-param name="highlight">
                                <xsl:value-of select="$highlight"/>
                            </xsl:with-param>
                        </xsl:apply-templates>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="egXMLStartHook"/>
                        <xsl:apply-templates mode="verbatim">
                            <xsl:with-param name="highlight">
                                <xsl:value-of select="$highlight"/>
                            </xsl:with-param>
                        </xsl:apply-templates>
                        <xsl:call-template name="egXMLEndHook"/>
                    </xsl:otherwise>
                </xsl:choose>
        </code>
        </pre>
    </xsl:template>
    <xsl:template
        match="teix:egXML[ancestor::tei:div[@xml:id = 'specification'] or ancestor::tei:floatingText or @rend='unwrapped']">
        <xsl:param name="simple">false</xsl:param>
        <xsl:param name="highlight"/>
        <xsl:call-template name="processExample">
            <xsl:with-param name="simple"/>
            <xsl:with-param name="highlight"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template
        match="
            teix:egXML
            [not(ancestor::tei:list[@type = 'examples'])]
            [not(ancestor::tei:div[@xml:id = 'specification'])]
            [not(ancestor::tei:floatingText)]
            [not(@rend='unwrapped')]">
        <xsl:element name="ul" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="class">examples tabs</xsl:attribute>
            <xsl:call-template name="wrapExample">
                <!--<xsl:with-param name="position" select="''"/>-->
            </xsl:call-template>
        </xsl:element>
    </xsl:template>
    <!--skip image inside items; they'll be picked up later-->
    <xsl:template match="tei:item[parent::tei:list[@type='examples']]">
        <xsl:apply-templates select="teix:egXML"></xsl:apply-templates>
    </xsl:template>
    <xsl:template
        match="
            teix:egXML
            [ancestor::tei:list[@type = 'examples']]
            [not(ancestor::tei:div[@xml:id = 'specification'])]
            [not(ancestor::tei:floatingText)]
            [not(@rend='unwrapped')]">
        <xsl:param name="simple">false</xsl:param>
        <xsl:param name="highlight"/>
      <!--  <xsl:variable name="pos-in-list" select="count(../preceding-sibling::tei:item) + 1"/>-->
        <xsl:variable name="egImg" select="parent::tei:item/tei:figure"/>
        <xsl:call-template name="wrapExample">
            <xsl:with-param name="egImg" select="$egImg"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="egXMLEndHook">
        <xsl:choose>
            <xsl:when test="@corresp and id(substring(@corresp, 2))">
                <span class="eg_biblStruct" xmlns="http://www.w3.org/1999/xhtml">
                    <xsl:call-template name="makeInternalLink">
                        <xsl:with-param name="target" select="id(substring(@corresp, 2))"/>
                        <xsl:with-param name="ptr" select="true()"/>
                        <xsl:with-param name="dest">
                            <xsl:call-template name="generateEndLink">
                                <xsl:with-param name="where">
                                    <xsl:value-of select="substring(@corresp, 2)"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:with-param>
                    </xsl:call-template>
                    <xsl:apply-templates mode="xref" select="id(substring(@corresp, 2))"/>
                    <!-- <a>
                        <xsl:attribute name="href">
                            <xsl:apply-templates mode="generateLink"
                                select="id(substring(@corresp, 2))"/>
                        </xsl:attribute>
                        <xsl:text>bibliography</xsl:text>
                       	 <!-\- <span class="citLink">&#x270d;</span>-\->
                    </a>-->
                    <xsl:text>&#160;</xsl:text>
                </span>
            </xsl:when>
            <xsl:when test="@source and id(substring(@source, 2))">
                <span class="eg_biblStruct" xmlns="http://www.w3.org/1999/xhtml">
                    <xsl:call-template name="makeInternalLink">
                        <xsl:with-param name="target" select="id(substring(@source, 2))"/>
                        <xsl:with-param name="ptr" select="true()"/>
                        <xsl:with-param name="body">
                            <xsl:apply-templates mode="xref" select="id(substring(@source, 2))"/>
                        </xsl:with-param>
                        <xsl:with-param name="dest">
                            <xsl:call-template name="generateEndLink">
                                <xsl:with-param name="where">
                                    <xsl:value-of select="substring(@source, 2)"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:with-param>
                    </xsl:call-template>
                    <!--<a>
                        <xsl:attribute name="href">
                            <xsl:apply-templates mode="generateLink"
                                select="id(substring(@source, 2))"/>
                        </xsl:attribute>
                        <xsl:text>bibliography</xsl:text>
                        <!-\-	  <span class="citLink">&#x270d;</span>-\->
                        <xsl:call-template name="egXMLReferencePopup">
                            <xsl:with-param name="id" select="@source"></xsl:with-param>
                        </xsl:call-template>
                    </a>-->
                    <xsl:text>&#160;</xsl:text>
                </span>
            </xsl:when>
        </xsl:choose>
        <xsl:for-each select="ancestor::tei:elementSpec">
            <div style="float: right;" xmlns="http://www.w3.org/1999/xhtml">
                <a href="examples-{@ident}.html">
                    <xsl:sequence select="tei:i18n('Show all')"/>
                </a>
                <xsl:text>&#160;</xsl:text>
            </div>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="tei:list[@type = 'examples']">
        <xsl:element name="ul" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="class">examples tabs</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
   
    <!-- TODO: when i have more time, merge wrapExample and wrapInFocusPanel
    accounting for the differences between them-->
    <xsl:template name="wrapExample">
        <xsl:param name="egImg"/>
        <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="class">tab</xsl:attribute>
            <input type="checkbox" xmlns="http://www.w3.org/1999/xhtml">
                <!--will need another unique str. for id-->
                <xsl:attribute name="id">
                    <xsl:value-of select="concat('chck', generate-id())"/>
                </xsl:attribute>
            </input>
            <label class="tab-label" xmlns="http://www.w3.org/1999/xhtml">
                <xsl:attribute name="for">
                    <xsl:value-of select="concat('chck', generate-id())"/>
                </xsl:attribute>
                <img class="pure-img" src="images/code.png"/>
                <span style="display:inline-block"
                    ><!--<xsl:value-of select="concat('Example ', $position)"/>--></span>
            </label>
            <div class="tab-content" xmlns="http://www.w3.org/1999/xhtml">
                <xsl:apply-templates select="$egImg"></xsl:apply-templates>
                <!--<xsl:apply-templates></xsl:apply-templates>-->
                <xsl:call-template name="processExample">
                    <xsl:with-param name="simple"/>
                    <xsl:with-param name="highlight"/>
                </xsl:call-template>
            </div>
        </xsl:element>
    </xsl:template>
    <!--first separate, then merge -->
    <xsl:template name="wrapInFocusPanel">
        <!--<xsl:param name="position"></xsl:param> -->
        <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="class">tab</xsl:attribute>
            <input type="checkbox" xmlns="http://www.w3.org/1999/xhtml">
                <!--will need another unique str. for id-->
                <xsl:attribute name="id">
                    <xsl:value-of select="concat('chck', generate-id())"/>
                </xsl:attribute>
            </input>
            <label class="tab-label" xmlns="http://www.w3.org/1999/xhtml">
                <xsl:attribute name="for">
                    <xsl:value-of select="concat('chck', generate-id())"/>
                </xsl:attribute>
                <img class="pure-img"
                    src="images/focus.png"/>
                <xsl:text>In focus: </xsl:text>
                <xsl:value-of select="tei:body/tei:head"/>
            </label>
            <div class="tab-content" xmlns="http://www.w3.org/1999/xhtml">
                <xsl:apply-templates/>
                <!--<xsl:call-template name="processExample">
                    <xsl:with-param name="simple"></xsl:with-param>
                    <xsl:with-param name="highlight"></xsl:with-param>
                </xsl:call-template>-->
            </div>
        </xsl:element>
    </xsl:template>
    <!--for the time being it's single -\- consider lists as well-->
    <xsl:template match="tei:floatingText[@type = 'inFocusPanel']">
        <xsl:element name="ul" namespace="http://www.w3.org/1999/xhtml">
            <xsl:if test="@xml:id">
                <xsl:attribute name="id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:attribute name="class">infopanels tabs</xsl:attribute>
            <xsl:call-template name="wrapInFocusPanel"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="tei:floatingText[@type = 'inFocusPanel']/tei:body/tei:head"> </xsl:template>
    <xsl:template match="tei:floatingText[@type = 'inFocusPanel']/tei:body">
        <div class="panelContent" xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>
            <p>Process comments in verbatim mode</p>
            <p>[common] </p>
        </desc>
    </doc>
    <xsl:template match="comment()" mode="verbatim">
        <xsl:choose>
            <xsl:when test="ancestor::Wrapper"/>
            <xsl:when test="ancestor::xhtml:Wrapper"/>
            <xsl:otherwise>
                <xsl:call-template name="verbatim-lineBreak">
                    <xsl:with-param name="id">21</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="verbatim-makeIndent"/>
                <xsl:call-template name="Comment">
                    <xsl:with-param name="content">
                        <xsl:text>&lt;!--</xsl:text>
                        <xsl:choose>
                            <xsl:when test="$forceWrap = 'true'">
                                <xsl:call-template name="verbatim-reformatText">
                                    <xsl:with-param name="sofar">0</xsl:with-param>
                                    <xsl:with-param name="indent">
                                        <xsl:text> </xsl:text>
                                    </xsl:with-param>
                                    <xsl:with-param name="text">
                                        <xsl:value-of select="normalize-space(.)"/>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:call-template name="verbatim-Text">
                                    <xsl:with-param name="words">
                                        <xsl:value-of select="."/>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:text>--&gt;</xsl:text>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
   
    
   
</xsl:stylesheet>
