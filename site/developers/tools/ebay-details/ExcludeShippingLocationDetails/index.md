---
layout: tool
title: ExcludeShippingLocationDetails
description: Results of calling GeteBayDetails with DetailName set to ExcludeShippingLocationDetails.
tool:
  name: ebay-details
  js: ['/developers/tools/ebay-details/js/app.js']
  css: ['/developers/tools/ebay-details/css/app.css']
---
ISO 3166 location codes and the localized names associated with each code. Locations are shown grouped by region code.

<a href="#example">Jump to example</a>

{% include site-picker.html %}
{% include_relative _0.html %}
{% include_relative _2.html %}
{% include_relative _3.html %}
{% include_relative _15.html %}
{% include_relative _16.html %}
{% include_relative _23.html %}
{% include_relative _71.html %}
{% include_relative _77.html %}
{% include_relative _100.html %}
{% include_relative _101.html %}
{% include_relative _123.html %}
{% include_relative _146.html %}
{% include_relative _186.html %}
{% include_relative _193.html %}
{% include_relative _201.html %}
{% include_relative _203.html %}
{% include_relative _205.html %}
{% include_relative _207.html %}
{% include_relative _210.html %}
{% include_relative _211.html %}
{% include_relative _212.html %}
{% include_relative _216.html %}

<h2 id="example">Example</h2>

Note that you can use either the location or region code when specifying the *ExcludeShipToLocation* field in the various calls of the AddItem family.

```xml
<AddItemRequest>
    <Item>
        <ShippingDetails>
            <!-- GB is a location code -->
            <ExcludeShipToLocation>GB</ExcludeShipToLocation>
            <!-- Asia is a region code -->
            <ExcludeShipToLocation>Asia</ExcludeShipToLocation>
        </ShippingDetails>
    </Item>
</AddItemRequest>
```
