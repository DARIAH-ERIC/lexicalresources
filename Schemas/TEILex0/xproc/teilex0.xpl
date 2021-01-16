<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" xmlns:c="http://www.w3.org/ns/xproc-step"
    version="1.0" name="generateDocumentation">
    <p:serialization port="result" method="xml" indent="true" omit-xml-declaration="true"/>
    <p:serialization port="final" method="html" indent="false" doctype-system="about:legacy-compat"
        standalone="true"/>
    <p:input port="source"/>
    <p:input port="stylesheet-odd2odd"/>
    <p:input port="stylesheet-odd2lite"/>
    <p:input port="stylesheet-odd2html">
        <p:document href="../stylesheets/TEILex0.xsl"/>
    </p:input>
    <!--hardcoded, one day should find a workaround-->
    <p:input port="stylesheet-html">
        <p:document href="../stylesheets/html/html.xsl"/>
    </p:input>
    <p:output port="result"/>
    <p:output port="final" primary="false">
        <p:pipe port="result" step="post-process"/>
    </p:output>
    <p:xslt name="odd2odd">
        <p:input port="source">
            <p:pipe step="generateDocumentation" port="source"/>
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
    <p:xslt name="xmlbase-fix">
        <p:input port="source">
            <p:pipe step="contributors" port="result"/>
        </p:input>
        <p:input port="stylesheet">
            <!--  includes an xml:base fix for ugly and unnecessary attributes in our examples-->
            <p:document href="../stylesheets/xmlbase-fix.xsl"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>
    <p:store href="results-new/odd2xmlbase-fixed.xml" method="xml" indent="false"/>
    <p:xslt name="odd2html">
        <p:input port="source">
            <p:pipe step="xmlbase-fix" port="result"/>
        </p:input>
        <p:input port="stylesheet">
            <p:pipe port="stylesheet-odd2html" step="generateDocumentation"/>
        </p:input>
        <p:input port="parameters">
            <p:empty/>
        </p:input>
    </p:xslt>
    <p:store href="results-new/odd2html-pre.html" method="xml" indent="false"/>
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
</p:declare-step>
