---
layout: blog
title: Using Postman To Connect To The eBay API
sitemap:
  lastmod: 2015-03-22
comments: true
---

Now that eBay no longer has an [API test tool](https://go.developer.ebay.com/api-test-tools) you may want to consider using [Postman](http://www.getpostman.com/) instead. For those of you who are new to Postman or the eBay API this guide will take you through the "Hello World" of the API which is to make a call to the [GeteBayOfficialTime](http://developer.ebay.com/DevZone/XML/docs/Reference/eBay/GeteBayOfficialTime.html) operation that is available via the Trading service.

If you haven't already done so you will need to [install Postman from the Google Chrome store](https://chrome.google.com/webstore/detail/postman-rest-client/fdmmgilgnpjigdojojpjoooidkmcomcm). Launching the application for the first time should leave you with an interface that is similar to what is shown below:

<p class="text-center">
  <a href="/img/screenshots/postman-ebay-api/postman-inital.png">
    <img src="/img/screenshots/postman-ebay-api/postman-inital.png" width="800" alt="How Postman looks when launched for the first time." title="How Postman looks when launched for the first time."/>
  </a>
</p>

## Connecting to the Trading API

The first thing to do is to tell Postman the URL and HTTP method that will be used when making the request. For the Trading service this will be the https://api.ebay.com/ws/api.dll and POST. Simply enter the URL into the text field and choose the appropriate method from the dropdown.

<p class="text-center">
  <a href="/img/screenshots/postman-ebay-api/url.gif">
    <img src="/img/screenshots/postman-ebay-api/url.gif" width="664" alt="Showing how to enter the URL and HTTP method in Postman." title="Showing how to enter the URL and HTTP method in Postman."/>
  </a>
</p>

In order to make a successful request there are a few HTTP headers that need to be sent.

| Header | Value | Description |
|:-------|:-----:|:------------|
| Content-Type | text/xml | This is needed as you will be using XML in the request body. |
| X-EBAY-API-COMPATIBILITY-LEVEL | 911 | The API version that you are requesting. A list of API version numbers can be found in the [release notes](http://developer.ebay.com/DevZone/XML/docs/ReleaseNotes.html) for the Trading service. |
| X-EBAY-API-SITEID | 3 | The unique numerical identifier for the eBay site your API requests are to be sent to. For example, you would pass the value 3 to specify the eBay UK site. A [complete list of eBay site IDs](http://developer.ebay.com/devzone/finding/Concepts/SiteIDToGlobalID.html) is available. |
| X-EBAY-API-CALL-NAME | GeteBayOfficialTime | The name of the operation that you will be calling. |

Clicking the Headers button in Postman toggles the header/value editor where you should enter the required headers.

<p class="text-center">
  <a href="/img/screenshots/postman-ebay-api/headers.gif">
    <img src="/img/screenshots/postman-ebay-api/headers.gif" width="664" alt="Showing how to enter the URL and HTTP method in Postman." title="Showing how to enter the URL and HTTP method in Postman."/>
  </a>
</p>

Shown below is the XML that is required when calling the GeteBayOfficialTime operation. You need to ensure that you enter a valid auth token as part of the request otherwise an error will be returned by eBay.

```xml
<?xml version="1.0" encoding="utf-8"?>
<GeteBayOfficialTimeRequest xmlns="urn:ebay:apis:eBLBaseComponents">
  <RequesterCredentials>
    <eBayAuthToken>ENTER YOUR AUTH TOKEN</eBayAuthToken>
  </RequesterCredentials>
</GeteBayOfficialTimeRequest>
```

By default the interface in Postman is designed for the quick entering of key/value form-data. As you are entering XML you will need to configure Postman so that it will allow you to manually enter the request. This is achieved by clicking the raw button and choosing XML (text/xml) from the dropdown.

<p class="text-center">
  <a href="/img/screenshots/postman-ebay-api/body.gif">
    <img src="/img/screenshots/postman-ebay-api/body.gif" width="664" alt="Showing how to enter the XML request body Postman." title="Showing how to enter the XML request body in Postman."/>
  </a>
</p>

Now all you need to do is click the Send button and Postman will send your request to eBay which should result in a response similar to the one shown below.

<p class="text-center">
  <a href="/img/screenshots/postman-ebay-api/response.png">
    <img src="/img/screenshots/postman-ebay-api/response.png" width="659" alt="Showing the response returned by the eBay API." title="Showing the response returned by the eBay API."/>
  </a>
</p>

## Calling other Operations

Calling GeteBayOfficialTime is fine for checking that you can connect to the eBay API with Postman, but what about the other operations that are available with the Trading service? Well all you need to do is change the value for the HTTP header X-EBAY-API-CALL-NAME to match the name of the operation that you want to call and then enter the necessary XML as the request's body. For example, to retrieve an eBay listing via the API you will need to set X-EBAY-API-CALL-NAME to be GetItem and then enter the XML below.

```xml
<?xml version="1.0" encoding="utf-8"?>
<GetItemRequest xmlns="urn:ebay:apis:eBLBaseComponents">
  <RequesterCredentials>
    <eBayAuthToken>ENTER YOUR AUTH TOKEN</eBayAuthToken>
  </RequesterCredentials>
  <DetailLevel>ReturnAll</DetailLevel>
  <ItemID>ENTER AN ITEM ID</ItemID>
</GetItemRequest>
```

<p class="text-center">
  <a href="/img/screenshots/postman-ebay-api/get-item.gif">
    <img src="/img/screenshots/postman-ebay-api/get-item.gif" width="664" alt="Showing how to call the GetItem operation." title="Showing how to call the GetItem operation."/>
  </a>
</p>

## Connecting to other Services 

Using Postman to connect to the other eBay services is as easy as using the correct URL and supplying the required HTTP headers. Shown below are the URLs and HTTP headers for the three most popular eBay API services. Note that I have only provided the minium set of required HTTP headers. Many of the services have optional headers that can be found in the eBay documentation.

### URLs

| Service | Production | Sandbox | 
|:--------|:-----------|:--------|
| Finding | http://svcs.ebay.com/services/search/FindingService/v1 | http://svcs.sandbox.ebay.com/services/search/FindingService/v1 |
| Shopping |http://open.api.ebay.com/shopping | http://open.api.sandbox.ebay.com/shopping |
| Trading | https://api.ebay.com/ws/api.dll | https://api.sandbox.ebay.com/ws/api.dll |

### Finding HTTP Headers

| Header | Example Value | Description |
|:-------|:-------------:|:------------|
| X-EBAY-SOA-SERVICE-VERSION | 1.13.0 | The API version that you are requesting. A list of API version numbers can be found in the [release notes](http://developer.ebay.com/DevZone/finding/ReleaseNotes.html) for the Finding service. |
| X-EBAY-SOA-GLOBAL-ID| EBAY-US | The unique string identifier for the eBay site your API requests are to be sent to. For example, you would pass the value EBAY-US to specify the eBay US site. A [complete list of eBay global IDs](http://developer.ebay.com/devzone/finding/Concepts/SiteIDToGlobalID.html) is available. |
| X-EBAY-SOA-OPERATION-NAME | findItemsAdvanced | The name of the operation that you will be calling. |
| X-EBAY-SOA-SECURITY-APPNAME | xxx-xxx-xxx | Your application ID, as explained in the [application keys guide](/sdk/guides/application-keys/). |

### Shopping HTTP Headers

| Header | Example Value | Description |
|:-------|:-------------:|:------------|
| X-EBAY-API-VERSION| 911 | The API version that you are requesting. A list of API version numbers can be found in the [release notes](http://developer.ebay.com/DevZone/shopping/docs/ReleaseNotes.html) for the Shopping service. |
| X-EBAY-API-APP-ID | xxx-xxx-xxx | Your application ID, as explained in the [application keys guide](/sdk/guides/application-keys/). |
| X-EBAY-API-CALL-NAME | GetSingleItem | The name of the operation that you will be calling. |
| X-EBAY-API-REQUEST-ENCODING | XML | The format of the request body. Valid options: JSON, XML, NV, or SOAP |
| X-EBAY-API-SITEID | 3 | The unique numerical identifier for the eBay site your API requests are to be sent to. For example, you would pass the value 3 to specify the eBay UK site. A [complete list of eBay site IDs](http://developer.ebay.com/devzone/finding/Concepts/SiteIDToGlobalID.html) is available. |

### Trading HTTP Headers

| Header | Example Value | Description |
|:-------|:-------------:|:------------|
| X-EBAY-API-COMPATIBILITY-LEVEL | 911 | The API version that you are requesting. A list of API version numbers can be found in the [release notes](http://developer.ebay.com/DevZone/XML/docs/ReleaseNotes.html) for the Trading service. |
| X-EBAY-API-SITEID | 3 | The unique numerical identifier for the eBay site your API requests are to be sent to. For example, you would pass the value 3 to specify the eBay UK site. A [complete list of eBay site IDs](http://developer.ebay.com/devzone/finding/Concepts/SiteIDToGlobalID.html) is available. |
| X-EBAY-API-CALL-NAME | GeteBayOfficialTime | The name of the operation that you will be calling. |

## Conclusion

Hopefully this guide has shown how easy it is to get connecting to the eBay API with Postman. Feel free to leave a comment below if you have any questions.
