# Guide d'encodage du roman-feuilleton La vieille fille, écrit par Honoré de Balzac en 1836.

## 1. Projet éditorial et exploitations possibles

### 1.1. Objectifs de l'édition de la La vieille fille

Ce document vise à expliquer comment l'œuvre mentionnée a été encodée en XML-TEI, ainsi que les objectifs de ce schéma d'encodage. Cet ODD (One Document Does it all) vise à établir des principes d'encodage stricts, afin de générer un guide personnalisé et spécifique à ce feuilleton.

Ce modèle est axé sur le codage du contenu littéraire de La vieille fille. Ainsi, les éléments typographiques propres à l'édition ont été délibérément exclus.

Cet encodage XML/TEI ne déclare pas d'entités donc aucune DTD n'a été créée. Le schéma d'encodage est conçu pour fournir des données permettant une meilleure compréhension de la structure de l'œuvre encodée, ainsi que de la manière dont l'auteur a conçu les personnages, par exemple leurs caractères et habitudes respectifs, les relations entre eux et le contexte culturel de l'époque.

### 1.2. Exploitations possibles de l'encodage

## 1.2. Les métadonnées : le teiHeader

### 1.2.1. Structure du teiHeader

#### 1.2.1.1. Le fileDesc

#### 1.2.1.2. Le encodingDesc

#### 1.2.1.3. Le profileDesc

## 1.3. Le text

### 1.3.1. Encodage du texte

#### 1.3.1.1. Structure du texte

#### 1.3.1.2. Normalisation du texte

## 1.4. L'analyse littéraire

### 1.4.1. Analyse des personnages

#### 1.4.1.1. La référence directe des personnages

#### 1.4.1.2. La référence indirecte des personnages

#### 1.4.1.3. Les roleName des personnages

### 1.4.2. Analyse des relations des personnages

### 1.4.3. Analyse des dialogues

## 2. Règles de validation

Définir des règles fonctionnelles, documentées et justifiée par le projet éditorial :
+ Une regle contraignant I'usage d'un attribut et sa ou ses valeurs => <attDef>;
+ Une règle contraignant l'enchaînement de certains éléments => <content>  ;
+ Une règle contraignant la valeur d'un attribut ou l'usage d'un élément ou d'un attribut en fonction de son environnement => <constraint> + <s:rule> .
