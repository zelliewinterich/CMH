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
                <title>Skyrim</title>
                <link rel="stylesheet" type="text/css" href="winterichxslt3.css"/>
            <style>
                
            </style>
            </head>
            <body>
                
                <xsl:apply-templates select="//body"/>
                
            </body>
        </html>
        
    </xsl:template>
    
    <xsl:template match="paragraph">
        <p style="color:black;">
            <xsl:apply-templates/>
        </p>
        
    </xsl:template>
    
    <xsl:template match="QuestItem">
       <questitem>
           <xsl:apply-templates/>
       </questitem>   
    </xsl:template>
    
    <xsl:template match="QuestEvent">
        <em>
            <xsl:apply-templates/>
        </em> 
    </xsl:template>
    
    <xsl:template match="character">
        <b style="color:blue;">
            <xsl:apply-templates/>
           
        </b>
    </xsl:template>
    
    <xsl:template match="epithet">
        <strong>
        <xsl:apply-templates/>
        </strong>
    </xsl:template>
    
    <xsl:template match="faction[@ref='MythicDawn']">
       <strong>
        <span class="MythicDawn">
            <xsl:value-of select="."/>
        </span>
       </strong>
    </xsl:template>
    
    <xsl:template match="location">
        <i>
            <xsl:apply-templates/>
        </i>
    </xsl:template>
    
</xsl:stylesheet>
    
   
    
   
    
    
    


