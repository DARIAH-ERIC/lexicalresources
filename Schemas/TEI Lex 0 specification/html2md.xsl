<xsl:stylesheet version="1.0"
    xmlns:h="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://exslt.org/functions"
    xmlns:str="http://exslt.org/strings"
    xmlns:my="urn:my:"
    extension-element-prefixes="fn str my"
    >
    
    <xsl:output method="text" encoding="utf-8" />
    
    <xsl:template match="/">
        <xsl:apply-templates select="//h:body/node()"/>
    </xsl:template>
    
    <!--==================   INLINE ELEMENTS   =====================-->
    
    <!-- FIXME backslash special characters:
	* periods following a newline + number
	* asterisks and underscores
	* backticks
	<xsl:template match="text()">
-->
    
    <xsl:template match="h:br">
        <xsl:text>  &#10;</xsl:text>
    </xsl:template>
    
    <xsl:template match="h:a[@href]">
        <xsl:text>[</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>](</xsl:text>
        <xsl:value-of select="@href"/>
        <xsl:if test="@title">
            <xsl:text> "</xsl:text>
            <xsl:value-of select="@title"/>
            <xsl:text>"</xsl:text>
        </xsl:if>
        <xsl:text>)</xsl:text>
    </xsl:template>
    
    <xsl:template match="h:img[not(@width | @height)]">
        <xsl:text>![</xsl:text>
        <xsl:value-of select="@alt"/>
        <xsl:text>](</xsl:text>
        <xsl:value-of select="@src"/>
        <xsl:if test="@title">
            <xsl:text> "</xsl:text>
            <xsl:value-of select="@title"/>
            <xsl:text>"</xsl:text>
        </xsl:if>
        <xsl:text>)</xsl:text>
    </xsl:template>
    
    <xsl:template match="h:em">
        <xsl:text>*</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>*</xsl:text>
    </xsl:template>
    
    <xsl:template match="h:strong">
        <xsl:text>**</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>**</xsl:text>
    </xsl:template>
    
    <xsl:template match="h:strong[h:em]">
        <xsl:text>__</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>__</xsl:text>
    </xsl:template>
    
    <xsl:template match="h:em[h:strong]">
        <xsl:text>_</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>_</xsl:text>
    </xsl:template>
    
    <xsl:template match="h:code">
        <xsl:text>`</xsl:text>
        <xsl:value-of select="."/>
        <xsl:text>`</xsl:text>
    </xsl:template>
    
    <!--==================   BLOCK ELEMENTS   =====================-->
    
    <fn:function name="my:prefix-all-lines">
        <xsl:param name="pfx" />
        <xsl:param name="text"><xsl:apply-templates /></xsl:param>
        <fn:result>
            <xsl:for-each select="str:tokenize( $text, '&#10;' )">
                <xsl:value-of select="concat( $pfx, ., '&#10;' )"/>
            </xsl:for-each>
        </fn:result>
    </fn:function>
    
    <fn:function name="my:prefix-first-line">
        <xsl:param name="pfx" />
        <xsl:param name="text"><xsl:apply-templates /></xsl:param>
        <fn:result>
            <xsl:for-each select="str:tokenize( $text, '&#10;' )">
                <xsl:choose>
                    <xsl:when test="position() = 1"><xsl:value-of select="concat( $pfx, ., '&#10;' )"/></xsl:when>
                    <xsl:otherwise><xsl:value-of select="concat( str:padding( string-length( $pfx ), ' ' ), ., '&#10;' )"/></xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </fn:result>
    </fn:function>
    
    <xsl:template match="h:p">
        <xsl:value-of select="my:prefix-all-lines( '' )"/>
    </xsl:template>
    
    <xsl:template match="h:h1">
        <xsl:value-of select="my:prefix-first-line( '# ' )"/>
    </xsl:template>
    
    <xsl:template match="h:h2">
        <xsl:value-of select="my:prefix-first-line( '## ' )"/>
    </xsl:template>
    
    <xsl:template match="h:h3">
        <xsl:value-of select="my:prefix-first-line( '### ' )"/>
    </xsl:template>
    
    <xsl:template match="h:h4">
        <xsl:value-of select="my:prefix-first-line( '#### ' )"/>
    </xsl:template>
    
    <xsl:template match="h:h5">
        <xsl:value-of select="my:prefix-first-line( '##### ' )"/>
    </xsl:template>
    
    <xsl:template match="h:h6">
        <xsl:value-of select="my:prefix-first-line( '###### ' )"/>
    </xsl:template>
    
    <xsl:template match="h:blockquote">
        <xsl:value-of select="my:prefix-all-lines( '> ' )"/>
    </xsl:template>
    
    <xsl:template match="h:pre[h:code]">
        <xsl:value-of select="my:prefix-all-lines( '&#9;', h:code )"/>
    </xsl:template>
    
    <xsl:template match="h:ul | h:ol">
        <xsl:apply-templates select="h:li"/>
    </xsl:template>
    
    <xsl:template match="h:ul/h:li">
        <xsl:value-of select="my:prefix-first-line( '* ' )"/>
    </xsl:template>
    
    <xsl:template match="h:ol/h:li">
        <xsl:value-of select="my:prefix-first-line( concat( position(), '. ' ) )"/>
    </xsl:template>
    
    <xsl:template match="h:hr">
        <xsl:value-of select="my:prefix-all-lines( '--------', '' )"/>
    </xsl:template>
    
    <!--==================   UNSUPPORTED BLOCK ELEMENTS   =====================-->
    
    <xsl:template match="h:address | h:center | h:dir | h:div | h:dl | h:fieldset | h:form | h:isindex | h:menu | h:noframes | h:noscript | h:pre | h:table | h:dd | h:dt | h:frameset | h:tbody | h:td | h:tfoot | h:th | h:thead | h:tr">
        <xsl:apply-templates select="." mode="block" />
        <xsl:text>&#10;</xsl:text>
    </xsl:template>
    
    <xsl:template match="*" mode="block">
        <xsl:text>&lt;</xsl:text>
        <xsl:value-of select="local-name()"/>
        <xsl:for-each select="@*">
            <xsl:text> </xsl:text>
            <xsl:value-of select="local-name()"/>
            <xsl:text>="</xsl:text>
            <xsl:value-of select="."/>
            <xsl:text>"</xsl:text>
        </xsl:for-each>
        <xsl:text>&gt;</xsl:text>
        <xsl:apply-templates mode="block" />
        <xsl:text>&lt;/</xsl:text>
        <xsl:value-of select="local-name()"/>
        <xsl:text>&gt;</xsl:text>
    </xsl:template>
    
    <!--==================   UNSUPPORTED INLINE ELEMENTS   =====================-->
    
    <!-- this is basically a copypaste of the above template -->
    <xsl:template match="h:*">
        <xsl:text>&lt;</xsl:text>
        <xsl:value-of select="local-name()"/>
        <xsl:for-each select="@*">
            <xsl:text> </xsl:text>
            <xsl:value-of select="local-name()"/>
            <xsl:text>="</xsl:text>
            <xsl:value-of select="."/>
            <xsl:text>"</xsl:text>
        </xsl:for-each>
        <xsl:text>&gt;</xsl:text>
        <xsl:apply-templates />
        <xsl:text>&lt;/</xsl:text>
        <xsl:value-of select="local-name()"/>
        <xsl:text>&gt;</xsl:text>
    </xsl:template>
    
</xsl:stylesheet>