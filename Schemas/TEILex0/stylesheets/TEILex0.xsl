<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:teix="http://www.tei-c.org/ns/Examples"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0"
    exclude-result-prefixes="tei teix">
    <xsl:output method="html" doctype-system="about:legacy-compat"/>
 
    <xsl:variable name="version" select="//tei:fileDesc/tei:editionStmt/tei:edition/@n"/>
    <xsl:import href="html/html.xsl"/>
    <!-- html.xsl will also import common.xsl and functions.xsl from common-->
    <xsl:import href="parts/layout.xsl"/>
    <xsl:import href="parts/pageHeader.xsl"/>
    <xsl:import href="parts/toc.xsl"/>
    <xsl:import href="parts/examples.xsl"/>
    <xsl:import href="parts/references.xsl"/>
    <xsl:import href="parts/graphic.xsl"/>
    <!--   <xsl:param name="outputTarget">html</xsl:param>
    <xsl:param name="doctypeSystem">about:legacy-compat</xsl:param>
   <!-\- <xsl:param name="doctypePublic"></xsl:param>-\->-->
    <xsl:param name="cssSecondaryFile" select="'css/tei.lex0.web.css'"/>
    <xsl:param name="cssFile" select="'https://unpkg.com/purecss@2.0.3/build/pure-min.css'"/>
    <xsl:param name="cssPrintFile" select="'css/tei-print.css'"/>
    <xsl:param name="pageLayout">Complex</xsl:param>
    <xsl:param name="institution" select="'DARIAH Working Group on Lexical Resources'"/>
    <xsl:param name="defaultSource"
        select="'https://www.tei-c.org/release/xml/tei/xml/tei/odd/p5subset.xml'"/>
    <xsl:param name="headInXref">false</xsl:param>
    <xsl:param name="contentStructure" select="'all'"/>
    <xsl:param name="verbose" select="'true'"/>
    <xsl:param name="minimalCrossRef">true</xsl:param>
    <xsl:param name="forceWrap">false</xsl:param>
    <xsl:param name="wrapLength">75</xsl:param>
    <xsl:param name="attLength">80</xsl:param>
    <xsl:template name="bodyEndHook">
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/lazysizes/5.2.1-rc2/lazysizes.min.js" xmlns="http://www.w3.org/1999/xhtml">
            <xsl:comment>lazysizes</xsl:comment>
        </script>
        <script type="text/javascript" src="js/teilex0.js" xmlns="http://www.w3.org/1999/xhtml">
            <xsl:comment>teilexjs</xsl:comment>
        </script>
        <script type="text/javascript" src="js/ui.js" xmlns="http://www.w3.org/1999/xhtml">
            <xsl:comment>uijs</xsl:comment>
        </script>
        <script type="text/javascript" src="js/prism.js" xmlns="http://www.w3.org/1999/xhtml">
            <xsl:comment>prism</xsl:comment>
        </script>
        <script type="text/javascript" src="js/prism-xpath.js" xmlns="http://www.w3.org/1999/xhtml">
            <xsl:comment>prism-xpath</xsl:comment>
        </script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/docsearch.js@2/dist/cdn/docsearch.min.js" xmlns="http://www.w3.org/1999/xhtml">
            <xsl:comment>doc-search</xsl:comment>
        </script>
        <script type="text/javascript">
            docsearch({
                apiKey: '27fc9785932247d5056acddcede378cf',
                indexName: 'tei_lex',
                inputSelector: '.algo',
                debug: true, // Set debug to true if you want to inspect the dropdown
                transformData: function (hits) {
                    // Transform the list of hits
                    hits.forEach(hit => {
                        //console.log(hit.url.replace('https://dariah-eric.github.io/', ''));
                        hit.url = hit.url.replace('https://dariah-eric.github.io/lexicalresources/pages/TEILex0/TEILex0.html', '');
                        console.log(hit.url);
                    });
                    return hits;
                },
                handleSelected: function (input, event, suggestion, datasetNumber, context) {
                    // Prevents the default behavior on click and rather opens the suggestion
                    // in a new tab.
                    if (context.selectionMethod === 'click') {
                        input.setVal('');
                        
                        window.open(suggestion.url, '_self');
                    }
                },
            });</script>
    </xsl:template>
    <xsl:template match="ab[@xml:space = 'preserve']">
        <pre xmlns="http://www.w3.org/1999/xhtml"><code>
            <xsl:value-of select="." disable-output-escaping="yes"/>
        </code></pre>
    </xsl:template>
    <xsl:template match="eg[@xml:space = 'preserve']">
        <pre xmlns="http://www.w3.org/1999/xhtml"><code>
            <xsl:value-of select="." disable-output-escaping="yes"/>
        </code></pre>
    </xsl:template>
    <!--double indentation of xml in egXML-->
    <xsl:template name="verbatim-makeIndent">
        <xsl:if test="not(ancestor::*[@xml:space][1]/@xml:space = 'preserve')">
            <xsl:variable name="depth"
                select="count(ancestor::*[not(namespace-uri() = 'http://www.tei-c.org/ns/1.0')]) - 1"/>
            <xsl:sequence select="
                    for $i in 1 to $depth
                    return
                        concat($spaceCharacter, $spaceCharacter)"/>
        </xsl:if>
    </xsl:template>
    <!-- rather than having to mess with algolia configs (which I would have to do through them;
        rather than directly), I'm adding paragraphs to element definitions in spec,
        so that they get indexed by algolia-->
    <xsl:template
        match="//tei:div[@xml:id = 'specification']//tei:table[@rend = 'wovenodd']/tei:row[1]">
        <xsl:element name="tr" namespace="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template
        match="//tei:div[@xml:id = 'specification']//tei:table[@rend = 'wovenodd']/tei:row[1]/tei:cell[1]">
        <xsl:element name="td" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="colspan">2</xsl:attribute>
            <xsl:attribute name="class">wovenodd-col2</xsl:attribute>
            <xsl:element name="p" namespace="http://www.w3.org/1999/xhtml">
                <xsl:attribute name="class">specDef</xsl:attribute>
                <xsl:apply-templates/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template name="egXMLReferencePopup">
        <xsl:param name="id"/>
        <xsl:apply-templates select="ancestor::tei:TEI//biblStruct[@xml:id = $id]"/>
    </xsl:template>
</xsl:stylesheet>
