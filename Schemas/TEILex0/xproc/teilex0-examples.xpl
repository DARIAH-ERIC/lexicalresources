<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
    xmlns:c="http://www.w3.org/ns/xproc-step" version="1.0" xpath-version="2.0">
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
    <p:directory-list exclude-filter=".+stripped\.xml$" path="../TEILex0.examples/headers"></p:directory-list>
    <p:for-each>
       <p:iteration-source select="//c:file"></p:iteration-source>
        <p:variable name="filename" select="substring-before(/c:file/@name, '.xml')"></p:variable>
        <p:load>
            <p:with-option name="href" select="concat('../TEILex0.examples/headers/', $filename, '.xml')"/>
        </p:load>
        <p:xslt>
            <p:input port="source"></p:input>
            <p:input port="stylesheet">
                <p:document href="../stylesheets/tei-stripper.xsl"></p:document>
            </p:input>
            <p:input port="parameters">
                <p:empty/>
            </p:input>         
        </p:xslt>
        <p:store>
            <p:with-option name="href" select="concat('../TEILex0.examples/headers/', $filename, '.stripped.xml')"></p:with-option>
        </p:store>
    </p:for-each>
</p:declare-step>