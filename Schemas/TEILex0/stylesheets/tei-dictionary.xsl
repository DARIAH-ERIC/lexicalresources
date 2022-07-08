<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0">
    
    <!--
        A stylesheet for TEI-encoded dictionaries.
        Author: Michal Boleslav Měchura, http://www.lexiconista.com/
    -->
    
   <!-- I'm just parking this here, it doesn't quite work for TEI Lex-0
    But we can improve it. May come in useful for the Publisher-->
    
    <xsl:output method="html"/>
    
    <xsl:template match="/">
        <html>
            <head>
            </head>
            <body>
                <div style="max-width: 600px; margin: 0px auto; x-column-count: 2; x-column-gap: 40px;">
                    <xsl:apply-templates select="/tei:TEI/tei:text/tei:body/*"/>
                </div>
            </body>
        </html>
    </xsl:template>
    
    
    <!--top-level entry element: basically just a paragraph-->
    <xsl:template match="tei:superEntry | tei:entry | tei:entryFree">
        <span style="display: block; line-height: 1.5em; margin: 1.5em 0 1.5em -1em; text-indent: -1em;" xml:space="preserve">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!--subentry with grey left border and indent-->
    <xsl:template match="tei:superEntry/tei:entry | tei:superEntry/tei:entryFree | tei:hom">
        <span style="display: block; line-height: 1.5em; margin: 0.35em 0 0 0; border-left: 5px solid #dddddd; padding: 0.25em 0 0.25em 1em; text-indent: 0em;">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!--subentry with bullet and indent-->
    <xsl:template match="tei:re">
        <span style="display: block; margin: 0.5em 0 0.5em 0.5em; min-height: 1.5em; text-indent: 0em;">
            <span style="float: left; font-weight: bold; color: #666666">»</span>
            <span style="display: block; margin-left: 1.5em;"><xsl:apply-templates/></span>
        </span>
    </xsl:template>
    
    <!--sense with bullet or number, and indent-->
    <xsl:template match="tei:sense">
        <span style="display: block; margin: 0.5em 0 0.5em 0.5em; min-height: 1.5em; text-indent: 0em;">
            <xsl:variable name="bullet">
                <xsl:choose>
                    <xsl:when test="@n"><xsl:value-of select="@n"/></xsl:when>
                    <xsl:otherwise>▪</xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <span style="float: left; font-weight: bold; color: #999999"><xsl:value-of select="$bullet"/></span>
            <span style="display: block; margin-left: 1.5em;"><xsl:apply-templates/></span>
        </span>
    </xsl:template>
    
    <!---tilda-->
    <xsl:template match="tei:oRef|tei:pRef">
        <xsl:choose>
            <xsl:when test="text()|*"><xsl:apply-templates/></xsl:when>
            <xsl:otherwise>~</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!--when <form> seems complex, give it a bullet and indent it-->
    <xsl:template match="tei:form[tei:gramGrp and not(position()=1)]">
        <span style="display: block; margin: 0.5em 0 0.5em 0.5em; min-height: 1.5em;">
            <span style="float: left; font-weight: bold; color: #999999">›</span>
            <span style="display: block; margin-left: 1.5em;"><xsl:apply-templates/></span>
        </span>
    </xsl:template>
    
    <!--a default <orth>-->
    <xsl:template match="tei:orth">
        <span style="font-family: sans-serif;">
            <xsl:apply-templates/>
        </span>
        <xsl:if test="following-sibling::node()[1][name()='orth']"><xsl:text> </xsl:text><span style="color: #999999">|</span><xsl:text> </xsl:text></xsl:if>
    </xsl:template>
    
    <!--an <orth> that seems like a headword; overrides default <orth>-->
    <xsl:template match="tei:form[@type='lemma' or @type='compound']//tei:orth
        | tei:form[1][parent::tei:entry or parent::tei:entryFree or parent::tei:superEntry or parent::tei:re]/tei:orth[not(preceding-sibling::*)]
        | tei:form[1][not(*) and (parent::tei:entry or parent::tei:entryFree or parent::tei:superEntry or parent::tei:re)]">
        <span style="font-family: sans-serif; font-weight: bold; text-shadow: 0px 0px 1px #999999;">
            <xsl:apply-templates/>
        </span>
        <xsl:if test="following-sibling::*[1][name()='orth']"><xsl:text> </xsl:text><span style="color: #999999">|</span><xsl:text> </xsl:text></xsl:if>
    </xsl:template>
    
    <!--defintion, etymology, note-->
    <xsl:template match="tei:def | tei:etym | tei:note">
        <xsl:apply-templates/>
        <xsl:if test="following-sibling::*[1][name()='def' or name()='etym' or name()='note' or (name()='cit' and (@type='translation' or @type='trans')) or name()='quote']">
            <xsl:text> </xsl:text><span style="color: #999999">|</span><xsl:text> </xsl:text>
        </xsl:if>
    </xsl:template>
    
    <!--a default <cit>-->
    <xsl:template match="tei:cit">
        <xsl:apply-templates/>
        <xsl:if test="following-sibling::node()[1][name()='cit']"><xsl:text> </xsl:text><span style="color: #999999">|</span><xsl:text> </xsl:text></xsl:if>
    </xsl:template>
    
    <!--a <cit> that looks like a translation of the headword-->
    <xsl:template match="tei:cit[(@type='translation' or @type='trans') and not (parent::tei:cit)]">
        <xsl:apply-templates/>
        <xsl:if test="following-sibling::*[1][name()='def' or name()='etym' or name()='note' or (name()='cit' and (@type='translation' or @type='trans'))  or name()='quote']">
            <xsl:text> </xsl:text><span style="color: #999999">|</span><xsl:text> </xsl:text>
        </xsl:if>
    </xsl:template>
    
    <!--a <cit> that looks like an example sentence-->
    <xsl:template match="tei:cit[@type='example' or @type='ex' or not(@type)]">
        <span style="display: block; margin: 0.5em 0 0.5em 0.5em; min-height: 1.5em; text-indent: 0em;">
            <span style="float: left; font-weight: bold; color: #666666">◆</span>
            <span style="display: block; margin-left: 1.5em;"><xsl:apply-templates/></span>
        </span>
    </xsl:template>
    
    <!--a default <quote>-->
    <xsl:template match="tei:quote">
        <span style="font-family: sans-serif; font-weight: bold; color: #666666;">
            <xsl:apply-templates/>
        </span>
        <xsl:if test="following-sibling::*[1][name()='quote']"><xsl:text> </xsl:text><span style="color: #999999">|</span><xsl:text> </xsl:text></xsl:if>
    </xsl:template>
    
    <!--a <quote> inside a translation of the headword-->
    <xsl:template match="tei:cit[@type='translation' or @type='trans']/tei:quote">
        <span style="font-family: sans-serif; text-shadow: 0px 0px 1px #999999;">
            <xsl:apply-templates/>
        </span>
        <xsl:if test="following-sibling::*[1][name()='quote' or name()='def' or name()='note']"><xsl:text> </xsl:text><span style="color: #999999">|</span><xsl:text> </xsl:text></xsl:if>
    </xsl:template>
    
    <!--a <quote> inside a translation of an example sentence-->
    <xsl:template match="tei:cit/tei:cit[@type='translation' or @type='trans']/tei:quote">
        <span style="font-family: sans-serif; font-style: italic; color: #666666;">
            <xsl:apply-templates/>
        </span>
        <xsl:if test="following-sibling::*[1][name()='quote' or name()='def' or name()='note']"><xsl:text> </xsl:text><span style="color: #999999">|</span><xsl:text> </xsl:text></xsl:if>
    </xsl:template>
    
    <!--pronunciation-->
    <xsl:template match="tei:pron">
        <span style="font-family: sans-serif; color: #006600">
            <xsl:text>[</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>]</xsl:text>
        </span>
    </xsl:template>
    
    <!--various <form> children-->
    <xsl:template match="tei:hyph|tei:syll|tei:stress">
        <span style="font-family: sans-serif; color: #666666">
            <xsl:text>(</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>)</xsl:text>
        </span>
    </xsl:template>
    
    <!--grammatical labels-->
    <xsl:template match="tei:gram|tei:gen|tei:number|tei:case|tei:per|tei:tns|tei:mood|tei:iType|tei:pos|tei:subc|tei:gramGrp[not(*)]">
        <span style="font-family: sans-serif; color: #000066; background-color: #eeeeee; padding: 1px 5px; border-radius: 2px;">
            <xsl:choose>
                <xsl:when test="text()|*"><xsl:apply-templates/></xsl:when>
                <xsl:otherwise><xsl:value-of select="@value"/></xsl:otherwise>
            </xsl:choose>
        </span>
    </xsl:template>
    
    <!--a collocate: looks like a grammatical label and like <orth> at the same time-->
    <xsl:template match="tei:colloc">
        <span style="font-family: sans-serif; border: 1px solid #aaaaaa; padding: 0px 5px; border-radius: 2px;">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!--various labels-->
    <xsl:template match="tei:lbl|tei:usg|tei:lang">
        <span style="color: #666666; font-style: italic;">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!-- a cross-reference -->
    <xsl:template match="tei:ref | tei:xr[not(tei:ref)] | tei:ptr">
        <span style="border-bottom: 1px dotted #006600; font-family: sans-serif;">
            <xsl:choose>
                <xsl:when test="text()|*"><xsl:apply-templates/></xsl:when>
                <xsl:otherwise><xsl:value-of select="@target"/></xsl:otherwise>
            </xsl:choose>
            <xsl:text>&#160;</xsl:text> <!-- non-breaking space -->
            <span style="color: #006600; font-weight: bold;">›</span>
        </span>
        <xsl:if test="following-sibling::node()[1][name()='ref' or name()='xr']"><xsl:text> </xsl:text><span style="color: #cccccc">|</span><xsl:text> </xsl:text></xsl:if>
    </xsl:template>
    
    <!--a <mentioned> inside an etymology: looks a bit like a headword-->
    <xsl:template match="tei:mentioned">
        <span style="font-family: sans-serif; text-shadow: 0px 0px 1px #999999;">
            <xsl:apply-templates/>
        </span>
        <xsl:if test="following-sibling::node()[1][name()='mentioned']"><xsl:text> </xsl:text><span style="color: #999999">|</span><xsl:text> </xsl:text></xsl:if>
    </xsl:template>
    
    <!--a gloss: surrounded by 69-shaped single quotes-->
    <xsl:template match="tei:gloss">
        <xsl:text>‘</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>’</xsl:text>
    </xsl:template>
    
</xsl:stylesheet>