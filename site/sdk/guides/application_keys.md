---
layout: sdk
title: Application Keys
description: Get your eBay API application keys ready for the eBay SDK for PHP.
sitemap:
  lastmod: 2014-06-11
pagination:
  prev:
    url: index
    title: eBay SDK for PHP
  next:
    url: requirements
    title: Requirements
---
Before you can send requests to the eBay API, you need to obtain a valid set of application keys. There are three keys available for use.

<dl>
    <dt>DevID</dt>
    <dd>Your deveveloper ID. This ID is unique to each developer that registers with the eBay Developers Program.</dd>
    <dt>AppID</dt>
    <dd>Your application ID. This is unique to each application that you create. Of all the keys this will be the one that you will use the most.</dd>
    <dt>CertID</dt>
    <dd>Your certificate ID. A special value that is used when obtaining an authentication token from an eBay user.</dd>
</dl>

Application keys serve the following purposes:

  - They identify which developer and application is making the API requests.
  - They verify that the developer or application is allowed to make the API requests that they are using.
  - They ensure that the developer or application is authorized to make API requests on behalf of an eBay user.

## Getting your application keys

This guide assumes that you have already generated a set of application keys after [joining the eBay Developers Progam](https://developer.ebay.com/join/) and so to obtain a copy of your keys you will need to:

  - [Sign in to the eBay Developers Program](https://developer.ebay.com/base/membership/signin/).
  - [Navigate to the **My Account** page](https://developer.ebay.com/DevZone/account/default.aspx) if you have not already done so.
  - Locate the **application keys** section. Here you will find values for your DevID, AppID and CertID keys which can be copied and then pasted into your application's configuration.

Note that there are two sets of application keys. The **Production** set will be what your application uses when sending requests to the production API. The **Sandbox** set can only be used with the sandbox API and allows you to test you application using [eBay's sandbox site](http://www.sandbox.ebay.com/). It is important to remember that the two sets are not interchangeable. You cannot use the production set with the sandbox API and likewse you cannot use the sandbox set with the production API. Using an application key set with the wrong API will result in errors when sending requests.
