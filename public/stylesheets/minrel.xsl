<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://esquemas.minrel.gov.cl/2008/1"
    xmlns:ns1="http://esquemas.minrel.gov.cl/2008/1" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://esquemas.minrel.gov.cl/2008/1 http://esquemas.minrel.gov.cl/2008/1/minrel.xsd"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
     exclude-result-prefixes="ns1 xsi xsl" >
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
                <title>Documento</title>
                <link href="/stylesheets/screen.css" media="screen" rel="stylesheet" type="text/css"/>
                <link href="print.css" media="print" rel="stylesheet" type="text/css"/>
                <link href="/stylesheets/comun.css" media="all" rel="stylesheet" type="text/css"/>
            </head>
            <body>
                <div class="hoja">
                    
                    <div id="logo">
                        <img src="/images/logoministeriodisminuido.png"/> 
                        <div class="buzon">
                            <xsl:value-of select="ns1:memo/ns1:origen/ns1:entidad"/>
                        </div>
                    </div>
                    <xsl:element name="div">
                        <xsl:attribute name="class">contenido</xsl:attribute>
                        <xsl:apply-templates/>
                    </xsl:element>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="ns1:memo"> 
        
        <xsl:element name="div">
            <xsl:attribute name="class">titulo</xsl:attribute>
            MEMORANDUM. <span><xsl:value-of select="substring(./ns1:clasificacion, 0, 4)"/></span>. Nº <span><xsl:value-of select="./ns1:folio/ns1:entidad"/></span>-<span><xsl:value-of select="./ns1:folio/ns1:numero"/></span>/<span><xsl:value-of select="./ns1:folio/ns1:agno"/></span> 
        </xsl:element>
        <div id="obj">OBJ.:<span><xsl:value-of select="./ns1:materia"/></span></div>
        <div id="ref">REF.:<span>
            <xsl:for-each select="./ns1:referencia">
                <xsl:value-of select="ns1:entidad"/>-<xsl:value-of select="ns1:numero"/>/
                <xsl:value-of select="ns1:agno"/> 
            </xsl:for-each></span>
        </div>
        <p>SANTIAGO,</p>
        <div>A: <xsl:value-of select="./ns1:destinatario/ns1:puesto/ns1:cargo"/></div>
        <div>DE: <xsl:value-of select="./ns1:origen/ns1:puesto/ns1:cargo"/></div>
        <p>
            <xsl:value-of select="./ns1:cuerpo"/>
        </p>
    <div id="firma">
        <div class="persona"><xsl:value-of select="./ns1:origen//ns1:persona"/></div>
        <div class="puesto"><xsl:value-of select="./ns1:origen//ns1:cargo"/></div>
    </div>
    <div id="distribucion"><div class="titulo">DISTRIBUCION:</div>
    <ol>
        <xsl:for-each select="./ns1:distribucion">
            <li><strong><xsl:value-of select="ns1:entidad/@sigla"/></strong>, <xsl:value-of select="ns1:accion"/></li>    
        </xsl:for-each>
    </ol>
    </div>
        <div id="firmas">
            Firmas en el presente documento:
            <ol>
                <xsl:apply-templates select="*[namespace-uri()='http://www.w3.org/2000/09/xmldsig#' and local-name()='Signature']"></xsl:apply-templates>
            </ol>
            </div>
    </xsl:template>
    
    <xsl:template name="firmas" match="*[namespace-uri()='http://www.w3.org/2000/09/xmldsig#' and local-name()='Signature']">
        
              <xsl:for-each select="*[namespace-uri()='http://www.w3.org/2000/09/xmldsig#' and local-name()='KeyInfo']/*[namespace-uri()='http://www.w3.org/2000/09/xmldsig#' and local-name()='X509Data']/*[namespace-uri()='http://www.w3.org/2000/09/xmldsig#' and local-name()='X509SubjectName']">
                <li><xsl:value-of select="."/> </li>
            </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
