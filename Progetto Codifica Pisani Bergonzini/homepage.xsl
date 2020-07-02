<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:tei="http://www.tei-c.org/ns/1.0"
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:fn="http://www.w3.org/2005/xpath-functions">
	
	<xsl:output method="html"/>

	<xsl:template match="/tei:TEI">
		<!-- albero DOM html -->
		<html lang="it">
			<head>
				<link rel="stylesheet" href="homepage.css"/>
				<meta charset="UTF-8"/>
				<title>LL1.15</title>
				<script src="homepage.js"></script>
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
			</head>

			<body>
				<!-- navbar e titolo principale -->
				<div id="apertura">
					<div id="contenitoretitoli">
						<div id="intestazione1" class="container">
							<xsl:call-template name="intestazione1"/>
						</div>
						<div id="logo" class="container">
							<img src="logo.png"/>
							<a href="https://www.comune.catania.it/la-citta/culture/monumenti-e-siti-archeologici/musei/museo-civico-belliniano/">
							<p class="sottotitolomin"><xsl:text> Museo Civico Belliniano </xsl:text><br/><xsl:text> Comune di Catania</xsl:text></p></a>
						</div>
					</div>
					<div id="titolo">
						<xsl:call-template name="intestazione2"/>
					</div>
				</div>

				<!-- opzioni di navigazione -->
				<div id="naviga">
					<div class="refimg">
						<a href="digitale.html">
							<img class="imagelink" src="01.jpg" style="width:100%"/>
							<div class="textblock">
								<p class="textp"><xsl:text>Risorsa digitale</xsl:text></p>
							</div>
						</a>
					</div>
					<div class="refimg">
						<a href="liste.html">
							<img class="imagelink" src="02.jpg"/>
							<div class="textblock">
								<p class="textp"><xsl:text>L'universo belliniano</xsl:text></p>
							</div>
						</a>
					</div>
					<div class="refimg">
						<a href="originale.html">
							<img class="imagelink" src="03.jpg"/>
							<div class="textblock">
								<p class="textp"><xsl:text>Risorsa originale</xsl:text></p>
							</div>
						</a>
					</div>
				</div>

				<!-- animate button scroll down-->
				<div id="scroll">
					<a href="#crediti_bibliografia" class="scroll-down" address="true"></a>
				</div>
				<div id="crediti_bibliografia">
					<div id="bibliografia">
						<xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listBibl[2]"/>
					</div>
					<span class="tratto"></span>
					<div id="#crediti">
						<p class="label"> <xsl:text>Crediti </xsl:text></p>
						<p class="print"> <xsl:text>Designed by Alice Bergonzini, Irene Pisani</xsl:text><br/>
						<xsl:text>UNIPI - University of Pisa</xsl:text><br/>
						<xsl:text>CdL Informatica Umanistica, Codifica di testi 2019/20</xsl:text><br/>
					 	</p>
					 	
					</div>
				</div>
			</body>
		</html>

	</xsl:template>

<!-- estraggo titoli per intestazione -->
	<xsl:template name="intestazione1">
		<p class="sottotitolo"><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno"/> - <xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:textClass/tei:keywords/tei:term"/></p>
		<p class="sottotitolo"><xsl:text>Estratto del carteggio belliniano (LL1)</xsl:text></p>
		<p class="sottotitolo"><xsl:text>Edizione digitale - UNIPI </xsl:text></p>
	</xsl:template>

	<xsl:template name="intestazione2">
		<p id="titolop"><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></p>
	</xsl:template>

<!-- estraggo bibliografia da listBibl -->
	<xsl:template match="tei:listBibl[2]/tei:head">
		<p class="label"><xsl:apply-templates /></p>
	</xsl:template>

	<xsl:template match="tei:listBibl[2]/tei:bibl">
		<p class="print"><xsl:apply-templates /></p>
	</xsl:template>

	<xsl:template match="tei:author|tei:editor">
		<span class="autor"><xsl:apply-templates/></span><xsl:text>,</xsl:text>
	</xsl:template>
	<xsl:template match="tei:bibl/tei:title">
		<span class="opera"><xsl:apply-templates/></span><xsl:text>,</xsl:text>
	</xsl:template>

	<xsl:template match="tei:biblScope">
		<span class="biblscope"><xsl:value-of select="./@unit"/><xsl:text>:</xsl:text><xsl:value-of select="."/></span>,
	</xsl:template>

</xsl:stylesheet>