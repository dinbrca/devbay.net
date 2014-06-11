---
layout: sdk
title: Shopping
description: In-depth guide on using the eBay SDK for PHP with the Shopping service.
sitemap:
  lastmod: 2014-06-11
pagination:
  prev:
    url: trading
    title: Trading
  next:
    url: business_policies_management
    title: Business Policies Management
---
This guide provides details for using the eBay SDK for PHP with the [Shopping](http://developer.ebay.com/Devzone/shopping/docs/Concepts/ShoppingAPIGuide.html) service in your projects. It assumes that you have read and understood the [getting started guide](/sdk/guides/getting_started.html).

## Installation

As shown in the [installation guide](/sdk/guides/installation.html), Composer is used to install the SDK and so you need to add `dts/ebay-sdk-shopping` as a dependency in your project's `composer.json` file.

```javascript
{
    "require": {
        "dts/ebay-sdk-shopping": "~0.1"
    }
}
```

### Versions

Using the above method will install a version of the SDK that is compatiable with the current API version. If you need to support a different version of the API there is a [list of SDK versions, and the API version they support](/sdk/guides/versions.html#shopping) available.

## Namespaces

The various classes and constants that the SDK provides are grouped using the following namespaces.

**\DTS\eBaySDK\Shopping\Services**

The **ShoppingService** class belongs to this namespace. An instance of this class is the **service object** that provides the means to send requests to the API as explained in the [getting started guide](/sdk/guides/getting_started.html#service-object).

**\DTS\eBaySDK\Shopping\Types**

This namespace groups the classes that are used to construct the **request and response objects**. As explained in the [getting started guide](/sdk/guides/getting_started.html#request-object) these classes save you from having to deal with XML when coding your application.

## Configuration

The SDK provides the following configuration options for the **ShoppingService** class. A guide is available explaining [how to configure the sdk](/sdk/guides/configuring.html). Note that some configuration options are required in order to receive a correct response from the API.

| Option              | Required | Description |
|:--------------------|:--------:|:------------|
| affiliateUserId     | No       | Affiliate parameter for applications that have registered on the [eBay Partner Network](https://www.ebaypartnernetwork.com/). |
| apiVersion          | Yes      | The API version supported by your application. A list of API version numbers can be found in the [release notes](http://developer.ebay.com/DevZone/shopping/docs/ReleaseNotes.html) for the Shopping service. |
| appId               | Yes      | Your application ID, as explained in the [application keys guide](/sdk/guides/application_keys.html). |
| sandbox   | No       | Boolean value that indicates if you application will be using the sandbox API instead of the default production API. Defaults to false if a value is not provided. |
| siteId              | No       | The unique numerical identifier for the eBay site your API requests are to be sent to. For example, you would pass the value 3 to specify the eBay UK site. A [complete list of eBay site IDs](http://developer.ebay.com/devzone/finding/Concepts/SiteIDToGlobalID.html) is available. |
| trackingId          | No       | Affiliate parameter for applications that have registered on the [eBay Partner Network](https://www.ebaypartnernetwork.com/). |
| trackingPartnerCode | No       | Affiliate parameter for applications that have registered on the [eBay Partner Network](https://www.ebaypartnernetwork.com/). |
