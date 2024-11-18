<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:custom="http://www.example.com/calculateImpactScore" 
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:param name="lockeWorkPath" select="'/Users/jamespaul/desktop/James-Paul-Repo_1/constitution_thinkers_repo/Locke_Second-Treatise.xml'"/>
    <xsl:param name="rousseauWorkPath" select="'/Users/jamespaul/desktop/James-Paul-Repo_1/constitution_thinkers_repo/social_contract.xml'"/>
    <xsl:param name="deciveWorkPath" select="'/Users/jamespaul/desktop/James-Paul-Repo_1/constitution_thinkers_repo/DeCive_comp.xml'"/>
    <xsl:param name="montesquieuWorkPath" select="'/Users/jamespaul/desktop/James-Paul-Repo_1/constitution_thinkers_repo/SOL.xml'"/>
    
    <!-- Template to match the root and process the entire document -->
    <xsl:template match="/">
        <html>
            <head><title>Thinkers and Their Impact on the Constitution</title></head>
            <body>
                <h1>Element and Attribute Count for Thinkers</h1>
                
                <!-- Reference to the thinker's works and the Constitution -->
                <xsl:variable name="lockeDoc" select="document($lockeWorkPath)" />
                <xsl:variable name="rousseauDoc" select="document($rousseauWorkPath)" />
                <xsl:variable name="deciveDoc" select="document($deciveWorkPath)" />
                <xsl:variable name="montesquieuDoc" select="document($montesquieuWorkPath)" />
                <xsl:variable name="constitutionDoc" select="document('/Users/jamespaul/desktop/James-Paul-Repo_1/constitution_thinkers_repo/new_constitution.xml')" />
                
                <!-- Table for thinker element-attribute counts -->
                <table border="1">
                    <thead>
                        <tr>
                            <th>Element Name</th>
                            <th>Attribute Name</th>
                            <th>Attribute Value</th>
                            <th>Count in Locke's Work</th>
                            <th>Count in Rousseau's Work</th>
                            <th>Count in DeCive's Work</th>
                            <th>Count in Montesquieu's Work</th>
                            <th>Count in Entire Constitution</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Call template to analyze element-attribute pairs for all thinkers -->
                        <xsl:call-template name="analyzeThinkerForWork">
                            <xsl:with-param name="lockeDoc" select="$lockeDoc"/>
                            <xsl:with-param name="rousseauDoc" select="$rousseauDoc"/>
                            <xsl:with-param name="deciveDoc" select="$deciveDoc"/>
                            <xsl:with-param name="montesquieuDoc" select="$montesquieuDoc"/>
                            <xsl:with-param name="constitutionDoc" select="$constitutionDoc"/>
                        </xsl:call-template>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
   
    <!-- Template to analyze element-attribute pairs for the thinker's works -->
    <xsl:template name="analyzeThinkerForWork">
        <xsl:param name="lockeDoc"/>
        <xsl:param name="rousseauDoc"/>
        <xsl:param name="deciveDoc"/>
        <xsl:param name="montesquieuDoc"/>
        <xsl:param name="constitutionDoc"/>
        
        <!-- Iterate through all the thinker works -->
        <xsl:for-each select="($lockeDoc, $rousseauDoc, $deciveDoc, $montesquieuDoc)">
            <xsl:variable name="workDoc" select="."/>
            
            <xsl:for-each select="$workDoc//*">
                <xsl:variable name="elementName" select="name()"/>
                
                <!-- Iterate over all attributes of the current element -->
                <xsl:for-each select="@*">
                    <xsl:variable name="attributeName" select="name()"/>
                    <xsl:variable name="attributeValue" select="."/>
                    
                    <!-- Count the occurrences of this element-attribute pair in the current work -->
                    <xsl:variable name="countInWork" select="count($workDoc//descendant-or-self::*[name() = $elementName]/@*[local-name() = $attributeName and . = $attributeValue])"/>
                    
                    <!-- Count the occurrences of this element-attribute pair in the entire Constitution -->
                    <xsl:variable name="countInConstitution" select="count($constitutionDoc//descendant-or-self::*[name() = $elementName]/@*[local-name() = $attributeName and . = $attributeValue])"/>
                    
                    <!-- Print the element-attribute pair and its counts -->
                    <tr>
                        <td><xsl:value-of select="$elementName"/></td>
                        <td><xsl:value-of select="$attributeName"/></td>
                        <td><xsl:value-of select="$attributeValue"/></td>
                        <td><xsl:value-of select="$countInWork"/></td>
                        <td><xsl:value-of select="count($rousseauDoc//descendant-or-self::*[name() = $elementName]/@*[local-name() = $attributeName and . = $attributeValue])"/></td>
                        <td><xsl:value-of select="count($deciveDoc//descendant-or-self::*[name() = $elementName]/@*[local-name() = $attributeName and . = $attributeValue])"/></td>
                        <td><xsl:value-of select="count($montesquieuDoc//descendant-or-self::*[name() = $elementName]/@*[local-name() = $attributeName and . = $attributeValue])"/></td>
                        <td><xsl:value-of select="$countInConstitution"/></td>
                    </tr>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>