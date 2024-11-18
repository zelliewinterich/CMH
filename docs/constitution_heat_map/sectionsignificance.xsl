<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:my="http://www.example.com/functions"
    version="3.0">
    
    <!-- Define the documents to process -->
    <xsl:variable name="rousseauDocument" select="document('/Users/jamespaul/desktop/James-Paul-Repo_1/constitution_thinkers_repo/social_contract.xml')" />
    <xsl:variable name="montesquieuDocument" select="document('/Users/jamespaul/desktop/James-Paul-Repo_1/constitution_thinkers_repo/SOL.xml')" />
    <xsl:variable name="deciveDocument" select="document('/Users/jamespaul/desktop/James-Paul-Repo_1/constitution_thinkers_repo/DeCive_comp.xml')" />
    <xsl:variable name="lockeDocument" select="document('/Users/jamespaul/desktop/James-Paul-Repo_1/constitution_thinkers_repo/Locke_Second-Treatise.xml')" />
    <xsl:variable name="constitutionDocument" select="document('/Users/jamespaul/desktop/James-Paul-Repo_1/constitution_thinkers_repo/new_constitution.xml')" />
    <xsl:variable name="testDocument" select="document('/Users/jamespaul/desktop/digital humanities/thinker_test/Untitled1.xml')" />
    <!-- This function computes the relative significance of elements in the thinker documents compared to the Constitution -->
    
    <xsl:function name="my:calculateSignificance" as="xs:decimal">
        <xsl:param name="thinkerDocument" />
        <xsl:param name="elementAttributePair" />
        
        <!-- Count the number of occurrences of the element-attribute pair in the thinker's document -->
        <xsl:variable name="thinkerCount" select="count($thinkerDocument//*[name() = substring-before($elementAttributePair, ', ') and @type = substring-after($elementAttributePair, ', ')])" />
        
        <!-- Count the number of occurrences of the element-attribute pair in the constitution document -->
        <xsl:variable name="constitutionCount" select="count($constitutionDocument//*[name() = substring-before($elementAttributePair, ', ') and @type = substring-after($elementAttributePair, ', ')])" />
        
        <!-- Calculate the relative significance by dividing the thinker count by the constitution count -->
        
        <xsl:variable name="significance" select="if ($constitutionCount > 0) then ($thinkerCount div $constitutionCount) else 0" />
        
        <!-- Return the significance -->
        <xsl:value-of select="$significance" />
    </xsl:function>
    
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
                            <th>Locke Count</th>
                            <th>Constitution Count</th>
                            <th>Relative Significance (Rousseau)</th>
                            <th>Relative Significance (Montesquieu)</th>
                            <th>Relative Significance (DeCive)</th>
                            <th>Relative Significance (Locke)</th>
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
                                
                                <!-- Count occurrences in the DeCive document -->
                                <td><xsl:value-of select="count($deciveDocument//*[name() = substring-before($elementAttributePair, ', ') and @type = substring-after($elementAttributePair, ', ')])" /></td>
                                
                                <!--  <td><xsl:value-of select="count($lockeDocument//*[name() = substring-before($elementAttributePair, ', ') and @type = substring-after($elementAttributePair, ', ')])" /></td> -->
                                
                                <!-- Count occurrences in the Constitution document -->
                                <td><xsl:value-of select="count($constitutionDocument//*[name() = substring-before($elementAttributePair, ', ') and @type = substring-after($elementAttributePair, ', ')])" /></td>
                                
                                <!-- Calls the function from above to calculate the relative significance for each thinker -->
                                <td><xsl:value-of select="my:calculateSignificance($rousseauDocument, $elementAttributePair)" /></td>
                                <td><xsl:value-of select="my:calculateSignificance($montesquieuDocument, $elementAttributePair)" /></td>
                                <td><xsl:value-of select="my:calculateSignificance($deciveDocument, $elementAttributePair)" /></td>
                                <td><xsl:value-of select="my:calculateSignificance($lockeDocument, $elementAttributePair)" /></td> 
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
                
                <!-- Calculate overall significance for each thinker -->
                <h2>Overall Significance of Thinkers</h2>
                <table border="1">
                    <thead>
                        <tr>
                            <th>Thinker</th>
                            <th>Overall Significance</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Sum the relative significance for each thinker -->
                        <xsl:variable name="totalRousseauSignificance" select="sum(for $element in document('/Users/jamespaul/desktop/digital humanities/thinker_test/Untitled1.xml')//* return my:calculateSignificance($rousseauDocument, concat(name($element), ', ', $element/@type)))" />
                        <xsl:variable name="totalMontesquieuSignificance" select="sum(for $element in document('/Users/jamespaul/desktop/digital humanities/thinker_test/Untitled1.xml')//* return my:calculateSignificance($montesquieuDocument, concat(name($element), ', ', $element/@type)))" />
                        <xsl:variable name="totalDeCiveSignificance" select="sum(for $element in document('/Users/jamespaul/desktop/digital humanities/thinker_test/Untitled1.xml')//* return my:calculateSignificance($deciveDocument, concat(name($element), ', ', $element/@type)))" />
                        <xsl:variable name="totalLockeSignificance" select="sum(for $element in document('/Users/jamespaul/desktop/digital humanities/thinker_test/Untitled1.xml')//* return my:calculateSignificance($lockeDocument, concat(name($element), ', ', $element/@type)))" /> -->
                        <!-- Count the number of element-attribute pairs -->
                        <xsl:variable name="pairCount" select="count(document('/Users/jamespaul/desktop/digital humanities/thinker_test/Untitled1.xml')//*)" />
                        
                        <!-- Calculate average significance for each thinker -->
                        <xsl:variable name="averageRousseauSignificance" select="$totalRousseauSignificance div $pairCount" />
                        <xsl:variable name="averageMontesquieuSignificance" select="$totalMontesquieuSignificance div $pairCount" />
                        <xsl:variable name="averageDeCiveSignificance" select="$totalDeCiveSignificance div $pairCount" />
                        <xsl:variable name="averageLockeSignificance" select="$totalLockeSignificance div $pairCount" />
                        
                        <tr>
                            <td>Rousseau</td>
                            <td><xsl:value-of select="$averageRousseauSignificance" /></td>
                        </tr>
                        <tr>
                            <td>Montesquieu</td>
                            <td><xsl:value-of select="$averageMontesquieuSignificance" /></td>
                        </tr>
                        <tr>
                            <td>DeCive</td>
                            <td><xsl:value-of select="$averageDeCiveSignificance" /></td>
                        </tr>
                        <tr>
                             <td>Locke</td>
                            <td><xsl:value-of select="$averageLockeSignificance" /></td>
                         </tr> 
                    </tbody>
                </table>
                
                <!-- Calculate relative significance for each section -->
                <h2>Relative Significance for Each Section</h2>
                <table border="1">
                    <thead>
                        <tr>
                            <th>Section</th>
                            <th>Rousseau Significance</th>
                            <th>Montesquieu Significance</th>
                            <th>DeCive Significance</th>
                            <th>Locke Significance</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Iterate through each section of the Constitution -->
                        <xsl:for-each select="$constitutionDocument//section">
                            <xsl:variable name="sectionName" select="section_name/@number" />
                            
                            <!-- Calculate the total significance for each thinker in the current section -->
                            <xsl:variable name="totalRousseauSignificance" select="sum(for $element in .//* return my:calculateSignificance($rousseauDocument, concat(name($element), ', ', $element/@type)))" />
                            <xsl:variable name="totalMontesquieuSignificance" select="sum(for $element in .//* return my:calculateSignificance($montesquieuDocument, concat(name($element), ', ', $element/@type)))" />
                            <xsl:variable name="totalDeCiveSignificance" select="sum(for $element in .//* return my:calculateSignificance($deciveDocument, concat(name($element), ', ', $element/@type)))" />
                            <xsl:variable name="totalLockeSignificance" select="sum(for $element in .//* return my:calculateSignificance($lockeDocument, concat(name($element), ', ', $element/@type)))" /> 
                            
                            <!-- Count the number of element-attribute pairs in this section -->
                            <xsl:variable name="pairCount" select="count(.//*)" />
                            
                            <!-- Calculate average significance for each thinker -->
                            <xsl:variable name="averageRousseauSignificance" select="$totalRousseauSignificance div $pairCount" />
                            <xsl:variable name="averageMontesquieuSignificance" select="$totalMontesquieuSignificance div $pairCount" />
                            <xsl:variable name="averageDeCiveSignificance" select="$totalDeCiveSignificance div $pairCount" />
                            <xsl:variable name="averageLockeSignificance" select="$totalLockeSignificance div $pairCount" />
                            <!-- Output the section name and average significance for each thinker -->
                            <tr>
                                <td><xsl:value-of select="$sectionName" /></td>
                                <td><xsl:value-of select="format-number($averageRousseauSignificance, '0.00')" /></td>
                                <td><xsl:value-of select="format-number($averageMontesquieuSignificance, '0,0')" /></td>
                                <td><xsl:value-of select="format-number($averageDeCiveSignificance, '0,0')" /></td>
                                <td><xsl:value-of select="format-number($averageLockeSignificance, '0,0')" /></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>
