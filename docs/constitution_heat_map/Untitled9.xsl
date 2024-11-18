<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="3.0">
    
    <!-- Define the documents to process -->
    <xsl:variable name="rousseauDocument" select="document('/Users/jamespaul/desktop/James-Paul-Repo_1/constitution_thinkers_repo/social_contract.xml')" />
    <xsl:variable name="montesquieuDocument" select="document('/Users/jamespaul/desktop/James-Paul-Repo_1/constitution_thinkers_repo/SOL.xml')" />
    <xsl:variable name="deciveDocument" select="document('/Users/jamespaul/desktop/James-Paul-Repo_1/constitution_thinkers_repo/DeCive_comp.xml')" />
    <!--<xsl:variable name="lockeDocument" select="document('/Users/jamespaul/desktop/James-Paul-Repo_1/constitution_thinkers_repo/Locke_Second-Treatise.xml')" />-->
    <xsl:variable name="constitutionDocument" select="document('/Users/jamespaul/desktop/James-Paul-Repo_1/constitution_thinkers_repo/new_constitution.xml')" />
    
    <!-- Template to match the root and process the entire document -->
    <xsl:template match="/">
        <html>
            <head><title>Thinkers and Their Impact on the Constitution</title></head>
            <body>
                <h1>Element and Attribute Count Across Thinkers and the Constitution</h1>
                
                <!-- Table for element-attribute counts across all works -->
                <table border="1">
                    <thead>
                        <tr>
                            <th>Element and Attribute</th>
                            <th>Rousseau Count</th>
                            <th>Montesquieu Count</th>
                            <th>DeCive Count</th>
                            <th>Constitution Count</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Iterate through all elements in the test XML -->
                        <xsl:for-each select="document('/Users/jamespaul/desktop/digital humanities/thinker_test/Untitled1.xml')//*">
                            
                            <!-- Generate element-attribute pair (element name and attribute 'type') -->
                            <xsl:variable name="elementAttributePair" select="concat(name(), ', ', @type)" />
                            
                            <tr>
                                <!-- Output the element-attribute pair -->
                                <td><xsl:value-of select="$elementAttributePair" /></td>
                                
                                <!-- Count occurrences in the Rousseau document -->
                                <td><xsl:value-of select="count($rousseauDocument//*[name() = substring-before($elementAttributePair, ', ') and @type = substring-after($elementAttributePair, ', ')])" /></td>
                                
                                <!-- Count occurrences in the Montesquieu document -->
                                <td><xsl:value-of select="count($montesquieuDocument//*[name() = substring-before($elementAttributePair, ', ') and @type = substring-after($elementAttributePair, ', ')])" /></td>
                                <td><xsl:value-of select="count($deciveDocument//*[name() = substring-before($elementAttributePair, ', ') and @type = substring-after($elementAttributePair, ', ')])" /></td>
                                <!-- <td><xsl:value-of select="count($lockeDocument//*[name() = substring-before($elementAttributePair, ', ') and @type = substring-after($elementAttributePair, ', ')])" /></td>-->
                                <!-- Count occurrences in the Constitution document -->
                                <td><xsl:value-of select="count($constitutionDocument//*[name() = substring-before($elementAttributePair, ', ') and @type = substring-after($elementAttributePair, ', ')])" /></td>
                                
                                <!-- Calculate total count across all documents -->

                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
