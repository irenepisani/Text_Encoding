<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="html" indent="yes"/>

	<xsl:template match="/">
		<html>
			<head>titolo pagina</head>
			<body>
				<xsl:apply-templates />
			</body>
		</html>
	</xsl:template>

	<xsl:template match="fileDesc">
		<h1> Edizione digitale </h1>
		<h3> Sottitolo pagina: 
			<xsl:value-of select="titleStmt/title"/>
		</h3>
	</xsl:template>

</xsl:stylesheet>

<!-- variante usando call-template anzichè apply-templates 
	

	<xsl:template match="/">
		<html>
			<head>titolo pagina</head>
			<body>
				<xsl:call-template name="templatenominato" />
			</body>
		</html>
	</xsl:template>

	<xsl:template match="fileDesc" name="templatenominato">
		<h1> Edizione digitale </h1>
		<h3> Sottitolo pagina: 
			<xsl:value-of select="titleStmt/title"/>
		</h3>
	</xsl:template>

-->
