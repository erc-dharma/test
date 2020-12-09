<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs t"
    version="2.0">
    
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <!-- Identity template -->
    <xsl:template match="@* | node()">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Changing the space for a non-breaking space inside the French part. Adding a non-breaking space between the word and the typo when expected -->
    <xsl:template match="div[@xml:lang='fra']//text()">
        <xsl:choose>
            <xsl:when test="matches(., '[\s][;\?!»:]+')">
            <xsl:value-of select="replace(., '[\s]([;\?!»:]+)', '&#160;$1')"/>
        </xsl:when>
        <xsl:when test="matches(., '[\w][;\?!»:]+')">
            <xsl:value-of select="replace(., '([\w])([;\?!»:]+)', '$1&#160;$2')"/>
        </xsl:when>
        <xsl:when test="matches(., '[«][\s]')">
            <xsl:value-of select="replace(., '([«])[\s]', '$1&#160;')"/>
        </xsl:when>
        <xsl:when test="matches(., '[«][\w]')">
            <xsl:value-of select="replace(., '([«])([\w])', '$1&#160;$2')"/>
        </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>