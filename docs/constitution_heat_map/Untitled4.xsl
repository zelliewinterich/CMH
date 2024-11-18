<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:my="http://www.example.com/functions"
    version="3.0">
    
    <!-- Define the documents to process -->
    <xsl:variable name="rousseauDocument" select="document('/Users/jamespaul/desktop/James-Paul-Repo_1/constitution_thinkers_repo/social_contract.xml')" />
    <xsl:variable name="montesquieuDocument" select="document('/Users/jamespaul/desktop/James-Paul-Repo_1/constitution_thinkers_repo/SOL.xml')" />
    <xsl:variable name="deciveDocument" select="document('/Users/jamespaul/desktop/James-Paul-Repo_1/constitution_thinkers_repo/DeCive_comp.xml')" />
    <xsl:variable name="constitutionDocument" select="document('/Users/jamespaul/desktop/James-Paul-Repo_1/constitution_thinkers_repo/new_constitution.xml')" />
    <xsl:variable name="testDocument" select="document('/Users/jamespaul/desktop/digital humanities/thinker_test/Untitled1.xml')" />
    
    <!-- Define the function to calculate significance -->
    <xsl:function name="my:calculateSignificance" as="xs:decimal">
        <xsl:param name="thinkerDocument" />
        <xsl:param name="elementAttributePair" />
        
        <!-- Count the number of matches in the thinker's document -->
        <xsl:variable name="thinkerCount" select="count($thinkerDocument//*[name() = substring-before($elementAttributePair, ', ') and @type = substring-after($elementAttributePair, ', ')])" />
        
        <!-- Count the number of matches in the test document -->
        <xsl:variable name="testCount" select="count($testDocument//*[name() = substring-before($elementAttributePair, ', ') and @type = substring-after($elementAttributePair, ', ')])" />
        
        <!-- Calculate relative significance -->
        <xsl:variable name="significance" select="if ($testCount > 0) then ($thinkerCount div $testCount) else 0" />
        
        <!-- Return the significance -->
        <xsl:value-of select="$significance" />
    </xsl:function>
    
    <!-- Template to match the root and process the entire document -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Constitution and Thinkers Significance</title>
                <!-- Link to the external CSS file -->
                <link rel="stylesheet" type="text/css" href="styles.css"/>
                <script src="script.js"></script>

            </head>
            <body>
                <h1>Constitution and Thinkers Significance</h1>
                
                <!-- Dropdown to select thinker -->
                <label for="thinkerSelector">Select Thinker: </label>
                <select id="thinkerSelector" onchange="changeThinkerSelection()">
                    <option value="rousseau">Rousseau</option>
                    <option value="montesquieu">Montesquieu</option>
                    <option value="decive">DeCive</option>
                </select>
                
                <!-- Iterate through each section of the Constitution -->
                <xsl:for-each select="$constitutionDocument//section">
                    <xsl:variable name="sectionName" select="section_name" />
                    
                    <!-- Calculate significance for each thinker in this section -->
                    <xsl:variable name="totalRousseauSignificance" select="sum(for $element in .//* return my:calculateSignificance($rousseauDocument, concat(name($element), ', ', $element/@type)))" />
                    <xsl:variable name="totalMontesquieuSignificance" select="sum(for $element in .//* return my:calculateSignificance($montesquieuDocument, concat(name($element), ', ', $element/@type)))" />
                    <xsl:variable name="totalDeCiveSignificance" select="sum(for $element in .//* return my:calculateSignificance($deciveDocument, concat(name($element), ', ', $element/@type)))" />
                    
                    <!-- Count the number of element-attribute pairs in this section -->
                    <xsl:variable name="pairCount" select="count(.//*)" />
                    
                    <!-- Calculate average significance for each thinker -->
                    <xsl:variable name="averageRousseauSignificance" select="$totalRousseauSignificance div $pairCount" />
                    <xsl:variable name="averageMontesquieuSignificance" select="$totalMontesquieuSignificance div $pairCount" />
                    <xsl:variable name="averageDeCiveSignificance" select="$totalDeCiveSignificance div $pairCount" />
                    
                    <!-- Output the section content with the calculated significance -->
                    <div class="section" 
                        data-rousseau="{$averageRousseauSignificance}" 
                        data-montesquieu="{$averageMontesquieuSignificance}" 
                        data-decive="{$averageDeCiveSignificance}">
                        <h2><xsl:value-of select="$sectionName" /></h2>
                        <p><strong>Rousseau Significance:</strong> <xsl:value-of select="$averageRousseauSignificance" /></p>
                        <p><strong>Montesquieu Significance:</strong> <xsl:value-of select="$averageMontesquieuSignificance" /></p>
                        <p><strong>DeCive Significance:</strong> <xsl:value-of select="$averageDeCiveSignificance" /></p>
                        <p><xsl:value-of select="." /></p>
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
    
    
</xsl:stylesheet>
    