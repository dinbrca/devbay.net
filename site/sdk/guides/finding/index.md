---
layout: sdk
title: Finding
description: In-depth guide on using the eBay SDK for PHP with the Finding service.
sitemap:
  lastmod: 2015-01-17
pagination:
  prev:
    url: uploading-and-downloading-files/
    title: Uploading and downloading files
  next:
    url: trading/
    title: Trading
---
This guide provides details for using the eBay SDK for PHP with the [Finding](http://developer.ebay.com/Devzone/finding/Concepts/FindingAPIGuide.html) service in your projects. It assumes that you have read and understood the [getting started guide](/sdk/guides/getting-started/).

## Installation

As shown in the [installation guide](/sdk/guides/installation/), Composer is used to install the SDK and so you need to add `dts/ebay-sdk-finding` as a dependency in your project's `composer.json` file.

```javascript
{
    "require": {
        "dts/ebay-sdk-finding": "~0.1"
    }
}
```

### Versions

Using the above method will install a version of the SDK that is compatiable with the current API version. If you need to support a different version of the API there is a [list of SDK versions, and the API version they support](/sdk/guides/versions/#finding) available.

## Namespaces

The various classes and constants that the SDK provides are grouped using the following namespaces.

**\DTS\eBaySDK\Finding\Services**

The **FindingService** class belongs to this namespace. An instance of this class is the **service object** that provides the means to send requests to the API as explained in the [getting started guide](/sdk/guides/getting-started/#service-object).

**\DTS\eBaySDK\Finding\Types**

This namespace groups the classes that are used to construct the **request and response objects**. As explained in the [getting started guide](/sdk/guides/getting-started/#request-object) these classes save you from having to deal with XML when coding your application.

## Configuration

The SDK provides the following configuration options for the **FindingService** class. A guide is available explaining [how to configure the sdk](/sdk/guides/configuring/). Note that some configuration options are required in order to receive a correct response from the API.

| Option     | Required | Description |
|:-----------|:--------:|:------------|
| apiVersion | No       | The API version supported by your application. A list of API version numbers can be found in the [release notes](http://developer.ebay.com/DevZone/finding/ReleaseNotes.html) for the Finding service. |
| appId      | Yes      | Your application ID, as explained in the [application keys guide](/sdk/guides/application-keys/). |
| globalId   | No       | The unique string identifier for the eBay site your API requests are to be sent to. For example, you would pass the value EBAY-US to specify the eBay US site. A [complete list of eBay global IDs](http://developer.ebay.com/devzone/finding/Concepts/SiteIDToGlobalID.html) is available. |
| sandbox   | No       | Boolean value that indicates if you application will be using the sandbox API instead of the default production API. Defaults to false if a value is not provided. |
