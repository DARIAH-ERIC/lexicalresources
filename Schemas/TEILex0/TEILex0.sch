<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"></ns>

    <title>TEI Lex-0 Schematron Rules</title>
    
    <p>This is an experimental set of schematron rules that should be used along the TEI Lex-0
    schema to provide additional constraints not provided by the schema itself. </p>

    <!-- 2019-02-24 (TT):  Allow only one text per TEI-->
    <pattern>
        <rule context="tei:TEI/tei:text">
            <report test="preceding-sibling::tei:text">There should be no more than one <name/> element as child of TEI.</report>
        </rule>
    </pattern>

    <!-- 2019-02-24 (TT):  Allow only one gramGrp per node-->
  <pattern>
    <rule context="tei:*/tei:gramGrp">
        <report test="preceding-sibling::tei:gramGrp">There should be no more than one <name/> element as child of <value-of select="name(..)"/>.</report>
    </rule>
    </pattern>
    
    <!-- 2020-06-18 (TT):  Allow only one gramGrp per node-->
    
    <pattern>
        <rule context="tei:entry/tei:entry">
            <report test="not(@type)">Nested entries should be typed. TEI Lex-0 recommends <![CDATA[<entry type='relatedEntry'></entry>]]>.</report>
        </rule>
    </pattern>

</schema>
