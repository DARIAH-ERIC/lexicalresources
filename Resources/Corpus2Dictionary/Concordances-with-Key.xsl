<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0" xmlns="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <!-- As compared to Concordances.xsl : 15 times faster -->

    <xsl:output method="xml" indent="yes"/>
    
    <!-- Declaring a key indexing all sentenxes by the lemmas they contain -->
    <xsl:key name="phrase" match="s" use="w/@lemma"/>

    <xsl:template match="/">
        <xsl:variable name="theRoot" select="."/>
        <xsl:variable name="folderName" select="'Entries'"/>
        <xsl:variable name="allLemmas" select="distinct-values(descendant::w/@lemma)"/>
        <xsl:for-each select="$allLemmas">
            <xsl:sort/>
            <xsl:result-document href="{$folderName}/{.}.xml" method="xml">
                <TEI>
                    <teiHeader>
                        <fileDesc>
                            <titleStmt>
                                <title>Concordance lexical entry for lemma: <xsl:value-of select="."/></title>
                            </titleStmt>
                            <publicationStmt>
                                <xsl:copy-of select="$theRoot/descendant::publicationStmt/distributor"/>
                                <xsl:copy-of select="$theRoot/descendant::publicationStmt/address"/>
                                <xsl:copy-of select="$theRoot/descendant::publicationStmt/availability"/>
                            </publicationStmt>
                            <sourceDesc>
                                <bibl>
                                    <xsl:copy-of select="$theRoot/descendant::titleStmt/title"/>
                                </bibl>
                            </sourceDesc>
                        </fileDesc>
                    </teiHeader>
                    <text>
                        <body>
                            <entry>
                                <form type="lemma">
                                    <orth>
                                        <xsl:value-of select="."/>
                                    </orth>
                                </form>
                                <!-- We get all sentences with a lemma that matches the current one in the embedding loop -->
                                <!-- Note the need to use the variable containg the root element of the document to give a context for the key -->
                                <xsl:for-each select="$theRoot/key('phrase',current())">
                                    <cit>
                                        <quote>
                                            <xsl:copy-of select="."/>
                                        </quote>
                                    </cit>
                                </xsl:for-each>
                            </entry>
                        </body>
                    </text>
                </TEI>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
