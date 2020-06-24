<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:teix="http://www.tei-c.org/ns/Examples"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0"
    exclude-result-prefixes="tei teix">
    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>Process elements teix:egXML</desc>
    </doc>
    
    <xsl:template name="processExample">
        <xsl:param name="simple"></xsl:param>
        <xsl:param name="highlight"/>
        <pre>
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
    
    <xsl:template match="teix:egXML[ancestor::tei:div[@xml:id='specification']]">
        <xsl:param name="simple">false</xsl:param>
        <xsl:param name="highlight"/>
        <xsl:call-template name="processExample">
            <xsl:with-param name="simple"></xsl:with-param>
            <xsl:with-param name="highlight"></xsl:with-param>
        </xsl:call-template>
        
    </xsl:template>
    
    <xsl:template match="teix:egXML[not(ancestor::tei:list[@type='examples'])][not(ancestor::tei:div[@xml:id='specification'])]">
        <xsl:element name="ul" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="class">examples tabs</xsl:attribute>
        <xsl:call-template name="wrapExample">
            <xsl:with-param name="position" select="''"></xsl:with-param>
        </xsl:call-template>
        </xsl:element>
       
    </xsl:template>
    
    <xsl:template match="teix:egXML[ancestor::tei:list[@type='examples']][not(ancestor::tei:div[@xml:id='specification'])]">
        <xsl:param name="simple">false</xsl:param>
        <xsl:param name="highlight"/>
        <xsl:variable name="pos-in-list" 
            select="count(../preceding-sibling::tei:item) + 1"/>
        <xsl:call-template name="wrapExample">
            <xsl:with-param name="position" select="$pos-in-list"></xsl:with-param>
        </xsl:call-template> 
    </xsl:template>
    

    
    <xsl:template name="egXMLEndHook">
        <xsl:choose>
            <xsl:when test="@corresp and id(substring(@corresp, 2))">
                <span class='eg_biblStruct'>
                    
                    <xsl:call-template name="makeInternalLink">
                        <xsl:with-param name="target" select="id(substring(@corresp, 2))"></xsl:with-param>
                        <xsl:with-param name="ptr" select="true()"></xsl:with-param>
                      
                        <xsl:with-param name="dest">
                            <xsl:call-template name="generateEndLink">
                                <xsl:with-param name="where">
                                    <xsl:value-of select="substring(@corresp,2)"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </xsl:with-param>
                    </xsl:call-template>
                    
                    <xsl:apply-templates mode="xref" select="id(substring(@corresp, 2))"></xsl:apply-templates>
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
                <span class='eg_biblStruct'>
                    <xsl:call-template name="makeInternalLink">
                        <xsl:with-param name="target" select="id(substring(@source, 2))"></xsl:with-param>
                        <xsl:with-param name="ptr" select="true()"></xsl:with-param>
                        <xsl:with-param name="body">
                            <xsl:apply-templates mode="xref" select="id(substring(@source, 2))"></xsl:apply-templates>
                        </xsl:with-param>
                       <xsl:with-param name="dest">
                            <xsl:call-template name="generateEndLink">
                                <xsl:with-param name="where">
                                    <xsl:value-of select="substring(@source,2)"/>
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
            <div style="float: right;">
                <a href="examples-{@ident}.html">
                    <xsl:sequence select="tei:i18n('Show all')"/>
                </a>
                <xsl:text>&#160;</xsl:text>
            </div>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="tei:list[@type='examples']">
        <xsl:element name="ul" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="class">examples tabs</xsl:attribute>
            <xsl:apply-templates></xsl:apply-templates>
        </xsl:element> 
    </xsl:template>
    
 <!--   <xsl:template match="tei:item[parent::tei:list[@type='examples']]">
        <xsl:variable name="pos" select="position()"/>
        
        <xsl:call-template name="wrapExample">
            <xsl:with-param name="position" select="$pos"></xsl:with-param>
        </xsl:call-template>
        
       
    </xsl:template>-->
    
    
    <xsl:template name="wrapExample">
        <xsl:param name="position"></xsl:param>   
        <xsl:element name="div" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="class">tab</xsl:attribute>
            <input type="checkbox" xmlns="http://www.w3.org/1999/xhtml">
                <!--will need another unique str. for id-->
                <xsl:attribute name="id">
                    <xsl:value-of select="concat('chck', generate-id())"></xsl:value-of>
                </xsl:attribute>    
            </input>
            <label class="tab-label" xmlns="http://www.w3.org/1999/xhtml">
                <xsl:attribute name="for">
                    <xsl:value-of select="concat('chck', generate-id())"/>
                </xsl:attribute>
                <text>
                    <xsl:value-of select="concat('Example ', $position)"/>
                </text>
            </label>
            <div class="tab-content" xmlns="http://www.w3.org/1999/xhtml">
                <!--<xsl:apply-templates></xsl:apply-templates>-->
                <xsl:call-template name="processExample">
                    <xsl:with-param name="simple"></xsl:with-param>
                    <xsl:with-param name="highlight"></xsl:with-param>
                </xsl:call-template>
            </div>
        </xsl:element>
        
    </xsl:template>
    
    
 <!--   <xsl:template match="comment() | processing-instruction()" mode="egXML">
        <xsl:copy-of select="."/>
    </xsl:template>

    <xsl:template match="@*[namespace-uri() = '']" mode="egXML">
        <xsl:attribute name="{local-name()}">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>

    <xsl:template match="@*" mode="egXML">
        <xsl:copy-of select="."/>
    </xsl:template>

    <xsl:template match="teix:*" mode="egXML">
        <xsl:element name="{local-name()}" xmlns="http://www.tei-c.org/ns/Examples">
            <xsl:apply-templates select="* | @* | processing-instruction() | comment() | text()"
                mode="egXML"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="*" mode="egXML">
        <xsl:copy>
            <xsl:apply-templates select="* | @* | processing-instruction() | comment() | text()"
                mode="egXML"/>
        </xsl:copy>
    </xsl:template>-->

</xsl:stylesheet>