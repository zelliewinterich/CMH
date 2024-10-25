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
                <link rel="stylesheet" type="text/css" href="winterich_1026_XSLT3.css"/>
            <style>
                
            </style>
            </head>
            
            <body>
                
                <xsl:apply-templates select="//body"/>
                
            </body>
        </html>
        
    </xsl:template>
    
    <xsl:template match="paragraph/*">
        <p>
            <xsl:apply-templates/>
        </p>
        
    </xsl:template>
    
    <xsl:template match="QuestEvent">
        <strong>
         <xsl:apply-templates/>
        </strong>   
    </xsl:template>
    
   
    <xsl:template match="faction">
        <span class="quest" >
            <strong>
        <xsl:apply-templates/>
            </strong>
        </span>
    </xsl:template>
    
    <xsl:template match="//QuestEvent/character">
        <xsl:apply-templates/>
    </xsl:template>
    
    
    
</xsl:stylesheet>

