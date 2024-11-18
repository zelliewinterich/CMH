<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="text" indent="yes"/>

    
<!--Set up an XSLT "Map," whereby you can call values based on a key.-->
<!-- Notice the additional namespace declaration in the root element above. -->
    <xsl:variable name="coordinates" as="map(xs:string, xs:string)">
        <xsl:map>
            <xsl:map-entry key="'commonplace'" select="'-79.91877256652567,40.441063867901882'"/>
            <xsl:map-entry key="'ascend'" select="'-79.8961075427762,40.45097067558358'"/>
            <xsl:map-entry key="'posvar'" select="'-79.95426787957021,40.44125235992703'"/>
            <xsl:map-entry key="'Apartment'" select="'-79.95906113933532, 40.440195727656445'"/>
            <xsl:map-entry key="'Cathy'" select="'-79.95306932398863, 40.444753963407564'"/>
            <xsl:map-entry key="'Bellefield'" select="'-79.95096857001674, 40.44590419511992'"/>
        </xsl:map>
    </xsl:variable>
    
    <xsl:variable name="day"/>
    
    

<!-- Geojson "superstructure" (analagous to how you would set up html or SVG superstructure) -->  
    <xsl:template match="/">
        {
        "type": "FeatureCollection",
        "features": [
        <xsl:apply-templates select="//place" mode="points"/>,
        <xsl:apply-templates select="//day" mode="lines"/>
        ]
        }
    </xsl:template>
   
   
  
<!-- Mapping all of the points in the XML document (no order, no relationship to one one another)  -->
    <xsl:template mode="points" match="place">
        <xsl:if test="position() != 1">,</xsl:if>
        {
        "type": "Feature",
        "geometry": {
        "type": "Point",
        "coordinates": [<xsl:value-of select="map:get($coordinates, @uid)"/>]
        },
        "properties": {
        "name": "<xsl:value-of select="@uid"/>"
        }
        }
    </xsl:template>
    
    

    <!-- Part V: Chart Your Journey -->
    <xsl:template mode="lines" match="day">
        <xsl:if test="position() != 1">,</xsl:if>
        {
        "type": "Feature",
        "geometry": {
        "type": "LineString",
        "coordinates": [
        <xsl:for-each select="place">
            <xsl:if test="position() != 1">,</xsl:if>
            [
            <xsl:value-of select="number(tokenize(map:get($coordinates, @uid), ',')[1])"/>
            <xsl:value-of select="number(tokenize(map:get($coordinates, @uid), ',')[2])"/>
        ]
        </xsl:for-each>
        ]
        },
        "properties": {
        "day": "<xsl:value-of select="@name"/>"
        }
        }
    </xsl:template>
    <!--<xsl:template mode="lines" match="day">
       <!-\-YOUR CODE HERE-\->
    </xsl:template>-->
    
    <!--<xsl:template mode="lines" match="place">
        <!-\-YOUR CODE HERE-\->
    </xsl:template>-->
    
</xsl:stylesheet>
