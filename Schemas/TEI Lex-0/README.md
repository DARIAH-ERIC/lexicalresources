
<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->
<!-- code_chunk_output -->

* [TEI Lex-0](#tei-lex-0)
	* [What is TEI Lex-0](#what-is-tei-lex-0)
	* [What's where?](#whats-where)
	* [Status](#status)
	* [Context](#context)
* [How to Contribute](#how-to-contribute)

<!-- /code_chunk_output -->



## TEI Lex-0

### What is TEI Lex-0

TEI Lex-0 is a subset of the TEI schema (see [Text Encoding Initiative](http://www.tei-c.org)) serving as a baseline encoding and a target format to facilitate the interoperability of heterogeneously encoded lexical resources.

This is important both in the context of building lexical infrastructures as such and in the context of developing generic TEI-aware tools such as dictionary viewers and profilers.

TEI Lex-0 should not be thought of as a replacement of the Dictionary Chapter in the TEI Guidelines or as the format that must be used for editing or managing individual resources, especially in those projects and/or institutions that already have established workflows based on their own flavors of TEI. TEI Lex-0 should be primarily seen as a format that existing TEI dictionaries can be univocally transformed to in order to be queried, visualized, or mined in a uniform way.

### What's where?

In this repository, you will find:
1. [TEI Lex-0 specification](TEILex0-ODD.xml) which comes in a so-called ODD file ("One Document Does it All") -- a single XML resource which contains explanatory prose, examples of usage and formal declarations for components for the TEI Abstract Model (elements and attributes, modules, as well as classes and macros.); and
2. The [RelaxNG schema](out/TEILex0-ODD.rng) generated from the ODD file which you can use to validate the conformance of your dictionary files with TEI Lex-0.
3. An HTML version of the TEI Lex-0 specification, which you can _consult directly in the browser_, is here (TODO:add link).

### Status

TEI Lex-0 is a work in progress. Our first public release, 0.7 will officially see the light of the day on September 11, 2018.

While the core elements of TEI Lex-0 stand in place, it is expected that the schema will continue to evolve significantly in the coming months.

### Context

Preliminary work for the establishment of TEI Lex-0 started in the Working Group "Retrodigitised Dictionaries" as part of the COST Action European Network of e-Lexicography (ENeL).

Upon the completion of the COST Action, the work on TEI Lex-0 was taken up by the DARIAH Working Group "Lexical Resources".

Currently, the work on TEI Lex-0 is conducted by the DARIAH WG "Lexical Resources" and the H2020-funded European Lexicographic Infrastructure (ELEXIS).

## How to Contribute

If you are working on TEI-encoded dictionaries, we'd love to get your feedback. To get in touch or leave feedback, please use our [issues tracker](https://github.com/DARIAH-ERIC/lexicalresources/issues) here on GitHub.

More advanced users can propose solutions by submitting pull requests. Instructions for submitting pull requests will be made at a later date.

<p style='float:left'><img id ="ttl" src="../../docs/assets/img/dariahlogo.png" width="200px"></p>

<p style='float:right'><img style="float:right; padding-top:20px"id ="se" src="../../docs/assets/elexis_logo_color-1-2.png" width="250px"></p>
