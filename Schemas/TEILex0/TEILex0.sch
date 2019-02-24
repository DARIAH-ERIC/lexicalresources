<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"></ns>

    <title>TEI Lex-0 Schematron Rules</title>
    
    <p>This is an experimental set of schematron rules that should be used along the TEI Lex-0
    schema to provide additional constraints not provided by the schema itself. </p>

    <!-- 2019-02-24 (TT):  Allow only one gramGrp per entry-->
  <pattern>
    <rule context="tei:entry/tei:gramGrp">
        <report test="preceding-sibling::tei:gramGrp">There should be no more than one <name/> element as child of entry.</report>
    </rule>
    </pattern>
    
    <!-- 2019-02-24 (TT):  Allow only one gramGrp per sense-->
    <pattern>
        <rule context="tei:sense/tei:gramGrp">
            <report test="preceding-sibling::tei:gramGrp">There should be no more than one <name/> element as child of sense.</report>
        </rule>
    </pattern>
    


</schema>
