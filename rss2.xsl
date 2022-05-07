<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output method="html"  indent="yes"/> 
  <xsl:template match="/">


<html>
  <body>

  <h1><xsl:value-of select="rss/channel/title"/></h1>
  <p>==========================================</p>

  <p>Actualment hi ha un total de : <b><xsl:value-of select="count(rss/channel/item)"/></b> Podcast.</p>
  <br></br>

    <table border="1">
      <tr bgcolor="#D891EF">
        <th>Title</th>
        <th>Link</th>
        <th>Description</th>
        <th>Category</th>
        <th>Comments</th>
        <th>PubDate</th>
        <th>Enclosure</th>
      </tr>
      <xsl:for-each select="rss/channel/item">
      <xsl:sort select="category"/>
      <tr>
        <b><td><xsl:value-of select="title"/></td></b>
        <td><xsl:value-of select="link"/></td>
        <td><xsl:value-of select="description"/></td>

        <xsl:choose>
            
              <xsl:when test="category='Punk'">
                <td style="background-color:#FFFF00"><xsl:value-of select="category" /></td>
              </xsl:when>
              
              <xsl:when test="category='Rock'">
                <td style="background-color:#FF00FF"><xsl:value-of select="category" /></td>
              </xsl:when>

              <xsl:when test="category='Pop Punk'">
                <td style="background-color:#00FF00"><xsl:value-of select="category" /></td>
              </xsl:when>
              
              <xsl:otherwise>
                <td style="background-color:#00FFFF"><xsl:value-of select="category" /></td>
              </xsl:otherwise>
              
            </xsl:choose>

        <td><xsl:value-of select="comments"/></td>
        <td><xsl:value-of select="pubDate"/></td>
     <!--   
        <td>
      <AUDIO controls="" 
        src="https://download.only-free-mp3.xyz/c/My-Chemical-Romance-Teenagers.mp3" type="audio/mpeg"/>
        </td>
     -->
  <audio>
    <xsl:attribute name="controls" >
    </xsl:attribute>
    <source src="{enclosure/@url}" xsl:type="{enclosure/@url}"/>
  </audio>

        
    
      </tr>
      </xsl:for-each>
    </table>

  
    
  </body>

  </html>
  
</xsl:template>
</xsl:stylesheet>


