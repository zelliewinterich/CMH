<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="#all"
    xmlns="http://www.w3.org/2000/svg" version="3.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    <!-- ================================================================ -->
    <!-- Stylesheet variables (preset)                                    -->
    <!-- ================================================================ -->
    <!-- graph -->
    <xsl:variable name="maxHeight" select="500"/>
    <xsl:variable name="spacing" select="100"/>
    <xsl:variable name="maxWidth" select="($spacing) * count(//election)"/>
    <xsl:variable name="max_ElectoralVotes" select="max(//candidate/@electoral_votes)"/>
    <xsl:variable name="max_Popularpercent" select="max(//candidate/@popular_percentage)"/>
    
    <xsl:template match="/">
        <svg height="{$maxHeight + 100}" width="{$maxWidth + 200}" viewBox="-50 -50 {$maxWidth + 200} {$maxHeight + 100}">
            <!-- axis labels -->
            <text x="15" y="-15" font-family="Times New Roman, Times, serif;" font-size="18" text-anchor="middle">Electoral Votes</text>
            <text x="300" y="535" font-family="Times New Roman, Times, serif;" font-size="18" text-anchor="middle">Election Year</text>
            
            <xsl:for-each select="0 to 5">
                <xsl:variable name="rulingHeight" select="(. * 100)"/>
                <line x1="0" x2="{$maxWidth}" y1="{$rulingHeight}" y2="{$rulingHeight}" stroke="black" stroke-width="1"/>
                <text x="-20" y="{$rulingHeight}" text-anchor="end" font-size="12" fill="black">
                    <xsl:value-of select="500 - (. * 100)"/>
                </text>
            </xsl:for-each>
            
            <xsl:for-each select="//election">
                <xsl:variable name="xpos" select="(position() - 1) * $spacing + ($spacing div 2)"/>
                <line x1="{$xpos}" x2="{$xpos}" y1="0" y2="{$maxHeight}" stroke="black" stroke-width="2"/>
                <text x="{$xpos}" y="{$maxHeight + 25}" text-anchor="middle" font-size="12" fill="black">
                    <xsl:value-of select="@year"/>
                </text>
            </xsl:for-each>
            
            <text x="-50" y="{$maxHeight div 2}" transform="rotate(-90, -50, {$maxHeight div 2})" text-anchor="middle" font-size="14" fill="black">
                Electoral votes
            </text>
            <text x="{$maxWidth div 2}" y="{$maxHeight + 75}" text-anchor="middle" font-size="14" fill="black">
                Election year
            </text>
            
            <!-- 1900 -->
            <xsl:variable name="xpos1900" select="0 * $spacing + ($spacing div 2)"/>
            <xsl:variable name="ypos1900" select="(1 - (292 div $max_ElectoralVotes)) * $maxHeight + 48"/>
            <xsl:variable name="radius1900" select="math:sqrt((51.7 div 100) * math:pi()) * 25"/>
            <circle cx="{$xpos1900}" cy="{$ypos1900}" r="{$radius1900}" fill="pink" opacity="0.75"/>
            <circle cx="{$xpos1900}" cy="{$ypos1900}" r="3" fill="black"/>
            <text x="{$xpos1900}" y="{$ypos1900}" text-anchor="middle" font-size="12" fill="black" dy="-5">51.7%</text>
            
            <xsl:variable name="xpos1900" select="0 * $spacing + ($spacing div 2)"/> 
            <xsl:variable name="ypos1900" select="(1 - (155 div $max_ElectoralVotes)) * $maxHeight + 20"/> 
            <xsl:variable name="radius1900" select="math:sqrt((45.5 div 100) * math:pi()) * 25"/> 
            <circle cx="{$xpos1900}" cy="{$ypos1900}" r="{$radius1900}" fill="cyan" opacity="0.65"/>
            <circle cx="{$xpos1900}" cy="{$ypos1900}" r="3" fill="black"/>
            <text x="{$xpos1900}" y="{$ypos1900}" text-anchor="middle" font-size="12" fill="black" dy="-5">45.5%</text>
            
            <!-- 1904 -->
            <xsl:variable name="xpos1904" select="1 * $spacing + ($spacing div 2)"/>
            <xsl:variable name="ypos1904" select="(1 - (336 div $max_ElectoralVotes)) * $maxHeight + 64"/> 
            <xsl:variable name="radius1904" select="math:sqrt((56.4 div 100) * math:pi()) * 25"/> 
            <circle cx="{$xpos1904}" cy="{$ypos1904}" r="{$radius1904}" fill="pink" opacity="0.75"/>
            <circle cx="{$xpos1904}" cy="{$ypos1904}" r="3" fill="black"/>
            <text x="{$xpos1904}" y="{$ypos1904}" text-anchor="middle" font-size="12" fill="black" dy="-5">56.4%</text>
            
            <xsl:variable name="xpos1904" select="1 * $spacing + ($spacing div 2)"/> 
            <xsl:variable name="ypos1904" select="(1 - (155 div $max_ElectoralVotes)) * $maxHeight + 35"/> 
            <xsl:variable name="radius1904" select="math:sqrt((37.6 div 100) * math:pi()) * 25"/> 
            <circle cx="{$xpos1904}" cy="{$ypos1904}" r="{$radius1904}" fill="cyan" opacity="0.65"/>
            <circle cx="{$xpos1904}" cy="{$ypos1904}" r="3" fill="black"/>
            <text x="{$xpos1904}" y="{$ypos1904}" text-anchor="middle" font-size="12" fill="black" dy="-5">37.6%</text>
            
            <xsl:variable name="xpos1904" select="1 * $spacing + ($spacing div 2)"/>
            <xsl:variable name="ypos1904" select="(1 - (0 div $max_ElectoralVotes)) * $maxHeight + 0"/> 
            <xsl:variable name="radius1904" select="math:sqrt((3.0 div 100) * math:pi()) * 25"/> 
            <circle cx="{$xpos1904}" cy="{$ypos1904}" r="{$radius1904}" fill="green" opacity="0.55"/>
            <circle cx="{$xpos1904}" cy="{$ypos1904}" r="3" fill="black"/>
            <text x="{$xpos1904}" y="{$ypos1904}" text-anchor="middle" font-size="12" fill="black" dy="-5">3.0%</text>
            
            <!-- 1908 -->
            <xsl:variable name="xpos1908" select="2 * $spacing + ($spacing div 2)"/> 
            <xsl:variable name="ypos1908" select="(1 - (321 div $max_ElectoralVotes)) * $maxHeight + 49"/>
            <xsl:variable name="radius1908" select="math:sqrt((51.6 div 100) * math:pi()) * 25"/> 
            <circle cx="{$xpos1908}" cy="{$ypos1908}" r="{$radius1908}" fill="pink" opacity="0.75"/>
            <circle cx="{$xpos1908}" cy="{$ypos1908}" r="3" fill="black"/>
            <text x="{$xpos1908}" y="{$ypos1908}" text-anchor="middle" font-size="12" fill="black" dy="-5">51.6%</text>
            
            <xsl:variable name="xpos1908" select="2 * $spacing + ($spacing div 2)"/> 
            <xsl:variable name="ypos1908" select="(1 - (162 div $max_ElectoralVotes)) * $maxHeight + 18"/> 
            <xsl:variable name="radius1908" select="math:sqrt((43.0 div 100) * math:pi()) * 25"/> 
            <circle cx="{$xpos1908}" cy="{$ypos1908}" r="{$radius1908}" fill="cyan" opacity="0.65"/>
            <circle cx="{$xpos1908}" cy="{$ypos1908}" r="3" fill="black"/>
            <text x="{$xpos1908}" y="{$ypos1908}" text-anchor="middle" font-size="12" fill="black" dy="-5">43.0%</text>
            
            <xsl:variable name="xpos1908" select="2 * $spacing + ($spacing div 2)"/> 
            <xsl:variable name="ypos1908" select="(1 - (0 div $max_ElectoralVotes)) * $maxHeight + 0"/> 
            <xsl:variable name="radius1908" select="math:sqrt((2.8 div 100) * math:pi()) * 25"/> 
            <circle cx="{$xpos1908}" cy="{$ypos1908}" r="{$radius1908}" fill="green" opacity="0.55"/>
            <circle cx="{$xpos1908}" cy="{$ypos1908}" r="3" fill="black"/>
            <text x="{$xpos1908}" y="{$ypos1908}" text-anchor="middle" font-size="12" fill="black" dy="-5">2.8%</text>
            
            <!-- 1912 -->
            <xsl:variable name="xpos1912" select="3 * $spacing + ($spacing div 2)"/> 
            <xsl:variable name="ypos1912" select="(1 - (88 div $max_ElectoralVotes)) * $maxHeight + 12"/> 
            <xsl:variable name="radius1912" select="math:sqrt((27.4 div 100) * math:pi()) * 25"/> 
            <circle cx="{$xpos1912}" cy="{$ypos1912}" r="{$radius1912}" fill="green" opacity="0.55"/>
            <circle cx="{$xpos1912}" cy="{$ypos1912}" r="3" fill="black"/>
            <text x="{$xpos1912}" y="{$ypos1912}" text-anchor="middle" font-size="12" fill="black" dy="-5">27.4%</text>
            
            <xsl:variable name="xpos1912" select="3 * $spacing + ($spacing div 2)"/> 
            <xsl:variable name="ypos1912" select="(1 - (8 div $max_ElectoralVotes)) * $maxHeight + 8"/> 
            <xsl:variable name="radius1912" select="math:sqrt((23.2 div 100) * math:pi()) * 25"/> 
            <circle cx="{$xpos1912}" cy="{$ypos1912}" r="{$radius1912}" fill="pink" opacity="0.75"/>
            <circle cx="{$xpos1912}" cy="{$ypos1912}" r="3" fill="black"/>
            <text x="{$xpos1912}" y="{$ypos1912}" text-anchor="middle" font-size="12" fill="black" dy="-5">23.2%</text>
            
            <xsl:variable name="xpos1912" select="3 * $spacing + ($spacing div 2)"/> 
            <xsl:variable name="ypos1912" select="(1 - (435 div $max_ElectoralVotes)) * $maxHeight + 65"/> 
            <xsl:variable name="radius1912" select="math:sqrt((41.8 div 100) * math:pi()) * 25"/> 
            <circle cx="{$xpos1912}" cy="{$ypos1912}" r="{$radius1912}" fill="cyan" opacity="0.65"/>
            <circle cx="{$xpos1912}" cy="{$ypos1912}" r="3" fill="black"/>
            <text x="{$xpos1912}" y="{$ypos1912}" text-anchor="middle" font-size="12" fill="black" dy="-5">41.8%</text>
            
            <xsl:variable name="xpos1912" select="3 * $spacing + ($spacing div 2)"/> 
            <xsl:variable name="ypos1912" select="(1 - (0 div $max_ElectoralVotes)) * $maxHeight + 0"/> 
            <xsl:variable name="radius1912" select="math:sqrt((6.0 div 100) * math:pi()) * 25"/> 
            <circle cx="{$xpos1912}" cy="{$ypos1912}" r="{$radius1912}" fill="green" opacity="0.55"/>
            <circle cx="{$xpos1912}" cy="{$ypos1912}" r="3" fill="black"/>
            <text x="{$xpos1912}" y="{$ypos1912}" text-anchor="middle" font-size="12" fill="black" dy="-5">6.0%</text>
        </svg>
    </xsl:template>
</xsl:stylesheet>