<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:tei="http://www.tei-c.org/ns/1.0"
	xmlns="http://www.w3.org/1999/xhtml">

	<xsl:output method="html"/>

	<xsl:template match="/tei:TEI">
		<!-- albero DOM html -->
		<html lang="it">
			<head>
				<link rel="stylesheet" href="originale.css"/>
				<meta charset="UTF-8"/>
				<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
				<title>LL1.15</title>
			</head>

			<body>
				<!-- navbar-->
				<div id="navbar">
					<div id="titolo">
						<div id="intestazione1">
							<xsl:call-template name="intestazione1"/>
						</div>
						<div id="intestazione2">
							<xsl:call-template name="intestazione2"/>
						</div>
						<div id="intestazione3">
							<p><xsl:text> Risorsa originale </xsl:text></p>
						</div>
					</div>
					<div id="backhome">
						<a href="homepage.html"><xsl:text>Back to Homepage</xsl:text></a>
					</div>
				</div>

				<!--inizio contenuto pagina -->
				<div id="contenuto">

					<!-- contenitore immagine interattiva e span per riga di testo -->
					<div id="contenutoimage">
						<!--contieni e mostra riga di testo -->
						<div id="contienitesto"></div>
						<!--immagini interattive (imagemap) -->
						<div id="risorse">
							<div id="immagine1" class="contieniimg">
								<img src="LL1.15_0001.jpg" usemap="#imm_int1" id="img1" class="map"/>
								<map name="imm_int1">
									<xsl:apply-templates select="tei:facsimile/tei:surface[@n='1']"/>
								</map>
							</div>
							<div id="immagine2" class="contieniimg">
								<img src="LL1.15_0002.jpg"  usemap="#imm_int2" id="img2" class="map"/>
								<map name="imm_int2">
									<xsl:apply-templates select="tei:facsimile/tei:surface[@n='2']"/>
								</map>
							</div>
						</div>
						<!-- memorizza testo lettera -->
						<div id="mostratesto">
							<div id="frasi">
								<xsl:apply-templates select="tei:text/tei:body"/>
							</div>
						</div>
					</div>
					<!-- INFO BOX informazioni di lettura per l'utente -->
					<div id="regole" class="infolettera">
						<label><xsl:text> Metodi di approfondimento</xsl:text></label>
						<p><xsl:text> Passa il mouse sopra un area dell'immagine per decifrare una riga di testo estratta dalla lettera.  </xsl:text></p>
					</div>
					<!-- INFO BOX informazioni sulla risorsa originale -->
					<div id="info" class="infolettera">
						<label><xsl:text>Informazioni sulla risorsa originale</xsl:text></label>
						<xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc"/>
					</div>
				</div>

				<!-- collegamenti script -->
				<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
				 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
				<script src="originale.js"></script>
				<script src="https://cdnjs.cloudflare.com/ajax/libs/maphilight/1.4.0/jquery.maphilight.min.js"></script>				

			</body>
		</html>
	</xsl:template>

<!-- estraggo informazioni per la navbar -->
	<xsl:template name="intestazione1">
		<p><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno"/> - <xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:textClass/tei:keywords/tei:term"/></p>
	</xsl:template>

	<xsl:template name="intestazione2">
		<p><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></p>
	</xsl:template>

<!-- estraggo cordinate ottenute tramite TEI ZONER delle aree delle immagini -->
	<xsl:template match="tei:surface[@n='1']">
		<xsl:for-each select="tei:zone">
			<area shape="rect" class="classearea1">
				<xsl:attribute name="id">
					<xsl:value-of select="./@n"/>
				</xsl:attribute>
				<xsl:attribute name="coords">
					<xsl:value-of select="./@ulx"/>, 
					<xsl:value-of select="./@uly"/>,
					<xsl:value-of select="./@lrx"/>, 
					<xsl:value-of select="./@lry"/> 
				</xsl:attribute>
			</area>	
		</xsl:for-each>
	</xsl:template> 

	<xsl:template match="tei:surface[@n='2']">
		<xsl:for-each select="tei:zone">
			<area shape="rect" class="classearea2">
				<xsl:attribute name="id">
					<xsl:value-of select="./@n"/>
				</xsl:attribute>
				<xsl:attribute name="coords">
					<xsl:value-of select="./@ulx"/>, 
					<xsl:value-of select="./@uly"/>,
					<xsl:value-of select="./@lrx"/>, 
					<xsl:value-of select="./@lry"/> 
				</xsl:attribute>
			</area>		
		</xsl:for-each>
	</xsl:template> 

<!-- estraggo il testo della lettera -->
	<xsl:template match="tei:lb[not(@break)]">
		<br/><xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="tei:lb[@break='no']">
		<sub> =</sub><br/><xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="tei:body">
		<xsl:apply-templates/>
	</xsl:template>

<!-- estraggo informazioni sulla risorsa originale -->
	<xsl:template match="tei:support">
		<p><span class="titoloinfo"><xsl:text>Supporto: </xsl:text></span><xsl:apply-templates/></p>
	</xsl:template>

	<xsl:template match="tei:extent">
		<p><span class="titoloinfo"><xsl:text>Dimensioni del foglio: </xsl:text></span><xsl:apply-templates/></p>
	</xsl:template>

	<xsl:template match="tei:foliation">
		<p><span class="titoloinfo"><xsl:text>Piegature: </xsl:text></span><xsl:apply-templates/></p>
	</xsl:template>

		<xsl:template match="tei:condition">
		<p><span class="titoloinfo"><xsl:text>Condizioni fisiche: </xsl:text></span><xsl:apply-templates/></p>
	</xsl:template>

	<xsl:template match="tei:handDesc">
		<p><span class="titoloinfo"><xsl:text>Forma: </xsl:text></span><xsl:apply-templates/></p>
		<p><span class="titoloinfo"><xsl:text>Numero autori: </xsl:text></span><xsl:value-of select="./@hands"/></p>
	</xsl:template>

	<xsl:template match="tei:height">
		<xsl:text>Altezza: </xsl:text><xsl:apply-templates/><xsl:text>,</xsl:text>
	</xsl:template>

	<xsl:template match="tei:width">
		<xsl:text>Larghezza: </xsl:text><xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="tei:dimensions">
		<xsl:text>(Unità di misura: </xsl:text><xsl:value-of select="./@unit"/><xsl:text>)</xsl:text><xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="tei:measure">
		<span id="cancella"><xsl:apply-templates/></span>
	</xsl:template>

	<xsl:template match="tei:expan">
		<a class="nascosto"><xsl:apply-templates/></a>
	</xsl:template>

<!-- estraggo informazioni di formattazione -->
	<xsl:template match="tei:reg">
		<a class="nascosto"><xsl:apply-templates/></a>
	</xsl:template>

	<xsl:template match="tei:del">
		<span class="overstrike"><xsl:apply-templates/></span>
	</xsl:template>

	<xsl:template match="tei:add">
		<span><sup> <xsl:apply-templates/> </sup></span>
	</xsl:template>

	<xsl:template match="tei:hi[@rend='underline']">
		<span class="underline"><xsl:apply-templates/></span>
	</xsl:template>

<xsl:template match="tei:hi[@rend='sup']">
		<span><sup><xsl:apply-templates/></sup></span>
	</xsl:template>

	<xsl:template match="tei:hi[@rend='italic']">
		<span class="italic"><xsl:apply-templates/></span>
	</xsl:template>

	<xsl:template match="tei:gap">
		<xsl:apply-templates/><xsl:text>[...]</xsl:text>
	</xsl:template>

	<xsl:template match="tei:material">
		<xsl:apply-templates /><xsl:text> - </xsl:text>
	</xsl:template>
	
</xsl:stylesheet>