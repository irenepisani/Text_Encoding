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
				<link rel="stylesheet" href="liste.css"/>
				<meta charset="UTF-8"/>
				<script src="liste.js"></script>
				<title>LL1.15 </title>
			</head>
			<body>
				<!-- navbar -->
				<div id="navbar">
					<div id="titolo">
						<div id="intestazione1">
							<xsl:call-template name="intestazione1"/>
						</div>
						<div id="intestazione2">
							<xsl:call-template name="intestazione2"/>
						</div>
						<div id="intestazione3">
							<p><xsl:text>L'universo belliniano</xsl:text></p>
						</div>
					</div>
					<div id="backhome">
						<a href="homepage.html"><xsl:text>Back to Homepage</xsl:text></a>
					</div>
				</div>

			<div id="container">
				<!-- slidequote biografia BELLINI -->
				<div class="slideshow" id="slideshow-Bellini">
					<p class="listtitle">
						<xsl:text>Biografia di Vincenzo Bellini</xsl:text>
					</p>
					<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
					<a class="next" onclick="plusSlides(1)">&#10095;</a>
					<div id="iniziale" class="Bellini" style="display:block;">
						<xsl:call-template name="slideBellini"/>
					</div>
					<div id="seconda" class="Bellini">
						<xsl:call-template name="slideBellini2"/>
					</div>
					<div id="terza" class="Bellini">
						<xsl:call-template name="slideBellini3"/>
					</div>
					<div id="quarta" class="Bellini">
						<xsl:call-template name="slideBellini4"/>
					</div>
					<div id="quinta" class="Bellini">
						<xsl:call-template name="slideBellini5"/>
					</div>
				</div>
				<!-- slidequote VOCABOLARIO MUSICALE -->
				<div class="slideshow" id="slideshow-terms">
					<p class="listtitle"><xsl:text>Vocabolario dei termini musicali</xsl:text></p>
					<a class="prev" onclick="plusSlidesTerm(-1)">&#10094;</a>
					<a class="next" onclick="plusSlidesTerm(1)">&#10095;</a>
					<xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:list[@type='terminology']"/>	
				</div>
				<!-- slidequote TEATRI ENTI -->
				<div class="slideshow" id="slideshow-org">
					<p class="listtitle"><xsl:text>Teatri ed enti</xsl:text></p>
					<a class="prev" onclick="plusSlidesOrg(-1)">&#10094;</a>
					<a class="next" onclick="plusSlidesOrg(1)">&#10095;</a>
					<xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listOrg"/>	
				</div>
				<!-- slidequote OPERE COMPOSIZIONI -->
				<div class="slideshow" id="slideshow-bibl">
					<p class="listtitle"><xsl:text>Opere musicali e composizioni</xsl:text></p>
					<a class="prev" onclick="plusSlidesBibl(-1)">&#10094;</a>
					<a class="next" onclick="plusSlidesBibl(1)">&#10095;</a>
					<xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listBibl[1]"/>
				</div>
				<!-- slidequote PERSONE -->
				<div class="slideshow" id="slideshow-person">
					<p class="listtitle"><xsl:text>Amici, parenti e colleghi di Bellini</xsl:text></p>
					<a class="prev" onclick="plusSlidesPers(-1)">&#10094;</a>
					<a class="next" onclick="plusSlidesPers(1)">&#10095;</a>
					<xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson"/>		
				</div>

				<div class="slideshow fonte" id="slideshow-fonti">
					<p class="listtitle"><xsl:text>Fonti e crediti</xsl:text></p>
					<p class="testoSlide"><xsl:text>1. Le informazioni sulla biografia di Bellini sono estratte dalla pagina wikipedia a lui dedicata;</xsl:text><br/><xsl:text>
					2. Le informazioni sui termini dedicati sono state estratte dall'edizione di Della Seta;</xsl:text><br/><xsl:text>
					3. Le informazioni sugli enti e i teatri sono state estratte dalle risorse online Wikipedia e Treccani;</xsl:text><br/><xsl:text>
					4. Le informazioni sulle opere sulle persone sono state riprese dai volumi dedicati a Vincenzo Bellini a cura di Graziella Seminare, e dal web sui siti di Wikipedia, Treccani e Viaf;
					</xsl:text></p>		
				</div>
			</div>
				<!-- collegamento libreria jquery -->
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
			</body>
		</html>

	</xsl:template>

	<!-- estraggo titoli per navbar -->
	<xsl:template name="intestazione1">
		<p><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno"/> - <xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:textClass/tei:keywords/tei:term"/></p>
	</xsl:template>

	<xsl:template name="intestazione2">
		<p><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></p>
	</xsl:template>

	<xsl:template match="tei:list[@type='terminology']">
		<div><xsl:apply-templates/></div>
	</xsl:template>

	<xsl:template match="tei:note">
		<div class="notaLuogo"><xsl:text>Nota: </xsl:text><xsl:apply-templates/>
	</div>
	</xsl:template>

	<!-- estraggo informazioni TEATRI -->
	<xsl:template match="tei:listOrg">
		<div><xsl:apply-templates/></div>
	</xsl:template>

	<xsl:template match="tei:org">
		<div class="org"><xsl:apply-templates/>
		<a class="linkfonte"><xsl:value-of select="./tei:orgName/@ref"/></a><br/></div>
		</xsl:template>

	<xsl:template match="tei:org[1]">
		<div class="org" style="display:block;"><xsl:apply-templates/>
		<a class="linkfonte"><xsl:value-of select="./tei:orgName/@ref"/></a><br/></div>
	</xsl:template>

	<xsl:template match="tei:org/tei:orgName">
		<div class="orgname"><xsl:apply-templates/></div>
	</xsl:template>

	<xsl:template match="tei:org/tei:placeName">
		<div class="orgplace"><xsl:apply-templates/></div>
	</xsl:template>
	<xsl:template match="tei:org/tei:desc">
		<div class="descrizione"><xsl:apply-templates/></div>
	</xsl:template>

	<!-- estraggo informazioni OPERE -->

	<xsl:template match="tei:listBibl">
		<div><xsl:apply-templates/></div>
	</xsl:template>

	<xsl:template match="tei:head">
		<p class="nascosto"><xsl:apply-templates/></p>
	</xsl:template>


	<xsl:template match="tei:item">
		<div class="termine"><xsl:apply-templates/>
		<a class="linkfonte"><xsl:value-of select="./tei:ref/@target"/></a><br/></div>
	</xsl:template>

	<xsl:template match="tei:item[1]">
		<div class="termine" style="display:block;"><xsl:apply-templates/><a class="linkfonte"><xsl:value-of select="./tei:ref/@target"/></a><br/></div>
	</xsl:template>

	<xsl:template match="tei:label">
		<div class="etichetta"><xsl:apply-templates/></div>
	</xsl:template>

	<xsl:template match="tei:gloss">
		<div class="descrizione"><xsl:apply-templates/></div>
	</xsl:template>

	
	<xsl:template match="tei:listBibl/tei:bibl">
		<div class="bibl"><xsl:apply-templates/>
		<br/><a class="linkfonte"><xsl:value-of select="./tei:ref/@target"/></a><br/>
	</div>
	</xsl:template>

	<xsl:template match="tei:listBibl/tei:bibl[1]">
		<div class="bibl" style="display:block;"><xsl:apply-templates/>
		<br/><a class="linkfonte"><xsl:value-of select="./tei:ref/@target"/></a><br/></div>
	</xsl:template>

	<xsl:template match="tei:title">
		<div class="titolobibl"><xsl:apply-templates/></div>
	</xsl:template>

	<xsl:template match="tei:persName[@role='composer']">
		<xsl:text>Compositore: </xsl:text> <xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="tei:persName[@role='librettist']">
		<div class="librettista"><xsl:text>Librettista: </xsl:text><xsl:apply-templates/></div>
	</xsl:template>


	<xsl:template match="tei:bibl/tei:orgName">
		<div class="orgbibl"><xsl:apply-templates/></div>
	</xsl:template>

	<!-- estraggo informazioni per slideshow PERSONE -->

	<xsl:template match="tei:listPerson/tei:person">
		<div class="persona"><xsl:apply-templates/>
		<br/><a class="linkfonte"><xsl:value-of select="./@sameAs"/></a><br/>
		<a class="linkfonte"><xsl:value-of select="./tei:persName/tei:ref/@target"/></a><br/>
		</div>
	</xsl:template>

	<xsl:template match="tei:listPerson/tei:person/tei:persName">
		<div class="nome"><xsl:apply-templates/></div>
	</xsl:template>

	<xsl:template match="tei:sex">
		<div class="sesso">Sesso: <xsl:apply-templates/></div>
	</xsl:template>

	<xsl:template match="tei:birth">
		<div class="nascita">Nascita: <xsl:apply-templates/></div>
	</xsl:template>

	<xsl:template match="tei:death">
		<div class="morte">Morte: <xsl:apply-templates/></div>
	</xsl:template>

	<xsl:template match="tei:citedRange">
		<span class="elimina"><xsl:apply-templates/></span>
	</xsl:template>

	<xsl:template match="tei:settlement[@type='province']">
		<span class="eliminasettlement"><xsl:apply-templates/></span>
	</xsl:template>

	<xsl:template match="tei:person/tei:note">
		<div class="notaPersona"><xsl:apply-templates/></div>
	</xsl:template>

	<xsl:template match="tei:listPerson/tei:person[1]">
		<div class="persona" style="display:block;"><xsl:apply-templates/></div>
	</xsl:template>

	<!-- estraggo informazioni per slideshow BIOGRAFIA BELLINI -->
	<xsl:template name="slideBellini">
		<p class="titoloslide">
			<xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person[@xml:id='VB']/tei:persName/tei:forename[1]"/><xsl:text> </xsl:text><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person[@xml:id='VB']/tei:persName/tei:forename[2]"/><xsl:text> </xsl:text><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person[@xml:id='VB']/tei:persName/tei:forename[3]"/><xsl:text> </xsl:text><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person[@xml:id='VB']/tei:persName/tei:forename[4]"/><xsl:text> </xsl:text><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person[@xml:id='VB']/tei:persName/tei:surname"/> 
			<span class="sottotitolo"> 
				<xsl:text>Detto </xsl:text><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person[@xml:id='VB']/tei:persName/tei:addName"/>,
				<xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person[@xml:id='VB']/tei:persName/tei:roleName"/>
			</span>
		</p>
		<div class="nascitaB">
			<xsl:text>Nato il </xsl:text> 
			<xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person[@xml:id='VB']/tei:birth/tei:date"/> a 
			<xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person[@xml:id='VB']/tei:birth/tei:placeName/tei:settlement[@type='municipality']"/> 
		</div>

		<div class="morteB">
			<xsl:text>Deceduto il </xsl:text>
			<xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person[@xml:id='VB']/tei:death/tei:date"/> a 
			<xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person[@xml:id='VB']/tei:death/tei:placeName/tei:settlement[@type='municipality']"/>, <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person[@xml:id='VB']/tei:death/tei:placeName/tei:settlement[@type='department']"/>
		</div>
		<a class="linkfonte"><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person[@xml:id='VB']/@sameAs"/></a><br/>
		<a class="linkfonte"><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person[@xml:id='VB']/tei:persName/tei:ref/@target"/></a><br/>
	</xsl:template>

	<xsl:template name="slideBellini2">
		<div class="titoloSlide"><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person[@xml:id='VB']/tei:note/tei:p[1]"/>
		</div>
		<div class="testoSlide"><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person[@xml:id='VB']/tei:note/tei:p[2]"/>
		</div>
	</xsl:template>

	<xsl:template name="slideBellini3">
		<div class="titoloSlide"><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person[@xml:id='VB']/tei:note/tei:p[3]"/>
		</div>
		<div class="testoSlide"><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person[@xml:id='VB']/tei:note/tei:p[4]"/>
		</div>
	</xsl:template>

	<xsl:template name="slideBellini4">
		<div class="titoloSlide"><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person[@xml:id='VB']/tei:note/tei:p[5]"/>
		</div>
		<div class="testoSlide"><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person[@xml:id='VB']/tei:note/tei:p[6]"/>
		</div>
	</xsl:template>

	<xsl:template name="slideBellini5">
		<div class="titoloSlide"><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person[@xml:id='VB']/tei:note/tei:p[7]"/>
		</div>
		<div class="testoSlide"><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person[@xml:id='VB']/tei:note/tei:p[8]"/>
		</div>
	</xsl:template>


</xsl:stylesheet>