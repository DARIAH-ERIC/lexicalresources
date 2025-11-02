<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet exclude-result-prefixes="#all" version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0" xmlns:xi="http://www.w3.org/2001/XInclude" xmlns:teix="http://www.tei-c.org/ns/Examples" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:i="http://www.iso.org/ns/1.0" xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:html="http://www.w3.org/1999/xhtml" xmlns:rng="http://relaxng.org/ns/structure/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <doc scope="stylesheet" type="stylesheet" xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>
         <p> TEI stylesheet definitions common for all of HTML, FO and LaTeX
      outputs </p>
         <p>This software is dual-licensed:

1. Distributed under a Creative Commons Attribution-ShareAlike 3.0
Unported License http://creativecommons.org/licenses/by-sa/3.0/ 

2. http://www.opensource.org/licenses/BSD-2-Clause
		


Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

* Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution.

This software is provided by the copyright holders and contributors
"as is" and any express or implied warranties, including, but not
limited to, the implied warranties of merchantability and fitness for
a particular purpose are disclaimed. In no event shall the copyright
holder or contributors be liable for any direct, indirect, incidental,
special, exemplary, or consequential damages (including, but not
limited to, procurement of substitute goods or services; loss of use,
data, or profits; or business interruption) however caused and on any
theory of liability, whether in contract, strict liability, or tort
(including negligence or otherwise) arising in any way out of the use
of this software, even if advised of the possibility of such damage.
</p>
         <p>Author: See AUTHORS</p>
         
         <p>Copyright: 2013, TEI Consortium</p>
      </desc>
   </doc>


  <doc class="localisation" type="string" xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc> The language to use when
    generating text (use ISO 2-letter codes)</desc>
   </doc>
  <xsl:param name="lang">en</xsl:param>
  <doc class="localisation" xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>[common] Prefix text before an auto-generated table of contents </desc>
   </doc>
  <doc class="localisation" type="string" xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc> The language the text is in
    (use ISO 2-letter codes)</desc>
   </doc>
  <xsl:param name="doclang"/>
  <doc class="localisation" xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>[common] Prefix text before an auto-generated table of contents </desc>
   </doc>
  <xsl:template name="contentsHeading">
      <xsl:sequence select="tei:i18n('contentsHeading')"/>
  </xsl:template>
  <doc class="localisation" xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>[common] Title for "Contents"; by default uses language-specific
      lookup table.</desc>
   </doc>
  <xsl:template name="contentsWord">
      <xsl:sequence select="tei:i18n('contentsWord')"/>
  </xsl:template>
  <doc class="localisation" xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>[common] Title for "Feedback"</desc>
   </doc>
  <xsl:template name="feedbackWords">
      <xsl:sequence select="tei:i18n('feedbackWords')"/>
  </xsl:template>
  <doc class="localisation" xmlns="http://www.oxygenxml.com/ns/doc/xsl">
      <desc>[common] Title for "Search"; by default uses language-specific
      lookup table. </desc>
   </doc>
  <xsl:template name="searchWords">
      <xsl:sequence select="tei:i18n('searchWords')"/>
  </xsl:template>
</xsl:stylesheet>