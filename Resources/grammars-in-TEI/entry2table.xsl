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
           <!--count rows and columns-->
           
           <xsl:variable name="columns">
               <xsl:value-of select="count(distinct-values(descendant::form[@type='inflectedForm']/string-join(descendant::gram[@rend='column'])))"/>
           </xsl:variable>
           <xsl:variable name="rows">
               <xsl:value-of select="count(distinct-values(descendant::form[@type='inflectedForm']/string-join(descendant::gram[@rend='row'])))"/>
           </xsl:variable>
           <!--we're assuming we have wrapped all inflected forms in form type="inflectedForms"-->
           <xsl:variable name="inflectedForms" select="form[@type='inflectedForms']"/>
           <xsl:value-of select="$columns"/>
           <xsl:value-of select="$rows"/>
           
         
           
           <xsl:for-each-group select="form[@type='inflectedForms']/form[@type='inflectedForm']" group-adjacent="2">
               <tr>
               </tr>
           </xsl:for-each-group>
           
          <!-- <xsl:iterate select="1 to $rows">
               <xsl:variable name="whichRow" select="." as="xs:integer"/>
               <tr n="{$whichRow}">
                   <xsl:iterate select="1 to $columns">
                       <xsl:variable name="whichColumn" select="." as="xs:integer"/>
                       <th n="{($whichRow * $columns) - $whichColumn}"> 
                           <xsl:value-of select="$inflectedForms/descendant::form[@type='inflectedForm'][$whichRow * $whichColumn]/string-join(descendant::gram[@rend='column'] )"/>
                       </th>
                   </xsl:iterate>
                   <xsl:iterate select="1 to $columns">
                       <xsl:variable name="whichColumn" select="." as="xs:integer"/>
                       <td n="{$whichRow * $whichColumn}">
                           
                       </td>
                   </xsl:iterate>
               </tr>
           </xsl:iterate>-->
           
       </table>
       
   </xsl:template>
    
   
    
    
    
    
    
</xsl:stylesheet>

