# Grammars in TEI

Descriptive grammars are one of the cornerstones of the study of language: while dictionaries, broadly speaking, describe the meaning of words, grammar books describe how the words are constructed and how they are put together to form meaningful sentences.

And just like dictionaries, grammars created in the past are still of interest to humanities scholars: they document not only the past epochs of particular languages, but also the evolving thought about language as such and its central role in society.

As part of the TEI Lex-0 initiative, [@ttasovac](https://github.com/ttasovac) and [@laurentromary](https://github.com/laurentromary) have started looking into the challenges of encoding grammar books in TEI. This is our playground and a place to document our current thinking about the problems at hand.  

## Why are grammar books difficult to encode?

Grammar books combine **unstructured** and **structured data**, i.e. both the narrative descriptions of grammatical phenomena _and_ structured representations of linguistic data such as paradigm tables. The narrative descriptions themselves often contain particular word forms with with explicit or implicit grammatical information associated with the given forms.

In an ideal world, a grammar book encoded in TEI should represent the narrative content and the underlying lexical data in such a way that one can produce an **accurate electronic representation of the text itself**, which can, _at the same time_, be used as a dataset amenable to **targeted data extraction** and, ultimately, **advanced searchability** of all the specific word forms that are mentioned in the text.

From the outset, one should also try to establish a consistent practice in terms of **_data modeling_** ("explicitly encoding the structural hierarchies and the scope of particular textual components") and **_data enrichment_** ("encoding additional information that specifies, extends or improves upon the information already present in the [given] resource") [see Tasovac and Petrović 2015].

### What is the current status of TEI and TEI Lex-0 in this respect?

As we'll show later, achieving both of the above-mentioned goals is not possible without customizing TEI.

TEI Lex-0, which has so far been focused on dictionaries rather than grammars, is capable of representing grammatically annotated linguistic forms, both individually and as paradigms. But it also does not currently cover the embedding of linguistic forms inside paragraphs of running text.

Our hope here is to explore descriptive grammars and work toward proposing solutions that will eventually make it to TEI Lex-0, and, if there is wider interest, to TEI itself.

## Paradigm tables

Let's take a look at a paradigm table. This is from Jonas Lau's PhD dissertation (TODO: add full reference)

![](https://i.imgur.com/56XEUeD.png)

### Level One: The Surface View

By "surface view" of a paradigm table, we refer to the structured representation of the table itself: a grid of intersecting and possibly labeled rows and columns, as well as character data.

#### Level 1.1. The bare minimum: rows and cells

Current TEI P5 Compatibility: full

```xml
<table xml:id="tb4-1" n="4.1">
    <head>Independent pronouns</head>
    <row>
        <cell/>
        <cell>Singular</cell>
        <cell>Plural</cell>
    </row>
    <row>
        <cell>1P</cell>
        <cell>ònì</cell>
        <cell>àbès</cell>
    </row>
    <row>
        <cell>2P</cell>
        <cell>òsì</cell>
        <cell>àbèn</cell>
    </row>
    <row>
        <cell>3P.HUM</cell>
        <cell>àu</cell>
        <cell>àba</cell>
    </row>
    <row>
        <cell>3P.NHUM</cell>
        <cell>ɛ̀jì</cell>
        <cell>ìjì</cell>
    </row>
</table>
```

#### Level 1.2: The bare minimum: labels and data cells with "mentioned" word forms

- Current TEI P5 Compatibility: full

```xml
<table xml:id="tb4-1" n="4.1">
    <head>Independent pronouns</head>
    <row>
        <cell/>
        <cell>Singular</cell>
        <cell>Plural</cell>
    </row>
    <row>
        <cell>1P</cell>
        <cell>
            <mentioned xml:lang="ibe">ònì</mentioned>
        </cell>
        <cell>
            <mentioned xml:lang="ibe">àbès</mentioned>
        </cell>
    </row>
    <row>
        <cell>2P</cell>
        <cell>
            <mentioned xml:lang="ibe">òsì</mentioned>
        </cell>
        <cell>
            <mentioned xml:lang="ibe">àbèn</mentioned>
        </cell>
    </row>
    <row>
        <cell>3P.HUM</cell>
        <cell>
            <mentioned xml:lang="ibe">àu</mentioned>
        </cell>
        <cell>
            <mentioned xml:lang="ibe">àba</mentioned>
        </cell>
    </row>
    <row>
        <cell>3P.NHUM</cell>
        <cell>
            <mentioned xml:lang="ibe">ɛ̀jì</mentioned>
        </cell>
        <cell>
            <mentioned xml:lang="ibe">ìjì</mentioned>
        </cell>
    </row>
</table>
```


### Level Two: The Intermediate View

By the "intermediate" view, we refer to the representation of paradigm tables as grids of intersecting rows and columns in which label cells contain explicit `<gramGrp>` and `<gram>` constructs; and data cells contain explicit `<form>` and `<orth>` constructs.

#### Level 2.1 The middle way: tables with clusters of semantically explicit grammatical labels and linguistic forms

- Current TEI 5 compatibility: partial
  - `<gramGrp>` is not allowed as a child of `<cell>`
  - `<form>` is not allowed as a child of `<cell>`
- Advantages over Level 1
  - grammatical labels use the semantically explicit `<gramGrp>`
  - grammatical labels can be encoded at a more granular level, for instance: `<cell role="grammaticalLabel"><gramGrp><gram type="person">3P</gram><pc>.</pc><gram type="animacy">NHUM</gram></gramGrp></cell>`
  - linguistic forms use the semantically explicit `<form>` and `<orth>` constructs
  - `<gramGrp>` and `<form>` are used for encoding grammatical information and linguistic forms in TEI Lex-0
- Disadvantages over Level 1
  - requires customization of the TEI P5 schema

```xml
<table xml:id="tb4-2.1" n="4.1">
    <head>Independent pronouns</head>
    <row>
        <cell/>
        <cell role="grammaticalLabel">
            <gramGrp>
                <gram type="number">Singular</gram>
            </gramGrp>
        </cell>
        <cell role="grammaticalLabel">
            <gramGrp>
                <gram type="number">Plural</gram>
            </gramGrp>
        </cell>
    </row>
    <row>
        <cell role="grammaticalLabel">
            <gramGrp>
                <gram type="person">1P</gram>
            </gramGrp>
        </cell>
        <cell role="linguisticForm">
            <form xml:lang="ibe">
                <orth>ònì</orth>
            </form>
        </cell>
        <cell role="linguisticForm">
            <form xml:lang="ibe">
                <orth>àbès</orth>
            </form>
        </cell>
    </row>
    <row>
        <cell role="grammaticalLabel">
            <gramGrp>
                <gram type="person">2P</gram>
            </gramGrp>
        </cell>
        <cell role="linguisticForm">
            <form xml:lang="ibe">
                <orth>òsì</orth>
            </form>
        </cell>
        <cell>
            <form xml:lang="ibe">
                <orth>àbèn</orth>
            </form>
        </cell>
    </row>
    <row>
        <cell role="grammaticalLabel">
            <gramGrp>
                <gram type="person">3P</gram>
                <pc>.</pc>
                <gram type="agency">HUM</gram>
            </gramGrp>
        </cell>
        <cell role="linguisticForm">
            <form xml:lang="ibe">
                <orth>àu</orth>
            </form>
        </cell>
        <cell role="linguisticForm">
            <form xml:lang="ibe">
                <orth>àba</orth>
            </form>
        </cell>
    </row>
    <row>
        <cell role="grammaticalLabel">
            <gramGrp>
                <gram type="person">3P</gram>
                <pc>.</pc>
                <gram type="animacy">NHUM</gram>
            </gramGrp>
        </cell>
        <cell role="linguisticForm">
            <form xml:lang="ibe">
                <orth>ɛ̀jì</orth>
            </form>
        </cell>
        <cell role="linguisticForm">
            <form xml:lang="ibe">
                <orth>ìjì</orth>
            </form>
        </cell>
    </row>
</table>
```

#### Level 2.1 The middle way: tables with clusters of grammatically labeled linguistic forms

- Current TEI 5 compatibility: partial
  - `<form>` is not allowed as a child of `<cell>`
- Advantages over Level 1
  - linguistic forms use the semantically explicit `<form>` and `<orth>` constructs
  - each linguistic form is explicitly labeled in terms of its grammatical information
  - `<gramGrp>` and `<form>` are used for encoding grammatical information and linguistic forms in TEI Lex-0
- Disadvantages over Level 1
  - requires customization of the TEI P5 schema

```xml
<table xml:id="tb4-2.2" n="4.1">
    <head>Independent pronouns</head>
    <row>
        <cell/>
        <cell role="grammaticalLabel">Singular</cell>
        <cell role="grammaticalLabel">Plural</cell>
    </row>
    <row>
        <cell role="grammaticalLabel">1P</cell>
        <cell role="linguisticForm">
            <form xml:lang="ibe">
                <orth>ònì</orth>
                <gramGrp>
                    <gram type="pos">pronoun</gram>
                    <gram type="person">1</gram>
                    <gram type="number">singular</gram>
                </gramGrp>
            </form>
        </cell>
        <cell role="linguisticForm">
            <form xml:lang="ibe">
                <orth>àbès</orth>
                <gramGrp>
                    <gram type="pos">pronoun</gram>
                    <gram type="person">1</gram>
                    <gram type="number">plural</gram>
                </gramGrp>
            </form>
        </cell>
    </row>
    <row>
        <cell role="grammaticalLabel">2P</cell>
        <cell role="linguisticForm">
            <form xml:lang="ibe">
                <orth>òsì</orth>
                <gramGrp>
                    <gram type="pos">pronoun</gram>
                    <gram type="person">2</gram>
                    <gram type="number">singular</gram>
                </gramGrp>
            </form>
        </cell>
        <cell>
            <form xml:lang="ibe">
                <orth>àbèn</orth>
                <gramGrp>
                    <gram type="pos">pronoun</gram>
                    <gram type="person">2</gram>
                    <gram type="number">plural</gram>
                </gramGrp>
            </form>
        </cell>
    </row>
    <row>
        <cell role="grammaticalLabel">3P.HUM</cell>
        <cell role="linguisticForm">
            <form xml:lang="ibe">
                <orth>àu</orth>
                <gramGrp>
                    <gram type="pos">pronoun</gram>
                    <gram type="person">3</gram>
                    <gram type="number">singular</gram>
                    <gram type="animacy">human</gram>
                </gramGrp>
            </form>
        </cell>
        <cell role="linguisticForm">
            <form xml:lang="ibe">
                <orth>àba</orth>
                <gramGrp>
                    <gram type="pos">pronoun</gram>
                    <gram type="person">3</gram>
                    <gram type="number">plural</gram>
                    <gram type="animacy">human</gram>
                </gramGrp>
            </form>
        </cell>
    </row>
    <row>
        <cell role="grammaticalLabel">3P.NHUM</cell>
        <cell role="linguisticForm">
            <form xml:lang="ibe">
                <orth>ɛ̀jì</orth>
                <gramGrp>
                    <gram type="pos">pronoun</gram>
                    <gram type="person">3</gram>
                    <gram type="number">singular</gram>
                    <gram type="animacy">nonhuman</gram>
                </gramGrp>
            </form>
        </cell>
        <cell role="linguisticForm">
            <form xml:lang="ibe">
                <orth>ìjì</orth>
                <gramGrp>
                    <gram type="pos">pronoun</gram>
                    <gram type="person">3</gram>
                    <gram type="number">plural</gram>
                    <gram type="animacy">nonhuman</gram>
                </gramGrp>
            </form>
        </cell>
    </row>
</table>
```

### Level Three: The Dictionary View

#### Level 3: Full Paradigm as a Lexicographic Entry

The table views of a full paradigm are based on the visual representation of lexical data placed inside a grid for easy consultation. The underlying data model, however, has no need for columns or rows, because full paradigms are no more than grammatically annotated linguistic forms.

A paradigm can therefore be represented as a lexicographic entry consisting of a number of inflected forms, each of which is grammatically tagged.

- Current TEI 5 compatibility: full
- Current TEI Lex-0 compatibility: full
- Advantages over Level 2
  - the data model is not based on tables and rows, but on the lexicographic treatment of inflected forms; this makes data extraction very easy
  - the data model is fully compatible with dictionary entries in TEI P5 and TEI Lex-0, which means that datasets from grammar books can be easily integrated into existing or new dictionaries
  - the dictionary view of a full paradigm can be transformed to a table representation (see entry2table.xsl) which is useful if you are, for instance, producing a digital edition of a grammar book
  - the model is flexible enough to allow for lexicographic enrichment: you can encode each inflected form at a high level of granularity , while choosing which aspects of your grammatical annotation will be displayed to the end user
- Disadvantages over Level 2
  - requires more linguistic skills from the encoder than a straight-forward table representation
  - needs an XSLT stylesheet to transform into a table for display

```xml
<entry xml:id="tb4-3" n="4.1" rend="table" type="fullParadigm">
    <note rend="head">Independent pronouns</note>
    <form type="inflectedForms">
        <form xml:lang="ibe" type="inflectedForm">
            <orth>ònì</orth>
            <gramGrp>
                <gram type="pos">pronoun</gram>
                <!--a @rend attribute indicates whether a gram element
                should be used to generate the row or column labels
                once transformed to the table view-->
                <gram type="person" rend="row" value="1P">1</gram>                
                <gram type="number" rend="column">singular</gram>
            </gramGrp>
        </form>
        <form xml:lang="ibe" type="inflectedForm">
            <orth>àbès</orth>
            <gramGrp>
                <!--grammatical annotations without a @rend attribute
                are not used for creating labels in the table view-->                
                <gram type="pos">pronoun</gram>
                <!--use @value attribute if you want your label in the
                    table view to have a different value from the tag  
                    you use in your grammatical annotation -->
                <gram type="person" rend="row" value="1P">1</gram>
                <gram type="number" rend="column">plural</gram>
            </gramGrp>
        </form>
        <form xml:lang="ibe" type="inflectedForm">
            <orth>òsì</orth>
            <gramGrp>
                <gram type="pos">pronoun</gram>
                <gram type="person" rend="row" value="2P">2</gram>
                <gram type="number" rend="column">singular</gram>
            </gramGrp>
        </form>
        <form xml:lang="ibe" type="inflectedForm">
            <orth>àbèn</orth>
            <gramGrp>
                <gram type="pos">pronoun</gram>
                <gram type="person" rend="row" value="2P">2</gram>
                <gram type="number" rend="column">plural</gram>
            </gramGrp>
        </form>
        <form xml:lang="ibe" type="inflectedForm">
            <orth>àu</orth>
            <gramGrp>
                <gram type="pos">pronoun</gram>
                <gram type="person" rend="row">3P</gram>
                <gram type="number" rend="column">singular</gram>
                <gram type="animacy" rend="row" value=".HUM">human</gram>
            </gramGrp>
        </form>
        <form xml:lang="ibe" type="inflectedForm">
            <orth>àba</orth>
            <gramGrp>
                <gram type="pos">pronoun</gram>
                <gram type="person" rend="row">3P</gram>
                <gram type="number" rend="column">plural</gram>
                <gram type="animacy" rend="row" value=".HUM">human</gram>
            </gramGrp>
        </form>
        <form xml:lang="ibe" type="inflectedForm">
            <orth>ɛ̀jì</orth>
            <gramGrp>
                <gram type="pos">pronoun</gram>
                <gram type="person" rend="row">3P</gram>
                <gram type="number" rend="column">singular</gram>
                <gram type="animacy" rend="row" value=".NHUM">nonhuman</gram>
            </gramGrp>
        </form>
        <form xml:lang="ibe" type="inflectedForm">
            <orth>ìjì</orth>
            <gramGrp>
                <gram type="pos">pronoun</gram>
                <gram type="person" rend="row">3P</gram>
                <gram type="number" rend="column">plural</gram>
                <gram type="animacy" rend="row" value=".NHUM">nonhuman</gram>
            </gramGrp>
        </form>
    </form>
</entry>
```

When converted to html using entry2table.xsl, we can generate this (no styling applied yet):

![Снимок экрана 2020-09-11 в 10.35.38](https://i.imgur.com/omZnNHp.png)

### Why are all three levels important?

Even though we prefer Level 3 as the most advanced representation of a full paradigm, we believe that all three levels are equally important because they reflect the realities of the encoding process.

Encoding can be an iterative process: starting with simple and moving toward more complex representations. Different projects have different levels of resources available to them: some will only be able to create a surface representation and will not be able to go beyond the bare minimum. We need to provide support and sufficient documentation for each level.

## Forms in text

Let's take a look at a simple example of linguistic forms being discussed inside running text:

`The forms  àbès  -  1PL.IDP  and  àbèn  -  2.PL.IDP    are also used as possessive and object pronouns.`

The abbreviations 1PL and 2PL refer to 1st and 2nd person plural, whereas IDP stands for independent personal pronouns.

### Level One: The Surface View

#### Level 1: Mentioned forms and grammatical tags as abbreviations

- Valid TEI P5, but:
- linguistic forms and abbreviations containing grammatical tags are associated with each other only by proximity
- `<abbr>` is a generic element for all abbreviations, rather than a specific element for grammatical tagging
- it's practically impossible to add ("enrich") the grammatical annotation beyond what's already in the text

```xml
<p>The forms  <mentioned xml:lang="ibe">àbès</mentioned> -  <abbr>1PL.IDP</abbr>  
and  <mentioned xml:lang="ibe">àbèn</mentioned>  -  <abbr>2.PL.IDP</abbr>  are
also used as possessive and object pronouns.</p>
```

### Level Two: Intermediate View
#### Level 2.0: Mentioned forms and grammatical tags as abbreviations inside glosses  

- Valid TEI P5
- Advantages over Level 1:
  - each "mentioned" forms and its grammatical tags are grouped together as glosses

```xml
<p>The forms <gloss><mentioned xml:lang="ibe">àbès</mentioned> <pc>-</pc> <abbr>1PL</abbr>
<pc>.</pc><abbr>IDP</abbr></gloss> and <gloss><mentioned xml:lang="ibe">àbèn</mentioned>
<pc>-</pc> <abbr>2PL</abbr><pc>.</pc><abbr>IDP</abbr></gloss> are also used as possessive
and object pronouns.</p>
```

### Level Three: The Dictionary View
#### Level 3.0: Excplicit forms wtih grammatical groups

- Advantages over Level 2:
  - `<form>`, `<gramGrp>` and <gram> are semantically most appropriate elements for encoding linguistic forms and grammatical annotations
  - it's easy to enrich grammatical annotations with values not present in the original text or with those that appear later in the running text (for instance: `<gram type="pos" rend="none">OBP</gram>` for object pronouns)
- Disadvantage over Level 2:
  - invalid TEI P5: `<form>` is not allowed as a child of `<p>`.

```xml
<p>The forms <form type="inflectedForm" xml:lang="ibe"><orth>àbès</orth> <pc>-</pc>
<gramGrp><gram type="person">1</gram><gram type="number">PL</gram><pc>.</pc>
<gram type="pos">IDP</gram><gram type="pos" rend="none">POP</gram>
<gram type="pos" rend="none">OBP</gram></gramGrp></form> and
<form type="inflectedForm" xml:lang="ibe"><orth>àbèn</orth><pc>-</pc>
<gram type="person">1</gram><gram type="number">PL</gram><pc>.</pc><gram type="pos">IDP</gram>
<gram type="pos" rend="none">POP</gram><gram type="pos" rend="none">OBP</gram></form>
are also used as possessive and object pronouns.</p>
```

## Things to consider

This is off the top of my head:

- testing more complex xslt transformations (see Laurent's Japanese table)
- writing XSLT transformation from Levels 1 and 2 to Level 3.
- "inflectedForm" and "inflectedFroms" vs. "inflected" (which is recommended by TEI Lex-0, check how we type nested forms, paradigms etc. )
- etc. etc. etc.


## References

Tasovac, Toma and Snežana Petrović (2015). Multiple Access Paths for Digital Collections of Lexicographic Paper Slips. In Kosem, I., et al. (eds.), _Electronic Lexicography in the 21st Century: Linking Lexical Data in the Digital Age. Proceedings of the eLex 2015 Conference, 11-13 August 2015, Herstmonceux Castle, United Kingdom_. Ljubljana and Brighton: Institute for Applied Slovene Studies and Lexical Computing Ltd.
