
<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->
<!-- code_chunk_output -->

- [TEI Lex-0](#tei-lex-0)
  - [What is TEI Lex-0](#what-is-tei-lex-0)
  - [What's where?](#whats-where)
  - [How to Contribute](#how-to-contribute)
    - [The internal nitty-gritty](#the-internal-nitty-gritty)
    - [GitHub workflow](#github-workflow)
  - [Context](#context)

<!-- /code_chunk_output -->



# TEI Lex-0

## What is TEI Lex-0

TEI Lex-0 is a subset of the TEI schema (see [Text Encoding Initiative](http://www.tei-c.org)) serving as a baseline encoding and a target format to facilitate the interoperability of heterogeneously encoded lexical resources.

This is important both in the context of building lexical infrastructures as such and in the context of developing generic TEI-aware tools such as dictionary viewers and profilers.

TEI Lex-0 should not be thought of as a replacement of the Dictionary Chapter in the TEI Guidelines or as the format that must be used for editing or managing individual resources, especially in those projects and/or institutions that already have established workflows based on their own flavors of TEI. TEI Lex-0 should be primarily seen as a format that existing TEI dictionaries can be univocally transformed to in order to be queried, visualized, or mined in a uniform way.

_TEI Lex-0 is a work in progress._

## What's where?

In this repository, you will find:
1. [TEI Lex-0 specification](TEILex0.odd) which comes in a so-called ODD file ("One Document Does it All") -- a single XML resource which contains explanatory prose, examples of usage and formal declarations for components for the TEI Abstract Model (elements and attributes, modules, as well as classes and macros.); and
2. The [RelaxNG schema](out/TEILex0.rng) generated from the ODD file which you can use to validate the conformance of your dictionary files with TEI Lex-0.
3. An HTML version of the TEI Lex-0 Guidelines, which you can _consult directly in the browser_, is [here](https://dariah-eric.github.io/lexicalresources/pages/TEILex0/TEILex0.html).

## How to Contribute

If you are working on TEI-encoded dictionaries, we'd love to get your feedback. To get in touch or leave feedback, please use our [issues tracker](https://github.com/DARIAH-ERIC/lexicalresources/issues) here on GitHub.

More advanced users can propose solutions by submitting pull requests. Make sure you understand the internal nitty-gritty as well as our GitHub workflow.

### The internal nitty-gritty

- `TEILex0.odd` is an index file: it uses a bunch of `<xi:include>` pointers to individual "chapters" which live in `TEILex0.parts`
- examples of dictionary entries encoded in TEI Lex-0 live in a file called `examples.xml` inside the folder `TEILex0.examples`
- `examples.xml` validates against the TEI Lex-0 schema compiled in `out/TEILex0.rng`
- `stylesheets/tei-stripper.xsl` is used to strip the TEI examples file of the TEI namespace, replacing it with "http://www.tei-c.org/ns/Examples" so that they can be used directly inside `<egXML>` in our ODD file. For more info about why this is necessary, see [https://github.com/BCDH/tei-strip-and-include](https://github.com/BCDH/tei-strip-and-include)
- to include validated examples, you can either point to the id of the element you want to include using the xpointer() scheme like this:
   ```xml
   <egXML xmlns="http://www.tei-c.org/ns/Examples">
     <xi:include href="../TEILex0.examples/examples.stripped.xml"
      corresp="../TEILex0.examples/examples.xml" xpointer="pflaume"/>
   </egXML>
   ```
   or, using the element() scheme, you can also include segments:

   ```xml
   <egXML xmlns="http://www.tei-c.org/ns/Examples" xml:id="d1e3178">
      <xi:include href="../TEILex0.examples/examples.stripped.xml" corresp="../TEILex0.examples/examples.xml"
      xpointer="element(MZ.RGJS.сејче/4/1)"/>
   </egXML>
   ```
  If you are using oXygen XML, clicking on the link in Author Mode will take you directly to the element or fragment in the `examples.xml` for editing XML.

  ![Скриншот 2020-05-06 10.59.05](https://i.imgur.com/BLvHW45.png)
- After making any changes to `examples.xml`, use the `tei-stripper.xsl` (or the include TEI Stripper transformation scenario in oXygen) to produce `examples.stripped.xml`. Without this step, the examples in your ODD file will not validate.

### GitHub workflow

  - fork this repository
  - clone your fork on your machine
  - create a branch for each new issue you're working on.
  - when you commit and push, you will be pushing to your fork (i.e. we won't be able to see your changes in our main repository (the so-called "upstream")
  - when you are ready to submit your contribution to TEI Lex-0, create a pull request (in GitHub Desktop: Branch > Create Pull Request)
  - once your pull request has been merged, you can safely delete the branch from which you created your pull request.

## Context

Preliminary work for the establishment of TEI Lex-0 started in the Working Group "Retrodigitised Dictionaries" as part of the COST Action European Network of e-Lexicography (ENeL).

Upon the completion of the COST Action, the work on TEI Lex-0 was taken up by the DARIAH Working Group "Lexical Resources".

Currently, the work on TEI Lex-0 is conducted by the DARIAH WG "Lexical Resources" and the H2020-funded European Lexicographic Infrastructure (ELEXIS).



<img src="../../docs/assets/img/dariahlogo.png" width="200px">

<img style='padding-top:25px; padding-left:10px' src="../../docs/assets/elexis_logo_color-1-2.png" width="225px"></p>
