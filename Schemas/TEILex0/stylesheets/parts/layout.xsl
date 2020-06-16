<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:teix="http://www.tei-c.org/ns/Examples"
    xmlns:html="http://www.w3.org/1999/xhtml"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0"
    exclude-result-prefixes="tei teix html">

    <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
        <desc>[html] the main page structure</desc>
    </doc>
    <xsl:template name="mainPage">
        <xsl:param name="currentID"/>        
        <div id="layout" class="custom-layout language-xml" xmlns="http://www.w3.org/1999/xhtml">
            <!-- Menu toggle -->
            <a href="#menu" id="menuLink" class="menu-link" xmlns="http://www.w3.org/1999/xhtml">
                <!-- Hamburger icon -->
                <span/>
            </a>
            <div id="menu" class="custom-menu" xmlns="http://www.w3.org/1999/xhtml">
                <div class="pure-menu" xmlns="http://www.w3.org/1999/xhtml">
                    <a class="pure-menu-heading" href="#" xmlns="http://www.w3.org/1999/xhtml">TEI Lex-0</a>

                  
                    
              

                     <xsl:for-each select="descendant-or-self::tei:TEI/tei:text/tei:front">
                        <xsl:apply-templates/>
                    </xsl:for-each>
                    
                    
                    
                    
                </div>

                <ul class="pure-menu-list" xmlns="http://www.w3.org/1999/xhtml" style="position: fixed; bottom: 0; width: 325px; ">
                   
                    <li xmlns="http://www.w3.org/1999/xhtml" style="background: #191818">
                        <a href="#" xmlns="http://www.w3.org/1999/xhtml" class="logos">
                            <img src="images/dariah-lr.png"  class="pure-img img-hover"></img>
                            <img src="images/dariah-lr-blue.png" class="pure-img img"></img>
                        </a>
                    </li>
                    
                    <li xmlns="http://www.w3.org/1999/xhtml" style="background: #191818">
                        <a href="#" xmlns="http://www.w3.org/1999/xhtml" class="logos">
                            <img src="images/elexis.png" class="pure-img img-hover"></img>
                            <img src="images/elexis-blue.png" class="pure-img img"></img>
                        </a>
                    </li>
                    
                     <!--<li class="pure-menu-item" xmlns="http://www.w3.org/1999/xhtml">                        
                    </li>-->
                </ul>

            </div>

            <!-- 
            <xsl:if test="not($REQUEST = '')">
                <div id="accessibility">
                    <span class="tocontent">
                        <a href="{$REQUEST}?style=text">Text only</a> | <a class="skiplinks"
                            href="#rh-col" title="Go to main page content">Skip links</a>
                    </span>
                </div>
            </xsl:if>
            -->




            <xsl:choose>
                <xsl:when test="$contentStructure = 'all' or tei:match(@rend, 'all')">
                    <div id="main">
                        <!-- <xsl:call-template name="col1"/>-->
                        <div class="header">
            
                            <xsl:call-template name="hdr"/>
                        </div>
                        <div class="content">
                            <xsl:call-template name="col2"/>
                        </div>
                        <!--       <xsl:call-template name="col3"/>-->
                    </div>
                </xsl:when>
                <!--<xsl:when test="tei:match(@rend, 'frontpage')">
                    <div class="main">
                        <div id="rh-col">
                            <xsl:for-each select="descendant-or-self::tei:TEI/tei:text/tei:body">
                                <xsl:apply-templates/>
                            </xsl:for-each>
                        </div>
                        <!-\-<div id="lh-col">
                                <xsl:for-each
                                    select="descendant-or-self::tei:TEI/tei:text/tei:front">
                                    <xsl:apply-templates/>
                                </xsl:for-each>
                            </div>-\->
                    </div>
                </xsl:when>
                <xsl:when test="$contentStructure = 'body'">
                    <xsl:call-template name="bodyLayout">
                        <xsl:with-param name="currentID" select="$currentID"/>
                    </xsl:call-template>
                </xsl:when> -->
            </xsl:choose>


        </div>
    </xsl:template>
</xsl:stylesheet>
