<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="2.0">
    
    <!-- INSTRUCTION D'OUTPUT : HTML -->
    <xsl:output method="html" indent="yes"/>
    
    <!-- CHEMINS DES FICHIERS DE SORTIE -->  
    <xsl:variable name="home">
        <xsl:value-of select="concat('la_vieille_fille_home','.html')"/>
    </xsl:variable>
    <xsl:variable name="chap1">
        <xsl:value-of select="concat('la_vieille_fille_chap1','.html')"/>
    </xsl:variable>
    <xsl:variable name="index_pers">
        <xsl:value-of select="concat('index_pers','.html')"/>
    </xsl:variable>
    <xsl:variable name="index_place">
        <xsl:value-of select="concat('index_place','.html')"/>
    </xsl:variable>
    <xsl:variable name="index_org">
        <xsl:value-of select="concat('index_org','.html')"/>
    </xsl:variable>
    
    <!-- VARIABLE AVEC LE <HEAD> -->
    <xsl:variable name="header">
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <title><xsl:value-of select="(//titleStmt/title)[1]"/></title>
            <meta name="description">
                <xsl:attribute name="content">
                    <xsl:value-of select="(//titleStmt/title)[1]"/>
                    <xsl:text> écrit par </xsl:text>
                    <xsl:value-of select="(//titleStmt/author/forename)[1]"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="(//titleStmt/author/surname)[1]"/>
                </xsl:attribute>
            </meta>
            <meta name="author">
                <xsl:attribute name="content">
                    <xsl:value-of select="(//titleStmt/respStmt/persName/forename)[1]"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="(//titleStmt/respStmt/persName/surname)[1]"/>
                </xsl:attribute>
            </meta>
        </head>
    </xsl:variable>
    
    <!-- VARIABLE AVEC LE <FOOTER> -->
    <xsl:variable name="footer">
        <footer>
            <p><i><xsl:value-of select="//titleStmt/respStmt/resp"/>.</i></p>
        </footer>
    </xsl:variable>
    
    <!-- VARIABLE AVEC LE CSS DU <BODY> -->
    <xsl:variable name="body_css">
        <xsl:text>
            margin-right: 20%;
            margin-left: 20%;
            margin-top: 10%;
            margin-bottom: 10%;
            font-family: 'Georgia';
            color: #5b5b5b;
            background-color: #dde8f2;
            line-height: 1.6;
            padding: 20px;
        </xsl:text>
    </xsl:variable>
    
    <!-- VARIABLES AVEC LES LIENS DE RETOUR -->
    <xsl:variable name="return_home">
        <i><a href="{$home}">Revenir à l'accueil</a></i>
    </xsl:variable>
    
    <xsl:variable name="return_index_pers">
        <i><a href="{$index_pers}">Index des noms de personnes</a></i>
    </xsl:variable>
    
    <xsl:variable name="return_index_place">
        <i><a href="{$index_place}">Index des noms de lieux</a></i>
    </xsl:variable>
    
    <xsl:variable name="return_index_org">
        <i><a href="{$index_org}">Index des noms d'organisations</a></i>
    </xsl:variable>
    
    <!-- VARIABLE AVEC L'EN-TÊTE DU <BODY> DES PAGES -->
    <xsl:variable name="body_header">
        <div style="text-align: center; margin-bottom: 8%;">
            <h1>Édition en ligne de <i><xsl:value-of select="(//titleStmt/title)[1]"/></i></h1>
            <h2><i><xsl:value-of select="(//div[@type='roman_feuilleton']/head[@type='subtitle'])[1]"/></i></h2>
            <p><xsl:value-of select="(//titleStmt/author/forename)[1]"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="(//titleStmt/author/surname)[1]"/></p>
        </div>
    </xsl:variable>
    
    <!-- TEMPLATE MATCH SUR LA RACINE AVEC LES CALL TEMPLATES DES PAGES-->
    <xsl:template match="/">
        <xsl:call-template name="home"/>
        <xsl:call-template name="chapter1"/>
        <xsl:call-template name="index_pers"/>
        <xsl:call-template name="index_place"/>
        <xsl:call-template name="index_org"/>
    </xsl:template>
    
    <!-- TEMPLATE DE LA PAGE HOME -->
    <xsl:template name="home">
        <xsl:result-document href="./html/la_vieille_fille_home.html" method="html">
            <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <div style="text-align: center;">
                        <img src="../image/vieille_fille_vignette.jpg" alt="vieille fille vignette"/>
                    </div>
                    <div style="text-align: justify;">  
                        <p><xsl:value-of select="//editionStmt/p"/></p>
                        <p><xsl:value-of select="//projectDesc/p"/></p>
                    </div>
                    <div>
                        <p><a href="{$chap1}">Chapitre 1</a></p>
                        <p><a href="{$index_pers}">Index des noms de personnes</a></p>
                        <p><a href="{$index_place}">Index des noms de lieux</a></p>
                        <p><a href="{$index_org}">Index des noms d'organisations</a></p>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- TEMPLATES DE LA PAGE CHAPITRE 1 -->
    <xsl:template name="chapter1">
        <xsl:result-document href="./html/la_vieille_fille_chap1.html" method="html">
            <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <div>
                        <xsl:for-each select="//div[@type='chapter']">
                            <h3 style="text-align: center; padding-bottom: 2%;">
                                Chapitre 
                                <!-- Titre de CHAPITRE 1 -->
                                <xsl:value-of select="head"/> 
                            </h3>
                        </xsl:for-each>
                        <xsl:apply-templates select="//div[@type='chapter'][@n='1']"/>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="//div[@type='chapter'][@n='1']">
        <div style="text-align: justify;">
            <!-- BOUCLE：Parcourez tous les nœuds qui ne sont pas en-tête <head> -->
            <xsl:for-each select="node()[not(self::head)]">
                <!-- CONDITION：choisir  en fonction du type de l'élément  -->
                <xsl:choose>
                    <!-- quand c'est élément <p> -->
                    <xsl:when test="self::p">
                        <p><xsl:value-of select="."/></p>
                    </xsl:when>
                    <!-- quand c'est élément <gap> -->
                    <xsl:when test="self::gap">
                        <div style="text-align: center;">[...]</div>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="."/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            <xsl:copy-of select="$return_home"/> – 
            <xsl:copy-of select="$return_index_pers"/> – 
            <xsl:copy-of select="$return_index_place"/> – 
            <xsl:copy-of select="$return_index_org"/>
        </div>
    </xsl:template>
   
    <!-- TEMPLATES DE LA PAGE INDEX -->
    <xsl:template name="index_pers">
        <xsl:result-document href="./html/index_pers.html" method="html">
            <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <div>
                        <h3>Index des noms de personnes</h3>
                        <!-- BOUCLE：Parcourez tous les <persName> et <rs type="person"> -->
                        <xsl:for-each-group select="//persName | //rs[@type = 'person']"
                            group-by="@ref">
                            <p>
                                <!-- noms de personnes et comptage des occurrences -->
                                <i><xsl:value-of select="current-group()[1]"/></i>:
                                <!-- CONDITION：Si la personne est mentionnée directement -->
                                <xsl:if test="current-group()/self::persName">
                                    <span>Directe (<xsl:value-of select="count(current-group()[self::persName])"/>)</span>
                                    <xsl:if test="current-group()/self::rs[@type='person']">
                                        <!-- Mettre un "," si il y a aussi des mentions indirectes -->
                                        <xsl:text>, </xsl:text>
                                    </xsl:if>
                                </xsl:if>
                                <!-- CONDITION：Si la personne est mentionnée indirectement -->
                                <xsl:if test="current-group()/self::rs[@type='person']">
                                    <span>Indirecte (<xsl:value-of select="count(current-group()[self::rs[@type='person']])"/>)</span>
                                </xsl:if>
                            </p>
                        </xsl:for-each-group>
                        <p><xsl:copy-of select="$return_home"/> – 
                            <a href="{$chap1}">Chapitre 1</a> -
                            <xsl:copy-of select="$return_index_place"/> – 
                            <xsl:copy-of select="$return_index_org"/>
                        </p>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template name="index_place">
        <xsl:result-document href="./html/index_place.html" method="html">
            <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <div>
                        <h3>Index des noms de lieux</h3>
                        <xsl:for-each-group select="//placeName"
                            group-by="@ref">
                            <p>
                                <!-- noms de lieux et nombre d'occurrences -->
                                <i><xsl:value-of select="current-group()[1]"/></i>
                                <xsl:text> (</xsl:text>
                                <xsl:value-of select="count(current-group())"/>
                                <xsl:text>)</xsl:text>
                            </p>
                        </xsl:for-each-group>
                        <p><xsl:copy-of select="$return_home"/> – 
                            <a href="{$chap1}">Chapitre 1</a> -
                            <xsl:copy-of select="$return_index_pers"/> – 
                            <xsl:copy-of select="$return_index_org"/>
                        </p>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template name="index_org">
        <xsl:result-document href="./html/index_org.html" method="html">
            <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <div>
                        <h3>Index des noms d'organisations</h3>
                        <xsl:for-each-group select="//orgName"
                            group-by="@ref">
                            <p>
                                <!-- noms d'organisations et nombre d'occurrences -->
                                <i><xsl:value-of select="current-group()[1]"/></i>
                                <xsl:text> (</xsl:text>
                                <xsl:value-of select="count(current-group())"/>
                                <xsl:text>)</xsl:text>
                            </p>
                        </xsl:for-each-group>
                        <p><xsl:copy-of select="$return_home"/> – 
                            <a href="{$chap1}">Chapitre 1</a> -
                            <xsl:copy-of select="$return_index_pers"/> – 
                            <xsl:copy-of select="$return_index_place"/>
                        </p>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

</xsl:stylesheet>