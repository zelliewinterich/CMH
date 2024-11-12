<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="#all"
    xmlns="http://www.w3.org/2000/svg" version="3.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    <!-- Variables -->
    <xsl:variable name="maxHeight" select="500"/>
    <xsl:variable name="spacing" select="150"/>
    <xsl:variable name="maxWidth" select="($spacing) * count(//election)"/>
    
    <!-- Max electoral votes and max popular percentage -->
    <xsl:variable name="max_ElectoralVotes" select="max(//candidate/@electoral_votes)"/>
    <xsl:variable name="max_Popularpercent" select="max(//candidate/@popular_percentage)"/>
    
    <xsl:template match="/">
        <svg height="{$maxHeight + 100}" width="{$maxWidth + 200}" viewBox="-50 -50 {$maxWidth + 200} {$maxHeight + 100}">
            <!-- Axis labels -->
            <text x="15" y="-15" font-family="Times New Roman, Times, serif;" font-size="18" text-anchor="middle">Electoral Votes</text>
            <text x="300" y="535" font-family="Times New Roman, Times, serif;" font-size="18" text-anchor="middle">Election Year</text>
            
            <!-- Axis Lines -->
            <xsl:for-each select="0 to 5">
                <xsl:variable name="rulingHeight" select="(. * 100)"/>
                <line x1="0" x2="{$maxWidth}" y1="{$rulingHeight}" y2="{$rulingHeight}" stroke="black" stroke-width="1"/>
                <text x="-20" y="{$rulingHeight}" text-anchor="end" font-size="12" fill="black">
                    <xsl:value-of select="500 - (. * 100)"/>
                </text>
            </xsl:for-each>
            
            <!-- Year labels and lines -->
            <xsl:for-each select="//election">
                <xsl:variable name="xpos" select="(position() - 1) * $spacing + ($spacing div 2)"/>
                <line x1="{$xpos}" x2="{$xpos}" y1="0" y2="{$maxHeight}" stroke="black" stroke-width="2"/>
                <text x="{$xpos}" y="{$maxHeight + 25}" text-anchor="middle" font-size="12" fill="black">
                    <xsl:value-of select="@year"/>
                </text>
                
                <!-- Bubble generation for each candidate in this election -->
                <xsl:for-each select="candidate">
                    <!-- Calculate Y position based on Electoral Votes (highest goes to top) -->
                    <xsl:variable name="ypos" select="($maxHeight) - ((@electoral_votes div $max_ElectoralVotes) * $maxHeight)"/>
                    <xsl:variable name="radius" select="math:sqrt((@popular_percentage div 100) * math:pi()) * 25"/>
                    <xsl:variable name="fillColor" select="if (position() = 1) then 'pink' else if (position() = 2) then 'cyan' else 'green'"/>
                    
                    <!-- Draw the bubble -->
                    <circle cx="{$xpos}" cy="{$ypos}" r="{$radius}" fill="{$fillColor}" opacity="0.75"/>
                    <circle cx="{$xpos}" cy="{$ypos}" r="3" fill="black"/>
                    <text x="{$xpos}" y="{$ypos}" text-anchor="middle" font-size="12" fill="black" dy="-5">
                        <xsl:value-of select="concat(@popular_percentage, '%')"/>
                    </text>
                </xsl:for-each>
            </xsl:for-each>
            
            <!-- Axis Labels -->
            <text x="-50" y="{$maxHeight div 2}" transform="rotate(-90, -50, {$maxHeight div 2})" text-anchor="middle" font-size="14" fill="black">Electoral votes</text>
            <text x="{$maxWidth div 2}" y="{$maxHeight + 75}" text-anchor="middle" font-size="14" fill="black">Election year</text>
        </svg>
    </xsl:template>
    
</xsl:stylesheet>
