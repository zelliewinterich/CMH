<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
     xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xpath-default-namespace="http://www.tei-c.org/ns/1.0"
        xmlns:xs="http://www.w3.org/2001/XMLSchema"
        xmlns:math="http://www.w3.org/2005/xpath-functions/math" 
        xmlns="http://www.w3.org/1999/xhtml"
        exclude-result-prefixes="xs math"
        version="3.0">
    
        <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" 
            include-content-type="no" indent="yes"/>

    
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Hamlet</title>
            </head>
            <body>
                <ul>
                    <xsl:apply-templates select="//body"/>
                </ul>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="body/div">
        
        <li>
            <xsl:apply-templates select="head"/>
            <ul>
                <xsl:apply-templates select="div"/>
            </ul>
        </li>    
    </xsl:template>
    
    <xsl:template match="div/div">
        <li>
            <xsl:apply-templates select="head"/>
        </li>
    </xsl:template>
    
    
    
    
 

</xsl:stylesheet>  
