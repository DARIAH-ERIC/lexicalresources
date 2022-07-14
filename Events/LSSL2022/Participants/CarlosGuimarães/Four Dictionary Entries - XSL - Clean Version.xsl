<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output method="html"/>
    
    <xsl:template match="/">
        <xsl:variable name="Title" select="descendant::titleStmt/title"/>
        <html>
            <head>
                <title><xsl:apply-templates select="$Title"/></title>
            </head>
            <body>
                <h1><xsl:apply-templates select="$Title"/></h1>
                <!--<xsl:value-of select="distinct-values(descendant::gramGrp/pos)" separator=" - " />-->
              <!--  <h1>Verbs</h1>
                <xsl:apply-templates select="descendant::entry[gramGrp/pos = 'verb']"/>
                <h1>Nouns</h1>
                <xsl:apply-templates select="descendant::entry[gramGrp/pos = 'noun']"/>
                <h1>Adjectives</h1>
                <xsl:apply-templates select="descendant::entry[gramGrp/pos = 'Adjective']"/>
                <xsl:apply-templates select="descendant::entry"/>-->
                <h1>Table of Contents</h1>
                <xsl:for-each select="descendant::entry">
                    <xsl:sort></xsl:sort>
                    <a href="#{@xml:id}"><xsl:value-of select="form/orth"/></a>
                    <br/>
                </xsl:for-each>
                <xsl:apply-templates select="descendant::entry"><xsl:sort select="form/orth"></xsl:sort></xsl:apply-templates>
            </body>
        </html>
    </xsl:template>
    
    <!--<xsl:template match="form">
        <xsl:apply-templates select="pron"/>
            <xsl:text>, </xsl:text>
            <xsl:apply-templates select="orth"/>
    </xsl:template>-->
    
    <xsl:template match="teiHeader"/>
        
    <xsl:template match="entry">
        <p id="{@xml:id}">
            <xsl:apply-templates/>
            <!-- select="descendant::form" -->
        </p>
     </xsl:template>
    
     <xsl:template match="orth">
         <b>
             <xsl:apply-templates/>
         </b>       
     </xsl:template>
    
     <xsl:template match="form/pron">
         <p>
             <xsl:apply-templates/>
         </p>
     </xsl:template>
    
     <xsl:template match="gramGrp/pos">
         <p>
             <b>
                 <span style="text-transform:uppercase;">
                     <xsl:apply-templates/>
                 </span>
              </b>   
         </p>
     </xsl:template>
    
    <xsl:template match="sense/subc">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="usg[@type='geo']">  
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="usg[@type='reg']">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="sense">
        <p><xsl:value-of select="@n"/> <xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="sense/def">
        <p>
            <xsl:apply-templates/>
        </p>    
    </xsl:template>
    
    <xsl:template match="gloss">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
         
    <xsl:template match="cit[@type='example']/quote">
        <p>
            <i>
                <xsl:apply-templates/>
            </i>
        </p>
    </xsl:template>
    
    <xsl:template match="etym">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
</xsl:stylesheet>