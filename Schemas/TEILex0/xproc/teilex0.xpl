<?xml version="1.0" encoding="UTF-8"?> 
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" xmlns:c="http://www.w3.org/ns/xproc-step"
    version="1.0">
    

    <p:serialization port="result" method="xml" indent="true" omit-xml-declaration="true"/>
    <p:serialization port="final" method="html" indent="false" doctype-system="about:legacy-compat" standalone="true"></p:serialization>
    <p:input port="source" sequence="true"/>
    <p:input port="parameters" kind="parameter"/>
    <p:output port="result" sequence="true" primary="false"></p:output>
    <p:output port="final" sequence="false" primary="true" ></p:output>

 
    <p:xinclude fixup-xml-base="false" fixup-xml-lang="false" name="expand"/>
    
    <p:xslt name="odd2odd">
        <p:input port="source">
            <p:pipe step="expand" port="result"></p:pipe>
        </p:input>
        <p:input port="stylesheet">

            <p:document href="../stylesheets/odd2odd.xsl"/>

        </p:input>
    </p:xslt>

    <p:store href="results/odd2odded.xml"/>
    
    <p:xslt name="odd2lite">
        <p:input port="source">
            <p:pipe step="odd2odd" port="result"></p:pipe>
        </p:input>
        <p:input port="stylesheet">

            <p:document href="../stylesheets/odd2lite.xsl"/>

        </p:input> 
    </p:xslt>
    <p:store href="results/odd2lit.xml"/>
    
    <p:xslt name="refs">
        <p:input port="source">
            <p:pipe step="odd2lite" port="result"></p:pipe>
        </p:input>
        <p:input port="stylesheet">
            <p:document href="../stylesheets/generate-ref-ids.xsl"/>
        </p:input>
    </p:xslt>

    <p:store href="results/refs.xml"/>
    
    <p:xslt name="html">
        <p:input port="source">
            <p:pipe step="refs" port="result"></p:pipe>
        </p:input>
        
        <!-- TEILex0.xsl has our template overrides + it imports odd2html -->

        <p:input port="stylesheet">
            <p:document href="../stylesheets/TEILex0.xsl"/>
        </p:input>
    </p:xslt>

    
    <p:store href="results/pre-processed.html"/>
    
    <p:xslt name="post-process">
        <p:input port="source">
            <p:pipe step="html" port="result"></p:pipe>
        </p:input>
        
        <!-- TEILex0.xsl has our template overrides + it imports odd2html -->
        <p:input port="stylesheet">
            <p:document href="../stylesheets/html-post-process.xsl"/>
        </p:input>
       

    </p:xslt>


</p:declare-step>
