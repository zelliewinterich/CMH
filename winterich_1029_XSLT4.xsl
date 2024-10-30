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
        </head>
        <body>
            <h1 style="text-align:center;">Shakespearean Sonnets</h1>
            <h2 style="text-align:center;">Table of Contents</h2>
            <ul>
            <xsl:apply-templates select="//sonnet" mode="toc"/>
            </ul>
            <hr/>
            <xsl:apply-templates/>
        </body>
    </html>
</xsl:template>
    
<xsl:template match="sonnet" mode="toc">
        <li>
            <strong>
            <xsl:value-of select="@number"/>
            </strong>
            <xsl:text>: </xsl:text>
            <i>
            <xsl:value-of select="line[1]"/>
            </i>
        </li>
    </xsl:template>

<xsl:template match="sonnet">
    <h2 style="text-align:center;">
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