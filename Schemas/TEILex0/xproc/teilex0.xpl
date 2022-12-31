<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" xmlns:c="http://www.w3.org/ns/xproc-step"
    version="3.0" name="generateDocumentation">
    <!-- ================================================================== -->
    <!-- PROLOG: -->
    <!-- <p:serialization port="result" method="html" indent="false" omit-xml-declaration="true" />
    <p:serialization port="secondary" method="html" indent="false" omit-xml-declaration="true" />-->
  <!--  <p:input port="exs" kind="document" primary="false" sequence="true"/>-->
    <p:input port="source" sequence="true"/>
    <p:input port="stylesheet-odd2odd">
        <p:document href="../../../../TEI-C/Stylesheets/odds/odd2odd.xsl"/>
    </p:input>
    <p:input port="stylesheet-odd2lite">
        <p:document href="../../../../TEI-C/Stylesheets/odds/odd2lite.xsl"/>
    </p:input>
    <!-- ================================================================== -->
    <!-- BODY: -->
    
    <p:xslt name="stripper">
        <p:input port="source">
            <p:document href="../TEILex0.examples/examples.xml"/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="../stylesheets/tei-stripper.xsl"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>
    <p:store href="../TEILex0.examples/examples.stripped.xml" method="xml" indent="true"/>
    <p:directory-list exclude-filter=".+stripped\.xml$" path="../TEILex0.examples/headers"/>
    <p:for-each>
        <p:iteration-source select="//c:file"/>
        <p:variable name="filename" select="substring-before(/c:file/@name, '.xml')"/>
        <p:load>
            <p:with-option name="href"
                select="concat('../TEILex0.examples/headers/', $filename, '.xml')"/>
        </p:load>
        <p:xslt>
            <p:input port="source"/>
            <p:input port="stylesheet">
                <p:document href="../stylesheets/tei-stripper.xsl"/>
            </p:input>
            <p:input port="parameters">
                <p:empty/>
            </p:input>
        </p:xslt>
        <p:store>
            <p:with-option name="href"
                select="concat('../TEILex0.examples/headers/', $filename, '.stripped.xml')"/>
        </p:store>
    </p:for-each>
    <p:xinclude fixup-xml-base="false" name="include">
        <p:input port="source">
            <p:document href="../TEILex0.odd"/>
        </p:input>
    </p:xinclude>
    <p:xslt name="odd2odd">
        <p:input port="source">
            <p:pipe step="include" port="result"/>
        </p:input>
        <p:input port="stylesheet">
            <p:pipe port="stylesheet-odd2odd" step="generateDocumentation"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>
    <p:xslt name="odd2lite">
        <p:input port="source">
            <p:pipe step="odd2odd" port="result"/>
        </p:input>
        <p:input port="stylesheet">
            <p:pipe port="stylesheet-odd2lite" step="generateDocumentation"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>
    <p:store href="results-new/odd2lit.xml" method="xml" indent="false"/>
    <p:xslt name="contributors">
        <p:input port="source">
            <p:pipe step="odd2lite" port="result"/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="../stylesheets/contributors.xsl"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>
    <p:store href="results-new/contributored.xml" method="xml" indent="false"/>
   <!-- <p:xslt name="xmlbase-fix">
        <p:input port="source">
            <p:pipe step="contributors" port="result"/>
        </p:input>
        <p:input port="stylesheet">
            <!-\-  includes an xml:base fix for ugly and unnecessary attributes in our examples-\->
            <p:document href="../stylesheets/xmlbase-fix.xsl"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>
    <p:store href="results-new/odd2xmlbase-fixed.xml" method="xml" indent="false"/>-->
    <p:xslt name="odd2html">
        <p:input port="source">
            <p:pipe step="contributors" port="result"/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="../stylesheets/TEILex0.xsl"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>
    <p:store href="results-new/pre.html" method="xhtml"> </p:store>
    <p:xslt name="post-process" version="2.0">
        <p:input port="source">
            <p:pipe step="odd2html" port="result"/>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="../stylesheets/html-post-process.xsl"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>
   <p:store href="../../../docs/pages/TEILex0/TEILex0.html" method="xhtml">
        <p:input port="source">
            <p:pipe port="result" step="post-process"/>
        </p:input>
    </p:store>
    <p:store href="../../../docs/pages/TEILex0/spec.html" method="xhtml">
        <p:input port="source">
            <p:pipe port="result" step="post-process"/>
        </p:input>
    </p:store>
</p:declare-step>
