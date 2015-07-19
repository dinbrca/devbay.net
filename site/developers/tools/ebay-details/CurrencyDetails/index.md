---
layout: tool
title: CurrencyDetails
description: Results of calling GeteBayDetails with DetailName set to CurrencyDetails.
tool:
  name: ebay-details
  js: ['/developers/tools/ebay-details/js/app.js']
  css: ['/developers/tools/ebay-details/css/app.css']
sitemap:
  lastmod: 2015-07-19
comments: true
---
Three-letter ISO 4217 currency code and the English names associated with each code.

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

```xml
<AddItemRequest>
    <Item>
        <Currency>GBP</Currency>
        <StartPrice currencyID="GBP">123.45</StartPrice>
    </Item>
</AddItemRequest>
```
