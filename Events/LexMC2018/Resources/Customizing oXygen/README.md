# Customizing oXygen for Lexicographic Work

|         |              |
| ------- | ------------ |
| Author  | Toma Tasovac |
| Version | 1.1          |
| Place   | LexMC Berlin |
| Date    | 2017-12-07   |
| License | CC BY-SA     |
|         |              |

## Shortcuts

In the rest of this document, we will focus on time-saving tips and hints for working with lexical data in oXygen XML, although most of these tips will apply to other uses of oXygen as well.

### <a name="defaultshortcuts"></a>Default Shortcuts

Shortcuts are very important because XML is, as you know, quite verbose. The more detailed your encoding is, the more typing you need to do.

- **Surround the selected text with a tag: ⌘-E (Mac) / ctrl-E (Windows):**   
This is probably the single most useful and most frequently used shortcut that you will end up using *all the time.* Because the text remains selected even after the first set of tags have been inserted, the most efficient way of wrapping text with multiple, nested tags is to start from the outer element.<figure><img class="img-responsive" src="http://i.imgur.com/kyFTQhY.png" width="500px"><figcaption  style="color:gray;font-size:80%;text-align:right"></figcaption></figure><figure><img class="img-responsive" src="http://i.imgur.com/yEjbGXY.png" width="500px"><figcaption  style="color:gray;font-size:80%;text-align:right"></figcaption></figure><figure><img class="img-responsive" src="http://i.imgur.com/7qhjnR1.png" width="500px"><figcaption  style="color:gray;font-size:80%;text-align:right"></figcaption></figure>

- **surround with last tag used: command + ForwardSlash (Mac) / Ctrl + ForwardSlash (Windows)**:
If you are trying to various selections with the same tag, this will be an even more quicker way of doing it than with ⌘-E / ctrl-E.

#### Other refactoring shortcuts

By default, oXygen comes with the following refactoring shortcuts:

- **Delete element tags** (Alt + X on Mac / Alt + Shift + X on Windows): deletes the start and end tag of the current element. As you have already seen, if you delete a start tag manually, oXygen will delete the end tag as well. But if you like to impress your friends with shortcuts, this is a good one. You don't have to select anything, it's enough for your cursor to be anywhere inside an element whose tags you want to delete.
- **Join elements** (Command + Alt + J on Mac / Alt + Shift + J on Windows): joins the left and right elements relative to the current cursor position. The elements must have the same name, attributes, and attributes values.
- **Split element** (Ctrl + Alt + D on Mac / Alt + Shift + D on Windows): splits the element from the cursor position into two identical elements. The cursor must be inside the element.

**Exercise.** Try all of the above shortcuts on your own. If you can't remember them right away, you can always get to them by using the contextual menu (ctrl-click or right-click).


### <a name="changingshortcuts"></a>Changing Shortcuts

If the oXygen shortcuts are not to your liking or difficult to remember, you can change them yourself.

Open the preferences, then follow the procedure as shown on the image below:

1. start typing "shortcuts"   
2. start typing the name of the command whose shortcut you want to change   
3. double-klick the command to get to the shortcut editing window  
4. press the desired shortcut keys to replace the current shortcut  
5. click on OK  
6. click on OK<figure><img class="img-responsive" src="http://i.imgur.com/NWlpEfn.png" width="100%"><figcaption  style="color:gray;font-size:80%;text-align:right"></figcaption></figure>


### Global options vs. Project options?

When you make oXygen customizations or transformation and validation scenarios, you can store them globally or bind them to a specific project by choosing the "Project Options" setting in the preferences pages.

<figure><img class="img-responsive" src="http://i.imgur.com/3aE2eeL.png" width="100%"><figcaption  style="color:gray;font-size:80%;text-align:right"></figcaption></figure>

It is important to understand the difference between the two.

*Global options* are stored on your computer and are not accessible to other users (unless you export them into an XML options file, which can then be imported on a different computer). That means that you can use your global customizations in any project which you have on your computer.  

*Project options*, on the other hand,  are stored in the currently open .xpr project and available only in the context of the given project. The advantage of project options is that they make it easier for members of the same team to share their customizations: if your project file is saved on a version control system (such as SVN, CVS, or Source Safe) or in a shared folder, then every member of your team will have the same option configuration that you stored in the project file.

**TODO**: in Starting with Oxygen tutorial, describe the creation of projects.

## Basic Code Templates

Code templates are code fragments that can be inserted quickly at the current editing position.

Oxygen comes with a set of built-in code templates for CSS, LESS, Schematron, XQuery, XSD and XSL. You can view them and edit them in the Preferences  > Templates > Code Templates.

<figure><img class="img-responsive" src="http://i.imgur.com/rjGiEnc.png" width="100%"><figcaption  style="color:gray;font-size:80%;text-align:right"></figcaption></figure>

To get a complete list of available code templates while working in the Text Mode in oXygen, press **`Ctrl-␣`** (control-space). You will only be shown the templates that make sense in the given context. So, to see built-in XSL templates, you have to be editing a XSL file.

Out of the box, you won't find any code templates for XML, but we'll create some.

### Write Your Own Code Template for Nested Elements

At the beginning of these Guidelines, we learned how to use the oXygen shortcut to wrap some text in TEI elements **`<gramGrp>`** and **`<pos>`**. This is not unusual. In your dictionaries, you will often have groups of nested elements that repeat. For instance:  

```xml
<gramGrp><pos>m</pos></gramGrp>
```
or
```xml  
<form type="lemma"><orth>Lexicographer</orth></form>
```
or
```xml
<cit type="translation"><quote>лексикограф</quote></cit>
```  

You could use the `⌘-E / ctrl-E` shortcut, but that wouldn't be very practical, especially since you would also need to enter attributes such as `@type` or `@xml:lang` etc.

Let's say we want to create a code template which will wrap the selected text with `<gramGrp><pos></pos></gramGrp>` and place the cursor after `<gramGrp>` when done.

To do that we need to:

1. Click on `New` in the Code Templates Editor.
2. Enter the abbreviate name for our code template
3. Enter the description which explains what the code template does
4. Associate the code template with an editor - for TEI always choose XML
5. Write the XML code we want to have in the template in the Content field, then place the cursor between <pos></pos> where we want the selected text to appear
6. Click on the little green arrow next to the Content field to select an editor variable; choose the "Current Selected Text"
7. Then repeat the last two steps to indicate where you want the caret to appear after your code has been inserted: in this particular case, place the caret after </gramGrp> in the Content field and then select the `Cursor position after insert` from the list of editor variables.
8. Finally click `OK` to save your code template <figure><img class="img-responsive" src="http://i.imgur.com/49uqCwi.png" width="100%"><figcaption  style="color:gray;font-size:80%;text-align:right"></figcaption></figure>

Now you are ready to use your code template. Go to your dictionary TEI file and:

1. select the string in your dictionary entry which you want to mark up as a part of speech tag
2. invoke the code templates with `Ctrl-␣` (control-space)
3. scroll to the grGr code template (it will be the only one if this is the first time you are doing this) and click on it
4. be amazed <figure><img class="img-responsive" src="http://i.imgur.com/pEhmnPY.png" width="530px"><figcaption  style="color:gray;font-size:80%;text-align:right"></figcaption></figure><figure><img class="img-responsive" src="http://i.imgur.com/n6bhsiP.png" width="530px"><figcaption  style="color:gray;font-size:80%;text-align:right"></figcaption></figure>


### Code Template for Nested Elements with Interactive Parameters

Sometimes, when encoding dictionaries, we have a need for a type of code that repeats, but that may differ in each instance by the value of an attribute.

For instance, let's say you are using `<etym></etym>` to mark up etymologies, and within etymologies you are using <mentioned> to mark up the etymon, with the appropriate language code.

You could either create different code templates for each language - and you will probably want to do that for the most common ones. If the largest number of etymons in your dictionary is from Latin, it would make sense to create a code template that looks like this:

<figure><img class="img-responsive" src="http://i.imgur.com/TiD6tQE.png" width="100%"><figcaption  style="color:gray;font-size:80%;text-align:right"></figcaption></figure>

But your dictionary may contain many different etymologies from many different languages, and it is probably not realistic to create individual code templates for each and every one of them.

In those cases, you want to write a code template that will ask you interactively to add the value of the language attribute.

To do that we will need to:

1. place the cursor between the quotation marks in `xml:lang=""`
2. click on the editorial variables icon and select the `Ask` editorial variable

<figure><img class="img-responsive" src="http://i.imgur.com/i1yGv3B.png" width="100%"><figcaption  style="color:gray;font-size:80%;text-align:right"></figcaption></figure>

The result will look like this:

<figure><img class="img-responsive" src="http://i.imgur.com/wUxsNv7.png" width="100%"><figcaption  style="color:gray;font-size:80%;text-align:right"></figcaption></figure>

We're almost there. To make this template code even more useful, do the following:

1. Replace `'Message'` with the message that you want the user to see. For instance `'Which language is this word from?'`
2. `input_type` you can leave as is
3. replace 'default_value' with the language code for that you want to appear automatically, for instance `'la' `for Latin.

The content field should loook likе this:

```xml
<mentioned xml:lang="${ask('Which langauge is this  word from?', input_type, 'la')}">${selection}</mentioned>${caret}
```

To apply this code template in your TEI encoded dictionary:

1. select the etymon
2. invoke the code templates with `Ctrl-␣` (control-space)
3. select and click on the `mentioned` template
4. change the default "la" value with the appropriate language code
5. click ok
6. be amazed

For the visually minded:

<figure><img class="img-responsive" src="http://i.imgur.com/hbYmzZX.png" width="100%"><figcaption  style="color:gray;font-size:80%;text-align:right"></figcaption></figure>
<figure><img class="img-responsive" src="http://i.imgur.com/wPBVN6l.png" width="100%"><figcaption  style="color:gray;font-size:80%;text-align:right"></figcaption></figure>
<figure><img class="img-responsive" src="http://i.imgur.com/L2NEwep.png" width="100%"><figcaption  style="color:gray;font-size:80%;text-align:right"></figcaption></figure>
<figure><img class="img-responsive" src="http://i.imgur.com/gL8tqJ7.png" width="100%"><figcaption  style="color:gray;font-size:80%;text-align:right"></figcaption></figure>

## <a name="advancedcodetemplates"></a> Advanced Code Templates

The true power of code templates comes from the ability to evaluate XPath expressions on your selected text.

Let's imagine you are working on a Serbian-German-Latin dictionary that has been transcribed in plain text. Very often, the translations are simple and consist of a German string followed by a comma followed by a Latin string.

For instance:

`реч, f. das Wort, verbum.`

Of course, you could try to convert this type of regularity with regular expressions as well, but we're learning here about code templates, so sit back and relax.

You've created code templates for `<form><orth></orth></form>` and for the `<gramGrp>` and your code currently looks like this:

```xml
    <entry>
    <form><orth>реч</orth></form>
    <gramGrp><pos>f.</pos></gramGrp> das Wort, verbum. </entry>
```

Wouldn't it be nice if you could separate the German translation from the Latin translation in one go and wrap everything in `<cit>`?

We can, using an oXygen editor variable `${xpath_eval()}` and a handy xPath function such as `substring-after()` and `substring-before()`. When you select your strings, you want everything before the comma to be marked up as a German translation, and everything after the comma and a space as a Latin translation.

```xml
    <cit type="translation">
        <quote xml:lang="de">${xpath_eval(substring-before('${selection}',','))}</quote>
    </cit>
    <cit type="translation">
        <quote xml:lang="la">${xpath_eval(substring-after('${selection}',', '))}</quote>
    </cit>
```

If you were ever looking for a proof why it's worth learning xPath for anything other than to explore your XML-encoded dictionaries, here it is:

<figure><img class="img-responsive" src="http://i.imgur.com/dJvjS9h.png" width="100%"><figcaption  style="color:gray;font-size:80%;text-align:right"></figcaption></figure>
<figure><img class="img-responsive" src="http://i.imgur.com/Gg1Zfyi.png" width="100%"><figcaption  style="color:gray;font-size:80%;text-align:right"></figcaption></figure>
<figure><img class="img-responsive" src="http://i.imgur.com/rwXFUYW.png" width="100%"><figcaption  style="color:gray;font-size:80%;text-align:right"></figcaption></figure>


## <a name="stylingdictionaries"></a>Styling Dictionaries

### Beauty is in the Eye of the Lexicographer

The encoding of dictionaries using TEI XML is also possible in a WYSIWYG-style editor in which the XML markup is not visible.

This type of tagless editor is available in oXygen's Author Mode.  The default Text Mode and the Author Mode offer two different ways of viewing and interacting with the underlying XML dataset. In Text Mode we work with XML directly; in the Author Mode interact with a styled, visually enhanced version of the XML data.

### Text Mode

<figure><img class="img-responsive" src="http://i.imgur.com/KwlEBK6.png" width="100%"><figcaption  style="color:gray;font-size:80%;text-align:right"></figcaption></figure>

In Text Mode all we get is XML. We see every tag, every attribute, every bit of text. oXygen automatically colors the tags and attributes differently from text in order to make the whole document more readable, but there is not much more that can be done here in terms of styling different parts of the dictionary entry.

The above example may look unusual because in it TEI tags have been localized in Serbian.

The same dictionary entry, when viewed in Author Mode together with a corresponding **CSS stylesheet**, can look quite differently.

### Author Mode

<figure><img class="img-responsive" src="http://i.imgur.com/7z0sEks.png" width="100%"><figcaption  style="color:gray;font-size:80%;text-align:right"></figcaption></figure>

You will notice straight away that there are no tags and no attributes, even though you could see them in the original XML sample. You will also notice that different parts of the dictionary are displayed in different colors. In the rest of this tutorial, we'll learn how to design a stylesheet to prettify our TEI-encoded dictionaries.

The Author mode renders the content of the XML document visually, based on a **CSS stylesheet** associated with the document. Many of the actions and features available in Text mode are also available in Author mode.

**Cascading Style Sheets** (CSS) are sets of instructions describing the presentation of a document written in a markup language. Along with HTML and JavaScript, CSS is one of the basic technologies used for creating visually engaging interfaces for online delivery.

This tutorial will not turn you into a CSS guru, but it will show you a concrete example of how to style dictionary data, which you can then use and adapt in your own dictionary projects.

But first things first. Open the TEI-tagged entry 'Lexicographer' from Johnson's dictionary. To enter Author Mode, click the Author button at the bottom of the editing area.

<figure><img class="img-responsive" src="http://i.imgur.com/0FVwnmS.png" width="100%"><figcaption  style="color:gray;font-size:80%;text-align:right"></figcaption></figure>

A default oXygen installation comes with a set of stylesheets for TEI documents, but these are not specifically targeted toward styling dictionaries. Therefore, the author mode may not seem all that impressive at first.

Take a look at the default rendering of Johnson's dictionary entry "Lexicographer".

<figure><img class="img-responsive" src="http://i.imgur.com/Cu64uPL.png" width="100%"><figcaption  style="color:gray;font-size:80%;text-align:right"></figcaption></figure>

This is not terribly useful — or pretty to look at. But we will fix it soon and show how useful it is to style your own TEI content for editing, proofreading etc.

Before we do that, let's just take a quick look at the default options that oXygen gives us in terms of rendering tags and attributes in the Author Mode.

<figure style="padding-left:10px; float:right;"><img src="http://i.imgur.com/rQPfLOt.png" width="350px"><figcaption  style="color:gray;font-size:80%;text-align:right"></figcaption></figure>

These are controlled by the dropdown menu, located in the lower row of icons on the default menu bar. As you can see, you can choose whether you want to display full tags, with or without attributes, only block or inline tags, partial or no tags at all.

The terms block elements and inline elements come from HTML, not XML. **Block elements** refer to those elements which start on a new line and take up the full width available to the container which holds them.  Typical block elements in HTML are `<div>`, `<p>`, `<form>` and `<h1>, <h2>, <h3>` etc. On the other hand, **inline elements** are those that do not start on a new line and only take up as much width as their content needs, for instance: `<span>`, `<a>`, `<img>` etc.  The distinction between block and online elements doesn't make much sense in the context of TEI-encoded dictionary data *before* we create a CSS style for it, but we will be coming back to this point again.

Try out different options, now and after we've designed our first dicitonary stylesheet and make sure you understand the differences between them.

### Associating a CSS stylesheet a TEI Document

To associate a stylesheet with an open TEI document, click on the "Associate XSLT/CSS Stylesheet..." icon which looks like green pin:

<figure><img class="img-responsive" src="http://i.imgur.com/VS6B2o2.png" width="400px"><figcaption  style="color:gray;font-size:80%;text-align:right"></figcaption></figure>

You will be presented with a new pop-up window, in which you should click on the folder icon and select the file johnson.css, which you have previously downloaded from this [GitHub repository](https://github.com/ParthenosWP4/standardsLibrary/blob/master/Lexicography/ENeL-WG2/Guidelines/Customizing%20Oxygen%20for%20Pure%20Lexicographic%20Pleaure/Sample/johnson.css). After you've selected the css file, click ok.

<figure><img class="img-responsive" src="http://i.imgur.com/nCz2Hs9.png" width="400px"><figcaption  style="color:gray;font-size:80%;text-align:right"></figcaption></figure>

Associating an CSS stylesheet will add an processing instruction at the beginning of your XML file that looks like this:

`<?xml-stylesheet type="text/css" href="johnson.css"?>`

If you switch to Text Mode, you can check it yourself.

So what does the styled version of Johnson's entry look like?

<figure><img class="img-responsive" src="http://i.imgur.com/9omxSQ4.png" width="100%"><figcaption  style="color:gray;font-size:80%;text-align:right"></figcaption></figure>

If the view you see on your computer screen differs from this one, make sure you play with the different rendering options we discussed in the previous section.

### Examining the sample CSS stylesheet

Now, oppen the CSS stylesheet in oXygen and examine its contents.

A style sheet consists of a list of *rules*. Each rule or rule-set consists of one or more *selectors*, and a *declaration block*.

**Selectors** are used to declare which part of the markup a style applies to by matching tags and attributes in the markup itself.

A **declaration block** consists of a list of declarations in curly braces. Each declaration itself consists of a **property**, a **colon**, and a **value**. If there are multiple declarations in a block, a semi-colon must be inserted to separate each declaration.

So, in the case of the following rule:

```css
teiHeader {
	display: none;
}
```

for the selector `teiHeader`, we are assigning the value `none` to the CSS property `display`. In other words, we are telling oXygen, *not* to display our teiHeader when we are in Author Mode.

**Try it yourself**: in your CSS styleshet, change the value of the `display` property from `none` to `block`, save the CSS file, then look at the effect this will have on the way your dictionary file is displayed in Author Mode. **Note**: if your XML file was already open in Author Mode, you may need to switch to Text Mode once and back to Author Mode for the changes to become visible.

In the case of:

```css
form[type="lemma"] {
	font-weight: bold;
}
```
our selector is element `<form>` but only of the type `lemma`. That means that our styling rule -- using bold -- will apply only to `<form type="lemma"/>` and not, for instance, to `<form type="ending"/>` or `<form type="inflected"/>`.

**Try it yourself**: switch to Text Mode, change the value of the type attribute in <lemma> or delete the attribute altogether, then switch back to Author Mode to see the effect this has.

When we construct a CSS rule that looks like this:

```css
gramGrp > pos {
	color: #ff2600;
}
```   
we're styling a `<pos>` element but only if is the child of the `<gramGrp>` element.

**Try it yourself**: switch to Text Mode, delete the `gramGrp` element and leave the `pos` only, then switch back to Author Mode and you will see that <pos> is no longer styled.


Finally, in the following rulesets:

```css
entry etym:before {
	content: " [";
}

entry etym:after {
	content: "] ";
}
```

we are telling oXygen to style `etym` elements which are descendants (not necessarily children) of the `entry` element in such a way that we end a space and an open square bracket *before* each such `etym` element; and a square bracket and a space *after* each scuh `etym` element.

**Try it yourself**: change the square brackets to round parenthesis in the stylesheet.

### What else can I do with CSS?

It is beyond the scope of the current lesson to teach you everything you ever wanted to know about CSS but were afraid to ask. Luckily, there are numerous rersources online where you could do that, for instance on [Code Academy](https://www.codecademy.com/learn/learn-html-css).

What we can do here is give you some more pointers about how to use basic CSS selectors in order to define which parts of your dictionary you want to style, and show you how to use basic property declarations for colors, backgrounds and fonts.

#### CSS selectors

- select multiple elements: ```cit[type="example"], cit[type="translation"] {/* property declarations */}``` will select all cits of type quote and all cits of type translation. You may want to style these differently from another type of cit.
- select elements that are descendants of another element: ```sense usg {/* property declarations */}``` will select all `usg` elements that are descendants of `sense`
- select elements that are children (i.e. direct descendants) of an element: ```sense > usg {/* property declarations */}``` will select all `usg` elements but only if they are children of `sense`
- select elements that are adjecent siblings of another element: ```cit + def {/* property declarations */}``` will select all `def` elements that immediately follow `cit`
- select elements that are preceeded by another element: ```gramGrp ~ sense {/* property declarations */}``` will select all `sense` elements that are preceded by `gramGrp`

#### CSS property declarations

- to set a **color**, you can use color names or hex values. What this means is that `color: aqua` is exactly the same as color: `#00FFFF`. For a list of named color values see [Color Names](http://www.w3schools.com/cssref/css_colors.asp) or this [Colors Tutorial](http://www.w3schools.com/colors/default.asp)
- to set **the color of a background**, use the background property, like this: `background: black;`. If you set dark backgrounds, remember to change the font color so that your text remains visible, for instance: `background: black; color:white;`.
- to set a **font**, use the font-family property like this:  `font-family: "Times New Roman", Times, serif;`. This will style the selected elements with  Times New Roman, if found on the system where you are running your oXygen installation; or with Times; or, in the absence of both, with a default system serif font. Of course, you could try a more fun font than Times.
- to set something in **italic**, use: `font-style: italic;`. The opposite of italic is: `font-style: normal;`
- to set something in **bold**, use `font-weight: bold;`. The opposite of bold is: `font-weight: normal;`
- to set the size of text, use the font-size property like this: `font-size: 15px;`

### Exercise

Take one of your dictionaries and design a CSS stylesheet, using the Johnson stylesheet as a starting point.
