<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="exsl"
  exclude-result-prefixes="xs wsdl">

<xsl:output method="html" encoding="UTF-8"/>

<xsl:param name="siteID" required="yes" as="xs:string"/>
<xsl:param name="destDirectory" required="yes" as="xs:string"/>

<xsl:template match="/">
  <xsl:apply-templates select="." mode="country-details"/>
  <xsl:apply-templates select="." mode="currency-details"/>
  <xsl:apply-templates select="." mode="dispatch-time-details"/>
  <xsl:apply-templates select="." mode="exclude-shipping-location-details"/>
  <xsl:apply-templates select="." mode="item-specific-details"/>
  <xsl:apply-templates select="." mode="return-policy-details"/>
  <xsl:apply-templates select="." mode="shipping-service-details"/>
  <xsl:apply-templates select="." mode="variation-details"/>
</xsl:template>

<xsl:template match="/" mode="country-details">
  <xsl:result-document href="{$destDirectory}/CountryDetails/_{$siteID}.html">
    <xsl:variable name="sorted">
        <xsl:apply-templates select="//*:CountryDetails" mode="sort">
          <xsl:sort select="*:Description"/>
        </xsl:apply-templates>
    </xsl:variable>

    <xsl:variable name="sortedResultsNodeSet" select="exsl:node-set($sorted)"/>

    <section id="site-{$siteID}" class="site">
      <h2><xsl:value-of select="//*:SiteDetails[*:SiteID=$siteID]/*:Site"/> (<xsl:value-of select="$siteID"/>)</h2>
      <table>
        <thead>
          <tr>
            <td>Description</td>
            <td>Country</td>
            <td>Description</td>
            <td>Country</td>
            <td>Description</td>
            <td>Country</td>
          </tr>
        </thead>
        <tbody>
          <xsl:apply-templates select="$sortedResultsNodeSet/*:CountryDetails[position() mod 3 = 1 or position() = 1]" mode="row"/>
        </tbody>
      </table>
    </section>
  </xsl:result-document>
</xsl:template>

<xsl:template match="*:CountryDetails" mode="sort">
  <xsl:copy-of select="current()"/>
</xsl:template>

<xsl:template match="*:CountryDetails" mode="row">
  <tr>
      <xsl:apply-templates select=". | following-sibling::*:CountryDetails[position() &lt; 3]" mode="cell"/>
  </tr>
</xsl:template>

<xsl:template match="*:CountryDetails" mode="cell">
  <td>
    <xsl:value-of select="*:Description"/>
  </td>
  <td>
    <strong>
      <xsl:value-of select="*:Country"/>
    </strong>
  </td>
</xsl:template>

<xsl:template match="/" mode="currency-details">
  <xsl:result-document href="{$destDirectory}/CurrencyDetails/_{$siteID}.html">
    <xsl:variable name="sorted">
        <xsl:apply-templates select="//*:CurrencyDetails" mode="sort">
          <xsl:sort select="*:Description"/>
        </xsl:apply-templates>
    </xsl:variable>

    <xsl:variable name="sortedResultsNodeSet" select="exsl:node-set($sorted)"/>

    <section id="site-{$siteID}" class="site">
      <h2><xsl:value-of select="//*:SiteDetails[*:SiteID=$siteID]/*:Site"/> (<xsl:value-of select="$siteID"/>)</h2>
      <table>
        <thead>
          <tr>
            <td>Description</td>
            <td>Currency</td>
            <td>Description</td>
            <td>Currency</td>
            <td>Description</td>
            <td>Currency</td>
          </tr>
        </thead>
        <tbody>
          <xsl:apply-templates select="$sortedResultsNodeSet/*:CurrencyDetails[position() mod 3 = 1 or position() = 1]" mode="row"/>
        </tbody>
      </table>
    </section>
  </xsl:result-document>
</xsl:template>

<xsl:template match="*:CurrencyDetails" mode="sort">
  <xsl:copy-of select="current()"/>
</xsl:template>

<xsl:template match="*:CurrencyDetails" mode="row">
  <tr>
      <xsl:apply-templates select=". | following-sibling::*:CurrencyDetails[position() &lt; 3]" mode="cell"/>
  </tr>
</xsl:template>

<xsl:template match="*:CurrencyDetails" mode="cell">
  <td>
    <xsl:value-of select="*:Description"/>
  </td>
  <td>
    <strong>
      <xsl:value-of select="*:Currency"/>
    </strong>
  </td>
</xsl:template>

<xsl:template match="/" mode="dispatch-time-details">
  <xsl:result-document href="{$destDirectory}/DispatchTimeMaxDetails/_{$siteID}.html">
    <section id="site-{$siteID}" class="site">
      <h2><xsl:value-of select="//*:SiteDetails[*:SiteID=$siteID]/*:Site"/> (<xsl:value-of select="$siteID"/>)</h2>
      <table>
        <thead>
          <tr>
            <td>Description</td>
            <td>DispatchTimeMax</td>
            <td>ExtendedHandling</td>
          </tr>
        </thead>
        <tbody>
          <xsl:apply-templates select=".//*:DispatchTimeMaxDetails" mode="row">
            <xsl:sort select="*:DispatchTimeMax" data-type="number"/>
          </xsl:apply-templates>
        </tbody>
      </table>
    </section>
  </xsl:result-document>
</xsl:template>

<xsl:template match="*:DispatchTimeMaxDetails" mode="row">
  <tr>
    <td>
      <xsl:value-of select="*:Description"/>
    </td>
    <td>
      <strong>
        <xsl:value-of select="*:DispatchTimeMax"/>
      </strong>
    </td>
    <td>
      <xsl:value-of select="*:ExtendedHandling"/>
    </td>
  </tr>
</xsl:template>

<xsl:template match="/" mode="exclude-shipping-location-details">
  <xsl:result-document href="{$destDirectory}/ExcludeShippingLocationDetails/_{$siteID}.html">
    <section id="site-{$siteID}" class="site">
      <h2><xsl:value-of select="//*:SiteDetails[*:SiteID=$siteID]/*:Site"/> (<xsl:value-of select="$siteID"/>)</h2>
        <xsl:for-each-group select="//*:ExcludeShippingLocationDetails" group-by="*:Region">
          <xsl:sort select="current-grouping-key()"/>
          <xsl:variable name="sorted">
              <xsl:apply-templates select="current-group()" mode="sort">
                <xsl:sort select="*:Description"/>
              </xsl:apply-templates>
          </xsl:variable>
          <xsl:variable name="sortedResultsNodeSet" select="exsl:node-set($sorted)"/>
          <h3><xsl:value-of select="current-grouping-key()"/></h3>
          <table>
            <thead>
              <tr>
                <td>Description</td>
                <td>Location</td>
                <td>Description</td>
                <td>Location</td>
                <td>Description</td>
                <td>Location</td>
              </tr>
            </thead>
            <tbody>
              <xsl:apply-templates select="$sortedResultsNodeSet/*:ExcludeShippingLocationDetails[position() mod 3 = 1 or position() = 1]" mode="row"/>
            </tbody>
          </table>
        </xsl:for-each-group>
    </section>
  </xsl:result-document>
</xsl:template>

<xsl:template match="*:ExcludeShippingLocationDetails" mode="sort">
  <xsl:copy-of select="current()"/>
</xsl:template>

<xsl:template match="*:ExcludeShippingLocationDetails" mode="row">
  <tr>
      <xsl:apply-templates select=". | following-sibling::*:ExcludeShippingLocationDetails[position() &lt; 3]" mode="cell"/>
  </tr>
</xsl:template>

<xsl:template match="*:ExcludeShippingLocationDetails" mode="cell">
  <td>
    <xsl:value-of select="*:Description"/>
  </td>
  <td>
    <strong>
      <xsl:value-of select="*:Location"/>
    </strong>
  </td>
</xsl:template>

<xsl:template match="/" mode="item-specific-details">
  <xsl:result-document href="{$destDirectory}/ItemSpecificDetails/_{$siteID}.html">
    <section id="site-{$siteID}" class="site">
      <h2><xsl:value-of select="//*:SiteDetails[*:SiteID=$siteID]/*:Site"/> (<xsl:value-of select="$siteID"/>)</h2>
      <table>
        <thead>
          <tr>
            <td>Description</td>
            <td>Maximum</td>
          </tr>
        </thead>
        <tbody>
          <xsl:apply-templates select=".//*:ItemSpecificDetails" mode="rows"/>
        </tbody>
      </table>
    </section>
  </xsl:result-document>
</xsl:template>

<xsl:template match="*:ItemSpecificDetails" mode="rows">
  <tr>
    <td>Item Specifics allowed when listing an item.</td>
    <td><xsl:value-of select="*:MaxItemSpecificsPerItem"/></td>
  </tr>
  <tr>
    <td>Characters allowed per Item Specific name.</td>
    <td><xsl:value-of select="*:MaxValuesPerName"/></td>
  </tr>
  <tr>
    <td>Characters allowed per Item Specific value.</td>
    <td><xsl:value-of select="*:MaxCharactersPerValue"/></td>
  </tr>
  <tr>
    <td>Values allowed per name.</td>
    <td><xsl:value-of select="*:MaxCharactersPerName"/></td>
  </tr>
</xsl:template>

<xsl:template match="/" mode="return-policy-details">
  <xsl:result-document href="{$destDirectory}/ReturnPolicyDetails/_{$siteID}.html">
    <section id="site-{$siteID}" class="site">
      <h2><xsl:value-of select="//*:SiteDetails[*:SiteID=$siteID]/*:Site"/> (<xsl:value-of select="$siteID"/>)</h2>
      <xsl:apply-templates select=".//*:ReturnPolicyDetails" mode="return-policy-details"/>
    </section>
  </xsl:result-document>
</xsl:template>

<xsl:template match="*:ReturnPolicyDetails" mode="return-policy-details">
  <p>Features available to the seller when specifying the return policy for an item.</p>
  <table>
    <thead>
      <tr>
        <td>Feature</td>
        <td>Available</td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>Sellers can enter a text description.</td>
        <td><xsl:choose><xsl:when test="*:Description">Yes</xsl:when><xsl:otherwise>No</xsl:otherwise></xsl:choose></td>
      </tr>
      <tr>
        <td>Sellers can specify a European Article Number (EAN).</td>
        <td><xsl:choose><xsl:when test="*:EAN">Yes</xsl:when><xsl:otherwise>No</xsl:otherwise></xsl:choose></td>
      </tr>
    </tbody>
  </table>
  <xsl:if test="*:ReturnsAccepted">
    <p>Sellers can specify whether they accept returns or not.</p>
    <table>
      <thead>
        <tr>
          <td>Description</td>
          <td>ReturnsAcceptedOption</td>
        </tr>
      </thead>
      <tbody>
        <xsl:apply-templates select="*:ReturnsAccepted" mode="return-policy-details"/>
      </tbody>
    </table>
  </xsl:if>
  <xsl:if test="*:ReturnsWithin">
    <p>Sellers can specify the time period in which an item should be returned by the buyer.</p>
    <table>
      <thead>
        <tr>
          <td>Description</td>
          <td>ReturnsWithinOption</td>
        </tr>
      </thead>
      <tbody>
        <xsl:apply-templates select="*:ReturnsWithin" mode="return-policy-details"/>
      </tbody>
    </table>
  </xsl:if>
  <xsl:if test="*:ShippingCostPaidBy">
    <p>Sellers can specify who pays the shipping cost for a returned item.</p>
    <table>
      <thead>
        <tr>
          <td>Description</td>
          <td>ShippingCostPaidBy</td>
        </tr>
      </thead>
      <tbody>
        <xsl:apply-templates select="*:ShippingCostPaidBy" mode="return-policy-details"/>
      </tbody>
    </table>
  </xsl:if>
  <xsl:if test="*:Refund">
    <p>Sellers can specify how the buyer will be compensated for a returned item.</p>
    <table>
      <thead>
        <tr>
          <td>Description</td>
          <td>RefundOption</td>
        </tr>
      </thead>
      <tbody>
        <xsl:apply-templates select="*:Refund" mode="return-policy-details"/>
      </tbody>
    </table>
  </xsl:if>
  <xsl:if test="*:RestockingFeeValue">
    <p>Sellers can specify a restocking fee for returned items.</p>
    <table>
      <thead>
        <tr>
          <td>Description</td>
          <td>RestockingFeeValueOption</td>
        </tr>
      </thead>
      <tbody>
        <xsl:apply-templates select="*:RestockingFeeValue" mode="return-policy-details"/>
      </tbody>
    </table>
  </xsl:if>
  <xsl:if test="*:WarrantyOffered">
    <p>Sellers can specify if an item includes a warranty.</p>
    <table>
      <thead>
        <tr>
          <td>Description</td>
          <td>WarrantyOfferedOption</td>
        </tr>
      </thead>
      <tbody>
        <xsl:apply-templates select="*:WarrantyOffered" mode="return-policy-details"/>
      </tbody>
    </table>
  </xsl:if>
  <xsl:if test="*:WarrantyType">
    <p>Sellers can specify what type of warranty is included with the item.</p>
    <table>
      <thead>
        <tr>
          <td>Description</td>
          <td>WarrantyType</td>
        </tr>
      </thead>
      <tbody>
        <xsl:apply-templates select="*:WarrantyType" mode="return-policy-details"/>
      </tbody>
    </table>
  </xsl:if>
  <xsl:if test="*:WarrantyType">
    <p>Sellers can specify the length of the warranty that is included with the item.</p>
    <table>
      <thead>
        <tr>
          <td>Description</td>
          <td>WarrantyDurationOption</td>
        </tr>
      </thead>
      <tbody>
        <xsl:apply-templates select="*:WarrantyDuration" mode="return-policy-details"/>
      </tbody>
    </table>
  </xsl:if>
</xsl:template>

<xsl:template match="*:ReturnsAccepted" mode="return-policy-details">
  <tr>
    <td>
      <xsl:value-of select="*:Description"/>
    </td>
    <td>
      <strong>
        <xsl:value-of select="*:ReturnsAcceptedOption"/>
      </strong>
    </td>
  </tr>
</xsl:template>

<xsl:template match="*:ReturnsWithin" mode="return-policy-details">
  <tr>
    <td>
      <xsl:value-of select="*:Description"/>
    </td>
    <td>
      <strong>
        <xsl:value-of select="*:ReturnsWithinOption"/>
      </strong>
    </td>
  </tr>
</xsl:template>

<xsl:template match="*:ShippingCostPaidBy" mode="return-policy-details">
  <tr>
    <td>
      <xsl:value-of select="*:Description"/>
    </td>
    <td>
      <strong>
        <xsl:value-of select="*:ShippingCostPaidByOption"/>
      </strong>
    </td>
  </tr>
</xsl:template>

<xsl:template match="*:Refund" mode="return-policy-details">
  <tr>
    <td>
      <xsl:value-of select="*:Description"/>
    </td>
    <td>
      <strong>
        <xsl:value-of select="*:RefundOption"/>
      </strong>
    </td>
  </tr>
</xsl:template>

<xsl:template match="*:RestockingFeeValue" mode="return-policy-details">
  <tr>
    <td>
      <xsl:value-of select="*:Description"/>
    </td>
    <td>
      <strong>
        <xsl:value-of select="*:RestockingFeeValueOption"/>
      </strong>
    </td>
  </tr>
</xsl:template>

<xsl:template match="*:WarrantyOffered" mode="return-policy-details">
  <tr>
    <td>
      <xsl:value-of select="*:Description"/>
    </td>
    <td>
      <strong>
        <xsl:value-of select="*:WarrantyOfferedOption"/>
      </strong>
    </td>
  </tr>
</xsl:template>

<xsl:template match="*:WarrantyType" mode="return-policy-details">
  <tr>
    <td>
      <xsl:value-of select="*:Description"/>
    </td>
    <td>
      <strong>
        <xsl:value-of select="*:WarrantyTypeOption"/>
      </strong>
    </td>
  </tr>
</xsl:template>

<xsl:template match="*:WarrantyDuration" mode="return-policy-details">
  <tr>
    <td>
      <xsl:value-of select="*:Description"/>
    </td>
    <td>
      <strong>
        <xsl:value-of select="*:WarrantyDurationOption"/>
      </strong>
    </td>
  </tr>
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
            <td>ShippingService</td>
            <td>ValidForSellingFlow</td>
          </tr>
        </thead>
        <tbody>
          <xsl:apply-templates select=".//*:ShippingServiceDetails[not(*:InternationalService)]" mode="row">
            <xsl:sort select="upper-case(*:ShippingService)"/>
          </xsl:apply-templates>
        </tbody>
      </table>
      <h3 id="site-{$siteID}-int">International</h3>
      <table>
        <thead>
          <tr>
            <td>Description</td>
            <td>ShippingService</td>
            <td>ValidForSellingFlow</td>
          </tr>
        </thead>
        <tbody>
          <xsl:apply-templates select=".//*:ShippingServiceDetails[*:InternationalService]" mode="row">
            <xsl:sort select="upper-case(*:ShippingService)"/>
          </xsl:apply-templates>
        </tbody>
      </table>
    </section>
  </xsl:result-document>
</xsl:template>

<xsl:template match="*:ShippingServiceDetails" mode="row">
  <xsl:variable name="class">
    <xsl:choose>
      <xsl:when test="position() mod 2 = 0">even</xsl:when>
      <xsl:otherwise>odd</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <tr class="{$class}">
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
    <xsl:apply-templates select="*:CODService" mode="dl"/>
    <xsl:apply-templates select="*:CostGroupFlat" mode="dl"/>
    <xsl:apply-templates select="*:DeprecationDetails" mode="dl"/>
    <xsl:apply-templates select="*:Description" mode="dl"/>
    <xsl:apply-templates select="*:ExpeditedService" mode="dl"/>
    <xsl:apply-templates select="*:InternationalService" mode="dl"/>
    <xsl:apply-templates select="*:MappedToShippingServiceID" mode="dl"/>
    <xsl:apply-templates select="*:ServiceType" mode="dl"/>
    <xsl:apply-templates select="*:ShippingCarrier" mode="dl"/>
    <xsl:apply-templates select="*:ShippingCategory" mode="dl"/>
    <xsl:apply-templates select="*:ShippingService" mode="dl"/>
    <xsl:apply-templates select="*:ShippingServiceID" mode="dl"/>
    <xsl:apply-templates select="*:ShippingServicePackageDetails" mode="dl"/>
    <xsl:apply-templates select="*:ShippingTimeMax" mode="dl"/>
    <xsl:apply-templates select="*:ShippingTimeMin" mode="dl"/>
    <xsl:apply-templates select="*:SurchargeApplicable" mode="dl"/>
    <xsl:apply-templates select="*:ValidForSellingFlow" mode="dl"/>
  </dl>
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

<xsl:template match="*:Description" mode="dl">
  <dt>Description</dt><dd><xsl:value-of select="."/></dd>
</xsl:template>

<xsl:template match="*:ExpeditedService" mode="dl">
  <dt>ExpeditedService</dt><dd><xsl:value-of select="."/></dd>
</xsl:template>

<xsl:template match="*:InternationalService" mode="dl">
  <dt>InternationalService</dt><dd><xsl:value-of select="."/></dd>
</xsl:template>

<xsl:template match="*:MappedToShippingServiceID" mode="dl">
  <dt>MappedToShippingServiceID</dt><dd><xsl:value-of select="."/></dd>
</xsl:template>

<xsl:template match="*:ServiceType" mode="dl">
  <dt>ServiceType</dt><dd><xsl:value-of select="."/></dd>
</xsl:template>

<xsl:template match="*:ShippingCarrier" mode="dl">
  <dt>ShippingCarrier</dt><dd><xsl:value-of select="."/></dd>
</xsl:template>

<xsl:template match="*:ShippingCategory" mode="dl">
  <dt>ShippingCategory</dt><dd><xsl:value-of select="."/></dd>
</xsl:template>

<xsl:template match="*:ShippingService" mode="dl">
  <dt>ShippingService</dt><dd><xsl:value-of select="."/></dd>
</xsl:template>

<xsl:template match="*:ShippingServiceID" mode="dl">
  <dt>ShippingServiceID</dt><dd><xsl:value-of select="."/></dd>
</xsl:template>

<xsl:template match="*:ShippingServicePackageDetails" mode="dl">
  <dt>ShippingServicePackageDetails</dt>
  <xsl:if test="*:DimensionsRequired"><dd>DimensionsRequired: <xsl:value-of select="*:DimensionsRequired"/></dd></xsl:if>
  <dd>Name: <xsl:value-of select="*:Name"/></dd>
</xsl:template>

<xsl:template match="*:ShippingTimeMax" mode="dl">
  <dt>ShippingTimeMax</dt><dd><xsl:value-of select="."/></dd>
</xsl:template>

<xsl:template match="*:ShippingTimeMin" mode="dl">
  <dt>ShippingTimeMin</dt><dd><xsl:value-of select="."/></dd>
</xsl:template>

<xsl:template match="*:SurchargeApplicable" mode="dl">
  <dt>SurchargeApplicable</dt><dd><xsl:value-of select="."/></dd>
</xsl:template>

<xsl:template match="*:ValidForSellingFlow" mode="dl">
  <dt>ValidForSellingFlow</dt><dd><xsl:value-of select="."/></dd>
</xsl:template>

<xsl:template match="/" mode="variation-details">
  <xsl:result-document href="{$destDirectory}/VariationDetails/_{$siteID}.html">
    <section id="site-{$siteID}" class="site">
      <h2><xsl:value-of select="//*:SiteDetails[*:SiteID=$siteID]/*:Site"/> (<xsl:value-of select="$siteID"/>)</h2>
      <table>
        <thead>
          <tr>
            <td>Description</td>
            <td>Maximum</td>
          </tr>
        </thead>
        <tbody>
          <xsl:apply-templates select=".//*:VariationDetails" mode="rows"/>
        </tbody>
      </table>
    </section>
  </xsl:result-document>
</xsl:template>

<xsl:template match="*:VariationDetails" mode="rows">
  <tr>
    <td>Number of item variations allowed per listing.</td>
    <td><xsl:value-of select="*:MaxVariationsPerItem"/></td>
  </tr>
  <tr>
    <td>Number of variation specific sets per listing. For example, specific sets for clothing would include <i>Size</i> and <i>Color</i>.</td>
    <td><xsl:value-of select="*:MaxNamesPerVariationSpecificsSet"/></td>
  </tr>
  <tr>
    <td>Number of values allowed per variation specific set. For example, if a specific set was <i>Color</i>, then values could include <i>Red</i>, <i>White</i> and <i>Blue</i> and others up to the maximum.</td>
    <td><xsl:value-of select="*:MaxValuesPerVariationSpecificsSetName"/></td>
  </tr>
</xsl:template>

</xsl:stylesheet>
