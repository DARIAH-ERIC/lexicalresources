# XPath for Dictionary Nerds

**Author:** Toma Tasovac ([@ttasovac](https://twitter.com/ttasovac))
**Version:** 1.0
**Date:** 2017-12-03
**License:** `CC BY-SA`

**Table of Contents**
<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->
<!-- code_chunk_output -->

* [XPath for Dictionary Nerds](#xpath-for-dictionary-nerds)
	* [What is XPath?](#what-is-xpath)
	* [Another language? Why, oh why?](#another-language-why-oh-why)
	* [What do I need to work with XPath?](#what-do-i-need-to-work-with-xpath)

<!-- /code_chunk_output -->

## What is XPath?

XPath (XML Path Language) is a standard query language for selecting nodes from XML documents.

In this tutorial, you will learn how to write XPath expressions in order to navigate around our XML-encoded dictionaries and select only those bits of data that you are interested in.

<figure><img class="img-responsive" src="https://i.imgur.com/FvDO0J1.png" width="100%"><figcaption  style="color:gray;font-size:80%;text-align:right">Dictionary as a tree structure</figcaption></figure>

## Another language? Why, oh why?

You may wonder why you need to learn yet another language to query your dictionary data. XML is, after all, a text format. You can open an XML-encoded dictionary in any text editor and search for strings in it using your editor's basic search functions.

The trouble with plain-text searches on XML data is that they are not _context-aware_. In a plain-text search, all strings are considered equal and the edtior will return all the hits containing the search string, regardless of its position in the dictionary hierarchy.

This can be ok for quick-and-dirty searches, but it can also produce a lot of noise, if we are looking for something really specific.

Say you have a large, XML-encoded dictionary and you are interested in:

- finding all the entries whose definition starts with or contains a particular word;
- extracting all the entries that have a particular translation equivalent in the target language;
- exploring all the polysemous entries in a dictionary;

in all of the above cases, succinct XPath expressions will help you get to the specific data that fits your search criteria in a way that plain-text search could never do.  

## What do I need to work with XPath?

In order to work with XPath, you will need:

- XML structured data
- an XPath-aware editor

XPath expressions are applied to XML data. So in order to query your dictionaries and get interesting results out of them, you have to have them encoded in XML. And you have to use an editor that lets you work with XPath.

XPath can't magically produce results that are not based on the actual structure and actual content of your dictionary. The usefulness of XPath searches is directly proportionate to the granularity at which you encoded your dictionary data: the more markup you have, the more interesting your searches can get.

To help you complete this tutorial, we have prepared a file which contains all the dictionary examples from the TEI Dictionary Chapter plus some.
