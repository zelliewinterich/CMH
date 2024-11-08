<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/2000/svg"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="#all"
    version="3.0">
    
    <xsl:variable name="barWidth" as="xs:double" select="100"/>
    <xsl:variable name="spacing" as="xs:double" select="$barWidth div 4"/>
    <xsl:variable name="yScale" as="xs:double" select="5"/>
    <xsl:variable name="maxHeight" as="xs:double" select="$yScale * 100"/>
    <xsl:variable name="maxWidth" as="xs:double" select="($barWidth + $spacing) * $candidates"/>
    <xsl:variable name="candidates" as="xs:integer" select="count(/stooge)"/>
    
    <xsl:template match="/">
        <svg height="1000" width="1000" viewBox="0, -500, 500, 500">
            <line x1="0" y1="0" x2="{$maxWidth}" y2="0" stroke="black"/>
            <line x1="0" y1="0" x2="0" y2="-{$maxHeight}" stroke="black"/>
            
            <xsl:apply-templates/>
        </svg>
    </xsl:template>
    
    <xsl:template match="stooge">
        
    </xsl:template>
    
</xsl:stylesheet>