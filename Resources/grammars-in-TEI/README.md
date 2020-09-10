# Grammars in TEI

Descriptive grammars of human languages are one of the cornerstones of the study of language: while dictionaries, broadly speaking, describe the meaning of words, grammar books describe how the words are constructed and how they are put together to form meaningful sentences.

And just like dictionaries, grammars created in the past are still of interest to humanities scholars: they document not only the past epochs of particular languages, but also the evolving thought about language as such and its central role in society.

As part of the TEI Lex-0 initiative, @ttasovac and @laurentromary have started looking into the challenges of encoding grammar books in TEI. This is our playground and a place to document our current thinking about the problems at hand.  

## Why are grammar books difficult to encode?

Grammar books combine **unstructured** and **structured data**, i.e. both the narrative descriptions of grammatical phenomena _and_ structured representations of linguistic data such as paradigm tables. The narrative descriptions themselves often contain particular word forms with with explicit or implicit grammatical information associated with the given forms.

In an ideal world, a grammar book encoded in TEI should represent the narrative content and the underlying lexical data in such a way that one can produce an **accurate electronic representation of the text itself**, which can, _at the same time_, be used as a dataset amenable to **targeted data extraction** and, ultimately, **advanced searchability** of all the specific word forms that are mentioned in the text.

From the outset, one should also try to establish a consistent practice in terms of **_data modeling_** ("explicitly encoding the structural hierarchies and the scope of particular textual components") and **_data enrichment_** ("encoding additional information that specifies, extends or improves upon the information already present in the [given] resource") [see Tasovac and Petrović 2015].

### What is the current status of TEI and TEI Lex-0 in this respect?

As we'll show later, achieving both of the above-mentioned goals is not possible without customizing TEI.

TEI Lex-0 has been so far focused on dictionaries rather than grammars, which is why TEI Lex-0 is itself not yet ready to accommodate the above-mentioned goals.

Our hope is to explore descriptive grammars and work toward proposing solutions that will eventually make it to TEI Lex-0, and, if there is wider interest, to TEI itself.

## Paradigm tables

Let's take a look at a paradigm table from Jonas' dissertation ADD INFO...

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

### Level Three: Full Paradigm



## Forms in text

![](https://i.imgur.com/k4182ii.png)

```xml
<p>The forms <mentioned>àbès</mentioned> - <gloss>1<abbr corresp="glossary.xml#pl"/>.<abbr
            corresp="glossary.xml#idp"/></gloss> and <mentioned>àbèn</mentioned> - <gloss>2<abbr
            corresp="glossary.xml#pl"/>.<abbr corresp="glossary.xml#idp"/></gloss> are also used as
    possessive and object pronouns (sections <ref target="#ch5-sc1-3"/> and <ref target="#ch6-sc1"
    />). </p>

```


## References

Tasovac, Toma and Snežana Petrović (2015). Multiple Access Paths for Digital Collections of Lexicographic Paper Slips. In Kosem, I., et al. (eds.), _Electronic Lexicography in the 21st Century: Linking Lexical Data in the Digital Age. Proceedings of the eLex 2015 Conference, 11-13 August 2015, Herstmonceux Castle, United Kingdom_. Ljubljana and Brighton: Institute for Applied Slovene Studies and Lexical Computing Ltd.
