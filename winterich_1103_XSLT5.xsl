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
            <title>Shakespeare Sonnets</title>
            <link rel="stylesheet" type="text/css" href="winterichxslt5.css"/>
            <style>
                <!-- I made a CSS stylesheet for the links I created as well as just some general styling of the headers -->
            </style>
        </head>
        <body>
            <h1 style="text-align:center;">Shakespearean Sonnets</h1>
            <h2 style="text-align:center;">Table of Contents</h2>
            <ul>
                <xsl:apply-templates select="//sonnet" mode="toc">
                    <xsl:sort>
                    <xsl:value-of select="translate('', line[1], @number)"/>
                    <!-- I used the Michael Kay way to sort it but I didn't like that it sorted it aplhabetically so I played around with it for a while until I got it to be sorted by roman numerals again. I can change this though if it was supposed to be sorted alphabetically -->
                    </xsl:sort>
                </xsl:apply-templates>
            </ul>
            <hr/>
            <xsl:apply-templates/>
        </body>
    </html>
</xsl:template>
    
    <xsl:template match="sonnet" mode="toc">
        <!-- i put the line tags before the number tags so that the lines would come before in the TOC -->
        <li>
            <line style="font-style:italic;">
                <xsl:value-of select="line[1]"/>
                <xsl:text> : </xsl:text>
                <!-- I also added in the 'xsl:text' tag just for organizational purposes -->
            </line>
            
            <!-- I switched the'<i>' tags to '<line>' tags with a style instead to make it italics, and switched out the '<strong>' tags for '<number>' tags so i could also add in styles-->
            <number style="font-weight:bold;">
                <a href="#{@number}">
                    <!-- I made sure to ref link it to my number so that when you click on the roman numerals, it'll take you to that section -->
                    <xsl:value-of select="@number"/>
                <xsl:text>. </xsl:text>
                </a>
            </number>
            <i>
                <xsl:value-of select="sub_section"/>
            </i>
        </li>
    </xsl:template>
    
    <xsl:template match="sonnet">
        <h2 id="{@number}" style="text-align:center;">
            <!-- i made sure to put the '<id>' tag so that when you click on the roman numerals in the TOC, it'll take you to the corresponding area -->
            <xsl:value-of select="@number"/>
        </h2>
        <p>
            <xsl:for-each select="line">
                <xsl:apply-templates/>
                <br>
                    <xsl:value-of select="line"/>
                </br>
            </xsl:for-each>
        </p>
    </xsl:template>
    
</xsl:stylesheet>
   