<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" 
        include-content-type="no" indent="yes"/>
    <!-- basic XSLT info -->
    
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Spirit of Laws</title>
                <link rel="stylesheet" type="text/css" href="constitutionstyle.css"/>
                <style>
                    .navbar a, .dropdown { float: none;  display: block; color: white; text-align: center; padding: 14px 16px; text-decoration: none; font-family: Georgia, serif;
                    } .navbar a { border: none; outline: none; } .navbar a:hover { background-color: #ddd; color: black; } .dropdown { position: relative;
                    } .dropdown .dropbtn { background-color: #333; border: none; outline: none; color: white; padding: 14px 16px; font-size: 16px; cursor: pointer; font-family: Georgia, serif;
                    } .dropdown:hover .dropbtn { background-color: #ddd; color: black; } .dropdown .dropbtn:focus { outline: none; box-shadow: none; 
                    } .dropdown-content { display: none; position: absolute; background-color: #333; min-width: 160px; z-index: 1;
                    } .dropdown:hover .dropdown-content { display: block; } .dropdown-content a { color: white; padding: 12px 16px; text-decoration: none; display: block; font-family: Georgia, serif;
                    } .dropdown-content a:hover { background-color: #ddd; color: black; }
                    .navbar { background-color: #333; display: flex; justify-content: space-evenly; align-items: center; padding: 8px 20px; font-family: Georgia, serif; }
                </style>
            </head>
            <body>
                <!-- dropdown menu code -->
                <section id="navigation">
                    <div class="navbar">
                        <a href="#home">Home</a> <!-- no need for drop down aspect --> 
                        <div class="dropdown">
                            <button class="dropbtn">The US Constitution
                                <i class="fa fa-caret-down"></i>
                                <!-- links for the constitution document-->
                            </button>
                            
                            <div class="dropdown-content">
                                <!-- Link to load the Constitution HTML page in the same window -->
                                <a href="https://zelliewinterich.github.io/CMH/final_const.html">Constitution Document</a>
                            </div>
                            
                        </div> 
                        <div class="dropdown">
                            <button class="dropbtn">Seminal Works 
                                <i class="fa fa-caret-down"></i>
                                <!-- links for seminal works -->
                            </button>
                            <div class="dropdown-content">
                                <a href="https://zelliewinterich.github.io/CMH/DeCive.xhtml">De Cive</a>
                                <a href="https://zelliewinterich.github.io/CMH/Locke.xhtml">Second Treatise</a>
                                <a href="https://zelliewinterich.github.io/CMH/social_contract.xhtml">Social Contract</a>
                                <a href="https://zelliewinterich.github.io/CMH/SOL.xhtml">Spirit of Laws</a>
                                <!-- for each seminal work -->
                            </div>
                        </div> 
                        <div class="dropdown">
                            <button class="dropbtn">About 
                                <i class="fa fa-caret-down"></i>
                                <!-- links for the about section -->
                            </button>
                            <div class="dropdown-content">
                                <a href="https://zelliewinterich.github.io/CMH/about.xhtml">Methodology</a>
                                <!-- methodology page -->     
                                <a href="https://zelliewinterich.github.io/CMH/thinkers.xhtml">Thinkers</a>
                                <!-- thinkers page -->
                            </div>
                        </div> 
                        <div class="dropdown">
                            <button class="dropbtn">Data and Graphs 
                                <i class="fa fa-caret-down"></i>
                                <!-- links for SVG, heatmap, and poll-->
                            </button>
                            <div class="dropdown-content">
                                <a href="https://zelliewinterich.github.io/CMH/const-test.html">Attribute Data</a>
                                <a href="https://zelliewinterich.github.io/CMH/opinionpoll.html">Opinion Poll</a>
                                <a href="https://zelliewinterich.github.io/CMH/SVGdata_sig.xhtml">SVG Graphs</a>
                            </div>
                        </div> 
                        <a href="https://zelliewinterich.github.io/CMH/citation.xhtml">Work Cited</a>
                    </div>
                </section>
                <h1 style="text-align:center;">The Spirit of Laws</h1>
                
                <xsl:apply-templates select="//meta_data"/>
                By: Zellie Winterich
                <hr/>
                <xsl:apply-templates select="//preamble"/>
                <h2 style="text-align:left;">Table of Contents</h2>
                <hr/>
                <ul>
                    <xsl:apply-templates select="//section" mode="toc">
                        <xsl:sort>
                            <xsl:value-of select="translate('','''', @number)"/>
                        </xsl:sort>
                    </xsl:apply-templates>
                </ul>
                <hr/>
                <xsl:apply-templates select="//section"/>
            </body>
        </html>
    </xsl:template>
    <!-- template for the doc -->
    
    <xsl:template match="//section" mode="toc">
        <li>  
            <h2 style="font-style:italic;">
                <xsl:for-each select="section_name">
                    <a href="#{@number}">
                        <xsl:value-of select="@number"/>
                        <xsl:text>.</xsl:text>
                    </a>
                </xsl:for-each>
            </h2>
        </li>
        <xsl:for-each select="sub_section">
            <li>
                <i style="font-weight:bold;">
                    Chapter:
                </i>
                <xsl:for-each select="subsection_name">
                    <i>
                        <a href="#{@number}">
                            <xsl:value-of select="@number"/>
                        </a> 
                    </i>
                </xsl:for-each>
            </li>
        </xsl:for-each>
    </xsl:template>
    <!-- table of contents, including linkage to amendments/articles and their sections -->
    
    <xsl:template match="//meta_data">
        <div class="meta_data">
            <p style="text-align:center; font-family: Lucida Handwriting, cursive">
                <i>
                    <xsl:value-of select="."/>
                </i>
            </p>
        </div>
    </xsl:template> 
    <!-- this is for the metadata text -->
    <xsl:template match="preamble">
        <div class="preamble">
            <hr/>
            <h2 style="text-align:center;">
                <xsl:value-of select="section_name"/>
            </h2>
            <xsl:for-each select="section_name">
                <h2>
                   <xsl:value-of select="section_name[@type='article' or @type='amendment' or @type='preamble']"/>
                </h2>
            </xsl:for-each>
            <xsl:for-each select="sub_section">
                <div class="sub_section">
                    <h3 style="text-align:center;">
                        <xsl:value-of select="subsection_name"/>
                    </h3>
                    <xsl:for-each select="subsection_name">
                        <h3>
                            <xsl:value-of select="subsection_name"/>
                        </h3>
                    </xsl:for-each>
                    <p style="text-align:center; font-style:italic;">
                        <xsl:value-of select="text() | (consent_of_governed | inherent_rights | criminal_justice | purposes_of_law | legal_documents | legislative_body | judicial_body | executive_body | limits_of_power)"/>
                    </p>
                </div> 
            </xsl:for-each>
            <hr/>
        </div>
    </xsl:template>
    <!-- this is for the preamble text -->
    
   
    <xsl:template match="//section">
        <div class="section">
            <hr/>
            <h2 style="text-align:center;">
                <xsl:value-of select="section_name"/>
            </h2>
            <xsl:for-each select="section_name">
                <h2 id="{@number}">
                    <xsl:value-of select="section_name[@type='article' or @type='amendment' or @type='preamble']"/>
                </h2>
            </xsl:for-each>
            <p> 
                <xsl:value-of select="text() | (consent_of_governed | inherent_rights | criminal_justice | purposes_of_law | legal_documents | legislative_body | judicial_body | executive_body | limits_of_power)"/>
            </p>
            <xsl:for-each select="sub_section">
                <div class="sub_section">
                    <h3 style="text-align:center;">
                        <xsl:value-of select="subsection_name"/>
                    </h3>
                    <xsl:for-each select="subsection_name">
                        <h3 id="{@number}">
                            <xsl:value-of select="subsection_name"/>
                        </h3>
                    </xsl:for-each>
                    <p>
                        <xsl:value-of select="text() | (consent_of_governed | inherent_rights | criminal_justice | purposes_of_law | legal_documents | legislative_body | judicial_body | executive_body | limits_of_power)"/>
                    </p>
                </div>
            </xsl:for-each>
            <hr/>
        </div>
    </xsl:template>
    <!-- this sets the style, layout, and text for all of the constitution text -->
</xsl:stylesheet>