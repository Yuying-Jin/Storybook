<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:yxj="http://www.yxj5181.com"
  version="3.0"
  xmlns="http://www.w3.org/1999/xhtml">
  
  <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" 
    include-content-type="no" indent="yes"/>
  
  <xsl:variable name="KG" select="collection('xml/?select=*.xml')"/>
  <xsl:variable name="elements" select="$KG//page/*[not(self::line)][not(self::description)]! name() => distinct-values() => sort()"/>

  <xsl:variable name="colors" select="$KG//page/color ! normalize-space() => distinct-values()"/>
  <xsl:function name="yxj:tableMaker">
    <xsl:for-each select="$elements">
      <table>
        <tr>
          <th><xsl:value-of select="current()"/></th>
          <th><xsl:text>count</xsl:text></th>
        </tr> 
        <xsl:for-each select="$KG//page/*[./name()=current()]!lower-case(.)! normalize-space()!replace(.,'[- ]','')!replace(.,'ves','f')!replace(.,'shaped','')!replace(.,'ies','y')=>distinct-values()">
          <xsl:sort select="count($KG//*[.!lower-case(.)! normalize-space()!replace(.,'[- ]','')!replace(.,'ves','f')!replace(.,'shaped','')!replace(.,'ies','y')=current()])" order="descending"/>
          
          <tr>
            <td>
              <xsl:value-of select="string-join($KG//page/*[.!lower-case(.)! normalize-space()!replace(.,'[- ]','')!replace(.,'ves','f')!replace(.,'shaped','')!replace(.,'ies','y')=current()] => distinct-values(), ', ')"/>
            </td>
            <td>
              <xsl:value-of select="count($KG//*[.!lower-case(.)! normalize-space()!replace(.,'[- ]','')!replace(.,'ves','f')!replace(.,'shaped','')!replace(.,'ies','y')=current()])"/>
              <!-- <xsl:value-of select="count($KG//*[.!lower-case(.)!substring(.,1,3)=current()!substring(.,1,3)])"/> -->
            </td>
          </tr>
          
        </xsl:for-each>
      </table>
      
    </xsl:for-each>
  </xsl:function>
  <xsl:template match="/">
    

    <html>
      <head>
        <title>Kew Garden</title>
        <link rel="stylesheet" type="text/css" href="webstyle.css" />
      </head>
      <body>
        <table>
          <tr>
            <xsl:for-each select="$elements">
            <th>
              <span class="{current()}"><xsl:value-of select="current()"/></span>
            </th>
            </xsl:for-each>
          </tr>
          <tr>
            <xsl:for-each select="$elements">
            <td>
              <xsl:value-of select="count($KG//*[.!name()=current()])"/>
            </td>
            </xsl:for-each>
          </tr>
        </table>
        <xsl:sequence select="yxj:tableMaker()"/>
        <xsl:apply-templates select="($KG//xml/metadata)[2]"/>
        <xsl:apply-templates select="$KG//xml//page"/>
      </body>
    </html>
    </xsl:template>
  
  <xsl:template match="metadata">
    <h1><xsl:apply-templates select="descendant::title"/></h1>
    <span class="source">
      <xsl:apply-templates select="child::source"/>
    </span>
    <br/>
    <span class="edition">
      <xsl:apply-templates select="child::edition"/>
    </span>
  </xsl:template>
    
  <xsl:template match="source">
    <xsl:for-each select="*[not(self::title)]">
      <ul><xsl:value-of select="local-name()"/>: <xsl:value-of select="."/></ul>
    </xsl:for-each>  
  </xsl:template>
  
  <xsl:template match="edition">
    <xsl:for-each select="*">
      <ul><xsl:value-of select="local-name()"/>: <xsl:value-of select="@xml:id" />
        <xsl:value-of select="."/>
      </ul>
    </xsl:for-each> 
    <br/>
  </xsl:template>
  
  <xsl:template match="page">
    <div class="page-{@n}">
    <div class="desc">
      <small><xsl:value-of select="@n"/></small>
      <xsl:apply-templates select="description" mode = "move"/>
    </div>
      
    <div pageNum="{@n}">
      <xsl:apply-templates/>
    </div>
    </div>
  </xsl:template>
  
  <xsl:template match="line">
    <br class="line"/>
    <!-- <xsl:apply-templates select="following-sibling::node()"/> -->
  </xsl:template>
  
  <xsl:template match="description" mode="move">
    <span class="desc"><i><xsl:apply-templates/>——
      <xsl:value-of select="@resp"/></i></span>
  </xsl:template>
  
  <xsl:template match="description"/>
  

  <xsl:template match="nature">
    <span class="nature">
      <xsl:apply-templates/>
    </span>
  </xsl:template>
  
  <xsl:template match="tech">
    <span class="tech">
      <xsl:apply-templates/>
    </span>
  </xsl:template>
  
  <xsl:template match="color">
    <span class="color">
      <xsl:apply-templates/>
    </span>
  </xsl:template>
  
  <xsl:template match="shape">
    <span class="shape">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

</xsl:stylesheet>
