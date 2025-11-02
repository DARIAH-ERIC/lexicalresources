<p:declare-step 
	xmlns:p="http://www.w3.org/ns/xproc" 
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xrm="https://www.tei-lex-0.dev/ns/xproc/resource-manager"
	xmlns:xrs="https://www.tei-lex-0.dev/ns/xproc/resources"
	xmlns:xhtml="http://www.w3.org/1999/xhtml"
	version="3.0">
	
	<p:import href="resources-xpc-lib.xpl" />
	
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
  <p:input port="source" primary="true">
  	<document />
  </p:input>
   
	<!--
   <<<<<<<<<<<<<<<<<<
   << OUTPUT PORTS <<
   <<<<<<<<<<<<<<<<<<
  -->
	<p:output port="result" primary="true" pipe="result@download-file-info" sequence="true" serialization="map {'indent' : true()}"/>
	
	<!--
   +++++++++++++
   ++ OPTIONS ++
   +++++++++++++
  -->
	<p:option name="debug-path" as="xs:string?" select="()" />
	<p:option name="base-uri" as="xs:anyURI" select="static-base-uri()" />
	
	<p:option name="main-xslt-url" as="xs:anyURI" select="'https://www.tei-c.org/release/xml/tei/stylesheet/html/html.xsl'"/>
	<p:option name="target-directory" as="xs:anyURI"  select="'../tei/stylesheet/html'"/>
	<p:option name="force-download" as="xs:boolean" select="false()" />
	
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
	
	<xrm:download-file source-url="https://www.tei-c.org/release/xml/tei/stylesheet/i18n.xml"
		target-directory="{$target-directory}/.."
		force-download="{$force-download}"
		debug-path="{$debug-path}"
		base-uri="{$base-uri}"
		/>
	
	<xrm:download-stylesheets main-xslt-url="{$main-xslt-url}"
		target-directory="{$target-directory}"
		force-download="{$force-download}"
		debug-path="{$debug-path}"
		base-uri="{$base-uri}" 
	/>
	
	<p:identity name="download-file-info">
		<p:with-input pipe="file-info" />
	</p:identity>
	
	<p:store href="../tei/resources.xml" use-when="false()" />

</p:declare-step>
