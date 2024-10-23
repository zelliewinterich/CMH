<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" 
        include-content-type="no" indent="yes"/>
    

    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Skyrim</title>
            </head>
            <body>
                <h1>Skryim</h1>
                <h2>Cast of characters</h2>
                <table border="1"> 
                    <tr>
                        <th>
                            ID
                        </th>
                        <th>
                            Loyalty
                        </th>
                        <th>
                            Alignment
                        </th>  
                    </tr>
                    <xsl:apply-templates select="//cast/character"/>
                </table>
                <h2>Factions</h2>
                <table border="1"> 
                    <tr>
                        <th>
                            ID
                        </th>
                        <th>
                            Alignment
                        </th>
                    </tr>
                    <xsl:apply-templates select="//cast/faction"/>
                </table>
            </body>
        </html>
    </xsl:template>
    
    
<xsl:template match="character">
    <tr>
        <td>
            <xsl:apply-templates select="@id"/>
        </td>
        <td>
            <xsl:apply-templates select="@loyalty"/>
        </td>
        <td>
            <xsl:apply-templates select="@alignment"/>
        </td>
        
    </tr>
</xsl:template>
    

<xsl:template match="faction">
    <tr>
        <td>
            <xsl:apply-templates select="@id"/>
        </td>
        <td>
            <xsl:apply-templates select="@alignment"/>
        </td>
    </tr>
            
    </xsl:template>
</xsl:stylesheet>