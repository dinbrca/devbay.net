<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
  exclude-result-prefixes="xs wsdl">

<xsl:output method="html" encoding="UTF-8"/>

<xsl:param name="siteID" required="yes" as="xs:string"/>
<xsl:param name="destDirectory" required="yes" as="xs:string"/>

<xsl:template match="/">
  <xsl:apply-templates select="." mode="shipping-service-details"/>
</xsl:template>

<xsl:template match="/" mode="shipping-service-details">
  <xsl:result-document href="{$destDirectory}/ShippingServiceDetails/_{$siteID}.html">
    <section id="site-{$siteID}" class="site">
      <h2><xsl:value-of select="//*:SiteDetails[*:SiteID=$siteID]/*:Site"/> (<xsl:value-of select="$siteID"/>)</h2>
      <h3 id="site-{$siteID}-dom">Domestic</h3>
      <table>
        <thead>
          <tr>
            <td>Description</td>
            <td>Service</td>
            <td>Valid</td>
          </tr>
        </thead>
        <tbody>
          <xsl:apply-templates select=".//*:ShippingServiceDetails[not(*:InternationalService)]" mode="shipping-service-details-table">
            <xsl:sort select="upper-case(*:ShippingService)"/>
          </xsl:apply-templates>
        </tbody>
      </table>
      <h3 id="site-{$siteID}-int">International</h3>
      <table>
        <thead>
          <tr>
            <td>Description</td>
            <td>Service</td>
            <td>Valid</td>
          </tr>
        </thead>
        <tbody>
          <xsl:apply-templates select=".//*:ShippingServiceDetails[*:InternationalService]" mode="shipping-service-details-table">
            <xsl:sort select="upper-case(*:ShippingService)"/>
          </xsl:apply-templates>
        </tbody>
      </table>
    </section>
  </xsl:result-document>
</xsl:template>

<xsl:template match="*:ShippingServiceDetails" mode="shipping-service-details-table">
  <tr>
    <td>
      <xsl:value-of select="*:Description"/>
    </td>
    <td>
      <strong>
        <xsl:value-of select="*:ShippingService"/>
      </strong>
    </td>
    <td>
      <xsl:value-of select="*:ValidForSellingFlow"/>
    </td>
  </tr>
  <tr class="shipping-service-details">
    <td colspan="3"><xsl:apply-templates select="." mode="dl"/></td>
  </tr>
</xsl:template>

<xsl:template match="*:ShippingServiceDetails" mode="dl">
  <dl>
    <xsl:apply-templates select="*:Description" mode="dl"/>
    <xsl:apply-templates select="*:ShippingService" mode="dl"/>
    <xsl:apply-templates select="*:CODService" mode="dl"/>
    <xsl:apply-templates select="*:CostGroupFlat" mode="dl"/>
    <xsl:apply-templates select="*:DeprecationDetails" mode="dl"/>
    <xsl:apply-templates select="*:ShippingTimeMin" mode="dl"/>
    <xsl:apply-templates select="*:ShippingTimeMax" mode="dl"/>
    <xsl:apply-templates select="*:ValidForSellingFlow" mode="dl"/>
  </dl>
</xsl:template>

<xsl:template match="*:ShippingService" mode="dl">
  <dt>ShippingService</dt><dd><xsl:value-of select="."/></dd>
</xsl:template>

<xsl:template match="*:Description" mode="dl">
  <dt>Description</dt><dd><xsl:value-of select="."/></dd>
</xsl:template>

<xsl:template match="*:CODService" mode="dl">
  <dt>CODService</dt><dd><xsl:value-of select="."/></dd>
</xsl:template>

<xsl:template match="*:CostGroupFlat" mode="dl">
  <dt>CostGroupFlat</dt><dd><xsl:value-of select="."/></dd>
</xsl:template>

<xsl:template match="*:DeprecationDetails" mode="dl">
  <dt>DeprecationDetails</dt>
  <dd>AnnouncementStartTime: <xsl:value-of select="*:AnnouncementStartTime"/></dd>
  <dd>EventTime: <xsl:value-of select="*:EventTime"/></dd>
  <dd>MessageType: <xsl:value-of select="*:MessageType"/></dd>
</xsl:template>

<xsl:template match="*:ShippingTimeMin" mode="dl">
  <dt>ShippingTimeMin</dt><dd><xsl:value-of select="."/></dd>
</xsl:template>

<xsl:template match="*:ShippingTimeMax" mode="dl">
  <dt>ShippingTimeMax</dt><dd><xsl:value-of select="."/></dd>
</xsl:template>

<xsl:template match="*:ValidForSellingFlow" mode="dl">
  <dt>ValidForSellingFlow</dt><dd><xsl:value-of select="."/></dd>
</xsl:template>

</xsl:stylesheet>