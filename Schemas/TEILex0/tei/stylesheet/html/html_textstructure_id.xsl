<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet version="3.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

  <xsl:template match="front|body|back">
    <div class="tei_{local-name()}">
      <xsl:apply-templates select="@xml:id | node()"/>
    </div>
  </xsl:template>

</xsl:stylesheet>