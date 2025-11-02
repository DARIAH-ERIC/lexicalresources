<p:library  xmlns:p="http://www.w3.org/ns/xproc" 
 xmlns:xs="http://www.w3.org/2001/XMLSchema" 
 xmlns:xrm="https://www.tei-lex-0.dev/ns/xproc/resource-manager"
 xmlns:xrs="https://www.tei-lex-0.dev/ns/xproc/resources"
 xmlns:xhtml="http://www.w3.org/1999/xhtml"
 xmlns:c="http://www.w3.org/ns/xproc-step"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 version="3.0">
 
 <p:documentation>
  <xhtml:section>
   <xhtml:h1></xhtml:h1>
   <xhtml:p></xhtml:p>
  </xhtml:section>
 </p:documentation>
 
 <!-- 
      ×××××××××××××××××××××××××××
      ×××××  PIPELINE STEP  ×××××
      ×××××××××××××××××××××××××××
 -->
 <p:declare-step type="xrm:download-stylesheets" name="downloading-stylesheets">
  <p:documentation>
   <xhtml:section>
    <xhtml:h2></xhtml:h2>
    <xhtml:p></xhtml:p>
   </xhtml:section>
  </p:documentation>
  
  <!--
   >>>>>>>>>>>>>>>>>
   >> INPUT PORTS >>
   >>>>>>>>>>>>>>>>>
  -->
  <p:input  port="source" primary="true" />
  
  <!--
   <<<<<<<<<<<<<<<<<<
   << OUTPUT PORTS <<
   <<<<<<<<<<<<<<<<<<
  -->
  <p:output port="result" primary="true" sequence="true" />
  <p:output port="file-info" primary="false" sequence="true" pipe="result@downloads-result" />
  
  
  <!--
   +++++++++++++
   ++ OPTIONS ++
   +++++++++++++
  -->
  <p:option name="debug-path" as="xs:string?" select="()" />
  <p:option name="base-uri" as="xs:anyURI" select="static-base-uri()" />
  
  <p:option name="main-xslt-url" as="xs:anyURI" required="true"  />
  <p:option name="target-directory" as="xs:anyURI" required="true" />
  <p:option name="force-download" as="xs:boolean" select="false()" />
  
  <!--
   ÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷
   ÷÷ VARIABLES ÷÷
   ÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷
  -->
  <p:variable name="debug" select="$debug-path || '' ne ''" />
  <p:variable name="debug-path-uri" select="resolve-uri($debug-path, $base-uri)" />

  <p:variable name="file-name" select="tokenize($main-xslt-url, '/')[.][last()]" />
  <p:variable name="source-directory" select="substring-before($main-xslt-url, '/' || $file-name)" />
  
  
  <!--
   *******************
   ** PIPELINE BODY **
   *******************
  -->
  <xrm:download-file
   source-url="{$main-xslt-url}"
   target-directory="{$target-directory}"
   force-download="{$force-download}"
   debug-path="{$debug-path}"
   base-uri="{$base-uri}" />



  <xrm:identify-resources
   source-directory="{$source-directory}"
   target-directory="{$target-directory}"
   force-download="{$force-download}"
   debug-path="{$debug-path}"
   base-uri="{$base-uri}" 
  />
 
  <xrm:download-resources 
   debug-path="{$debug-path}"
   base-uri="{$base-uri}" 
  />
  <p:identity name="downloads-result">
<!--   <p:with-input pipe="file-info" />-->
   <p:with-input pipe="result" />
  </p:identity> 
  
 
 </p:declare-step>
 
 
 
<!-- 
  ×××××××××××××××××××××××××××
  ×××××  PIPELINE STEP  ×××××
  ×××××××××××××××××××××××××××
 -->
 <p:declare-step type="xrm:identify-resources" name="idetifying-resources">
  
  <p:documentation>
   <xhtml:section>
    <xhtml:h2></xhtml:h2>
    <xhtml:p></xhtml:p>
   </xhtml:section>
  </p:documentation>
  
  <!--
   >>>>>>>>>>>>>>>>>
   >> INPUT PORTS >>
   >>>>>>>>>>>>>>>>>
  -->
  <p:input port="source" primary="true" />
  
  <!--
   <<<<<<<<<<<<<<<<<<
   << OUTPUT PORTS <<
   <<<<<<<<<<<<<<<<<<
  -->
  <p:output port="result" primary="true"  />
  
  <!--
   +++++++++++++
   ++ OPTIONS ++
   +++++++++++++
  -->
  <p:option name="debug-path" select="()" as="xs:string?" />
  <p:option name="base-uri" as="xs:anyURI" select="static-base-uri()"/>
  
  <p:option name="source-directory" as="xs:anyURI" required="true" />
  <p:option name="target-directory" as="xs:anyURI" required="true" />
  <p:option name="force-download" as="xs:boolean" select="true()" />
  
  <!--
   ÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷
   ÷÷ VARIABLES ÷÷
   ÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷
  -->
  <p:variable name="debug" select="$debug-path || '' ne ''" />
  <p:variable name="debug-path-uri" select="resolve-uri($debug-path, $base-uri)" />
  
  <!--
   *******************
   ** PIPELINE BODY **
   *******************
  -->
  
  <p:for-each>
   <p:with-input select="//xsl:include[@href] | //xsl:import[@href]"/>
   <p:variable name="href" select="/*/@href" />
   <p:variable name="source-uri" select="p:urify(concat($source-directory, '/', $href), $base-uri)" />
   <p:variable name="target-uri" select="p:urify(concat($target-directory, '/', $href), $base-uri)" />
   <p:rename match="*" new-name="xrs:resource" />
   <p:set-attributes attributes="map { 'source' : $source-uri,
                                       'target' : $target-uri,
                                        'force-download' : $force-download }" 
   />
   
  </p:for-each>
  
  <p:wrap-sequence wrapper="xrs:resources" />
  
  <p:identity />
  
 </p:declare-step>
 
 
 
<!-- 
  ×××××××××××××××××××××××××××
  ×××××  PIPELINE STEP  ×××××
  ×××××××××××××××××××××××××××
 -->
 <p:declare-step type="xrm:download-file" name="downloading-file">
  
  <p:documentation>
   <xhtml:section>
    <xhtml:h2></xhtml:h2>
    <xhtml:p></xhtml:p>
   </xhtml:section>
  </p:documentation>
  
  <!--
   >>>>>>>>>>>>>>>>>
   >> INPUT PORTS >>
   >>>>>>>>>>>>>>>>>
  -->
  <p:input port="source" primary="true" />
  
  <!--
   <<<<<<<<<<<<<<<<<<
   << OUTPUT PORTS <<
   <<<<<<<<<<<<<<<<<<
  -->
  <p:output port="result" primary="true" pipe="result@file-content"  />
  <p:output port="file-info" primary="false" pipe="result@result-file"  />
  
  <!--
   +++++++++++++
   ++ OPTIONS ++
   +++++++++++++
  -->
  <p:option name="debug-path" select="()" as="xs:string?" />
  <p:option name="base-uri" as="xs:anyURI" select="static-base-uri()"/>
  
  <p:option name="source-url" as="xs:anyURI" required="true" />
  <p:option name="target-directory" as="xs:anyURI" required="true" />
  <p:option name="force-download" as="xs:boolean" select="false()" />
  
  <!--
   ÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷
   ÷÷ VARIABLES ÷÷
   ÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷
  -->
  <p:variable name="debug" select="$debug-path || '' ne ''" />
  <p:variable name="debug-path-uri" select="p:urify($debug-path, $base-uri)" />
  
  <p:variable name="target-directory-uri" select="p:urify($target-directory, $base-uri)" />
  <p:variable name="file-name" select="tokenize($source-url, '/')[.][last()]" />
  
  <!--
   *******************
   ** PIPELINE BODY **
   *******************
  -->
  <p:file-info href="{$target-directory-uri}/{$file-name}" fail-on-error="false" />
  <p:variable name="file-exists" select="exists(/c:file)"  />
  
  <p:choose>
   <p:when test="$file-exists and not($force-download)">
    <p:load href="{$target-directory-uri}/{$file-name}" message="... |-: xrm:download-file :-| ... file {$file-name} exists, loading content from {$target-directory-uri}/{$file-name}" />
   </p:when>
   <p:otherwise>
    <p:http-request href="{$source-url}" message="... |-: xrm:download-file :-| ... downloading {$file-name}" />
    <p:store href="{$target-directory-uri}/{$file-name}" message="... |-: xrm:download-file :-| ... storing to {$target-directory-uri}/{$file-name}" />
   </p:otherwise>
  </p:choose>
  
  <p:identity  name="file-content" />
  
  <p:file-info href="{$target-directory-uri}/{$file-name}" fail-on-error="false" name="result-file" />
  
  
 </p:declare-step>
 
 
<!-- 
  ×××××××××××××××××××××××××××
  ×××××  PIPELINE STEP  ×××××
  ×××××××××××××××××××××××××××
 -->
 <p:declare-step type="xrm:download-resources">
  
  <p:documentation>
   <xhtml:section>
    <xhtml:h2></xhtml:h2>
    <xhtml:p></xhtml:p>
   </xhtml:section>
  </p:documentation>
  
  <!--
   >>>>>>>>>>>>>>>>>
   >> INPUT PORTS >>
   >>>>>>>>>>>>>>>>>
  -->
  <p:input port="source" primary="true" />
  
  <!--
   <<<<<<<<<<<<<<<<<<
   << OUTPUT PORTS <<
   <<<<<<<<<<<<<<<<<<
  -->
  <p:output port="result" primary="true"  />
  
  <!--
   +++++++++++++
   ++ OPTIONS ++
   +++++++++++++
  -->
  <p:option name="debug-path" select="()" as="xs:string?" />
  <p:option name="base-uri" as="xs:anyURI" select="static-base-uri()"/>
  
  <!--
   ÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷
   ÷÷ VARIABLES ÷÷
   ÷÷÷÷÷÷÷÷÷÷÷÷÷÷÷
  -->
  <p:variable name="debug" select="$debug-path || '' ne ''" />
  <p:variable name="debug-path-uri" select="resolve-uri($debug-path, $base-uri)" />
  
  <!--
   *******************
   ** PIPELINE BODY **
   *******************
  -->
  
  <p:viewport match="xrs:resource[not(@checked='true')]" message="   ... |:- xrm:download-resources -:|">
   <p:variable name="root" select="." />
   <p:variable name="force-download" select="xs:boolean(/xrs:resource/@force-download)" />
   <p:variable name="target-uri" select="/xrs:resource/@target" />
   <p:variable name="source-url" select="/xrs:resource/@source" />
   <p:variable name="file-name" select="tokenize($source-url, '/')[.][last()]" />
   <p:variable name="target-directory" select="substring-before($target-uri, '/' || $file-name)" />
   <p:variable name="source-directory" select="substring-before($source-url, '/' || $file-name)" />
   <p:file-info href="{$target-uri}" fail-on-error="false" />
   <p:variable name="file-exists" select="exists(/c:file)"  />
   
   <p:choose message="... |:- xrm:download-resources -:| choosing for {$target-uri}">
    <p:when test="$file-exists and not($force-download)">
     <p:load href="{$target-uri}" message="... |-: xrm:download-resources :-| ... file exists, loading content from {$target-uri}" />
    </p:when>
    <p:otherwise>
     <p:http-request href="{$source-url}" message="... |-: xrm:download-resources :-| ... downloading {$source-url}" />
     <p:store href="{$target-uri}" message="... |-: xrm:download-resources :-| ... storing to {$target-uri}" />
    </p:otherwise>
   </p:choose>
   
   <xrm:identify-resources
    source-directory="{$source-directory}"
    target-directory="{$target-directory}"
    force-download="{$force-download}"
    debug-path="{$debug-path}"
    base-uri="{$base-uri}" 
    name="resources" />
   
   <p:file-info href="{$target-uri}" fail-on-error="false" name="file-info" />
   
   <p:identity>
    <p:with-input select="$root" />
   </p:identity>
   <p:add-attribute attribute-name="checked" attribute-value="true" />
   <p:insert position="first-child">
    <p:with-input port="insertion" pipe="result@file-info result@resources" />
   </p:insert>
  </p:viewport>
  
  <p:if test="//xrs:resource[not(@checked='true')]">
   <xrm:download-resources 
    debug-path="{$debug-path}"
    base-uri="{$base-uri}" 
   />
  </p:if>
  
 </p:declare-step>
 
 
</p:library>