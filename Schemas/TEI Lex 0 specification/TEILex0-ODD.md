#TEI Lex-0 — A baseline encoding for lexicographic data


<!--TEI front-->Table of contents

* [1. Introduction](#1-introduction)
  * [1.1. Context](#11-context)
  * [1.2. Dictionary model vs. XML serialization](#12-dictionary-model-vs-xml-serialization)
* [2. Entries and entry-like objects](#2-entries-and-entry-like-objects)
  * [2.1. Unified representation of entries](#21-unified-representation-of-entries)
  * [2.2. Changes to the content model of entry](#22-changes-to-the-content-model-of-entry)
  * [2.3. Types of entries](#23-types-of-entries)
* [3. Towards a more systematic use of sense](#3-towards-a-more-systematic-use-of-sense)
  * [3.1. Guidelines](#31-guidelines)
  * [3.2. A limited number of possible contexts for def](#32-a-limited-number-of-possible-contexts-for-def)
  * [3.3. Encoding sense in entries with multiple parts of speech](#33-encoding-sense-in-entries-with-multiple-parts-of-speech)
  * [3.4. Case of bilingual dictionaries](#34-case-of-bilingual-dictionaries)
  * [3.5. Deprecating hom](#35-deprecating-hom)
* [4. Written and Spoken Forms](#4-written-and-spoken-forms)
  * [4.1. A note on inheritance](#41-a-note-on-inheritance)
  * [4.2. Grammatical properties of lexical entries](#42-grammatical-properties-of-lexical-entries)
  * [4.3. Representation of the lemma](#43-representation-of-the-lemma)
  * [4.4. Representation of inflected forms](#44-representation-of-inflected-forms)
  * [4.5. Paradigms](#45-paradigms)
  * [4.6. Representation of variants](#46-representation-of-variants)
    * [4.6.1. Orthographic variation](#461-orthographic-variation)
    * [4.6.2. Phonetic Variation](#462-phonetic-variation)
    * [4.6.3. Regional or dialectal Variation](#463-regional-or-dialectal-variation)
* [5. Structured lexical references (xr/ref)](#5-structured-lexical-references-xrref)
  * [5.1. Motivation](#51-motivation)
  * [5.2. Proposal: Using ref and xr to point to lexical entities](#52-proposal-using-ref-and-xr-to-point-to-lexical-entities)
    * [5.2.1. Typology for xr/@type values](#521-typology-for-xr@type-values)
    * [5.2.2. Suggested values of ref/@target](#522-suggested-values-of-ref@target)
    * [5.2.3. How TEI Lex-0 differs from TEI Guidelines](#523-how-tei-lex-0-differs-from-tei-guidelines)
  * [5.3. xr and ref: further examples](#53-xr-and-ref-further-examples)
    * [5.3.1. Simple cross-reference to an entry](#531-simple-cross-reference-to-an-entry)
    * [5.3.2. More complex example including quotations](#532-more-complex-example-including-quotations)
    * [5.3.3. Synonym, hyperonym, etc as (part of) a definition (“synonym definition", “genus proximum”)](#533-synonym-hyperonym-etc-as-part-of-a-definition-“synonym-definition"-“genus-proximum”)
* [6. Usage information](#6-usage-information)
  * [6.1. Label-like vs. narrative usage descriptions](#61-label-like-vs-narrative-usage-descriptions)
  * [6.2. Types of usage information](#62-types-of-usage-information)
  * [6.3. Restricting the scope of usg](#63-restricting-the-scope-of-usg)
* [7. References](#7-references)
* [8. Misc. examples (these are various leftovers, TODO cleanup)](#8-misc-examples-these-are-various-leftovers-todo-cleanup)
  * [8.1. X.2.](#81-x2)
  * [8.2. X.3.](#82-x3)
* [9. Cited sources](#9-cited-sources)
* [10. Bibliography](#10-bibliography)
* [11. Annex A: Arabic examples to illustrate recursive entries](#11-annex-a-arabic-examples-to-illustrate-recursive-entries)
* [12. Annex B: additional examples (could be referenced in the main text)](#12-annex-b-additional-examples-could-be-referenced-in-the-main-text)
  * [12.1. Implicit grammatical information (morpheme or particle)](#121-implicit-grammatical-information-morpheme-or-particle)
* [13. Specification](#13-specification)
  * [13.1. Elements](#131-elements)
    * [13.1.1. &lt;TEI&gt;](#1311-&lt;tei&gt;)
    * [13.1.2. &lt;abstract&gt;](#1312-&lt;abstract&gt;)
    * [13.1.3. &lt;author&gt;](#1313-&lt;author&gt;)
    * [13.1.4. &lt;authority&gt;](#1314-&lt;authority&gt;)
    * [13.1.5. &lt;availability&gt;](#1315-&lt;availability&gt;)
    * [13.1.6. &lt;back&gt;](#1316-&lt;back&gt;)
    * [13.1.7. &lt;body&gt;](#1317-&lt;body&gt;)
    * [13.1.8. &lt;c&gt;](#1318-&lt;c&gt;)
    * [13.1.9. &lt;case&gt;](#1319-&lt;case&gt;)
    * [13.1.10. &lt;catRef&gt;](#13110-&lt;catref&gt;)
    * [13.1.11. &lt;category&gt;](#13111-&lt;category&gt;)
    * [13.1.12. &lt;change&gt;](#13112-&lt;change&gt;)
    * [13.1.13. &lt;char&gt;](#13113-&lt;char&gt;)
    * [13.1.14. &lt;charDecl&gt;](#13114-&lt;chardecl&gt;)
    * [13.1.15. &lt;charName&gt;](#13115-&lt;charname&gt;)
    * [13.1.16. &lt;charProp&gt;](#13116-&lt;charprop&gt;)
    * [13.1.17. &lt;cit&gt;](#13117-&lt;cit&gt;)
    * [13.1.18. &lt;classCode&gt;](#13118-&lt;classcode&gt;)
    * [13.1.19. &lt;classDecl&gt;](#13119-&lt;classdecl&gt;)
    * [13.1.20. &lt;colloc&gt;](#13120-&lt;colloc&gt;)
    * [13.1.21. &lt;correspAction&gt;](#13121-&lt;correspaction&gt;)
    * [13.1.22. &lt;correspContext&gt;](#13122-&lt;correspcontext&gt;)
    * [13.1.23. &lt;correspDesc&gt;](#13123-&lt;correspdesc&gt;)
    * [13.1.24. &lt;creation&gt;](#13124-&lt;creation&gt;)
    * [13.1.25. &lt;def&gt;](#13125-&lt;def&gt;)
    * [13.1.26. &lt;dictScrap&gt;](#13126-&lt;dictscrap&gt;)
    * [13.1.27. &lt;distributor&gt;](#13127-&lt;distributor&gt;)
    * [13.1.28. &lt;div&gt;](#13128-&lt;div&gt;)
    * [13.1.29. &lt;edition&gt;](#13129-&lt;edition&gt;)
    * [13.1.30. &lt;editionStmt&gt;](#13130-&lt;editionstmt&gt;)
    * [13.1.31. &lt;editorialDecl&gt;](#13131-&lt;editorialdecl&gt;)
    * [13.1.32. &lt;encodingDesc&gt;](#13132-&lt;encodingdesc&gt;)
    * [13.1.33. &lt;entry&gt;](#13133-&lt;entry&gt;)
    * [13.1.34. &lt;etym&gt;](#13134-&lt;etym&gt;)
    * [13.1.35. &lt;fileDesc&gt;](#13135-&lt;filedesc&gt;)
    * [13.1.36. &lt;form&gt;](#13136-&lt;form&gt;)
    * [13.1.37. &lt;front&gt;](#13137-&lt;front&gt;)
    * [13.1.38. &lt;funder&gt;](#13138-&lt;funder&gt;)
    * [13.1.39. &lt;g&gt;](#13139-&lt;g&gt;)
    * [13.1.40. &lt;gen&gt;](#13140-&lt;gen&gt;)
    * [13.1.41. &lt;geoDecl&gt;](#13141-&lt;geodecl&gt;)
    * [13.1.42. &lt;glyph&gt;](#13142-&lt;glyph&gt;)
    * [13.1.43. &lt;glyphName&gt;](#13143-&lt;glyphname&gt;)
    * [13.1.44. &lt;gram&gt;](#13144-&lt;gram&gt;)
    * [13.1.45. &lt;gramGrp&gt;](#13145-&lt;gramgrp&gt;)
    * [13.1.46. &lt;head&gt;](#13146-&lt;head&gt;)
    * [13.1.47. &lt;hyph&gt;](#13147-&lt;hyph&gt;)
    * [13.1.48. &lt;hyphenation&gt;](#13148-&lt;hyphenation&gt;)
    * [13.1.49. &lt;iType&gt;](#13149-&lt;itype&gt;)
    * [13.1.50. &lt;idno&gt;](#13150-&lt;idno&gt;)
    * [13.1.51. &lt;interpretation&gt;](#13151-&lt;interpretation&gt;)
    * [13.1.52. &lt;item&gt;](#13152-&lt;item&gt;)
    * [13.1.53. &lt;keywords&gt;](#13153-&lt;keywords&gt;)
    * [13.1.54. &lt;label&gt;](#13154-&lt;label&gt;)
    * [13.1.55. &lt;lang&gt;](#13155-&lt;lang&gt;)
    * [13.1.56. &lt;langUsage&gt;](#13156-&lt;langusage&gt;)
    * [13.1.57. &lt;language&gt;](#13157-&lt;language&gt;)
    * [13.1.58. &lt;lbl&gt;](#13158-&lt;lbl&gt;)
    * [13.1.59. &lt;licence&gt;](#13159-&lt;licence&gt;)
    * [13.1.60. &lt;list&gt;](#13160-&lt;list&gt;)
    * [13.1.61. &lt;listChange&gt;](#13161-&lt;listchange&gt;)
    * [13.1.62. &lt;listPrefixDef&gt;](#13162-&lt;listprefixdef&gt;)
    * [13.1.63. &lt;mapping&gt;](#13163-&lt;mapping&gt;)
    * [13.1.64. &lt;mood&gt;](#13164-&lt;mood&gt;)
    * [13.1.65. &lt;namespace&gt;](#13165-&lt;namespace&gt;)
    * [13.1.66. &lt;normalization&gt;](#13166-&lt;normalization&gt;)
    * [13.1.67. &lt;notesStmt&gt;](#13167-&lt;notesstmt&gt;)
    * [13.1.68. &lt;number&gt;](#13168-&lt;number&gt;)
    * [13.1.69. &lt;oRef&gt;](#13169-&lt;oref&gt;)
    * [13.1.70. &lt;orth&gt;](#13170-&lt;orth&gt;)
    * [13.1.71. &lt;p&gt;](#13171-&lt;p&gt;)
    * [13.1.72. &lt;pRef&gt;](#13172-&lt;pref&gt;)
    * [13.1.73. &lt;pc&gt;](#13173-&lt;pc&gt;)
    * [13.1.74. &lt;per&gt;](#13174-&lt;per&gt;)
    * [13.1.75. &lt;pos&gt;](#13175-&lt;pos&gt;)
    * [13.1.76. &lt;prefixDef&gt;](#13176-&lt;prefixdef&gt;)
    * [13.1.77. &lt;principal&gt;](#13177-&lt;principal&gt;)
    * [13.1.78. &lt;profileDesc&gt;](#13178-&lt;profiledesc&gt;)
    * [13.1.79. &lt;projectDesc&gt;](#13179-&lt;projectdesc&gt;)
    * [13.1.80. &lt;pron&gt;](#13180-&lt;pron&gt;)
    * [13.1.81. &lt;publicationStmt&gt;](#13181-&lt;publicationstmt&gt;)
    * [13.1.82. &lt;punctuation&gt;](#13182-&lt;punctuation&gt;)
    * [13.1.83. &lt;quotation&gt;](#13183-&lt;quotation&gt;)
    * [13.1.84. &lt;refState&gt;](#13184-&lt;refstate&gt;)
    * [13.1.85. &lt;refsDecl&gt;](#13185-&lt;refsdecl&gt;)
    * [13.1.86. &lt;rendition&gt;](#13186-&lt;rendition&gt;)
    * [13.1.87. &lt;revisionDesc&gt;](#13187-&lt;revisiondesc&gt;)
    * [13.1.88. &lt;samplingDecl&gt;](#13188-&lt;samplingdecl&gt;)
    * [13.1.89. &lt;schemaRef&gt;](#13189-&lt;schemaref&gt;)
    * [13.1.90. &lt;scriptNote&gt;](#13190-&lt;scriptnote&gt;)
    * [13.1.91. &lt;seg&gt;](#13191-&lt;seg&gt;)
    * [13.1.92. &lt;segmentation&gt;](#13192-&lt;segmentation&gt;)
    * [13.1.93. &lt;sense&gt;](#13193-&lt;sense&gt;)
    * [13.1.94. &lt;seriesStmt&gt;](#13194-&lt;seriesstmt&gt;)
    * [13.1.95. &lt;sourceDesc&gt;](#13195-&lt;sourcedesc&gt;)
    * [13.1.96. &lt;sponsor&gt;](#13196-&lt;sponsor&gt;)
    * [13.1.97. &lt;stress&gt;](#13197-&lt;stress&gt;)
    * [13.1.98. &lt;subc&gt;](#13198-&lt;subc&gt;)
    * [13.1.99. &lt;syll&gt;](#13199-&lt;syll&gt;)
    * [13.1.100. &lt;taxonomy&gt;](#131100-&lt;taxonomy&gt;)
    * [13.1.101. &lt;teiHeader&gt;](#131101-&lt;teiheader&gt;)
    * [13.1.102. &lt;text&gt;](#131102-&lt;text&gt;)
    * [13.1.103. &lt;title&gt;](#131103-&lt;title&gt;)
    * [13.1.104. &lt;titleStmt&gt;](#131104-&lt;titlestmt&gt;)
    * [13.1.105. &lt;tns&gt;](#131105-&lt;tns&gt;)
    * [13.1.106. &lt;unicodeName&gt;](#131106-&lt;unicodename&gt;)
    * [13.1.107. &lt;usg&gt;](#131107-&lt;usg&gt;)
    * [13.1.108. &lt;value&gt;](#131108-&lt;value&gt;)
    * [13.1.109. &lt;xenoData&gt;](#131109-&lt;xenodata&gt;)
    * [13.1.110. &lt;xr&gt;](#131110-&lt;xr&gt;)
  * [13.2. Model classes](#132-model-classes)
    * [13.2.1. model.availabilityPart](#1321-modelavailabilitypart)
    * [13.2.2. model.common](#1322-modelcommon)
    * [13.2.3. model.correspActionPart](#1323-modelcorrespactionpart)
    * [13.2.4. model.correspContextPart](#1324-modelcorrespcontextpart)
    * [13.2.5. model.correspDescPart](#1325-modelcorrespdescpart)
    * [13.2.6. model.divBottom](#1326-modeldivbottom)
    * [13.2.7. model.divLike](#1327-modeldivlike)
    * [13.2.8. model.divPart](#1328-modeldivpart)
    * [13.2.9. model.divTop](#1329-modeldivtop)
    * [13.2.10. model.divTopPart](#13210-modeldivtoppart)
    * [13.2.11. model.editorialDeclPart](#13211-modeleditorialdeclpart)
    * [13.2.12. model.emphLike](#13212-modelemphlike)
    * [13.2.13. model.encodingDescPart](#13213-modelencodingdescpart)
    * [13.2.14. model.entryLike](#13214-modelentrylike)
    * [13.2.15. model.entryPart](#13215-modelentrypart)
    * [13.2.16. model.entryPart.top](#13216-modelentryparttop)
    * [13.2.17. model.formPart](#13217-modelformpart)
    * [13.2.18. model.frontPart](#13218-modelfrontpart)
    * [13.2.19. model.gLike](#13219-modelglike)
    * [13.2.20. model.global](#13220-modelglobal)
    * [13.2.21. model.gramPart](#13221-modelgrampart)
    * [13.2.22. model.headLike](#13222-modelheadlike)
    * [13.2.23. model.highlighted](#13223-modelhighlighted)
    * [13.2.24. model.inter](#13224-modelinter)
    * [13.2.25. model.labelLike](#13225-modellabellike)
    * [13.2.26. model.lexicalRefinement](#13226-modellexicalrefinement)
    * [13.2.27. model.limitedPhrase](#13227-modellimitedphrase)
    * [13.2.28. model.listLike](#13228-modellistlike)
    * [13.2.29. model.morphLike](#13229-modelmorphlike)
    * [13.2.30. model.nameLike](#13230-modelnamelike)
    * [13.2.31. model.pLike](#13231-modelplike)
    * [13.2.32. model.pLike.front](#13232-modelplikefront)
    * [13.2.33. model.pPart.data](#13233-modelppartdata)
    * [13.2.34. model.pPart.edit](#13234-modelppartedit)
    * [13.2.35. model.phrase](#13235-modelphrase)
    * [13.2.36. model.placeStateLike](#13236-modelplacestatelike)
    * [13.2.37. model.profileDescPart](#13237-modelprofiledescpart)
    * [13.2.38. model.ptrLike.form](#13238-modelptrlikeform)
    * [13.2.39. model.publicationStmtPart.agency](#13239-modelpublicationstmtpartagency)
    * [13.2.40. model.publicationStmtPart.detail](#13240-modelpublicationstmtpartdetail)
    * [13.2.41. model.qLike](#13241-modelqlike)
    * [13.2.42. model.quoteLike](#13242-modelquotelike)
    * [13.2.43. model.resourceLike](#13243-modelresourcelike)
    * [13.2.44. model.respLike](#13244-modelresplike)
    * [13.2.45. model.segLike](#13245-modelseglike)
    * [13.2.46. model.sensePart](#13246-modelsensepart)
    * [13.2.47. model.teiHeaderPart](#13247-modelteiheaderpart)
  * [13.3. Attribute classes](#133-attribute-classes)
    * [13.3.1. att.ascribed](#1331-attascribed)
    * [13.3.2. att.canonical](#1332-attcanonical)
    * [13.3.3. att.datable](#1333-attdatable)
    * [13.3.4. att.datable.w3c](#1334-attdatablew3c)
    * [13.3.5. att.datcat](#1335-attdatcat)
    * [13.3.6. att.declarable](#1336-attdeclarable)
    * [13.3.7. att.declaring](#1337-attdeclaring)
    * [13.3.8. att.divLike](#1338-attdivlike)
    * [13.3.9. att.docStatus](#1339-attdocstatus)
    * [13.3.10. att.edition](#13310-attedition)
    * [13.3.11. att.entryLike](#13311-attentrylike)
    * [13.3.12. att.fragmentable](#13312-attfragmentable)
    * [13.3.13. att.global](#13313-attglobal)
    * [13.3.14. att.global.analytic](#13314-attglobalanalytic)
    * [13.3.15. att.global.linking](#13315-attgloballinking)
    * [13.3.16. att.global.rendition](#13316-attglobalrendition)
    * [13.3.17. att.global.responsibility](#13317-attglobalresponsibility)
    * [13.3.18. att.global.source](#13318-attglobalsource)
    * [13.3.19. att.handFeatures](#13319-atthandfeatures)
    * [13.3.20. att.lexicographic](#13320-attlexicographic)
    * [13.3.21. att.linguistic](#13321-attlinguistic)
    * [13.3.22. att.milestoneUnit](#13322-attmilestoneunit)
    * [13.3.23. att.naming](#13323-attnaming)
    * [13.3.24. att.notated](#13324-attnotated)
    * [13.3.25. att.partials](#13325-attpartials)
    * [13.3.26. att.patternReplacement](#13326-attpatternreplacement)
    * [13.3.27. att.placement](#13327-attplacement)
    * [13.3.28. att.pointing](#13328-attpointing)
    * [13.3.29. att.resourced](#13329-attresourced)
    * [13.3.30. att.segLike](#13330-attseglike)
    * [13.3.31. att.sortable](#13331-attsortable)
    * [13.3.32. att.styleDef](#13332-attstyledef)
    * [13.3.33. att.typed](#13333-atttyped)
    * [13.3.34. att.written](#13334-attwritten)
  * [13.4. Macros](#134-macros)
    * [13.4.1. macro.limitedContent](#1341-macrolimitedcontent)
    * [13.4.2. macro.paraContent](#1342-macroparacontent)
    * [13.4.3. macro.phraseSeq](#1343-macrophraseseq)
    * [13.4.4. macro.phraseSeq.limited](#1344-macrophraseseqlimited)
    * [13.4.5. macro.specialPara](#1345-macrospecialpara)
    * [13.4.6. macro.xtext](#1346-macroxtext)
  * [13.5. Datatypes](#135-datatypes)
    * [13.5.1. teidata.certainty](#1351-teidatacertainty)
    * [13.5.2. teidata.count](#1352-teidatacount)
    * [13.5.3. teidata.duration.iso](#1353-teidatadurationiso)
    * [13.5.4. teidata.duration.w3c](#1354-teidatadurationw3c)
    * [13.5.5. teidata.enumerated](#1355-teidataenumerated)
    * [13.5.6. teidata.language](#1356-teidatalanguage)
    * [13.5.7. teidata.name](#1357-teidataname)
    * [13.5.8. teidata.namespace](#1358-teidatanamespace)
    * [13.5.9. teidata.numeric](#1359-teidatanumeric)
    * [13.5.10. teidata.outputMeasurement](#13510-teidataoutputmeasurement)
    * [13.5.11. teidata.pattern](#13511-teidatapattern)
    * [13.5.12. teidata.pointer](#13512-teidatapointer)
    * [13.5.13. teidata.prefix](#13513-teidataprefix)
    * [13.5.14. teidata.probCert](#13514-teidataprobcert)
    * [13.5.15. teidata.probability](#13515-teidataprobability)
    * [13.5.16. teidata.replacement](#13516-teidatareplacement)
    * [13.5.17. teidata.temporal.w3c](#13517-teidatatemporalw3c)
    * [13.5.18. teidata.text](#13518-teidatatext)
    * [13.5.19. teidata.truthValue](#13519-teidatatruthvalue)
    * [13.5.20. teidata.version](#13520-teidataversion)
    * [13.5.21. teidata.versionNumber](#13521-teidataversionnumber)
    * [13.5.22. teidata.word](#13522-teidataword)
    * [13.5.23. teidata.xTruthValue](#13523-teidataxtruthvalue)
    * [13.5.24. teidata.xmlName](#13524-teidataxmlname)
    * [13.5.25. teidata.xpath](#13525-teidataxpath)

<!--TEI body-->## 1. Introduction
Achieving consistent encoding within a given community of practice has been a recurrent
issue for the TEI Guidelines. The topic is of particular importance for lexical data
if we think of the potential wealth of content we could gain from pooling together
the information available in the variety of highly structured, historical and contemporary
lexical resources. Still, the encoding possibilities offered by the Dictionaries Chapter
in the Guidelines are too numerous and too flexible to guarantee sufficient interoperability
and a coherent model for searching, visualising or enriching multiple lexical resources.

Following the spirit of TEI Analytics [Zillig, 2009], developed in the context of
the MONK project, <span xmlns="http://www.w3.org/1999/xhtml" style="font-weight:bold">TEI Lex-0</span> aims at establishing a baseline encoding and a target format to facilitate the interoperability
of heterogeneously encoded lexical resources. This is important both in the context
of building lexical infrastructures as such [Ermolaev and Tasovac, 2012] and in the
context of developing generic TEI-aware tools such as dictionary viewers and profilers.
T

TEI Lex-0 should not be thought of as a replacement of the Dictionary Chapter in the
TEI Guidelines or as the format that must be used for editing or managing individual
resources, especially in those projects and/or institutions that already have established
workflows based on their own flavors of TEI. TEI Lex-0 should be primarily seen as
a format that existing TEI dictionaries can be univocally transformed to in order
to be queried, visualised, or mined in a uniform way. At the same time, however, there
is no reason why TEI Lex-0 could not or should not be used as a best-practice example
in educational settings or as a set of best-practice guidelines for new TEI-based
projects, especially considering the fact that in TEI Lex-0 we aimed to stay as aligned
as possible with the TEI subset developed in conjunction with the revision of the
ISO LMF (Lexical Markup Framework) standard (cf. [Romary, 2015])

### 1.1. Context
Preliminary work for the establishment of TEI Lex-0 started in the Working Group "Retrodigitised
Dictionaries" lead by Toma Tasovac and Vera Hildenbrandt as part of the COST Action
<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="http://www.elexicography.eu">European Network of e-Lexicography</a> (ENeL). Upon the completion of the COST Action, the work on TEI Lex-0 was taken up
by the DARIAH Working Group "Lexical Resources" which is co-chaired by Laurent Romary
and Toma Tasovac. Currently, the work on TEI Lex-0 is conducted by the DARIAH WG "Lexical
Resources" and the H2020-funded <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="https://elex.is">European Lexicographic Infrastructure</a> (ELEXIS).

The above paragraph should be expanded to include a list of meetings we organized,
who sponsored them, who attended etc. 

### 1.2. Dictionary model vs. XML serialization
A fundamental principle that the present enterprise relies on is the nature of the
mapping of the physical or “near-physical” (OCR-ed) dictionary contents onto the abstract
model of a dictionary structure, and the mapping from said model onto its (in our
case) TEI XML serialization. It is important to keep in mind the distinction between
the abstract model and its serialization because, as we shall see, the TEI uses the
same elements of the abstract model to serve many kinds of text-modelling tasks, and
standardly employs ‘features’ or ‘facets’ of these elements (known in the XML world
as attributes) to express differences among them. The fact that some elements of the
serialization have names closely corresponding to what we can customarily find in
the dictionary model is more or less a lucky coincidence. It is not the pattern to
be expected. A lexicographer coming from outside of the TEI universe should not necessarily
expect his or her customary terms (names of dictionary objects in the dictionary model)
to be straightforwardly reflected in the TEI vocabulary names.

Take, for instance, the TEI element <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.cit" title="<cit&gt;">&lt;cit&gt;</a>. Originally, its TEI name came from the word “citation” and this is what the element
was used for up to the early days of TEI P5, when it acquired a new, broader function
of grouping together pieces of text perceived or broadly treated as “foreign” or additional,
together with their (bibliographic, linguistic, or usage-oriented) description. This
element is nowadays used as a “container” for citations, dictionary examples, translation
equivalents etc. The value of the attribute <span xmlns="http://www.w3.org/1999/xhtml" class="att">type</span> is used to further specify the kind of cit-object at hand. In our case, four distinct
names of dictionary objects in the abstract dictionary model (namely, “citation”,
“example”, “translation” (of quotes) and “translation equivalent” (of words) map onto
four distinct element+attribute combinations in the TEI XML serialization (respectively,
<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.cit" title="<cit&gt;">&lt;cit&gt;</a> with <span xmlns="http://www.w3.org/1999/xhtml" class="att">type</span>="citation", <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.cit" title="<cit&gt;">&lt;cit&gt;</a> with <span xmlns="http://www.w3.org/1999/xhtml" class="att">type</span>="example", and <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.cit" title="<cit&gt;">&lt;cit&gt;</a> with <span xmlns="http://www.w3.org/1999/xhtml" class="att">type</span>="translation" or <span xmlns="http://www.w3.org/1999/xhtml" class="att">type</span>="translationEquivalent".

The following example from a bilingual dictionary, shows how one typed element – <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.cit" title="<cit&gt;">&lt;cit&gt;</a> – can be used to encode different parts of the dictionary structure:


```xml
<entry xmlns="http://www.tei-c.org/ns/Examples" xml:lang="fr">
   <form type="lemma">
      <orth>horrifier</orth>
   </form>
   <gramGrp>
      <gram type="pos">v</gram>
   </gramGrp>
   <sense>
      <cit type="translationEquivalent" xml:lang="en">
         <quote>horrify</quote>
      </cit>
      <cit type="example">
         <quote>elle était horrifiée par la dépense</quote>
         <cit type="translation" xml:lang="en">
            <quote>she was horrified at the expense</quote>
         </cit>
      </cit>
   </sense>
</entry>
```
## 2. Entries and entry-like objects
### 2.1. Unified representation of entries
In the current <span xmlns="http://www.w3.org/1999/xhtml" style="font-style:italic">Guidelines</span>, the TEI defines four different container elements that may serve as grouping devices
for lexical information on the level of entries (the following definitions are taken
from the TEI guidelines, emphasis added):


<ol xmlns="http://www.w3.org/1999/xhtml">
   <li class="item"><a class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a>: contains a single <span style="font-style:italic">structured entry</span> in any kind of lexical resource, such as a dictionary or lexicon.
   </li>
   <li class="item"><span class="gi">&lt;entryFree&gt;</span>: contains a single <span style="font-style:italic">unstructured entry</span> in any kind of lexical resource, such as a dictionary or lexicon.
   </li>
   <li class="item"><span class="gi">&lt;superEntry&gt;</span>: groups a sequence of entries within any kind of lexical resource, such as a dictionary
      or lexicon which function as a single unit, for example a set of homographs.
   </li>
   <li class="item"><span class="gi">&lt;re&gt;</span>: (related entry) contains a dictionary entry for a lexical item related to the headword,
      such as a compound phrase or derived form, embedded inside a larger entry.
   </li>
</ol>These four elements can be used to distinguish types of entries along two conceptual
axes:


<ol xmlns="http://www.w3.org/1999/xhtml">
   <li class="item"><span style="font-weight:bold">Containing vs. contained entries</span>: entries may contain additional lexical information that can be conceived as an additional
      dictionary entry in its own right. Specifically, <span class="gi">&lt;superEntry&gt;</span> may contain <a class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a> and <a class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a> in turn may contain <span class="gi">&lt;re&gt;</span> to represent the embedding of lexical entries on three distinct levels. Due to <span class="gi">&lt;re&gt;</span> being allowed to be used recursively, the number of levels for representing entry-like
      lexical information inside other such blocks is effectively unrestricted.
   </li>
   <li class="item"><span style="font-weight:bold">Structured vs. unstructured entries</span>, i. e. entries that can readily be represented (in the lexical view) in the spirit
      of the TEI Guideline’s Dictionary Chapter (<a class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a>, <span class="gi">&lt;re&gt;</span>) vs. entries that for some reason violate the generic content model of <a class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a> or <span class="gi">&lt;re&gt;</span> and thus have to be represented more freely (<span class="gi">&lt;entryFree&gt;</span>). A third category in this respect are entries that exhibit a highly reduced amount
      of lexical content while this content is still of essentially entry-like nature (<span class="gi">&lt;superEntry&gt;</span>).
   </li>
</ol>In TEI Lex-0, we refrain from this overly complex cross-classification of entries
with regard to their place within an entry hierarchy (first axis above) and the rigidity
of the lexical structuring they exhibit (second axis above). Instead of using four
different elements for entry-like objects, only <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a> is used. In order to still be able to construct hierarchies of embedded entries,
<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a> is in the context of TEI Lex-0 allowed to occur recursively (e.g. by making it part
of model.entryPart.top). This is where TEI Lex-0 departs from the TEI <span xmlns="http://www.w3.org/1999/xhtml" style="font-style:italic">Guidelines</span>, but this <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="https://github.com/TEIC/TEI/issues/1791">issue</a> has already been raised with TEI.

In the context of TEI-Lex-0, <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a> is used to encode the basic element of the dictionary microstructure; it groups all
the information related to a particular linguistic entity and may contain further
entries related to it (e.g. homographs or compound phrases).

The substitution of <span xmlns="http://www.w3.org/1999/xhtml" class="gi">&lt;re&gt;</span> and <span xmlns="http://www.w3.org/1999/xhtml" class="gi">&lt;superEntry&gt;</span> by <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a> is compatible with regard to the content model of the discarded elements. Both <span xmlns="http://www.w3.org/1999/xhtml" class="gi">&lt;re&gt;</span> and <span xmlns="http://www.w3.org/1999/xhtml" class="gi">&lt;superEntry&gt;</span> have content models that are proper subsets of the content model of <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a>. Instead of <span xmlns="http://www.w3.org/1999/xhtml" class="gi">&lt;superEntry&gt;</span> which most typically is used as a mere container for grouping lexical entries, either
an <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a> grouping entries can be used or the mechanisms implemented by att.global.linking
can be exploited.

Consider the following excerpt from the “Wörterbuch der deutschen Gegenwartssprache”
(“Dictionary of Contemporary German”, WDG, 1964–1977). In the WDG, compounds with
the same morphological dependant (but different heads) are grouped into nests. According
to the current TEI <span xmlns="http://www.w3.org/1999/xhtml" style="font-style:italic">Guidelines</span>, such a nest would most probably be serialized as follows:


```xml
<superEntry xmlns="http://www.tei-c.org/ns/Examples">
   <form>
      <orth>Haus-</orth>, 
      <orth>haus-</orth>:
   </form>
   <!-- possibly some shared usg information -->
   <entry>
      <form>
         <orth expand="Hausaltar">-altar</orth>, 
         <gramGrp>
            <gen value="masculine">der</gen>
         </gramGrp>
      </form>
      <sense>...</sense>
   </entry>
   <entry>
      <form>
         <orth expand="Hausandacht">-andacht</orth>, 
         <gramGrp>
            <gen value="feminine">die</gen>
         </gramGrp>
      </form>
      <sense>...</sense>
   </entry>
   <!-- ... -->
</superEntry>
```
In TEI-Lex-0, this nest of entries would be modelled as an <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a> in its own right. Note that the former <span xmlns="http://www.w3.org/1999/xhtml" class="gi">&lt;superEntry&gt;</span> was transformed into a typed entry (see <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TypesOfEntries" title="Types of entries">Types of entries</a> below for a detailed discussion of entry types):


```xml
<entry xmlns="http://www.tei-c.org/ns/Examples" type="wordFamily">
   <form type="base">
      <orth>Haus-</orth>
   </form>
   <pc>,</pc>
   <form type="base">
      <orth>haus-</orth>
   </form>
   <pc>:</pc>
   <!-- possibly some shared usg information -->
   <entry type="wordForm">
      <form type="lemma">
         <orth expand="Hausaltar">-altar</orth>
         <pc>,</pc>
         <gramGrp>
            <gen value="masculine">der</gen>
         </gramGrp>
      </form>
      <sense>...</sense>
   </entry>
   <entry type="wordForm">
      <form type="lemma">
         <orth expand="Hausandacht">-andacht</orth>
         <pc>,</pc>
         <gramGrp>
            <gen value="feminine">die</gen>
         </gramGrp>
      </form>
      <sense>...</sense>
   </entry>
   <!-- ... -->
</entry>
```
The same encoding strategy can be exploited when entries are grouped under a common
morphological root as is customary for Arabic dictionaries such as the 48th edition
of “The Dictionary of Language and Proper Nouns” (المنجد في اللغة والأعلام) presented
below:


```xml
<entry xmlns="http://www.tei-c.org/ns/Examples" type="wordFamily">
   <form type="root">
      <orth>ﺍﺮﻛ</orth>
      <pc>:</pc>
   </form>
   <entry n="١-" type="wordForm">
      <form type="lemma">
         <orth>ﺃَﺮَﻛَ</orth> -ُ ﺃُﺮُﻛًﺍ
      </form>
      <sense> ﺎﻠﺠﻤﻟُ: ﺎﻜﻟ ﻭﺮﻗ ﺍﻷﺭَﺎﻛِ ٠ ﺃَﺮَﻛَ ٠- ﺃَﺮَﻛًﺍ ﺎﻠﺠﻤﻟُ ﺎﺸﺘﻛﻯ ﺐﻄﻨﻫُ ﻢﻧ ﺄَﻜﻟ ﺍﻷﺭَﺎﻛِ ٠
         ﺍﻷﺭﺎﻛ (ﻥ): ﻭﺎﺣﺪﺘﻫُ ﺃَﺭﺎﻛﺓ ﺝ ﺃُﺮُﻛ ﻭ ﺃَﺭَﺎﺌِﻛ. ﺶﺟﺭ ﺫﻭ ﺵﻮﻛ. ﻁﻮﻴﻟ ﺎﻠﺳﺎﻗ، ﻚﺜﻳﺭ
         ﺎﻟﻭﺮﻗ ﻭ ﺍﻸﻐﺻﺎﻧ. ﺥﻭَّﺍﺭ ﺎﻠﻋﻭﺩ ﺖﺘَّﺧﺫ ﻢﻨﻫ ﺎﻠﻤﺳﺍﻮﻴﻛ
      </sense>
   </entry>
   <entry n="٢٠ -" type="wordForm">
      <form type="lemma">
         <orth>ﺃَﺮَﻛَ</orth>
      </form>
      <sense> ْ -َ ﺃَﺮَﻛًﺍ ﻭ ﺃَﺮِﻛَ ْ -ُ ﺃُﺮﻛًﺍ ﺎﻠﺟﺮﺣُ: ﺏﺭﺃَ</sense>
   </entry>
   <!-- … -->
</entry>
```
Note that the embedded entries are enumerated by way of the attribute @n.

This type of grouping is also customarily used in dictionaries of word-families in
other languages such as in Howard H. Keller’s (1978): “A German word family dictionary
together with English equivalents”:


```xml
<entry xmlns="http://www.tei-c.org/ns/Examples" type="wordFamily">
   <entry type="main">
      <form>
         <orth>Haus</orth>
         <gramGrp>
            <pos>nn</pos>
         </gramGrp>
      </form>
      <sense>...</sense>
   </entry>
   <entry type="sub">
      <form>
         <orth>
            <m>Häus</m>
            <m>chen</m>
         </orth>
      </form>
      <sense>...</sense>
   </entry>
   <entry type="sub">
      <form>
         <orth>
            <m>haus</m>
            <m>en</m>
         </orth>
      </form>
      <sense>...</sense>
   </entry>
</entry>
```
In the Collins/COBUILD “Dictionary of Idioms” (2nd. ed., 2002), idioms are grouped
under a common headword. No additional information for the headword is provided; it
only serves as part of the access structure for the idioms. This can also be modelled
using recursive entries. Again, see <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TypesOfEntries" title="Types of entries">Types of entries</a> for a discussion of possible entry types:


```xml
<entry xmlns="http://www.tei-c.org/ns/Examples" type="simple">
   <form>
      <orth>house</orth>
   </form>
   <entry type="multiWordExpression">
      <form>
         <orth>bring the house down</orth>
      </form>
      <sense>...</sense>
   </entry>
   <entry type="multiWordExpression">
      <form>
         <orth>eat someone out of house and home</orth>
      </form>
      <sense>...</sense>
   </entry>
   <entry type="multiWordExpression">
      <form>
         <orth>get on like a house on fire</orth>
      </form>
      <sense>...</sense>
   </entry>
</entry>
```
For <span xmlns="http://www.w3.org/1999/xhtml" class="gi">&lt;entryFree&gt;</span>, the content model is defined more freely than for <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a>. To account for entries that do not follow the rather strict lexical model envisioned
by the TEI <span xmlns="http://www.w3.org/1999/xhtml" style="font-style:italic">Guidelines</span> for <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a>, <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.dictScrap" title="<dictScrap&gt;">&lt;dictScrap&gt;</a> within <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a> shall be used.

### 2.2. Changes to the content model of &lt;entry&gt;
In TEI Lex-0, <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a> may contain the following elements: <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.form" title="<form&gt;">&lt;form&gt;</a>, <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.sense" title="<sense&gt;">&lt;sense&gt;</a>, <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a>, <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.etym" title="<etym&gt;">&lt;etym&gt;</a>, <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.gramGrp" title="<gramGrp&gt;">&lt;gramGrp&gt;</a>, <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.usg" title="<usg&gt;">&lt;usg&gt;</a>, <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.xr" title="<xr&gt;">&lt;xr&gt;</a>, <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.pc" title="<pc&gt;">&lt;pc&gt;</a>, and <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.dictScrap" title="<dictScrap&gt;">&lt;dictScrap&gt;</a>. Contrary to the current TEI <span xmlns="http://www.w3.org/1999/xhtml" style="font-style:italic">Guidelines</span>, it may not directly contain the following elements: <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.def" title="<def&gt;">&lt;def&gt;</a>, <span xmlns="http://www.w3.org/1999/xhtml" class="gi">&lt;hom&gt;</span>, and <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.cit" title="<cit&gt;">&lt;cit&gt;</a>. See the section <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#hp8vymhe6byi" title=""><span class="hi">Towards a more systematic use of <a class="link_ref" href="#TEI.sense" title="<sense&gt;">&lt;sense&gt;</a></span></a> below.

In TEI Lex-0, <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a> has a mandatory <span xmlns="http://www.w3.org/1999/xhtml" class="att">xml:id</span>.

### 2.3. Types of entries
Based on the proposed definition for <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a> in TEI-Lex-0, entries are conceived as “the most basic” elements of the microstructure.
The examples provided in the section <span xmlns="http://www.w3.org/1999/xhtml" class="hi">Unified representation of entries</span> illustrate two applications of entries embedded within entries and make it obvious
that different types of linguistic entities can be represented by <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a> in one single dictionary. Therefore, the provision of a <span xmlns="http://www.w3.org/1999/xhtml" class="att">type</span> attribute for <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a> is encouraged in such cases. The value for the type attribute shall denote a property
of the entry as a whole that is not represented more specifically by way of other
elements within the entry. It is for example <span xmlns="http://www.w3.org/1999/xhtml" style="font-style:italic">not</span> good practice to use the part-of-speech as the value for entry/@type because this
information is encoded in gramGrp/pos.

The current TEI <span xmlns="http://www.w3.org/1999/xhtml" style="font-style:italic">Guidelines</span> suggest the set of the following values for <span xmlns="http://www.w3.org/1999/xhtml" class="att">type</span>:


<ul xmlns="http://www.w3.org/1999/xhtml">
   <li class="item">abbr</li>
   <li class="item">affix</li>
   <li class="item">foreign</li>
   <li class="item">hom</li>
   <li class="item">main</li>
   <li class="item">sub</li>
   <li class="item">supplemental</li>
   <li class="item">xref</li>
</ul>Again, the list of values represent features from a considerable range of axes. Moreover,
the features are not mutually exclusive (e.g. a foreign abbreviation may well be a
homonym). The values belong to different domains: morphology (abbr), etymology (foreign),
orthography and possibly phonology (hom), and (in a broad sense) the macrostructure
of the dictionary (main, supplemental, xr). Of these domains, all except the dictionary’s
macrostructure are catered for in specific elements below the level of the entry.
They should therefore not be used as types of entries.

In general, the entry type can be applied locally for a single dictionary or globally
to allow for classification across different dictionaries. Provided that a single
dictionary will often comprise entries that describe linguistic entities of the same
kind (“words”, word families, multi-word expressions, morphemes, …) a classification
along those lines will be of minor importance for a stand-alone resource but may be
useful in a multi-dictionary use-case. Possible values for this domain include:


<ul xmlns="http://www.w3.org/1999/xhtml">
   <li class="item">affix</li>
   <li class="item">word</li>
   <li class="item">synset<span class="note" id="Note1"><span class="noteLabel">Note: </span><span class="hi">e.g. for onomasiological dictionaries</span></span><span class="note" id="Note2"><span class="noteLabel">Note: </span><span class="hi">… though this is not the primary concern of the TEI it reads elsewhere in this text.
            (Laurent?)</span></span></li>
   <li class="item">multi-word-entity</li>
   <li class="item">word-family</li>
</ul>A classification based on macrostructural properties (i. e. properties describing
aspects of the internal organisation of a resource) can on the other hand be exploited
both for a single dictionary and across different dictionaries. Possible values for
this domain include:


<ul xmlns="http://www.w3.org/1999/xhtml">
   <li class="item">main</li>
   <li class="item">supplemental</li>
   <li class="item">nest</li>
   <li class="item">niche</li>
   <li class="item">xr</li>
</ul><span xmlns="http://www.w3.org/1999/xhtml" class="hi">TODO: Priviledge one strategy (discussion)?</span> See this <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="https://github.com/DARIAH-ERIC/lexicalresources/issues/12">issue</a> on GitHub.

## 3. Towards a more systematic use of &lt;sense&gt;
### 3.1. Guidelines
In the current TEI Dictionary Chapter, the content model of <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a> allows one to have sense-related information directly within <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a>. TEI Lex-0 proscribes a stricter use of these elements so that sense-related information
is grouped within the <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.sense" title="<sense&gt;">&lt;sense&gt;</a> element, in accordance with the underlying semasiological model implemented in the
TEI <span xmlns="http://www.w3.org/1999/xhtml" style="font-style:italic">Guidelines</span>.

<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.sense" title="<sense&gt;">&lt;sense&gt;</a> should be therefore considered mandatory for any dictionary entry that actually provides
sense information for the headword. Further in this document, we consider some additional
specific cases e.g. “referencing” entries (entires that simply point to other entries)
and inflexional lexica (dictionaries that describe word forms only), where <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.sense" title="<sense&gt;">&lt;sense&gt;</a> is not a mandatory child of <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a>.

As a consequence of making the use of <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.sense" title="<sense&gt;">&lt;sense&gt;</a> more systematic within <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a>, we have seen (see section on <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a>) that some elements are no longer allowed as children of <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a>. We provide here a specific background for each of them:


<ul xmlns="http://www.w3.org/1999/xhtml">
   <li class="item"><a class="link_ref" href="#TEI.def" title="<def&gt;">&lt;def&gt;</a> is clearly intended to provide a prose description of a meaning within a <a class="link_ref" href="#TEI.sense" title="<sense&gt;">&lt;sense&gt;</a> element and should not appear in any other context;
   </li>
   <li class="item">In the same way, it is recommended that <a class="link_ref" href="#TEI.cit" title="<cit&gt;">&lt;cit&gt;</a> be used exclusively as a child of <a class="link_ref" href="#TEI.sense" title="<sense&gt;">&lt;sense&gt;</a>, or when necessary within <a class="link_ref" href="#TEI.dictScrap" title="<dictScrap&gt;">&lt;dictScrap&gt;</a>;
   </li>
   <li class="item">The case of <span class="gi">&lt;hom&gt;</span> is peculiar since it provides a subordinate organization to an entry which is redundant
      in relation to what <a class="link_ref" href="#TEI.sense" title="<sense&gt;">&lt;sense&gt;</a> allows one to represent. <span class="gi">&lt;hom&gt;</span> is not allowed in TEI Lex-0.
   </li>
</ul>Note: In the case one has to deal with information that does not fit a <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.sense" title="<sense&gt;">&lt;sense&gt;</a>-based organization, for instance in the process of retro-digitizing an existing dictionary
source, the use of <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.dictScrap" title="<dictScrap&gt;">&lt;dictScrap&gt;</a> is recommended. Further step in the encoding of the lexical content may lead to a
more precise encoding in a second phase.

In TEI Lex-0, <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.sense" title="<sense&gt;">&lt;sense&gt;</a> has a mandatory <span xmlns="http://www.w3.org/1999/xhtml" class="att">xml:id</span>.

### 3.2. A limited number of possible contexts for &lt;def&gt;
In the current TEI guidelines, <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.def" title="<def&gt;">&lt;def&gt;</a> is allowed to be used within the following elements:


<ul xmlns="http://www.w3.org/1999/xhtml">
   <li class="item">Module core: <a class="link_ref" href="#TEI.cit" title="<cit&gt;">&lt;cit&gt;</a></li>
   <li class="item">Module dictionaries: <a class="link_ref" href="#TEI.dictScrap" title="<dictScrap&gt;">&lt;dictScrap&gt;</a>, <a class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a>, <span class="gi">&lt;entryFree&gt;</span>, <a class="link_ref" href="#TEI.etym" title="<etym&gt;">&lt;etym&gt;</a>, <span class="gi">&lt;hom&gt;</span>, <span class="gi">&lt;re&gt;</span>, <a class="link_ref" href="#TEI.sense" title="<sense&gt;">&lt;sense&gt;</a></li>
   <li class="item">Module namesdates: <span class="gi">&lt;nym&gt;</span></li>
</ul>TEI Lex-0 allows the use of <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.def" title="<def&gt;">&lt;def&gt;</a> in <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.sense" title="<sense&gt;">&lt;sense&gt;</a>, <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.cit" title="<cit&gt;">&lt;cit&gt;</a> and <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.etym" title="<etym&gt;">&lt;etym&gt;</a> only. All other existing contexts would be implemented by embedding <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.def" title="<def&gt;">&lt;def&gt;</a> within a <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.sense" title="<sense&gt;">&lt;sense&gt;</a>.

### 3.3. Encoding sense in entries with multiple parts of speech
For multi-POS lexical entries, TEI Lex-0 considers each POS as a trigger for a new
sense. Consequently, we recommend encoding grammatical information in each sense coming
after the first one to be serialised inside the semantic bloc as follows:


```xml
<sense xmlns="http://www.tei-c.org/ns/Examples">
   <gramGrp>
      <pos>..</pos>
   </gramGrp>
   <def>..</def> .. 
</sense>
```
Consider this example, where <span xmlns="http://www.w3.org/1999/xhtml" class="mentioned">arrest</span> appears both as a verb and a noun:


<div xmlns="http://www.w3.org/1999/xhtml" class="figure"><img src="media/image25.png" alt="" class="inline" style=" width:6.720416666666667cm; height:4.709583333333334cm;"></img></div>
```xml
<entry xmlns="http://www.tei-c.org/ns/Examples">
   <form type="lemma">
      <orth>arrest</orth>
      <pron>/ə rest/</pron>
      <gramGrp>
         <pos>verb</pos>
      </gramGrp>
   </form>
   <sense>
      <usg>(of the police)</usg>
      <def>to catch and hold someone who has broken the law</def>
      <cit type="example">
         <quote>The police arrested two men and took them to the police station</quote>
      </cit>
      <pc>.</pc>
      <cit type="example">
         <quote>He ended up getting arrested as he tried to leave the country</quote>
      </cit>
      <pc>.</pc>
      <cit type="example">
         <quote>She was arrested for stealing</quote>
      </cit>
   </sense>
   <pc>.</pc>
   <sense>
      <gramGrp>
         <pos>noun</pos>
      </gramGrp>
      <def>the act of holding someone for breaking the law</def>
      <cit type="example">
         <quote>The police made several arrests at the demonstration</quote>
      </cit>
      <pc>.</pc>
      <entry type="multiWordExpression">
         <form>under arrest</form>
         <sense>
            <def>held by the police After the fight</def>
            <pc>,</pc>
            <cit type="example">
               <quote>three people were under arrest</quote>
            </cit>
         </sense>
      </entry>
   </sense>
</entry>
```
### 3.4. Case of bilingual dictionaries

<div xmlns="http://www.w3.org/1999/xhtml" class="figure"><img src="media/image13.png" alt="" class="inline" style=" width:15.927916666666667cm; height:5.538611111111111cm;"></img><span class="caption">Excerpt from the entry <span class="mentioned">aid</span> from XXX</span></div>
```xml
<entry xmlns="http://www.tei-c.org/ns/Examples">
   <form type="lemma">
      <orth>Aid</orth>
   </form>
   <pc>,</pc>
   <sense>
      <gramGrp>
         <pos>v.a.</pos>
      </gramGrp>
      <cit type="translationEquivalent">
         <form xml:lang="fr">
            <orth>aider</orth>
         </form>
      </cit>
      <pc>,</pc>
      <cit type="translationEquivalent">
         <form>
            <orth>assister</orth>
         </form>
      </cit>
      <pc>,</pc>
      <cit type="translationEquivalent">
         <form>
            <orth>secourir</orth>
         </form>
      </cit>
   </sense>
   <pc>;</pc>
   <sense>
      <oRef>_</oRef>
      <gramGrp>
         <pos>s.</pos>
      </gramGrp>
      <cit type="equivalent">
         <form>
            <orth>aide</orth>
         </form>
      </cit>
      <pc>,</pc>
      <cit type="equivalent">
         <form>
            <orth>assistance</orth>
            <pc>,</pc>
            <gramGrp>
               <gen>f.</gen>
            </gramGrp>
         </form>
      </cit>
      <pc>,</pc>
      <cit type="equivalent">
         <form>
            <orth>secours</orth>
            <pc>,</pc>
            <gramGrp>
               <gen>m.</gen>
            </gramGrp>
         </form>
      </cit>
   </sense>
   <pc>;</pc>
   <sense>
      <cit type="equivalent">
         <form>
            <orth>sub-side</orth>
         </form>
         <pc>,</pc>
         <gramGrp>
            <gen>m.</gen>
         </gramGrp>
      </cit>
   </sense>
   <pc>;</pc>
   <sense>
      <usg type="hint">(pers)</usg>
      <cit type="equivalent">
         <form>
            <orth>aide</orth>
         </form>
         <pc>,</pc>
         <gramGrp>
            <gen>m.</gen>
            <gen>f.</gen>
         </gramGrp>
      </cit>
   </sense>
   <entry type="multiWordExpression">
      <form type="lemma">
         <orth>By the 
            <oRef>_</oRef> of
         </orth>
      </form>
      <pc>,</pc>
      <sense>
         <cit type="equivalent">
            <form>
               <orth>à l'aide de</orth>
            </form>
         </cit>
      </sense>
   </entry>
   <pc>.</pc>
   <entry type="multiWordExpression">
      <form>
         <orth>In 
            <oRef>_</oRef> of
         </orth>
      </form>
      <pc>,</pc>
      <sense>
         <usg>(of performances)</usg>
         <cit type="equivalent">au profit de</cit>
         <pc>,</pc>
         <cit type="equivalent">au bénéfice de</cit>
      </sense>
   </entry>
   <pc>.</pc>
   <entry type="derived">
      <form type="lemma">
         <orth>_less</orth>
         <pc>,</pc>
         <gramGrp>
            <pos>adj.</pos>
         </gramGrp>
      </form>
      <sense>
         <cit type="equivalent">
            <form xml:lang="fr">
               <orth>sans aide</orth>
            </form>
         </cit>
         <pc>,</pc>
         <cit type="equivalent">
            <form xml:lang="fr">
               <orth>sans secours</orth>
            </form>
         </cit>
      </sense>
      <pc>;</pc>
      <sense>
         <cit type="equivalent">
            <form>
               <orth>abandonné</orth>
            </form>
         </cit>
         <pc>,</pc>
         <cit type="equivalent">
            <form>
               <orth>délaissé</orth>
            </form>
         </cit>
      </sense>
   </entry>
</entry>
```
### 3.5. Deprecating &lt;hom&gt;
Making a clear difference between a situation where an entry has to be split into
two or more homonyms and one where these differences correspond to a semantic alternation
is lexicographically difficult. Still, the main danger in keeping both possibilities
in the representation of a lexical entry in a digital lexicon is to introduce a systematic
structural ambiguity as to where the appropriate information is to be found. We thus
deprecate <span xmlns="http://www.w3.org/1999/xhtml" class="gi">&lt;hom&gt;</span> altogether in the present recommendation and have this element be replaced by the
appropriate <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.sense" title="<sense&gt;">&lt;sense&gt;</a> construct. For instance, the following example from the TEI <span xmlns="http://www.w3.org/1999/xhtml" style="font-style:italic">Guidelines</span>:


```xml
<entry xmlns="http://www.tei-c.org/ns/Examples">
   <form>
      <orth>bray</orth>
      <pron>breI</pron>
   </form>
   <hom>
      <gramGrp>
         <gram type="pos">n</gram>
      </gramGrp>
      <sense>
         <def>cry of an ass; sound of a trumpet.</def>
      </sense>
   </hom>
   <hom>
      <gramGrp>
         <gram type="pos">vt</gram>
         <subc>VP2A</subc>
      </gramGrp>
      <sense>
         <def>make a cry or sound of this kind.</def>
      </sense>
   </hom>
</entry>
```
would in TEI Lex-0 be represented as:


```xml
<entry xmlns="http://www.tei-c.org/ns/Examples">
   <form type="lemma">
      <orth>bray</orth>
      <pron>brel</pron>
   </form>
   <sense>
      <gramGrp>
         <pos>n</pos>
      </gramGrp>
      <sense>
         <def>cry of an ass</def>
      </sense>
      <pc>;</pc>
      <sense>
         <def>sound of a trumpet</def>
      </sense>
   </sense>
   <pc>.</pc>
   <sense>
      <gramGrp>
         <pos>vt</pos>
         <subc>VP2A</subc>
      </gramGrp>
      <def>make a cry or sound of this kind</def>
   </sense>
   <pc>.</pc>
</entry>
```
## 4. Written and Spoken Forms
The current TEI <span xmlns="http://www.w3.org/1999/xhtml" style="font-style:italic">Guidelines</span> allows for an extremely wide range of encoding possibilities for written and spoken
forms. In the discussion which follows, we suggest ways in which the elements, in
particular <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.form" title="<form&gt;">&lt;form&gt;</a>, can be constrained. We give examples of use types not covered by the <span xmlns="http://www.w3.org/1999/xhtml" style="font-style:italic">Guidelines</span>, and propose some extensions.

### 4.1. A note on inheritance
We assume that in order to determine the complete properties of an element inside
the entry tree, the principle of default inheritance applies, e.g. grammatical properties
of a form are determined by collecting the sibling <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.gramGrp" title="<gramGrp&gt;">&lt;gramGrp&gt;</a> of the ancestor-or-self of the focus element, where the superordinate grammatical
properties can be overwritten by the lower-level properties. This principle is relatively
straightforward in the case of grammatical properties, but more complex for the word
paradigm, esp. in cases of variant forms. For more information c.f. Ide et al. (<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="https://www.kilgarriff.co.uk/Publications/2000-IdeKilgRomary-Euralex.pdf"><span class="hi">2000</span></a>) and Erjavec et al. (<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="http://www.lrec-conf.org/proceedings/lrec2000/html/summary/335.htm"><span class="hi">2000</span></a>).

### 4.2. Grammatical properties of lexical entries
Grammatical properties of lexical entries should be specified in <code xmlns="http://www.w3.org/1999/xhtml">entry/gramGrp</code>. This element will typically specify the part-of-speech of the entry.


```xml
<entry xmlns="http://www.tei-c.org/ns/Examples" xml:lang="en">
   <form type="lemma">
      <orth>on</orth>
   </form>
   <gramGrp>
      <gram type="pos">prep</gram>
   </gramGrp> ... 
</entry>
```
Notes:


<ol xmlns="http://www.w3.org/1999/xhtml">
   <li class="item">Grammatical properties of the entry should <span class="hi">not</span> be specified in <code>entry/form[@type="lemma"]/gramGrp</code></li>
   <li class="item">In cases where headwords are discriminated only on the basis of their orthography
      (e.g. in English dictionaries which treat conversion pairs of nouns and verbs, such
      as <span class="hi">run</span>, as belonging in single entries), <code>entry/gramGrp</code> should not be used, because its role is taken over by the individual <code>sense/gramGrp</code>.
   </li>
</ol>
<div xmlns="http://www.w3.org/1999/xhtml" class="figure"><img src="media/image17.png" alt="" class="inline" style=" width:7.750422222222222cm; height:5.357813888888889cm;"></img></div>
```xml
<entry xmlns="http://www.tei-c.org/ns/Examples">
   <form>
      <orth>aid</orth>
      <pron>/ed/</pron>
   </form>
   <gramGrp>
      <pos>noun</pos>
   </gramGrp>
   <sense>
      <sense>1. help, especially money, 
         <lb></lb>food or other gifts given to people living 
         <lb></lb> in difficult conditions aid to the earth-
         <lb></lb>quake zone an aid worker (NOTE:
         This 
         <lb></lb>meaning of aid has no plural.) in aid 
         <lb></lb>of in order to help We give money in 
         <lb></lb> aid of the Red Cross. They are collect-
         <lb></lb>ing money in aid of
         refugees
      </sense>
      <pc>. </pc>
      <sense>2. some-
         <lb></lb>thing which helps you to do something 
         <lb></lb>kitchen aids
      </sense> í 
   </sense>
   <sense>
      <gramGrp>
         <pos>verb</pos>
      </gramGrp>
      <sense>1. to help some-
         <lb></lb>thing to happen
      </sense>
      <sense>2. to help someone</sense>
   </sense>
</entry>
```
### 4.3. Representation of the lemma
The form element should always be qualified by its <span xmlns="http://www.w3.org/1999/xhtml" class="att">type</span>. The lemma (i.e. headword) form should be encoded as <code xmlns="http://www.w3.org/1999/xhtml">form[@type="lemma"]</code>.

If it is necessary to specify the grammatical properties of the lemma form itself
(as opposed to the grammatical properties of the entry), this is described by <code xmlns="http://www.w3.org/1999/xhtml">entry/form[@type="lemma"]/gramGrp</code>, e.g.:


```xml
<form xmlns="http://www.tei-c.org/ns/Examples" type="lemma">
   <orth>go</orth>
   <gramGrp>
      <gram type="tense">present</gram>
   </gramGrp>
</form>
```
### 4.4. Representation of inflected forms
Dictionaries often include additional forms next to the lemma. In English, these are
used to specify irregular forms, such as “corpus / corpora” or “take / took”, whereas
in inflectionally rich languages they are often used to help the user determine the
correct paradigm of the word (such as “krava / -e” in Slovene). 

Such inflected forms should be encoded in <code xmlns="http://www.w3.org/1999/xhtml">entry/form/@type="inflected"</code>, e.g.:


```xml
<entry xmlns="http://www.tei-c.org/ns/Examples">
   <form type="lemma">
      <orth>go</orth>
   </form>
   <form type="inflected">
      <orth>went</orth>
      <gramGrp>
         <tns>past</tns>
      </gramGrp>
   </form>
</entry>
```
... 

### 4.5. Paradigms
When several inflected forms can be present next to the lemma, these can be embedded
into <code xmlns="http://www.w3.org/1999/xhtml">entry/form[@type="paradigm"]</code>. The decision on whether to use this extra element depends on the particular dictionary
and language.

The other use case for paradigms is when the full inflectional paradigm of the word
is embedded in the entry, i.e. when the dictionary also includes all the word-forms
of the words covered, which can be useful for example in machine processing. 

An entry may contain several paradigms, e.g. a partial one for humans and a full one
for machines, or one for each stem of a verb. Each paradigm type should be distinguished
by the <span xmlns="http://www.w3.org/1999/xhtml" class="att">subtype</span> attribute.


```xml
<entry xmlns="http://www.tei-c.org/ns/Examples" xml:id="perder" xml:lang="es">
   <form type="lemma">
      <orth>perder</orth>
   </form>
   <gramGrp>
      <gram type="pos">verb</gram>
   </gramGrp>
   <form type="paradigm" subtype="present">
      <form type="inflected">
         <orth>pierdo</orth>
         <gramGrp>
            <per>1</per>
            <number>sg</number>
            <mood>indic</mood>
            <gram type="voice">active</gram>
         </gramGrp>
      </form>
      <!-- other inflected forms (of present indicative) here -->
      <gramGrp>
         <tns>present</tns>
      </gramGrp>
   </form>
   <form type="paradigm" subtype="preteritum">
      <form type="inflected">
         <orth>perdí</orth>
         <gramGrp>
            <per>1</per>
            <number>sg</number>
            <mood>indic</mood>
            <gram type="voice">active</gram>
         </gramGrp>
      </form>
      <gramGrp>
         <tns>preteritum</tns>
      </gramGrp>
   </form> ... 
</entry>
```
### 4.6. Representation of variants
The representation of variation within a form is highly dependant upon the specifics
of the features of the variation and the way in which they vary. However, as a general
principle, variation may be encoded as <code xmlns="http://www.w3.org/1999/xhtml">form[@type="variant"]</code> and embedded within the parent element for which a subordinate feature exhibits variation.

### 4.6.1. Orthographic variation
Several kinds of orthographic variation may be distinguished. Below, we present some
of the options with the corresponding examples.

Spelling variation due to change in language’s orthography convention:


```xml
<entry xmlns="http://www.tei-c.org/ns/Examples" xml:id="Flussschifffahrt" xml:lang="de" type="compound">
   <form type="lemma">
      <orth type="segmeted">
         <seg>Fluss</seg>
         <seg>schifffahrt</seg>
      </orth>
      <form type="variant">
         <orth>
            <seg>Fluss</seg>
            <pc>-</pc>
            <seg>Schifffahrt</seg>
         </orth>
      </form>
      <form type="variant">
         <orth notAfter="1996">
            <seg>Fluß</seg>
            <seg>schifffahrt</seg>
         </orth>
         <usg type="time">Vor 1996 Rechtschreibung Reform</usg>
      </form>
      <gramGrp>
         <gram type="pos">noun</gram>
      </gramGrp>
   </form> .... 
</entry>
```
The following example is from American English in which due to the lack of official
conventions for transliteration of Arabic orthography to the English (Latin) script,
the initial vowel in the surname ‘Osama Bin Laden’ varies between ‘O’ and ‘U’:


```xml
<form xmlns="http://www.tei-c.org/ns/Examples" type="lemma">
   <pron notation="ipa">
      <seg xml:id="ousma" corresp="#usma #osma">ow."sa.ma</seg>
      <seg>bɪn</seg>
      <seg>ˈlaːdn̹</seg>
   </pron>
   <form type="variant">
      <orth type="transliterated">
         <seg xml:id="osma" corresp="#usma #ousma">Osama</seg>
         <seg>Bin</seg>
         <seg>Laden</seg>
      </orth>
   </form>
   <form type="variant">
      <orth type="transliterated">
         <seg xml:id="usma" corresp="#osma #ousma">Usama</seg>
         <seg>Bin</seg>
         <seg>Laden</seg>
      </orth>
   </form>
</form>
```
### 4.6.2. Phonetic Variation
In this example, the entry contains the single orthographic form as a direct child
of the lemma and phonetic transcriptions of the two roughly equally used variant pronunciations
of the word 'caramel' from American English.


```xml
<entry xmlns="http://www.tei-c.org/ns/Examples" xml:id="caramel-en" xml:lang="en-US">
   <form type="lemma">
      <orth>caramel</orth>
      <form type="variant">
         <pron notation="ipa">'keɹə"mɛl</pron>
      </form>
      <form type="variant">
         <pron notation="ipa">'kaɹmɫ̩</pron>
      </form>
   </form>
   <gramGrp>
      <gram type="pos">noun</gram>
   </gramGrp>
   <!-- ... -->
</entry>
```
We have an open GitHub <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="https://github.com/DARIAH-ERIC/lexicalresources/issues/16">issue</a> related to this.

### 4.6.3. Regional or dialectal Variation
In the following example from Mixtepec-Mixtec, there is variation in the form of the
word for the city of Oaxaca between speakers from the village of Yucanany and the
rest of the speakers. Since the Yucanany variety makes up only a small portion of
the speakers of the language, this case of variation is represented as an embedded
<code xmlns="http://www.w3.org/1999/xhtml">form[@type="variant"]</code> within the lemma. Note the use of <code xmlns="http://www.w3.org/1999/xhtml">usg[@type="geo"]/placeName</code> to explicitly specify this feature in addition to the use of the private language
subtag (<code xmlns="http://www.w3.org/1999/xhtml">xml:lang="mix-x-YCNY"</code>) as per <span xmlns="http://www.w3.org/1999/xhtml" class="ref">BCP 47</span>.


```xml
<entry xmlns="http://www.tei-c.org/ns/Examples" xml:id="Oaxaca-MIX" xml:lang="mix" type="compound">
   <form type="lemma">
      <orth>
         <seg>Ñuu</seg>
         <seg>Ntua</seg>
      </orth>
      <pron notation="ipa">
         <seg>ɲùù</seg>
         <seg>nd̪ùá</seg>
      </pron>
      <form type="variant" xml:lang="mix-x-YCNY">
         <orth>Ntua</orth>
         <pron notation="ipa">nd̪ùá</pron>
         <usg type="geo">
            <placeName>Yucanany</placeName>
         </usg>
      </form>
   </form>
   <gramGrp>
      <gram type="pos">locationNoun</gram>
   </gramGrp> ... 
</entry>
```
## 5. Structured lexical references (xr/ref)
### 5.1. Motivation
The current TEI <span xmlns="http://www.w3.org/1999/xhtml" style="font-style:italic">Guidelines</span> provide several mechanisms by means of which one item of lexical information can
refer to another, e.g.:


<ul xmlns="http://www.w3.org/1999/xhtml">
   <li class="item"><span class="gi">&lt;gloss&gt;</span> for the provision of simple (non refined) translation equivalents of the head word
   </li>
   <li class="item"><span class="tag">&lt;usg type="synonym"&gt;&gt;</span> for synonym references
   </li>
   <li class="item"><code>cit[@type="translation"]/quote</code> for translation equivalents in bilingual or translation dictionaries
   </li>
   <li class="item"><a class="link_ref" href="#TEI.oRef" title="<oRef&gt;">&lt;oRef&gt;</a>, <a class="link_ref" href="#TEI.pRef" title="<pRef&gt;">&lt;pRef&gt;</a> for the resolution of “~" headword placeholders in quotations and other dictionary
      text
   </li>
   <li class="item"><a class="link_ref" href="#TEI.xr" title="<xr&gt;">&lt;xr&gt;</a>, <span class="gi">&lt;ref&gt;</span> as a general cross-referencing mechanism
   </li>
   <li class="item"><span class="gi">&lt;ptr&gt;</span> as a pointer to another location
   </li>
   <li class="item"><span class="gi">&lt;link&gt;</span></li>
   <li class="item"><span class="gi">&lt;mentioned&gt;</span> in the etymology section
   </li>
   <li class="item"><span class="gi">&lt;term&gt;</span> for mentions of technical terms
   </li>
</ul>In keeping with the approach of the TEI Lex-0, and considering that links/relations
between lexical data elements are increasingly part of the core lexical data model
rather than mere convenience pointers for dictionary users, we need a more unified
and more constrained mechanism for lexical references, whether they point to an existing
lexical entity in some dictionary or lexicon, or in a more general way to lexical
objects without a target reference. 

The proposed mechanism has the following properties 


<ol xmlns="http://www.w3.org/1999/xhtml">
   <li class="item">It applies only to references with a clear <span style="font-style:italic">linguistic</span> meaning.
   </li>
   <li class="item">The number of arbitrary (or context-dependent) choices for the encoder is minimal;
      the semantics of the reference should not depend on context
   </li>
   <li class="item">The relation between the encoding dictionary content and the underlying/implied lexical
      data model should be as transparent as possible
   </li>
   <li class="item">No drastic changes to the TEI guidelines are needed, except for minor changes within
      the dictionary module
   </li>
</ol>In the following we first present the recommended encoding, and then elicit how existing
alternatives can be replaced accordingly.

### 5.2. Proposal: Using &lt;ref&gt; and &lt;xr&gt; to point to lexical entities
In TEI Lex-0, we use <span xmlns="http://www.w3.org/1999/xhtml" class="gi">&lt;ref&gt;</span> as the general element for a lexical reference and <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.xr" title="<xr&gt;">&lt;xr&gt;</a> as the enclosing element that groups information related to this reference. The reference
may be internal to a dictionary or pointing to an external source, even when the actual
target lexical object is not explicitly known. In the latter case, <span xmlns="http://www.w3.org/1999/xhtml" class="gi">&lt;ref&gt;</span> can be used without an explicit pointing attribute. Furthermore the actual intended
target of the reference can be of various possible types, namely a full entry, but
also a specific sense, form or morpheme within a given entry.

For all such uses, the following attributes may be used on <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.xr" title="<xr&gt;">&lt;xr&gt;</a> and <span xmlns="http://www.w3.org/1999/xhtml" class="gi">&lt;ref&gt;</span>:


<ul xmlns="http://www.w3.org/1999/xhtml">
   <li class="item"><span class="att">type</span> is a mandatory attribute on <a class="link_ref" href="#TEI.xr" title="<xr&gt;">&lt;xr&gt;</a> for a lexical reference. Its default value is "lexical" and can be superseded (or
      complemented by means of <span class="att">subtype</span>). It should be an indication of the lexical relation between the headword of the
      entry and the object referred to (cf. next subsection)
   </li>
   <li class="item"><code>ref/@type</code> may be an indication of the target object category (entry, sense, ….) See this <a class="link_ref" href="https://github.com/DARIAH-ERIC/lexicalresources/issues/20">issue</a> on GitHub.
   </li>
   <li class="item"><span class="att">xml:lang</span>, which is recommended when <span class="gi">&lt;ref&gt;</span> actually contains an explicit lexical form
   </li>
   <li class="item"><code>ref/@target</code>: to point to the actual lexical object being pointed at when applicable
   </li>
   <li class="item"><code>ref/@notation</code> to indicate, like we currently do on <a class="link_ref" href="#TEI.orth" title="<orth&gt;">&lt;orth&gt;</a> or <a class="link_ref" href="#TEI.pron" title="<pron&gt;">&lt;pron&gt;</a> the actual notation used for the explicit lexical form when provided
   </li>
</ul>### 5.2.1. Typology for xr/@type values
We suggest an extensible list of values, including “cf" for general references which
do not have clear semantics.


<div xmlns="http://www.w3.org/1999/xhtml" class="table">
   <table class="rules" style="border-collapse:collapse;border-spacing:0;">
      <tr>
         <td style="border: 1px solid black; padding: 2px;">value of @type</td>
         <td style="border: 1px solid black; padding: 2px;">description</td>
         <td style="border: 1px solid black; padding: 2px;">example</td>
      </tr>
      <tr>
         <td style="border: 1px solid black; padding: 2px;">lexical</td>
         <td style="border: 1px solid black; padding: 2px;">default (root of hierarchy)</td>
         <td style="border: 1px solid black; padding: 2px;"></td>
      </tr>
      <tr>
         <td style="border: 1px solid black; padding: 2px;">cognate</td>
         <td style="border: 1px solid black; padding: 2px;">link to cognate in other language. See this <a class="link_ref" href="https://github.com/DARIAH-ERIC/lexicalresources/issues/19">issue</a> on GitHub.
         </td>
         <td style="border: 1px solid black; padding: 2px;">
            ```xml
            <entry xmlns="http://www.tei-c.org/ns/Examples">
               <form type="lemma">voice</form>
               <etym>
                  <xr type="cognate">
                     <ref xml:lang="sa">वाच्</ref>
                  </xr>
               </etym>
            </entry>
            ```
            
         </td>
      </tr>
      <tr>
         <td style="border: 1px solid black; padding: 2px;">etymon</td>
         <td style="border: 1px solid black; padding: 2px;">link to (possibly reconstructed) root form</td>
         <td style="border: 1px solid black; padding: 2px;">
            ```xml
            <entry xmlns="http://www.tei-c.org/ns/Examples">
               <form type="lemma">voice</form>
               <etym>
                  <xr type="etymon">
                     <ref target="http://indo-european.info/pokorny-etymological-dictionary/u%CC%AFek%CA%B7.htm" xml:lang="PIE">u̯ekʷ-</ref>
                  </xr>
               </etym>
            </entry>
            ```
            
         </td>
      </tr>
      <tr>
         <td style="border: 1px solid black; padding: 2px;">synonym, hyponym, hyperonym, antonym , meronym (etc.) </td>
         <td style="border: 1px solid black; padding: 2px;"></td>
         <td style="border: 1px solid black; padding: 2px;">
            ```xml
            <entry xmlns="http://www.tei-c.org/ns/Examples">
               <form type="lemma">
                  <orth>dog</orth>
               </form>
               <sense>
                  <xr type="hyperonym">
                     <ref xml:lang="en" type="entry">mammal</ref>
                  </xr>
               </sense>
            </entry>
            ```
            
         </td>
      </tr>
      <tr>
         <td style="border: 1px solid black; padding: 2px;">translationEquivalent</td>
         <td style="border: 1px solid black; padding: 2px;">translation equivalent</td>
         <td style="border: 1px solid black; padding: 2px;">
            ```xml
            <entry xmlns="http://www.tei-c.org/ns/Examples">
               <form type="lemma">
                  <orth>horrify</orth>
               </form>
               <sense>
                  <xr type="translationEquivalent">
                     <ref xml:lang="fr">horrifier</ref>
                  </xr>
               </sense>
            </entry>
            ```
            
         </td>
      </tr>
      <tr>
         <td style="border: 1px solid black; padding: 2px;">cf</td>
         <td style="border: 1px solid black; padding: 2px;">Untyped cross-reference</td>
         <td style="border: 1px solid black; padding: 2px;">
            ```xml
            <entry xmlns="http://www.tei-c.org/ns/Examples">
               <form type="lemma">
                  <orth>borcht</orth>
               </form>
               <xr type="cf">
                  <lbl>Cf.</lbl>
                  <ref xml:lang="nl" target="#M012340">burcht</ref>
               </xr>
            </entry>
            ```
            
         </td>
      </tr>
   </table>
</div>### 5.2.2. Suggested values of ref/@target
Cf: <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="http://www.tei-c.org/release/doc/tei-p5-doc/en/html/SA.html#SAXP"><span class="hi">http://www.tei-c.org/release/doc/tei-p5-doc/en/html/SA.html#SAXP</span></a>


<ul xmlns="http://www.w3.org/1999/xhtml">
   <li class="item"># + xml:id: reference to element by xml:id inside current document</li>
   <li class="item">URI reference</li>
   <li class="item">xpath/xpointer expressions, using TEI xpointer schemes (<a class="link_ref" href="http://www.tei-c.org/release/doc/tei-p5-doc/en/html/SA.html#SATS"><span class="hi">http://www.tei-c.org/release/doc/tei-p5-doc/en/html/SA.html#SATS</span></a>) See <a class="link_ref" href="https://github.com/DARIAH-ERIC/lexicalresources/issues/23">GitHub issue</a>.
   </li>
   <li class="item">#null: there is no concrete reference</li>
</ul>### 5.2.3. How TEI Lex-0 differs from TEI Guidelines
This section is still not properly encoded.


<div xmlns="http://www.w3.org/1999/xhtml" class="table">
   <table class="rules" style="border-collapse:collapse;border-spacing:0;">
      <tr>
         <td style="border: 1px solid black; padding: 2px;">description</td>
         <td style="border: 1px solid black; padding: 2px;">current encoding</td>
         <td style="border: 1px solid black; padding: 2px;">proposed encoding</td>
      </tr>
      <tr>
         <td style="border: 1px solid black; padding: 2px;">synonyms, hyponyms, hyperonyms (and other semantic relations)</td>
         <td style="border: 1px solid black; padding: 2px;">&lt;usg type="synonym"&gt;Hund&lt;/usg&gt;</td>
         <td style="border: 1px solid black; padding: 2px;">&lt;xr type="synonym"&gt;<br></br><span></span>&lt;ref target="http://woerterbuchnetz.de/DWB/?sigle=DWB&amp;amp;mode=Vernetzung&amp;amp;lemid=GH13199#XGH13199"
            xml:lang="de"&gt;Hund&lt;/ref&gt;<br></br><span class="hi">&lt;/xr&gt;</span></td>
      </tr>
      <tr>
         <td style="border: 1px solid black; padding: 2px;">abbreviated headword occurrence in quotations</td>
         <td style="border: 1px solid black; padding: 2px;">academy … The Royal A~ of Arts OALD
            
            <span class="gi">&lt;q&gt;</span><br></br> The Royal<br></br> &lt;oRef type="cap" /&gt;<br></br> of Arts<br></br>&lt;/q&gt;
            
            
         </td>
         <td style="border: 1px solid black; padding: 2px;"><span class="gi">&lt;q&gt;</span><br></br> The Royal<br></br> &lt;xr type="headwordAttestation"&gt;<br></br><span></span>&lt;ref target="#current_entry_id"&gt;A~&lt;/ref&gt;<br></br><span></span>&lt;/xr&gt;<br></br> of Arts<br></br>&lt;/q&gt;
         </td>
      </tr>
      <tr>
         <td style="border: 1px solid black; padding: 2px;">translation of headword (possibly in a particular senses/context)<span id="ftn2_return"><a class="notelink" title="http://www.tei-c.org/release/doc/tei-p5-doc/en/html/examples-cit.html" href="#ftn2"><sup>2</sup></a></span></td>
         <td style="border: 1px solid black; padding: 2px;"><span class="hi"><a class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a></span><br></br><span></span><span class="hi"><a class="link_ref" href="#TEI.form" title="<form&gt;">&lt;form&gt;</a></span><br></br><span></span><a class="link_ref" href="#TEI.orth" title="<orth&gt;">&lt;orth&gt;</a>to horrify&lt;/orth&gt;<br></br><span></span><span class="hi">&lt;/form&gt;</span><br></br><span></span>&lt;cit type="translation" xml:lang="en"&gt;<br></br><span></span><span class="gi">&lt;quote&gt;</span>horrifier&lt;/quote&gt;<br></br><span></span><span class="hi">&lt;/cit&gt;</span><br></br><span></span>&lt;cit type="example"&gt;<br></br><span></span><span class="gi">&lt;quote&gt;</span>she was horrified at the expense.&lt;/quote&gt;<br></br><span></span>&lt;cit type="translation" xml:lang="en"&gt;<br></br><span></span><span class="gi">&lt;quote&gt;</span>elle était horrifiée par la dépense.&lt;/quote&gt;<br></br><span></span><span class="hi">&lt;/cit&gt;</span><br></br><span></span><span class="hi">&lt;/cit&gt;</span><br></br><span class="hi">&lt;/entry&gt;</span></td>
         <td style="border: 1px solid black; padding: 2px;"><span class="hi"><a class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a></span><br></br><span></span>&lt;form type="lemma"&gt;<br></br><span></span><a class="link_ref" href="#TEI.orth" title="<orth&gt;">&lt;orth&gt;</a>horrify&lt;/orth&gt;<br></br><span></span><span class="hi">&lt;/form&gt;</span><br></br><span></span><span class="hi"><a class="link_ref" href="#TEI.sense" title="<sense&gt;">&lt;sense&gt;</a></span><br></br><span></span><span class="hi"><a class="link_ref" href="#TEI.xr" title="<xr&gt;">&lt;xr&gt;</a></span><br></br><span></span>&lt;ref type="translationEquivalent" xml:lang="fr"&gt;horrifier&lt;/ref&gt;<br></br><span></span><span class="hi">&lt;/xr&gt;</span><br></br><span></span>&lt;cit type="example"&gt;<br></br><span></span><span class="gi">&lt;quote&gt;</span>she was horrified at the expense.&lt;/quote&gt;<br></br><span></span>&lt;cit type="translation"<span id="ftn3_return"><a class="notelink" title="Note that we do not change the encoding of the example" href="#ftn3"><sup>3</sup></a></span> xml:lang="en"&gt;<br></br><span></span><span class="gi">&lt;quote&gt;</span>elle était horrifiée par la dépense.&lt;/quote&gt;<br></br><span></span><span class="hi">&lt;/cit&gt;</span><br></br><span></span><span class="hi">&lt;/cit&gt;</span><br></br><span></span><span class="hi">&lt;/sense&gt;</span><br></br><span class="hi">&lt;/entry&gt;</span></td>
      </tr>
      <tr>
         <td style="border: 1px solid black; padding: 2px;">collocates in gramGrp<span id="ftn4_return"><a class="notelink" title="This is not replaced, but may be complemented by the reference mechanism" href="#ftn4"><sup>4</sup></a></span></td>
         <td style="border: 1px solid black; padding: 2px;"><span class="hi"><a class="link_ref" href="#TEI.gramGrp" title="<gramGrp&gt;">&lt;gramGrp&gt;</a></span><br></br><span></span><a class="link_ref" href="#TEI.colloc" title="<colloc&gt;">&lt;colloc&gt;</a>stray&lt;/colloc&gt;<br></br><span class="hi">&lt;/gramGrp&gt;</span></td>
         <td style="border: 1px solid black; padding: 2px;"><span class="hi"><a class="link_ref" href="#TEI.gramGrp" title="<gramGrp&gt;">&lt;gramGrp&gt;</a></span><br></br><span></span><span class="hi">&lt;colloc</span><span class="note" id="Note6"><span class="noteLabel">Note: </span><span class="hi">we might also right away think of a place to hold grammatical information, on the
                  function of the collocate (is it a subject or an object, etc.) and its category/features</span></span><span class="hi">&gt;</span><br></br><span></span>&lt;xr type="collocation"&gt;<br></br><span></span>&lt;ref target="http://www.oed.com/view/Entry/191378?rskey=WgfOMW&amp;amp;result=2&amp;amp;isAdvanced=false#eid"&gt;stray&lt;/ref&gt;<br></br><span></span><span class="hi">&lt;/xr&gt;</span><br></br><span></span><span class="hi">&lt;/colloc&gt;</span><br></br><span class="hi">&lt;/gramGrp&gt;</span></td>
      </tr>
   </table>
</div>### 5.3. &lt;xr&gt; and &lt;ref&gt;: further examples
### 5.3.1. Simple cross-reference to an entry

```xml
<entry xmlns="http://www.tei-c.org/ns/Examples">
   <form type="lemma">
      <orth>borcht</orth>
   </form>
   <xr type="crossReference">
      <lbl>Cf.</lbl>
      <ref target="#M012340">burcht</ref>
   </xr>
</entry>
```
### 5.3.2. More complex example including quotations

```xml
<entry xmlns="http://www.tei-c.org/ns/Examples">
   <form type="lemma">
      <orth>dog</orth>
   </form>
   <sense>
      <xr type="translationEquivalent">
         <lbl>Male or unknown gender</lbl>
         <ref xml:lang="fr" type="entry">chien</ref>
         <cit>
            <quote xml:lang="fr"> Le matin j'ouvre au 
               <xr type="headwordAttestation">
                  <ref type="entry">chien</ref>
               </xr> et je lui fais manger sa soupe. Le soir je lui siffle de venir se coucher
            </quote>
            <bibl>RENARD, Poil de Carotte, 1894, p. 102.</bibl>
            <cit type="translation">
               <!-- included in the french cit, otherwise relation is lost -->
               <quote xml:lang="en">In the morning, I open the door for the dog, and i ...</quote>
            </cit>
            <bibl>
               <!-- If the translation is from a published source, there could be a bibl here as well -->
            </bibl>
         </cit>
      </xr>
      <xr type="translationEquivalent">
         <lbl>Female</lbl>
         <ref xml:lang="fr" type="entry">chienne</ref>
         <cit xml:lang="fr">
            <quote>6. Les fleuristes, murmura Lorilleux, toutes des Marie-couche-toi-là. Eh bien! Et
               moi? reprit la grande veuve, les lèvres pincées. Vous êtes galant.
               Vous savez, je ne suis pas une 
               <xr type="the_type_formerly_known_as_oref">
                  <ref type="entry">chienne</ref>
               </xr> , je ne me mets pas les pattes en l'air, quand on siffle! 
            </quote>
            <bibl>ZOLA, L'Assommoir, 1877, p. 681.</bibl>
            <!-- possible translation -->
            <cit type="translation">…..</cit>
         </cit>
      </xr>
   </sense>
</entry>
```
### 5.3.3. Synonym, hyperonym, etc as (part of) a definition (“synonym definition", “genus
proximum”)
Under consideration. See this <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="https://github.com/DARIAH-ERIC/lexicalresources/issues/24">issue</a> on GitHub.

## 6. Usage information
In the current TEI guidelines, <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.usg" title="<usg&gt;">&lt;usg&gt;</a> is defined as an element which marks up “usage information in a dictionary entry”.
Prototypically, usage information is a label which can be attached at various points
in the entry hierarchy in order to signal e. g. restrictions in terms of geographic
regions, domains of specialized language or stylistic properties for the particular
lexical item that it is attached to.

### 6.1. Label-like vs. narrative usage descriptions
Usage information ca be provided in dictionaries both in the form of label-like descriptors
(often abbreviated) and as fuller narrative expressions.

Consider, for instance, the following senses taken from a German entry for Pflaume
“plum” where usage information is provided by labels taken from fixed sets of values
for stylistic and diatopic properties:


```xml
<sense xmlns="http://www.tei-c.org/ns/Examples" n="1">
   <def xml:lang="de">Frucht des Pflaumenbaums</def>
   <def xml:lang="en">fruit of the plum tree</def>
</sense>
<sense xmlns="http://www.tei-c.org/ns/Examples" n="2">
   <usg type="register" norm="colloquial">ugs.</usg>
   <def xml:lang="de">Pflaumenbaum</def>
   <def xml:lang="en">plum tree</def>
</sense>
<sense xmlns="http://www.tei-c.org/ns/Examples" n="3">
   <usg type="style" norm="casual">salopp</usg>
   <usg type="style" norm="expletive">Schimpfwort</usg>
   <def xml:lang="de">ungeschickter, untauglicher Mensch</def>
   <def xml:lang="en">awkward, ineligible person</def>
</sense>
<sense xmlns="http://www.tei-c.org/ns/Examples" n="4">
   <usg type="geo" norm="regional">landsch.</usg>
   <usg type="style" norm="casual">salopp</usg>
   <def xml:lang="de">anzügliche, leicht boshafte Bemerkung</def>
   <def xml:lang="en">offensive, slightly mischievous remark</def>
</sense>
```
In contrast to the example above, the following sample features an occurrence of a
more verbose usage description that does not rely on a fixed vocabulary. The sample
is taken from a Serbian dialect dictionary. The quote in the dialect is further qualified
by a usage hint: “(said by a peasant woman in the field in hot weather)” which provides
a particular context in which the quote was recorded.


<div xmlns="http://www.w3.org/1999/xhtml" class="table">
   <table class="rules" style="border-collapse:collapse;border-spacing:0;">
      <tr>
         <td style="border: 1px solid black; padding: 2px;">
            ```xml
            <cit xmlns="http://www.tei-c.org/ns/Examples" type="example">
               <quote>„Ду́ни, ве́тре, се́јче леб да пе́че”</quote>
               <usg type="hint">(рекла сељанка на њиви за време врућине)</usg>
               <bibl>(
                  <placeName>Дубница</placeName>).
               </bibl>
            </cit>
            ```
            
         </td>
      </tr>
   </table>
</div>### 6.2. Types of usage informationNote: frequency information in a dictionary: usage?
(corpus based dictionary with frequency information)oldest attestation: date + location
of oldest attestation of an entry in a corpus based dictionary: usage?
USAGE FURTHER INVESTIGATED: <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="https://docs.google.com/document/d/10xxYwTSrAk1otrkOCZCIwE79VhTjObqmTRhpKosipyU/edit#heading=h.selhcccybq1y">https://docs.google.com/document/d/10xxYwTSrAk1otrkOCZCIwE79VhTjObqmTRhpKosipyU/edit#heading=h.selhcccybq1y</a>

In lexicographic literature, usage information is not always uniformly classified.
Compare, for instance, Svendsen (2009): 


<div xmlns="http://www.w3.org/1999/xhtml" class="figure"><img src="https://i.imgur.com/uXnKDcE.png" alt="(image taken from Marcin Overgaard, Theoretical Considerations for the Improvement of Usage Labelling in Dictionaries: a Combined Formal-Functional Approach. In: International Journal of Lexicography, Vol. 23 No. 4, pp. 411–442.)" class="graphic"></img></div>and Atkins and Rundell (2008) 


<div xmlns="http://www.w3.org/1999/xhtml" class="figure"><img src="https://i.imgur.com/RDyjhtm.png" alt="B.T. Atkins and M. Rundell, The Oxford Guide to Practical Lexicography. Oxford University Press, 2008, p. 183" class="graphic"></img></div>Svendsen and Atkins and Rundell can, however, be mapped against each other – with
the exception of one category which is present only in the latter: 


<div xmlns="http://www.w3.org/1999/xhtml" class="table">
   <table>
      <tr>
         <td>Svendsen</td>
         <td>Atkins and Rundell</td>
         <td>Examples</td>
         <td>Summary</td>
      </tr>
      <tr>
         <td>Diachronic marking (Time)</td>
         <td>Time</td>
         <td>arch., dated, ...</td>
         <td>TIME</td>
      </tr>
      <tr>
         <td>Diatopic marking (Place)</td>
         <td>Region</td>
         <td>AmE., dial. ...</td>
         <td>GEO</td>
      </tr>
      <tr>
         <td>Diaintegrative marking (Nationality)</td>
         <td>-</td>
         <td>Lat., ...</td>
         <td>LANGUAGE</td>
      </tr>
      <tr>
         <td>Diastratic marking (Socio-Cultural)</td>
         <td>Register / Style</td>
         <td>formal, informal, journalese ...</td>
         <td>SOCIO-CULTURAL</td>
      </tr>
      <tr>
         <td>Diatechnical marking (Technicality)</td>
         <td>Domain</td>
         <td>Mil., Biol., ...</td>
         <td>DOMAIN</td>
      </tr>
      <tr>
         <td>Diafrequential marking (Frequency)</td>
         <td></td>
         <td></td>
         <td>FREQUENCY</td>
      </tr>
      <tr>
         <td>Diaevaluative marking (Attitude)</td>
         <td>Attitude</td>
         <td>pejor., iron., ...</td>
         <td>ATTITUDE</td>
      </tr>
      <tr>
         <td>Dianormative marking (Normativity)</td>
         <td></td>
         <td></td>
         <td>NORMATIVITY</td>
      </tr>
      <tr>
         <td></td>
         <td>Meaning type</td>
         <td>Lit., Fig. ...</td>
         <td>MEANING TYPE</td>
      </tr>
   </table>
</div>In TEI, <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.usg" title="<usg&gt;">&lt;usg&gt;</a> is a typed element. The type of a <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.usg" title="<usg&gt;">&lt;usg&gt;</a> element can be conceived as a conceptual axis (independent from other types) along
which the given value of the element is located. The TEI <span xmlns="http://www.w3.org/1999/xhtml" style="font-style:italic">Guidelines</span> offer a range of sample values for types to illustrate potential uses of <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.usg" title="<usg&gt;">&lt;usg&gt;</a>, but not al of them have been carried over to TEI Lex-0. The following table shows
the differences between suggested values of <span xmlns="http://www.w3.org/1999/xhtml" class="att">type</span> in TEI and the required values of <span xmlns="http://www.w3.org/1999/xhtml" class="att">type</span> in TEI Lex-0:


<div xmlns="http://www.w3.org/1999/xhtml" class="table">
   <table class="rules" style="border-collapse:collapse;border-spacing:0;">
      <tr>
         <td style="border: 1px solid black; padding: 2px;">suggested values in TEI P5</td>
         <td style="border: 1px solid black; padding: 2px;">corresponding Svendsen – Atkins and Rundell mapping </td>
         <td style="border: 1px solid black; padding: 2px;"><span style="font-weight:bold">TEI Lex-0</span></td>
         <td style="border: 1px solid black; padding: 2px;">example value</td>
      </tr>
      <tr>
         <td style="border: 1px solid black; padding: 2px;">geo</td>
         <td style="border: 1px solid black; padding: 2px;">GEO</td>
         <td style="border: 1px solid black; padding: 2px;"><span style="font-weight:bold">geographic</span></td>
         <td style="border: 1px solid black; padding: 2px;">AmE., dial.</td>
      </tr>
      <tr>
         <td style="border: 1px solid black; padding: 2px;">time</td>
         <td style="border: 1px solid black; padding: 2px;">TIME</td>
         <td style="border: 1px solid black; padding: 2px;"><span style="font-weight:bold">temporal</span></td>
         <td style="border: 1px solid black; padding: 2px;">archaic, old</td>
      </tr>
      <tr>
         <td style="border: 1px solid black; padding: 2px;">dom</td>
         <td style="border: 1px solid black; padding: 2px;">DOMAIN</td>
         <td style="border: 1px solid black; padding: 2px;"><span style="font-weight:bold">domain</span></td>
         <td style="border: 1px solid black; padding: 2px;">scientific, literary</td>
      </tr>
      <tr>
         <td style="border: 1px solid black; padding: 2px;">reg</td>
         <td style="border: 1px solid black; padding: 2px;">SOCIO-CULTURAL</td>
         <td style="border: 1px solid black; padding: 2px;"><span style="font-weight:bold">socioCultural</span></td>
         <td style="border: 1px solid black; padding: 2px;">slang, vulgar</td>
      </tr>
      <tr>
         <td style="border: 1px solid black; padding: 2px;">style</td>
         <td style="border: 1px solid black; padding: 2px;">-</td>
         <td style="border: 1px solid black; padding: 2px;"><span style="font-weight:bold">meaningType</span></td>
         <td style="border: 1px solid black; padding: 2px;">figurative, literal</td>
      </tr>
      <tr>
         <td style="border: 1px solid black; padding: 2px;">plev</td>
         <td style="border: 1px solid black; padding: 2px;">-</td>
         <td style="border: 1px solid black; padding: 2px;"><span style="font-weight:bold">frequency</span></td>
         <td style="border: 1px solid black; padding: 2px;">rare, occas.</td>
      </tr>
      <tr>
         <td style="border: 1px solid black; padding: 2px;">-</td>
         <td style="border: 1px solid black; padding: 2px;"></td>
         <td style="border: 1px solid black; padding: 2px;"><span style="font-weight:bold">attitude</span></td>
         <td style="border: 1px solid black; padding: 2px;">formal, informal</td>
      </tr>
      <tr>
         <td style="border: 1px solid black; padding: 2px;">-</td>
         <td style="border: 1px solid black; padding: 2px;"></td>
         <td style="border: 1px solid black; padding: 2px;"><span style="font-weight:bold">normativity</span></td>
         <td style="border: 1px solid black; padding: 2px;">non-standard</td>
      </tr>
      <tr>
         <td style="border: 1px solid black; padding: 2px;">lang</td>
         <td style="border: 1px solid black; padding: 2px;">LANGUAGE</td>
         <td style="border: 1px solid black; padding: 2px;"><span style="font-weight:bold">-</span></td>
         <td style="border: 1px solid black; padding: 2px;"></td>
      </tr>
      <tr>
         <td style="border: 1px solid black; padding: 2px;">gram</td>
         <td style="border: 1px solid black; padding: 2px;">-</td>
         <td style="border: 1px solid black; padding: 2px;"><span style="font-weight:bold">-</span></td>
         <td style="border: 1px solid black; padding: 2px;"></td>
      </tr>
      <tr>
         <td style="border: 1px solid black; padding: 2px;">syn</td>
         <td style="border: 1px solid black; padding: 2px;">-</td>
         <td style="border: 1px solid black; padding: 2px;"><span style="font-weight:bold">-</span></td>
         <td style="border: 1px solid black; padding: 2px;"></td>
      </tr>
      <tr>
         <td style="border: 1px solid black; padding: 2px;">hyper</td>
         <td style="border: 1px solid black; padding: 2px;">-</td>
         <td style="border: 1px solid black; padding: 2px;"><span style="font-weight:bold">-</span></td>
         <td style="border: 1px solid black; padding: 2px;"></td>
      </tr>
      <tr>
         <td style="border: 1px solid black; padding: 2px;">colloc</td>
         <td style="border: 1px solid black; padding: 2px;">-</td>
         <td style="border: 1px solid black; padding: 2px;"><span style="font-weight:bold">-</span></td>
         <td style="border: 1px solid black; padding: 2px;"></td>
      </tr>
      <tr>
         <td style="border: 1px solid black; padding: 2px;">comp</td>
         <td style="border: 1px solid black; padding: 2px;">-</td>
         <td style="border: 1px solid black; padding: 2px;"><span style="font-weight:bold">-</span></td>
         <td style="border: 1px solid black; padding: 2px;"></td>
      </tr>
      <tr>
         <td style="border: 1px solid black; padding: 2px;">obj</td>
         <td style="border: 1px solid black; padding: 2px;">-</td>
         <td style="border: 1px solid black; padding: 2px;"><span style="font-weight:bold">-</span></td>
         <td style="border: 1px solid black; padding: 2px;"></td>
      </tr>
      <tr>
         <td style="border: 1px solid black; padding: 2px;">subj</td>
         <td style="border: 1px solid black; padding: 2px;">-</td>
         <td style="border: 1px solid black; padding: 2px;"><span style="font-weight:bold">-</span></td>
         <td style="border: 1px solid black; padding: 2px;"></td>
      </tr>
      <tr>
         <td style="border: 1px solid black; padding: 2px;">verb</td>
         <td style="border: 1px solid black; padding: 2px;">-</td>
         <td style="border: 1px solid black; padding: 2px;"><span style="font-weight:bold">-</span></td>
         <td style="border: 1px solid black; padding: 2px;"></td>
      </tr>
      <tr>
         <td style="border: 1px solid black; padding: 2px;">hint</td>
         <td style="border: 1px solid black; padding: 2px;">-</td>
         <td style="border: 1px solid black; padding: 2px;"><span style="font-weight:bold">hint</span></td>
         <td style="border: 1px solid black; padding: 2px;"></td>
      </tr>
   </table>
</div>In TEI-Lex-0:


<ol xmlns="http://www.w3.org/1999/xhtml">
   <li class="item">The <span class="att">type</span> attribute is made mandatory.
   </li>
   <li class="item">The element <a class="link_ref" href="#TEI.usg" title="<usg&gt;">&lt;usg&gt;</a> is used in a narrower sense than is currently the case in the TEI <span style="font-style:italic">Guidelines</span>.
   </li>
   <li class="item">The <span class="att">norm</span> attribute is encouraged.
   </li>
</ol>Justification:


<ol xmlns="http://www.w3.org/1999/xhtml">
   <li class="item">Without <span class="att">type</span> attribute, <a class="link_ref" href="#TEI.usg" title="<usg&gt;">&lt;usg&gt;</a> would be an underspecified element. Usage labels describe a wide range of linguistic
      phenomena. Classifying them should be considered a good practice.
   </li>
   <li class="item">Currently, the TEI <span style="font-style:italic">Guidelines</span> contain an overuse of <a class="link_ref" href="#TEI.usg" title="<usg&gt;">&lt;usg&gt;</a> for describing phenomena that could be covered by alternative, more narrowly defined
      TEI elements. It should be considered a good practice to use the most specific TEI
      element available. See table above and the next section <a class="link_ref" href="#RestristingUsg" title="Restricting the scope of usg">Restricting the scope of <span class="gi">&lt;usg&gt;</span></a></li>
   <li class="item">It is good practice to normalize the values of the <a class="link_ref" href="#TEI.usg" title="<usg&gt;">&lt;usg&gt;</a> elements because dictionaries are not always consistent in the way they use their
      usage labels. For instance, abbreviated and unabbreviated labels can appear in the
      same dictionary: they should be normalized to a single value. Normalization should
      be only restricted to a single dictionary. A global normalization effort is currently
      beyond the scope of TEI Lex-0.
   </li>
</ol>### 6.3. Restricting the scope of &lt;usg&gt;

<ol xmlns="http://www.w3.org/1999/xhtml">
   <li class="item">Do not use <span class="tag">&lt;usg type="lang"&gt;</span> to mark up the name of a language in an etymological or other discussion. The recommended
      way to encode this information is using <a class="link_ref" href="#TEI.lang" title="<lang&gt;">&lt;lang&gt;</a> element within <a class="link_ref" href="#TEI.etym" title="<etym&gt;">&lt;etym&gt;</a>.
      
      INCORRECT
      
      
      ```xml
      <entryFree xmlns="http://www.tei-c.org/ns/Examples" xml:id="MZ.RGJS.сајдисльк">
         <form type="lemma">
            <orth>сајдисль́к</orth>
         </form>
         <gramGrp>
            <gram type="pos">м</gram>
         </gramGrp>
         <usg type="lang">тур.</usg>
         <sense>
            <def>уважавање.</def> … 
         </sense>
      </entryFree>
      ```
      CORRECT
      
      
      ```xml
      <entry xmlns="http://www.tei-c.org/ns/Examples" xml:id="MZ.RGJS.сајдисльк">
         <form type="lemma">
            <orth>сајдисль́к</orth>
         </form>
         <gramGrp>
            <gram type="pos">м</gram>
         </gramGrp>
         <etym>
            <lang value="tr">тур.</lang>
         </etym>
         <sense>
            <def>уважавање.</def> … 
         </sense>
      </entry>
      ```
      
   </li>
   <li class="item">Do not use <span class="tag">&lt;usg type="hyper"&gt;</span> or <span class="tag">&lt;usg type="syn"&gt;</span> to mark lexical relations such as hyperonymy or synonymy. The recommended way to
      encode lexical relations is using the reference mechanism provided by <span class="tag">&lt;xr type="syn"&gt;</span>. TOMA TODO: add examples
   </li>
   <li class="item">Do not use <span class="tag">&lt;usg type="colloc"&gt;</span> or for that matter "comp.", "obj.", "subj.", "verb" etc., but rather <span class="tag">&lt;colloc type="object"&gt;</span> or <span class="tag">&lt;colloc type="preposition"&gt;</span>.
   </li>
   <li class="item"><span class="tag">&lt;usg type="hint"&gt;</span> should be used as fallback for cases where the usage information does not fall into
      one of the recognized cases discussed above.
   </li>
   <li class="item">Frequency information on lexicographic entities may differ from other types of usage
      information in that it often cannot be interpreted without further context. In phrases
      such as “mostly biology” or “rarely used in American English” it serves the purpose
      of a modifier (quantifier) to another usage information (or other lexical information).
      Such use calls for modeling the frequency information as an attribute to the usg element
      modified. For frequency information provided explicitly (e.g. corpus frequencies),
      a separate element should be introduced. TODO
   </li>
</ol><span xmlns="http://www.w3.org/1999/xhtml" class="hi">stuff to think about:</span>


<ul xmlns="http://www.w3.org/1999/xhtml">
   <li class="item"><span class="hi">Frequency and source corpus? ie. source attribute &lt;usg type=”frequency” unit=????
         source= “this_and_that_corpus”&gt;12&lt;/usg&gt; </span></li>
</ul>Sample from Althochdeutsches Wörterbuch, feel free to annotate:


<div xmlns="http://www.w3.org/1999/xhtml" class="figure"><img src="media/image27.png" alt="" class="inline" style=" width:10.874375cm; height:3.889375cm;"></img></div>Text:

aba-nemanto adv.; vgl. mhd. abenemende part.-adj.

(vgl. Findebuch S. 2). - Graff 11,1063 s. v. abaneman.

aba-nemend-: -o Np 45,10 (Ausg. K.-T getrennt

geschr.); -a Npw 9 (getrennt geschr.).

etw. beendend, mit abstr. Akk.: uuieo tuot er diu?

abanemendo dia uuiga . unz ze ende dero erdo aufe-

rens bella usque adfines terrae NpNpw 45,10 (= Npw 9).

Here is a typical WNT dictScrap (“kopje”) (<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="http://gtb.inl.nl/iWDB/search?actie=article&amp;wdb=WNT&amp;id=M073402"><span class="hi">http://gtb.inl.nl/iWDB/search?actie=article&amp;wdb=WNT&amp;id=M073402</span></a>)

— VERKEN —, znw. onz., mv. -s. Oorspr. is verken de alg. vorm in de mnl. schrijftaal,
doch deze wordt naderhand, vooral in de 17de e., door holl. varken verdrongen. Verken,
dat buiten Holland de gewone vorm in de dial. is, komt nog bij zndl. schrijvers voor.
De uit het mnl. bekende meervoudsvorm varken, verken vindt men nog in de 16de en 17de
e. (O. Rechtsbr. v. Steenb. 81 [1504]; Gem. Duytsche Spreckw. H 5 r° [1550]; gruterus
2, 129 [1611]; zie nog cats 2, 320 b [1656], echter in het rijm); de eveneens mnl.
formatie varkene(n), verkene(n) komt nog tot in de 17de e. voor (v. dillen, Bedrijfslev.
Amst. 1, 199 [1550]; Utr. Placaatb. 3, 674 a [1617]). De thans eenig gebruikelijke
meervoudsvorm op -s is pas in de 15de e. voor het eerst aangetroffen (posthumus, Leidsche
Textielnijverh. 1, 157 [1436], R. v. Zieriks. 281 [1485].) Het verkl. verksken (zie
Teuthon. [1477]; junius, Nomencl. 57 a [1567]; kil. [1574]; heerman, Annot. 207 a
[1642]) is in Z.-Nederl. de gewone vorm (j. joos, Schetsen en Schertsen 124 [1906]);
varkske(n) (timmermans, Anna-Marie 47 [1921]) sluit aan bij een gedepalataliseerd
brab. varken. Thans in de cultuurtaal alleen varkentje.

Mnl. verken, varken naast ouder verkin (reeds 1208 als bijnaam, zie H. Top. Dial.
20, 54), varkin; mnd. verken, varken, nnd. ferken, farken, varken; nhd. ferken (&lt;
nd.). Verken is de uit germ. *farχîna- ontstane umlautsvorm (zie v. wijk [1912]) met
depalatalisatie tot varken en overgang χ &gt; k in de inlaut (verg. hd. ferkel &lt; ohd.farhilî(n)).
Eig., evenals veulen en kuiken, het ter aanduiding van het jonge dier gebruikte gesubstantiveerde
neutrum van een met -în-suffix gevormd bnw. (verg. lat.taurînus, suînus) — met een
diminutieve bet., die in het mnl. soms nog merkbaar is — bij germ. *farχaz: oeng.
fearh, neng. (veroud.) farrow (verg. to farrow); ohd. farh, farah, mhd. varch, nhd.
(dial.) farch, fark ”big, varken”; verg. zwe. fargalt ”ever”; buiten het germ. lat.
porcus; iersch orc (&lt; *pork); lit. pa᪇szas ”gecastreerd varken”; ksl. prasę ”big”.
Zie verder Ts. 67, Afl. 2.

## 7. References

<ul xmlns="http://www.w3.org/1999/xhtml">
   <li class="item">Parthenos WP4 standards library at GitHub:<a class="link_ref" href="https://github.com/ParthenosWP4/standardsLibrary"></a><a class="link_ref" href="https://github.com/ParthenosWP4/standardsLibrary"><span class="hi">https://github.com/ParthenosWP4/standardsLibrary</span></a> with a collection of dictionary samples (many in TEI formats) under Lexicography/ENeL-WG2/Dictionary
      Samples/
   </li>
   <li class="item">V. papers on “logical structure” of MRD/LDBs: 
      <ul>
         <li class="item">Ide, N., Kilgarriff, A., Romary, L. (2000).<a class="link_ref" href="https://www.kilgarriff.co.uk/Publications/2000-IdeKilgRomary-Euralex.pdf"></a><a class="link_ref" href="https://www.kilgarriff.co.uk/Publications/2000-IdeKilgRomary-Euralex.pdf"><span class="hi">A Formal Model of Dictionary Structure and Content.</span></a><span class="hi">Proceedings of Euralex 2000,</span> Stuttgart, 113-126.
         </li>
         <li class="item">Erjavec, T., Evans, R., Ide, N., Kilgarriff, A. (2000).<a class="link_ref" href="http://www.lrec-conf.org/proceedings/lrec2000/html/summary/335.htm"></a><a class="link_ref" href="http://www.lrec-conf.org/proceedings/lrec2000/html/summary/335.htm"><span class="hi">The CONCEDE Model for Lexical Databases.</span></a>. <span class="hi">Proceedings of the Second Language Resources and Evaluation Conference</span> (LREC), Athens, Greece, 355-62.
         </li>
      </ul>
   </li>
</ul>## 8. Misc. examples (these are various leftovers, TODO cleanup)
<span xmlns="http://www.w3.org/1999/xhtml" class="hi">Example discussed at ENel WG2 Budapest</span>


<ul xmlns="http://www.w3.org/1999/xhtml">
   <li class="item">Example from A DICTIONARY OF MANGAREVA (OR GAMBIER ISLANDS)</li>
</ul><span xmlns="http://www.w3.org/1999/xhtml" class="hi">The original text:</span>

<span xmlns="http://www.w3.org/1999/xhtml" class="hi">AGAI</span> ( àgài), adopted or adoptive. Ex. Motua agai, an adoptive

father, a foster­father. To nurse; to nurture. To give food to. 2.

To manure the ground. 3. To impregnate female flowers with

those of the male.

Aka­agai, to nourish; to feed. Plural akaagaigai.

<span xmlns="http://www.w3.org/1999/xhtml" class="hi">The TEI-Lex0 encoding:</span>

<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a>

&lt;form type="lemma"&gt;

<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.orth" title="<orth&gt;">&lt;orth&gt;</a>AGAI&lt;/orth&gt;

<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.pc" title="<pc&gt;">&lt;pc&gt;</a>(&lt;/pc&gt; <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.pron" title="<pron&gt;">&lt;pron&gt;</a>àgài&lt;/pron&gt;<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.pc" title="<pc&gt;">&lt;pc&gt;</a>)&lt;/pc&gt; <span xmlns="http://www.w3.org/1999/xhtml" class="hi">&lt;!-- dictscrap vs pc --&gt;</span>

&lt;/form&gt;

&lt;sense n="1"&gt;

<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.sense" title="<sense&gt;">&lt;sense&gt;</a>

<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.def" title="<def&gt;">&lt;def&gt;</a>adopted or adoptive.&lt;/def&gt; <span xmlns="http://www.w3.org/1999/xhtml" class="hi">&lt;!-- should/could translation equivalent rather than <a class="link_ref" href="#TEI.def" title="<def&gt;">&lt;def&gt;</a> --&gt;</span>

&lt;cit type="example"&gt;

<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.lbl" title="<lbl&gt;">&lt;lbl&gt;</a>Ex.&lt;/lbl&gt;

<span xmlns="http://www.w3.org/1999/xhtml" class="gi">&lt;quote&gt;</span> Motua agai,&lt;/quote&gt;

&lt;cit type="translation"&gt;

<span xmlns="http://www.w3.org/1999/xhtml" class="gi">&lt;quote&gt;</span>an adoptive father, a foster­father.&lt;/quote&gt;

&lt;/cit&gt;

&lt;/cit&gt; 

&lt;/sense&gt;

<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.sense" title="<sense&gt;">&lt;sense&gt;</a>

<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.def" title="<def&gt;">&lt;def&gt;</a>To nurse; to nurture. To give food to.&lt;/def&gt;

&lt;/sense&gt;

&lt;/sense&gt;

&lt;sense n="2"&gt; 2.

<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.def" title="<def&gt;">&lt;def&gt;</a>To manure the ground.&lt;/def&gt;

&lt;/sense&gt; 

&lt;sense n="3"&gt;3. 

<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.def" title="<def&gt;">&lt;def&gt;</a>To impregnate female flowers with

those of the male.&lt;/def&gt;

&lt;/sense&gt;

<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a>

&lt;form type="compound"&gt;

<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.orth" title="<orth&gt;">&lt;orth&gt;</a>Aka­agai,&lt;/orth&gt;

&lt;/form&gt;

<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.sense" title="<sense&gt;">&lt;sense&gt;</a> to nourish; to feed.&lt;/sense&gt;

&lt;form type="inflected"&gt;

<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.gramGrp" title="<gramGrp&gt;">&lt;gramGrp&gt;</a>Plural akaagaigai.&lt;/gramGrp&gt;

&lt;/form&gt;

&lt;/entry&gt;

&lt;/entry&gt;

### 8.1. X.2.
from Milena Hebal-Jezierska’s Czech-Polish dictionary (discussed after the meeting
in Budapest). 


<div xmlns="http://www.w3.org/1999/xhtml" class="figure"><img src="media/image16.png" alt="" class="inline" style=" width:17.832916666666666cm; height:5.675313888888889cm;"></img></div>Piotr’s suggestion follows (and it’s meant as food for thought / basis for discussion):


<div xmlns="http://www.w3.org/1999/xhtml" class="figure"><img src="media/image9.png" alt="" class="inline" style=" width:14.44625cm; height:17.30375cm;"></img></div>Please note: (1) I am not taking a stance on how to encode equivalents. I simply used
what I felt relatively comfortable with. (2) I had nothing to say about <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.usg" title="<usg&gt;">&lt;usg&gt;</a> -- I copied Milena’s suggestion.

I see several issues that are particularly worth discussion here:


<ol xmlns="http://www.w3.org/1999/xhtml">
   <li class="item"><a class="link_ref" href="#TEI.colloc" title="<colloc&gt;">&lt;colloc&gt;</a> However we decide to encode it, let us use a solution that offers structural space
      for grammatical (and other) description of the collocate
   </li>
   <li class="item">note the highlighted @resp at the level of <a class="link_ref" href="#TEI.cit" title="<cit&gt;">&lt;cit&gt;</a>. This is Milena’s “intrusion” into the scanned data. She is responsible for the <a class="link_ref" href="#TEI.cit" title="<cit&gt;">&lt;cit&gt;</a>, so it should be “@resp-able”. Probably nearly every element inside the entry should.
      OR: we (ab)use @decls mechanism for descriptions of such changes. OR (best?) we create
      a @tlex:change attribute that references a single <a class="link_ref" href="#TEI.change" title="<change&gt;">&lt;change&gt;</a> in the <a class="link_ref" href="#TEI.revisionDesc" title="<revisionDesc&gt;">&lt;revisionDesc&gt;</a>.
   </li>
   <li class="item">I used <a class="link_ref" href="#TEI.oRef" title="<oRef&gt;">&lt;oRef&gt;</a> on purpose here, because I got startled when I saw the <a class="link_ref" href="#TEI.xr" title="<xr&gt;">&lt;xr&gt;</a> alternative. I am not saying it’s wrong, but I think we also need a shorthand expression
      (I will add some prose on that)
   </li>
   <li class="item">“kuty na cztery nogi” is an idiomatic expression headed by the passive adjectival
      participle kuty. It would be lemmatized under kuć , probably as a <span class="gi">&lt;re&gt;</span> (or an equivalent). I mention this to make sure that, if we end up using <a class="link_ref" href="#TEI.xr" title="<xr&gt;">&lt;xr&gt;</a> for encoding translation equivalents, we also find a way to handle such cases.
   </li>
</ol>### 8.2. X.3.
From Joanna Bilińska’s Budapest presentation


<div xmlns="http://www.w3.org/1999/xhtml" class="figure"><img src="media/image14.jpg" alt="" class="inline" style=" width:15.92cm; height:3.7394444444444446cm;"></img></div>Entry that we’ve arrived at in Budapest:

<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.entry" title="<entry&gt;">&lt;entry&gt;</a>

&lt;form type="lemma"&gt; 

<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.orth" title="<orth&gt;">&lt;orth&gt;</a>BODŁO&lt;/orth&gt;

<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.pc" title="<pc&gt;">&lt;pc&gt;</a>,&lt;/pc&gt; &lt;!--we don't like this, need better solution for commas--&gt;

&lt;/form&gt;

&lt;form type="ending"&gt;<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.orth" title="<orth&gt;">&lt;orth&gt;</a>a&lt;/orth&gt;

<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.pc" title="<pc&gt;">&lt;pc&gt;</a>,&lt;/pc&gt;

&lt;/form&gt;

<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.gramGrp" title="<gramGrp&gt;">&lt;gramGrp&gt;</a>

&lt;gen value="neutrum"&gt;n.&lt;/gen&gt;

&lt;/gramGrp&gt;

<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.sense" title="<sense&gt;">&lt;sense&gt;</a>

<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.def" title="<def&gt;">&lt;def&gt;</a>bobo, straszydło, potwora, dziwotwor, &lt;/def<span xmlns="http://www.w3.org/1999/xhtml" class="note" id="Note8"><span class="noteLabel">Note: </span><span class="hi">these are translation equivalents</span></span>&gt;

&lt;cit type="translation"&gt;&lt;quote xml:lang="de"&gt;ein<span xmlns="http://www.w3.org/1999/xhtml" class="note" id="Note9"><span class="noteLabel">Note: </span><span class="hi">And this "ein" is weird. It goes for all these three (masculine) nouns, and it actually
      signals "masculine or neuter" (unless the dictionary uses something extra to mark
      German neuters)</span></span><span xmlns="http://www.w3.org/1999/xhtml" class="note" id="Note10"><span class="noteLabel">Note: </span><span class="hi">You could assume ellipsis here and the other two two equivalents would actually be
      "ein Popanz", "ein Unhold" – unfortunately we do not have @expand at hand …</span></span> Schreckbild&lt;/quote&gt;&lt;/cit&gt;

&lt;cit type="translation"&gt;&lt;quote xml:lang="de"&gt;Popanz&lt;/quote&gt;&lt;/cit&gt;

&lt;cit type="translation"&gt;&lt;quote xml:lang="de"&gt;Unhold&lt;/quote&gt;&lt;/cit&gt;

&lt;cit type="example"&gt;

<span xmlns="http://www.w3.org/1999/xhtml" class="gi">&lt;quote&gt;</span>Trudno dać wiarę, by to przecie bodło Podnieść cały wóz jedną ręką

mogło.&lt;/quote<span xmlns="http://www.w3.org/1999/xhtml" class="note" id="Note11"><span class="noteLabel">Note: </span><span class="hi">and this quote here consists of two verses. This is signalled by the rhyming "bodło"-"mogło"
      and by the capitalization of the "Podnieść". I wonder if we can encode this information
      (it may of course remain implicit).</span></span><span xmlns="http://www.w3.org/1999/xhtml" class="note" id="Note12"><span class="noteLabel">Note: </span><span class="hi">quote/l or even quote/lg/l</span></span>&gt;<span xmlns="http://www.w3.org/1999/xhtml" class="gi">&lt;bibl&gt;</span>

<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.author" title="<author&gt;">&lt;author&gt;</a>Opal.&lt;/author&gt; <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.title" title="<title&gt;">&lt;title&gt;</a>poet.&lt;/title&gt; <span xmlns="http://www.w3.org/1999/xhtml" class="gi">&lt;biblScope&gt;</span>8.&lt;/biblScope&gt;&lt;/bibl&gt;&lt;/cit&gt;

&lt;cit type="example"&gt;

<span xmlns="http://www.w3.org/1999/xhtml" class="gi">&lt;quote&gt;</span>Okrutnym przerażona bodłem. &lt;/quote&gt;<span xmlns="http://www.w3.org/1999/xhtml" class="gi">&lt;bibl&gt;</span><a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.author" title="<author&gt;">&lt;author&gt;</a>Pot.<span xmlns="http://www.w3.org/1999/xhtml" class="note" id="Note13"><span class="noteLabel">Note: </span><span class="hi">"Pot." and "Stryjk." are actually abbreviated author names, so we should probably
      reference the authors listed in the header. Same goes for the titles.</span></span>&lt;/author&gt; <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.title" title="<title&gt;">&lt;title&gt;</a>Arg.&lt;/title&gt; <span xmlns="http://www.w3.org/1999/xhtml" class="gi">&lt;biblScope&gt;</span>324.&lt;/biblScope&gt;

<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.author" title="<author&gt;">&lt;author&gt;</a>Stryjk.&lt;/author&gt; <a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="#TEI.title" title="<title&gt;">&lt;title&gt;</a>Gon. U.&lt;/title&gt; <span xmlns="http://www.w3.org/1999/xhtml" class="gi">&lt;biblScope&gt;</span>3.&lt;/biblScope&gt;&lt;/bibl&gt;&lt;/cit&gt;

&lt;/sense&gt;

&lt;/entry&gt;

<a xmlns="http://www.w3.org/1999/xhtml" class="link_ref" href="https://docs.google.com/document/d/1F57EB_zSMPAtDTuAaWC_iRxNQoy4QbjR63t0oWRe4sI/edit?usp=sharing"><span class="hi">https://docs.google.com/document/d/1F57EB_zSMPAtDTuAaWC_iRxNQoy4QbjR63t0oWRe4sI/edit?usp=sharing</span></a>


<ul xmlns="http://www.w3.org/1999/xhtml">
   <li class="item">everywhere where there is a form: use “form”</li>
   <li class="item">cit type=cognate/etymon/descendent for etymology and within: form and @corresp when
      you want to link to somewhere else
   </li>
   <li class="item">cit type = equivalent for bilingual dictionaries and within: form and @corresp when
      you want to link to somewhere else
   </li>
   <li class="item">unresolved: “a certain plant” in cit type=equivalent</li>
   <li class="item">classical references, eg. see also 1.1, use <a class="link_ref" href="#TEI.xr" title="<xr&gt;">&lt;xr&gt;</a><span class="gi">&lt;ref&gt;</span></li>
   <li class="item">ref is allowed inside of def; examples???</li>
   <li class="item">references in etymology that are a bibl refering to extended description: bibl with
      @corresp when wanting to link to external source list
   </li>
   <li class="item">def and gloss: to do: look at examples, from both etymological dictionaries and dictionaries
      with an etymological section (everyone look for examples)
   </li>
</ul>Recommendations on how to do encode idioms, collocates, proverbs etc. (Katrien, Toma)

## 9. Cited sources
<span xmlns="http://www.w3.org/1999/xhtml" class="author">Charles Du Cange. </span><span xmlns="http://www.w3.org/1999/xhtml" class="titlem">Glossarium ad Scriptores Mediae et Infimae Graecitatis</span>, <a xmlns="http://www.w3.org/1999/xhtml" class="link_ptr" href="http://anemi.lib.uoc.gr/metadata/f/4/b/metadata-01-0000493.tkl"><span>http://anemi.lib.uoc.gr/metadata/f/4/b/metadata-01-0000493.tkl</span></a><span xmlns="http://www.w3.org/1999/xhtml" class="publisher">Apud Amissonios</span>. ## 10. Bibliography
<span xmlns="http://www.w3.org/1999/xhtml" class="titlem">A Formal Model of Dictionary Structure and Content</span>, <span xmlns="http://www.w3.org/1999/xhtml" class="author"><span class="persName"> Nancy Ide</span> 131850 <br xmlns:html="http://www.w3.org/1999/xhtml"></br>, </span><span xmlns="http://www.w3.org/1999/xhtml" class="author"><span class="persName"> Adam Kilgarriff</span> 198330 <br xmlns:html="http://www.w3.org/1999/xhtml"></br>, </span><span xmlns="http://www.w3.org/1999/xhtml" class="author"><span class="persName"> Laurent Romary</span>. </span> 0707.3270<span xmlns="http://www.w3.org/1999/xhtml" class="titlem">Proceedings of Euralex 2000</span>, (<span xmlns="http://www.w3.org/1999/xhtml" class="titlem">Euralex 2000</span>, <span xmlns="http://www.w3.org/1999/xhtml" class="date">2000-08-08. </span><span xmlns="http://www.w3.org/1999/xhtml" class="date">2000-08-12. </span> Stuttgart Germany) <span xmlns="http://www.w3.org/1999/xhtml" class="date">2000. </span>pp. 113-126. ## 11. Annex A: Arabic examples to illustrate recursive entries

<div xmlns="http://www.w3.org/1999/xhtml" class="table">
   <table class="rules" style="border-collapse:collapse;border-spacing:0;">
      <tr>
         <td style="border: 1px solid black; padding: 2px;"><span class="hi">Digitised Sample</span></td>
         <td style="border: 1px solid black; padding: 2px;"><span class="hi">TEI-Lex Encoding</span></td>
      </tr>
      <tr>
         <td style="border: 1px solid black; padding: 2px;">
            <div class="figure"><img src="media/image26.png" alt="" class="inline" style=" width:6.746875cm; height:4.1275cm;"></img><span class="note" id="Note14"><span class="noteLabel">Note: </span><span class="hi">In this example, the root entry contains entries which don't have necessarily related
                     meanings</span></span></div><span class="hi">سيج: سيّج الكرم: جعل له سياجا٠ السياج ج سيَاجات</span>
            
            <span class="hi">وأسْوِجة وأَسْوِجة وسُوج: الحائط || ما أُحيط بهِ على شيءٍ كالكرم و النخل٠ السيْجان
               (ح): نوع من السمك</span>
            
            
         </td>
         <td style="border: 1px solid black; padding: 2px;">
            ```xml
            <entry xmlns="http://www.tei-c.org/ns/Examples" type="family">
               <form type="root">
                  <orth type="lemma">سيج</orth>
               </form>
               <pc>:</pc>
               <!-- To fence (verb) -->
               <entry>
                  <form type="lemma">
                     <orth>سيّج</orth>
                  </form>
                  <sense>الكرم: جعل له سياجا</sense>
                  <pc>٠</pc>
               </entry>
               <!-- A fence (noun) -->
               <entry>
                  <form type="lemma">
                     <orth>السياج</orth> ج سيَاجات وأسْوِجة وأَسْوِجة وسُوج
                  </form>
                  <pc>:</pc>
                  <sense>الحائط</sense> || 
                  <sense>ما أُحيط بهِ على شيءٍ كالكرم و النخل</sense>
               </entry>
               <pc>٠</pc>
               <!-- A kind of fish -->
               <entry>
                  <form type="lemma">
                     <orth>السيْجان</orth> (ح)
                  </form>
                  <pc>:</pc>
                  <sense>نوع من السمك</sense>
               </entry>
            </entry>
            ```
            
         </td>
      </tr>
      <tr>
         <td style="border: 1px solid black; padding: 2px;"><span class="note" id="Note15"><span class="noteLabel">Note: </span>In this example, the content of the root entry is organised by sense where each sense
               is composed of different entries listed by POS.</span><div class="figure"><img src="media/image24.png" alt="" class="inline" style=" width:6.797366666666667cm; height:8.294688888888889cm;"></img></div><span class="hi">شهم:١ــ شَهَمَ ــ شَهْمًا وشُهُمًا الفرسَ: زجرهُ || و ــ الرجُلَ: افزعهُ ٠ اَلمشْهوم
               ٠: المذعور</span>
            
            <span class="hi">٢٠ ــ شَهُمَ ـُـ شَهَامةً و شُهُومَةُُ: كان شهْمًا ٠ الشَهْم ج شِهام: الذكيّ الفؤاد
               || السيِّد النافذ الحكم || وــ ج شُهُم: الفرس النشيط السريع القويّ ٠ اَلمَشْهُوم *:
               الذكيّ الفؤاد</span>
            
            <span class="hi">٠٣ ــ الشَيْهَم ج شَيَهِم (ح) ذَكَر القنافذ ٠ الشَيْهَمَة: العجوز</span>
            
            
         </td>
         <td style="border: 1px solid black; padding: 2px;">
            ```xml
            <entry xmlns="http://www.tei-c.org/ns/Examples" type="family">
               <form type="root">
                  <orth>شهم</orth>
               </form>
               <pc>:</pc>
               <entry type="family">١ــ 
                  <!-- To rebuff a horse or to scare a man -->
                  <entry>
                     <form>
                        <orth type="lemma">شَهَم</orth>َ ــ شَهْمًا وشُهُمًا 
                     </form> `
                     <sense>الفرسَ: زجرهُ || و ــ الرجُلَ: افزعه</sense>
                  </entry> ٠ 
                  <entry>
                     <form>
                        <orth type="lemma"> اَلمشْهوم</orth>
                     </form>٠: 
                     <sense>المذعور</sense>
                  </entry> Note: scared (adjective) 
               </entry>
               <sense>٢٠ ــ 
                  <!-- chivalrous -->
                  <entry>
                     <form>
                        <form>
                           <orth type="lemma">شَهُمَ</orth> ـُـ 
                        </form>شَهَامةً و شُهُومَة
                     </form>ُُ
                     <pc>:</pc>
                     <sense>كان شهْم</sense>
                  </entry> ٠ 
                  <entry>
                     <form>
                        <orth type="lemma">الشَهْم </orth>ج شِهام
                     </form>: 
                     <sense>
                        <sense>الذكيّ الفؤاد</sense> || 
                        <sense>السيِّد النافذ الحكم</sense> || 
                        <sense>وــ ج شُهُم:
                           الفرس النشيط السريع القوي
                        </sense>
                     </sense>ّ 
                  </entry>Note: powerful/clever/rapid and strong٠ 
                  <entry>
                     <form>
                        <orth type="lemma">اَلمَشْهُوم</orth>
                     </form>
                     *: 
                     <sense>الذكيّ الفؤاد</sense>
                  </entry>Note: clever 
               </sense>
               <sense>٠٣ ــ 
                  <!-- a male Hedgehog -->
                  <entry>
                     <form>
                        <orth type="lemma">الشَيْهَم</orth> ج شَيَهِم (ح) 
                     </form>
                     <sense>ذَكَر القنافذ</sense>
                  </entry>Note: ٠
                  <entry>
                     <form>
                        <orth type="lemma">الشَيْهَمَة</orth>
                     </form>: 
                     <sense>العجوز</sense>
                  </entry>Note: old woman 
               </sense>
            </entry>
            ```
            
         </td>
      </tr>
      <tr>
         <td style="border: 1px solid black; padding: 2px;">
            <div class="figure"><img src="media/image20.png" alt="" class="inline" style=" width:6.574897222222222cm; height:13.028780555555555cm;"></img></div>ارك: ١- أَرَكَ -ُ أُرُكًا الجملُ: اكل ورق الأَرَاكِ ٠ أَرَكَ ٠- أَرَكًا الجملُ اشتكى
            بطنهُ من أَكل الأَرَاكِ ٠ الأَراك (ن): واحدتهُ أَراكة ج أُرُك و أَرَائِك. شجر ذو شوك.
            طويل الساق، كثير الورق و الأغصان. خوَّار العود تتَّخذ منه المساويك
            
            ٢٠ - أَرَكَ ْ -َ أَرَكًا و أَرِكَ ْ -ُ أُركًا الجرحُ: برأَ
            
            ٣٠ - <span class="hi">أرْوكاريا</span> (ن): شجرة باسقة من فصيلة الصنوبريَّات.منبتها الاصلي٠ اميركا الجنوبية، تزرع في الحدائق
            للزينة، اوراقها شائكة تنبت حتى على الجذع §
            
            ٤٠ <span class="hi">-لأَرِكَة</span> ج أَرِيْك و أَرائك: سرير مزيَّن فاخر
            
            
         </td>
         <td style="border: 1px solid black; padding: 2px;">
            ```xml
            <entry xmlns="http://www.tei-c.org/ns/Examples" type="root">
               <form type="lemma">
                  <orth>ارك</orth>
               </form>: ١-
               <sense>
                  <entry>
                     <form type="lemma">
                        <orth>أَرَكَ</orth> -ُ أُرُكًا
                     </form>
                     <sense>الجملُ: اكل ورق الأَرَاك</sense>
                  </entry>Note: (verb) to eat the "Salvadora persica" plant&gt;٠
                  <entry>
                     <form type="lemma">
                        <orth>أَرَكَ ٠</orth>- أَرَكًا
                     </form>
                     <sense>الجملُ اشتكى بطنهُ من أَكل الأَرَاك</sense>
                  </entry>Note: to have stomachaches from eating the "Salvadora persica" plantِ ٠ 
                  <entry>
                     <form type="lemma">
                        <orth>الأَراك</orth> (ن): واحدتهُ أَراكة ج أُرُك و
                        أَرَائِك
                     </form>. 
                     <sense>شجر ذو شوك. طويل الساق، كثير الورق و الأغصان. خوَّار العود تتَّخذ منه المساويك</sense>
                  </entry>Note: The "Salvadora persica"
                  plant 
               </sense> ٢٠ - 
               <sense>
                  <entry>
                     <form type="lemma">
                        <orth>أَرَكَ</orth> ْ -َ
                     </form>
                     <sense>أَرَكًا</sense>
                  </entry>Note: ? و 
                  <entry>
                     <form type="lemma">
                        <orth>أَرِكَ</orth> ْ -ُ أُركًا
                     </form>
                     <sense>الجرحُ: برأ</sense>
                  </entry>Note: got healed 
               </sense>َ ٣٠ - 
               <sense>
                  <entry>
                     <form type="lemma">
                        <orth>أرْوكاريا</orth>(ن)
                     </form>: 
                     <sense>شجرة باسقة من فصيلة الصنوبريَّات.منبتها الاصلي٠ اميركا الجنوبية، تزرع في الحدائق للزينة،
                        اوراقها
                        شائكة تنبت حتى على الجذع
                     </sense>
                  </entry>Note: Monkey puzzles plant 
               </sense> § ٤٠ -
               <sense>
                  <entry>
                     <form type="lemma">
                        <orth>لأَرِكَة</orth> ج أَرِيْك و أَرائك
                     </form>: 
                     <sense>سرير مزيَّن فاخر</sense>
                  </entry>Note: a luxurious decorated bed 
               </sense>
            </entry>
            ```
            
         </td>
      </tr>
   </table>
</div>## 12. Annex B: additional examples (could be referenced in the main text)
### 12.1. Implicit grammatical information (morpheme or particle)

<div xmlns="http://www.w3.org/1999/xhtml" class="p">cf. TEI List 
   ```xml
   <orth xmlns="http://www.tei-c.org/ns/Examples">Ἀαρών, ὁ</orth>
   ```
    (Jonathan Robie)
</div>Piotr suggested: 


```xml
<form xmlns="http://www.tei-c.org/ns/Examples" type="lemma">
   <orth>Ἀαρών</orth>
</form>
<pc xmlns="http://www.tei-c.org/ns/Examples">,</pc>
<gramGrp xmlns="http://www.tei-c.org/ns/Examples">
   <gram type="pos">ὁ</gram>
</gramGrp>
```
Issues: @norm/@value (@ana? overkill)

Suggested in <span xmlns="http://www.w3.org/1999/xhtml" class="ref">http://jtei.revues.org/540</span>:


```xml
<form xmlns="http://www.tei-c.org/ns/Examples" type="lemma">
   <gramGrp>
      <gen norm="feminine">die</gen>
   </gramGrp>
   <orth>Katze</orth>
</form>
```
 SPECIFICATION missing -- Markdown issues to be fixed 
<!--TEI back-->
<!--Notes in [TEI]-->
<div xmlns="http://www.w3.org/1999/xhtml" class="notes">
   <div class="noteHeading">Notes</div>
   <div class="note" id="ftn2"><span class="noteLabel">2. </span><div class="noteBody"><a class="link_ref" href="http://www.tei-c.org/release/doc/tei-p5-doc/en/html/examples-cit.html"><span class="hi">http://www.tei-c.org/release/doc/tei-p5-doc/en/html/examples-cit.html</span></a>
         
         
      </div>
   </div>
   <div class="note" id="ftn3"><span class="noteLabel">3. </span><div class="noteBody">Note that we do not change the encoding of the example
         
         
      </div>
   </div>
   <div class="note" id="ftn4"><span class="noteLabel">4. </span><div class="noteBody">This is not replaced, but may be complemented by the reference mechanism
         
         
      </div>
   </div>
</div>
<div xmlns="http://www.w3.org/1999/xhtml" class="stdfooter autogenerated">
   <div class="footer">
      <!--standard links to project, institution etc--><a class="plain" href="/">Home</a>&nbsp;
   </div>
   <address>DARIAH WG "Lexical Resources". Date: 2018-09-06<br></br>
      <!--
	  Generated from index.xml using XSLT stylesheets version 7.45.0
	       based on http://www.tei-c.org/Stylesheets/
	       on 2018-09-06T09:19:17Z.
	       SAXON PE 9.8.0.12.
		 --></address>
</div>