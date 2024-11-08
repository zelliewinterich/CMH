<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" 
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="#all"
    version="3.0">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" 
        include-content-type="no" indent="yes"/>
    
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>XSLT Test</title>
                <link rel="stylesheet" type="text/css" href="xslttest.css"/>
            </head>
            <body>
                <xsl:apply-templates select="//metaData"/>
                <img src="yellowfairytale.jpg" alt="book" class="center" width="350" height="500"/>              
                <!-- i added in an image of the book lol -->
                <hr/>
                <!-- this is saying have the text and info in metaData come first -->
                <h2 style="text-align:center;">Table of Contents</h2>
                <ul>
                    <xsl:apply-templates select="//story" mode="toc"/>
                </ul>
                <!-- this is saying apply the table of contents to the stories -->
                <hr/>
                <!-- this is just a line -->
                <xsl:apply-templates select="//story"/>
                <!-- this is saying apply the templates below to the story -->
            </body>
        </html>
    </xsl:template>
    <!-- general outline -->
    
    <xsl:template match="//metaData">
        <div class="metaData">
            <h1 style="text-align:center;">
                <xsl:value-of select="title"/>
            </h1>
            <h3 style="text-align:center;">
                <i>
                <xsl:value-of select="author"/>
                </i>
            </h3>
            <h3 style="text-align:center;">
                <i>
                <xsl:value-of select="editor"/>
                </i>
            </h3>
        </div>
    </xsl:template>
    <!-- metadata section -->
    
    <xsl:template match="//story" mode="toc">
        <li>
            <h2>
                <a href="#story-{position()}"> <!-- this is linking the titles in the TOC to where they appear in the document, it's saying link the titles, within the stories, to their position -->
                    <xsl:value-of select="title"/>
                    <xsl:text>:</xsl:text>
                </a>
            </h2>
            <h3>
            <xsl:if test="origin">
                <a href="#footnote{generate-id()}">
                    <xsl:value-of select="position()"/>
                </a>
            </xsl:if>
            </h3>
            <i>
                <!-- this is saying take each time '<p>' occurs and make it italicized, but only show the first 1-10 words in the TOC (i did this just because if I only selected 'p[1]' the TOC would be much longer and this condenses it a ton -->
                <xsl:value-of select="string-join(subsequence(tokenize(p[1], '\s+'), 1, 10), ' ')"/> <!-- also the '\s+' command is taking the white spaces, with the + allowing for more than one instance to occur -->
                <xsl:text>...</xsl:text>
            </i>
        </li>
    </xsl:template>
    <!-- table of contents section -->
    
    <xsl:template match="story">
        <div class="story">
            <div id="story-{position()}"> <!-- this is what links the titles in the TOC to where they appear within the story/document -->
                <hr/>
                <xsl:apply-templates select="title"/>
                <xsl:apply-templates select="origin"/>
                <xsl:apply-templates select="p"/>
                <hr/>
            </div>
        </div>
    </xsl:template>
    <!-- story section -->
    
    <xsl:template match="title">
        <h2 style="text-align:center">
            <xsl:value-of select="."/>
        </h2>
    </xsl:template>
    <!-- title section -->
    
    <xsl:template match="origin">
       <div class="origin">
        <h2 style="text-align:center">
                <sup>
                    <a id="footnote{generate-id()}">
                        <xsl:value-of select="position()"/>
                    </a>
                </sup>
            <xsl:value-of select="."/>
        </h2>
       </div>
    </xsl:template>
    <!-- origin section/footnotes -->
    
    <xsl:template match="p">
        <p>
            <xsl:value-of select="."/>
        </p>
    </xsl:template>
    <!-- p section, or, where the main text of each story is -->
</xsl:stylesheet>
