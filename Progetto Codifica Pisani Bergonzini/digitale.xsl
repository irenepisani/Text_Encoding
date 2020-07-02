<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:tei="http://www.tei-c.org/ns/1.0"
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:fn="http://www.w3.org/2005/xpath-functions">

	<xsl:output method="html"/>

	<xsl:template match="/tei:TEI">
		<!-- albero DOM html-->
		<html lang="it">
			<head>
				<link rel="stylesheet" href="digitale.css"/>
				<meta charset="UTF-8"/>
				<title>LL1.15</title>	
			</head>

			<body>
				<!-- navbar-->
				<div id="navbar">
					<div id="titolo">
						<div id="intestazione1" class="intestazione">
							<xsl:call-template name="intestazione1"/>
						</div>
						<div id="intestazione2" class="intestazione">
							<xsl:call-template name="intestazione2"/>
						</div>
						<div id="intestazione3" class="intestazione">
							<p><xsl:text>Risorsa digitale</xsl:text></p>
						</div>
					</div>
					<div id="backhome">
						<a href="homepage.html"><xsl:text>Back to Homepage</xsl:text></a>
					</div>
				</div>

				<!--inizio corpo lettera RISORSA DIGITALE -->
				<div id="corpolettera">

					<!-- BOX INFO legenda colori per evidenziazioni -->
					<div id="legenda" class="infolettera">
						<label><xsl:text>Legenda dei colori</xsl:text></label><br/>
						<span class="line" id="L_person">
							<svg width="20" height="20">
	  							<rect width="20" height="20" style="fill:#ffd9b3; stroke-width:1; stroke:darkgrey" />
							</svg>
							<p><xsl:text>Nomi, ruoli e titoli di persone</xsl:text></p>
						</span>
						<span class="line" id="L_place">
							<svg width="20" height="20">
	  							<rect width="20" height="20" style="fill:#ffffcc; stroke-width:1; stroke:darkgrey" />
							</svg>
							<p><xsl:text>Città e luoghi geografici</xsl:text></p>
						</span>
						<span class="line" id="L_org">
							<svg width="20" height="20">
	  							<rect width="20" height="20" style="fill:#ffb3cc; stroke-width:1; stroke:darkgrey" />
							</svg>
							<p><xsl:text>Organizzazioni, enti e teatri</xsl:text></p>
						</span>
						<span class="line" id="L_term">
							<svg width="20" height="20">
	  							<rect width="20" height="20" style="fill:#ccffe6;stroke-width:1;stroke:darkgrey" />
							</svg>
							<p><xsl:text>Termini musicali</xsl:text></p>
						</span>
						<span class="line" id="L_work">
							<svg width="20" height="20">
	  							<rect width="20" height="20" style="fill:#cce6ff;stroke-width:1;stroke:darkgrey" />
							</svg>
							<p><xsl:text>Opera e composizioni</xsl:text></p>
						</span>
						<span class="line" id="L_term">
							<svg width="20" height="20">
	  							<rect width="20" height="20" style="fill:#ccccff;stroke-width:1;stroke:darkgrey" />
							</svg>
							<p><xsl:text>Forme compresse e desuete</xsl:text></p>
						</span>
					</div>

					<!-- estreggo testo della lettera -->
					<div id="testolettera">
						<label><xsl:text>Testo della lettera</xsl:text></label><br/>
						<xsl:apply-templates select="tei:text/tei:body/tei:div"/>
					</div>

					<!-- BOX INFO informazioni di lettura per l'utente -->
					<div id="#regole" class="infolettera">
						<label><xsl:text> Metodi di approfondimento </xsl:text></label>
						<p style="margin-top: 20px; "><xsl:text>Passa il cursore sulle parole evidenziate per legggere nuove informazioni e clicca sulle forme compresse e desuete per scoprirne la correzione.</xsl:text> </p>
					</div>

					<!-- BOX INFO informazioni sulla risorsa digitale -->
					<div id="infodigitali" class="infolettera">
						<label> <xsl:text>Informazioni sull'edizione digitale</xsl:text></label><br/>
						<span class="infospan"><xsl:text>Responsabilità del testo: </xsl:text></span> 
						<xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt"/><br/>
						<xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:editionStmt"/><br/>
						<xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:publicationStmt"/><br/>
						<span class="infospan"><xsl:text>Encoding: </xsl:text></span>
						<xsl:value-of select="tei:teiHeader/tei:encodingDesc"/><br/>
						<span class="infospan"><xsl:text>Destinatario: </xsl:text></span>
						<xsl:apply-templates select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[2]/tei:persName"/><br/>
						<xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msContents"/>
						<xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier"/>
						<xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:additional/tei:adminInfo"/>
					</div>

					<!-- estraggo note relative alla lettera -->
					<div id="notelettera">
						<label><xsl:text>Note della lettera </xsl:text></label><br/>
						<xsl:apply-templates select="tei:text/tei:back/tei:div/tei:div"/>
					</div>	
				</div>

				<!-- script collegamenti -->
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
				<script src="digitale.js"></script>

			</body>
		</html>
	</xsl:template>

<!-- estraggo testo per navbbar -->
	<xsl:template name="intestazione1">
		<p><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno"/> - <xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:textClass/tei:keywords/tei:term"/></p>
	</xsl:template>

	<xsl:template name="intestazione2">
		<p><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></p>
	</xsl:template>

<!--- estraggo testo della lettera -->
	<xsl:template match="tei:opener">
		<p class="dx"><xsl:value-of select="."/></p>
	</xsl:template>

	<xsl:template match="tei:ab">
		<p><xsl:apply-templates select="tei:s"/></p>
	</xsl:template>

	
	<xsl:template match="tei:closer/tei:salute">
		<p><xsl:apply-templates select="tei:s"/></p>
	</xsl:template>


	<xsl:template match="tei:signed/tei:s">
		<p class="dx"><xsl:apply-templates/></p>
	</xsl:template>

	<xsl:template match="tei:del">
		<span class="overstrike"><xsl:apply-templates/></span>
	</xsl:template>

	<xsl:template match="tei:add">
		<sup> <xsl:apply-templates/> </sup>
	</xsl:template>

	<xsl:template match="tei:hi[@rend='underline']">
		<span class="underline"><xsl:apply-templates/></span>
	</xsl:template>

	<xsl:template match="tei:hi[@rend='sup']">
			<sup><xsl:apply-templates/></sup>
		</xsl:template>

	<xsl:template match="tei:abbr">
		<span class="abbr coloratoForma"><xsl:apply-templates/></span>
	</xsl:template>

	<xsl:template match="tei:expan">
		<span class="expan coloratoForma"><xsl:apply-templates/></span>
	</xsl:template>

	<xsl:template match="tei:orig">
		<span class="abbr coloratoForma"><xsl:apply-templates/></span>
	</xsl:template>

	<xsl:template match="tei:reg">
		<span class="expan coloratoForma"><xsl:apply-templates/></span>
	</xsl:template> 

	<xsl:template match="tei:gap">
		<xsl:apply-templates/><xsl:text>[...]</xsl:text>
	</xsl:template>

<!-- estraggo note relative alla lettera -->

	<xsl:template match="tei:ptr[@target='#LL1_15_note_4']">
		<xsl:apply-templates/><sup><a href="#2"><xsl:text>[3]</xsl:text></a></sup>
	</xsl:template>

	<xsl:template match="tei:ptr[@target='#LL1_15_note_3']">
		<xsl:apply-templates/><sup><a href="#1"><xsl:text>[2]</xsl:text></a></sup>
	</xsl:template>

	<xsl:template match="tei:ptr[@target='#LL1_15_note_5']">
		<xsl:apply-templates/><sup><a href="#3"><xsl:text>[4]</xsl:text></a></sup>
	</xsl:template>

	<xsl:template match="tei:ptr[@target='#LL1_15_note_6']">
		<xsl:apply-templates/><sup><a href="#4"><xsl:text>[5]</xsl:text></a></sup>
	</xsl:template>

	<xsl:template match="tei:ptr[@target='#LL1_15_note_2']">
		<xsl:apply-templates/><sup><a href="#5"><xsl:text>[6]</xsl:text></a></sup>
	</xsl:template>

	<xsl:template match="tei:hi[@rend='italic']">
		<span class="italic"><xsl:apply-templates/></span>
	</xsl:template>

	<xsl:template match="tei:note[@ana]">
		<p class="notes"><sup><xsl:text>[</xsl:text><xsl:value-of select="./@n"/><xsl:text>]</xsl:text></sup> <span class="infospan">
		<xsl:text>(Nota n. </xsl:text><xsl:value-of select="./@ana"/><xsl:text>,
		p. </xsl:text><xsl:value-of select="tei:bibl/tei:citedRange"/> <xsl:text>dal carteggio Seminara2017 a cura di Graziella Seminara)</xsl:text></span>
		<xsl:apply-templates/></p>
	</xsl:template>

	<xsl:template match="tei:citedRange">
		<span class="nascostopage"><xsl:apply-templates/></span>
	</xsl:template>

	<xsl:template match="tei:note[@xml:id='LL1_15_note_6']">
		<p class="notes"><sup><xsl:text>[</xsl:text><xsl:value-of select="./@n"/><xsl:text>]</xsl:text></sup> <span class="infospan"><xsl:text>(Nota della lettera a cura di Graziella Seminara)</xsl:text></span><xsl:apply-templates/></p>
	</xsl:template>

<!-- estraggo informazioni sulla risorsa digitale -->	

	<xsl:template match="tei:author">
		<span class="infospan"><xsl:text>Autore e mittente: </xsl:text></span> <xsl:apply-templates/><br/>
	</xsl:template>


	<xsl:template match="tei:title">
		<span class="infospan"><xsl:text>Titolo: </xsl:text></span> <xsl:apply-templates/> <br/>
	</xsl:template>

	<xsl:template match="tei:textLang">
		<span class="infospan"><xsl:text>Lingua: </xsl:text></span> <xsl:text> ITA,</xsl:text> <xsl:apply-templates/><br/>
	</xsl:template>

	<xsl:template match="tei:note[@xml:id='msItemNota1']">
		<span class="infospan"><xsl:text>Manoscritto: </xsl:text></span> <xsl:apply-templates/><xsl:text>. Un foglio, due facciate</xsl:text><br/>
	</xsl:template>

	<xsl:template match="tei:note[@xml:id='msItemNota2']">
		<span class="infospan"><xsl:text>Note: </xsl:text></span> <xsl:apply-templates/><br/>
	</xsl:template>

	<xsl:template match="tei:msIdentifier">
		<span class="infospan"><xsl:text>Collocazione: </xsl:text></span> <xsl:apply-templates/><br/>
	</xsl:template>

	<xsl:template match="tei:idno">
		<span class="nascosto"><xsl:apply-templates/></span>
	</xsl:template>

	<xsl:template match="tei:country">
		<xsl:apply-templates/><xsl:text>,</xsl:text>
	</xsl:template>

	<xsl:template match="tei:settlement">
		<xsl:apply-templates/><br/>
	</xsl:template>

	<xsl:template match="tei:repository">
		<span class="infospan"><xsl:text>Repository: </xsl:text></span><xsl:text> AUT </xsl:text><xsl:value-of select="./@n"/><xsl:text>, </xsl:text><xsl:apply-templates/><xsl:text>, in esposizione.</xsl:text>
	</xsl:template>

	<xsl:template match="tei:note[@xml:id='additionalNota1']">
		<span class="infospan"><xsl:text>Codice identificativo: </xsl:text></span><xsl:text> LL1.15 - </xsl:text><xsl:apply-templates /><br/>
	</xsl:template>

	<xsl:template match="tei:resp|tei:name">
		<xsl:value-of select="."/>
	</xsl:template>

	<xsl:template match="tei:edition">
		<span class="infospan">Codifica: </span><xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="tei:publisher">
		<span class="infospan">Pubblicazione: </span><xsl:value-of select="following-sibling"/><xsl:apply-templates/>
	</xsl:template>

<!-- estraggo informazioni da riportare nei tooltip -->
	<xsl:template match="tei:orgName">
		<xsl:variable name="REForg">
			<xsl:value-of select="substring(./@ref,2)"/>
		</xsl:variable>
		<span class="coloratoOrg tooltip"><xsl:apply-templates />
		<span class="descOrg hidden tooltiptext"> <xsl:value-of select="//tei:org[@xml:id=$REForg]"/><a> <xsl:value-of select="//tei:org[@xml:id=$REForg]/tei:orgName/@ref"/></a></span></span>
	</xsl:template>

	<xsl:template match="tei:placeName">
		<xsl:variable name="REFplace">
			<xsl:value-of select="substring(./@ref,2)"/>
		</xsl:variable>
		<span class="coloratoPlace tooltip"><xsl:apply-templates />
		<span class="descPlace hidden tooltiptext"> <xsl:value-of select="//tei:place[@xml:id=$REFplace]"/><a> <xsl:value-of select="//tei:place[@xml:id=$REFplace]/tei:placeName/@ref"/></a>
		<a><xsl:value-of select="//tei:place[@xml:id=$REFplace]/tei:placeName/tei:ref/@target"/></a></span></span>
	</xsl:template>

	<xsl:template match="tei:term">
		<xsl:variable name="REFterm">
			<xsl:value-of select="substring(./@ref,2)"/>
		</xsl:variable>
		<span class="coloratoTerm tooltip"><xsl:apply-templates />
		<span class="descTerm hidden tooltiptext"> <xsl:value-of select="//tei:item[@xml:id=$REFterm]/tei:gloss"/><a> <xsl:value-of select="//tei:item[@xml:id=$REFterm]/tei:ref/@target"/></a></span></span>
	</xsl:template>

	<xsl:template match="tei:rs">
		<xsl:variable name="REFrs">
			<xsl:value-of select="substring(./@ref,2)"/>
		</xsl:variable>
		<span class="coloratoWork tooltip" ><xsl:apply-templates />
		<span class="descWork hidden tooltiptext"> <xsl:value-of select="//tei:bibl[@xml:id=$REFrs]/tei:note/tei:p"/><a> <xsl:value-of select="//tei:bibl[@xml:id=$REFrs]/tei:ref/@target"/></a></span></span>
	</xsl:template>

	<xsl:template match="tei:persName[not(@ref='#VB')]|tei:roleName[not(@ref='#VB')]">
		<xsl:variable name="REFperson">
			<xsl:value-of select="substring(./@ref,2)"/>
		</xsl:variable>
		<span class="coloratoPerson tooltip"><xsl:apply-templates />
		<span class="descPerson hidden tooltiptext"> <xsl:value-of select="//tei:person[@xml:id=$REFperson]/tei:note/tei:p"/><a><xsl:value-of select="//tei:person[@xml:id=$REFperson]/tei:persName/tei:ref/@target"/></a><br/>
		<a><xsl:value-of select="//tei:person[@xml:id=$REFperson]/@sameAs"/></a></span></span>
	</xsl:template>

	<xsl:template match="tei:persName[@ref='#VB']|tei:roleName[@ref='#VB']">
		<xsl:variable name="REFperson">
			<xsl:value-of select="substring(./@ref,2)"/>
		</xsl:variable>
		<span class="coloratoPerson tooltip"><xsl:apply-templates />
		<span class="descPerson hidden tooltiptext"><a> <xsl:value-of select="//tei:person[@xml:id=$REFperson]/tei:persName/tei:ref/@target"/></a>
		<a> <xsl:value-of select="//tei:person[@xml:id=$REFperson]/@sameAs"/></a></span></span>
	</xsl:template>

	<xsl:template match="tei:edition">
		<xsl:apply-templates/><xsl:text>.</xsl:text>
	</xsl:template>

	<xsl:template match="tei:editionStmt/tei:respStmt/tei:name[1]">
		<xsl:apply-templates/><xsl:text>,</xsl:text>
	</xsl:template>

	<xsl:template match="tei:editionStmt/tei:respStmt/tei:name[2]">
		<xsl:apply-templates/><xsl:text>.</xsl:text>
	</xsl:template>

	<xsl:template match="tei:publicationStmt/tei:pubPlace">
		<xsl:apply-templates/><xsl:text>,</xsl:text>
	</xsl:template>


</xsl:stylesheet>
