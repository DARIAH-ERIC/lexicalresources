<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:teix="http://www.tei-c.org/ns/Examples"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0"
    exclude-result-prefixes="tei teix">
    
    <xsl:template name="pageHeader">
        <xsl:param name="mode"/>
        <xsl:choose>
            <xsl:when test="$mode='table'">
                <table width="100%" border="0">
                    <tr>
                        <td height="98" class="bgimage" onclick="window.location='{$homeURL}'"
                            cellpadding="0">
                            
                            <xsl:call-template name="makeHTMLHeading">
                                <xsl:with-param name="class">subtitle</xsl:with-param>
                                <xsl:with-param name="text">
                                    <xsl:sequence select="tei:generateSubTitle(.)"/>
                                </xsl:with-param>
                                <xsl:with-param name="level">2</xsl:with-param>
                            </xsl:call-template>
                            
                            <xsl:call-template name="makeHTMLHeading">
                                <xsl:with-param name="class">title</xsl:with-param>
                                <xsl:with-param name="text">
                                    <xsl:sequence select="tei:generateTitle(.)"/>
                                </xsl:with-param>
                                <xsl:with-param name="level">1</xsl:with-param>
                            </xsl:call-template>
                            
                        </td>
                        <td style="vertical-align:top;"/>
                    </tr>
                </table>
            </xsl:when>
            <xsl:otherwise>
              
                
                <xsl:call-template name="makeHTMLHeading">
                    <xsl:with-param name="class">title</xsl:with-param>
                    <xsl:with-param name="text">
                        <xsl:sequence select="tei:generateSimpleTitle(.)"/>
                    </xsl:with-param>
                    <xsl:with-param name="level">1</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="makeHTMLHeading">
                    <xsl:with-param name="class">subtitle</xsl:with-param>
                    <xsl:with-param name="text">
                        <xsl:sequence select="tei:generateSubTitle(.)"/>
                    </xsl:with-param>
                    <xsl:with-param name="level">2</xsl:with-param>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>