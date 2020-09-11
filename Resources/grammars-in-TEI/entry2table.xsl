<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:eg="http://www.tei-c.org/ns/Examples"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei eg"
    version="3.0"> 
    
    <xsl:output method="html" encoding="UTF-8"></xsl:output>
    
    <!--Converts full paradigm entries (with specific @rend 
    attributes) to HTML tables. Proof of concept. -->
    
    
    <!--Skip anything but explicitly matched nodes
    Eventually, we'll want to change this and also transform
    TEI tables to HTML tables, but here I'm focusing
    on the transformation of entries with @rend="table"-->
    <xsl:mode on-no-match="shallow-skip"/>
    
   <xsl:template match="entry[@rend='table']">
       <table>
            <xsl:if test="child::note[@rend='head']">
                <caption>
                    <xsl:value-of select="child::note[@rend='head']"/>
                </caption>
            </xsl:if>
           <!--count columns-->
           <xsl:variable name="columns">
               <xsl:value-of select="count(distinct-values(descendant::form[@type='inflectedForm']/string-join(descendant::gram[@rend='column'])))"/>
           </xsl:variable>
           <xsl:for-each-group select="form[@type='inflectedForms']/form[@type='inflectedForm']" group-adjacent="ceiling(position() div $columns)">

               <xsl:choose>
                   <xsl:when test="position() =1">
                       <tr>
                           <th></th>
                           <xsl:apply-templates select="current-group()" mode="column-label"></xsl:apply-templates>
                       </tr>
                       <tr>
                           <xsl:apply-templates select="current-group()[1]" mode="row-label"></xsl:apply-templates>
                           <xsl:apply-templates select="current-group()" mode="data"></xsl:apply-templates>
                       </tr>
                   </xsl:when>
                   <xsl:otherwise>
                       <tr>
                           <xsl:apply-templates select="current-group()[1]" mode="row-label"></xsl:apply-templates>
                           <xsl:apply-templates select="current-group()" mode="data"></xsl:apply-templates>
                       </tr>
                   </xsl:otherwise>
               </xsl:choose>
           </xsl:for-each-group>
               
       </table>
       
   </xsl:template>
    <xsl:template match="form[@type='inflectedForm']" mode="column-label">
        <th>
            <xsl:value-of select="string-join(descendant::gram[@rend='column'])"/>
        </th>
    </xsl:template>
    
    <xsl:template match="form[@type='inflectedForm']" mode="row-label">
        <th>
            <xsl:value-of select="string-join( descendant::gram[@rend='row']  )"/>
        </th>
    </xsl:template>
    
    <xsl:template match="form[@type='inflectedForm']" mode="data">
        <td>
            <xsl:value-of select="orth"/>
        </td>
    </xsl:template>
    
    
    
</xsl:stylesheet>

