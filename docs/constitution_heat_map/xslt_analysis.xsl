<!--<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <!-- Template to match the root and process the entire document -->
    <xsl:template match="/">
        <html>
            <head><title>Element and Attribute Counts</title></head>
            <body>
                <h1>Element and Attribute Count</h1>
                <table border="1">
                    <thead>
                        <tr>
                            <th>Element Name</th>
                            <th>Attribute Name</th>
                            <th>Attribute Value</th>
                            <th>Count</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:call-template name="analyzeThinker"/>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <!-- Template to analyze all elements and their attributes -->
    <xsl:template name="analyzeThinker">
        <xsl:for-each select="descendant::*">
            <xsl:variable name="elementName" select="name()" />
            
            <!-- Iterate over all attributes of the current element -->
            <xsl:for-each select="@*">
                <xsl:variable name="attributeName" select="name()" />
                <xsl:variable name="attributeValue" select="." />
                
                <!-- Correct XPath to dynamically reference attributes -->
                <xsl:variable name="count" select="count(//*/@*[local-name() = $attributeName and . = $attributeValue])" />
                
                <!-- Print the element-attribute pair and its count -->
                <tr>
                    <td><xsl:value-of select="$elementName"/></td>
                    <td><xsl:value-of select="$attributeName"/></td>
                    <td><xsl:value-of select="$attributeValue"/></td>
                    <td><xsl:value-of select="$count"/></td>
                </tr>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>
-->
