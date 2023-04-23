<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:teix="http://www.tei-c.org/ns/Examples"
    xmlns:html="http://www.w3.org/1999/xhtml" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="2.0" exclude-result-prefixes="tei teix html">

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
                <div class="pure-menu">
                    <div class="pure-menu-heading">
                        <a style="float:right; text-transform:capitalize; margin-right: 0.75em; line-height:30px; vertical-align:middle; font-size:85%; padding: 0" href="#revisionHistory">Version <xsl:value-of select="$version"/></a>
                        <a style="line-height:30px; vertical-align:middle" href="#">TEI Lex-0</a>
                        
                    </div>
                    
                    <div class="tei_toc_search">
                        <div class="input-group">
                            <input type="search" placeholder="Search..." onfocus="this.placeholder=''" onblur="this.placeholder='Search...'" class="algo rounded"/>
                        </div>
                    </div>
                    <xsl:for-each select="descendant-or-self::tei:TEI/tei:text/tei:front">
                        <xsl:apply-templates/>
                    </xsl:for-each>
                </div>
                
                <ul class="pure-menu-list" xmlns="http://www.w3.org/1999/xhtml"
                    style="position: fixed; bottom: 0; width: 325px;">
                    
                   
                    
                    <li class="dlogo" xmlns="http://www.w3.org/1999/xhtml" style="background: #1a252f">
                        <a href="#" xmlns="http://www.w3.org/1999/xhtml" class="logos">
                            <img src="images/dariah-lr.png" class="pure-img img-hover"/>
                            <img src="images/dariah-lr-blue.png" class="pure-img img"/>
                        </a>
                    </li>

                    <li xmlns="http://www.w3.org/1999/xhtml" style="background: #1a252f">
                        <a href="#" xmlns="http://www.w3.org/1999/xhtml" class="logos">
                            <img src="images/elexis.png" class="pure-img img-hover"/>
                            <img src="images/elexis-blue.png" class="pure-img img"/>
                        </a>
                    </li>
                    <li class="pure-menu-item h2020" xmlns="http://www.w3.org/1999/xhtml" style="background: #1a252f">
                        <p xmlns="http://www.w3.org/1999/xhtml">Co-funded by the Horizon 2020 innovation and research programme of the European Union under grant no. 731015.</p>
                    </li>
                </ul>

            </div>
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
