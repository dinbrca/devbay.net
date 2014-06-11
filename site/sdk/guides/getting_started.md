---
layout: sdk
title: Getting Started Guide
description: Learn how to get started with the eBay SDK for PHP.
pagination:
  prev:
    url: installation
    title: Installation
  next:
    url: sample_project
    title: Sample Project
---
This guide will take you through the basics of using the eBay SDK for PHP. By the end of it you should have enough knowledge to start using the SDK in your projects. For the purpose of this guide the [Finding](http://developer.ebay.com/Devzone/finding/Concepts/FindingAPIGuide.html) service is been used and for the most part the process is the same for all services. It is assumed that you have already [downloaded and installed the SDK](/sdk/guides/installation.html) and [retrieved your application keys](/sdk/guides/application_keys.html).

## Including the SDK

As Composer was used to install the SDK an autoloader is provided so that you can include the SDK in your project. To use the autoloader add the following line to your project files. Note that you should replace `/path/to/` with the actual path used on your system.

```php
require '/path/to/vendor/autoload.php';
```

## <a id="service-object"> </a>Creating a service object

To use the SDK, you first need to instaniate a **service** object for the eBay API service you are using. For this guide the object will be an instance of the [\DTS\eBaySDK\Finding\Services\FindingService](https://github.com/davidtsadler/ebay-sdk-finding/blob/master/src/DTS/eBaySDK/Finding/Services/FindingService.php) class.

```php
<?php

// Use the Composer autoloader to include the SDK.
require 'vendor/autoload.php';

use \DTS\eBaySDK\Constants;
use \DTS\eBaySDK\Finding\Services;
use \DTS\eBaySDK\Finding\Types;

// Instantiate a service.
$service = new Services\FindingService(array(
    'appId' => 'YOUR_APPID_APPLICATION_KEY',
    'globalId' => Constants\GlobalIds::US
));
```

You can provide your application keys and other configuration options when creating the service object. For more information see [Configuring the SDK](/sdk/guides/configuring.html).

## <a id="request-object"> </a>Creating a request object

Before sending data to the API you will need to instaniate a **request** object. This example will call the [findItemsByKeywords](http://developer.ebay.com/DevZone/finding/CallRef/findItemsByKeywords.html) operation and so the object will be an instance of the [\DTS\eBaySDK\Finding\Types\FindItemsByKeywordsRequest](https://github.com/davidtsadler/ebay-sdk-finding/blob/master/src/DTS/eBaySDK/Finding/Types/FindItemsByKeywordsRequest.php) class.

```php
// Create the API request object.
$request = new Types\FindItemsByKeywordsRequest();
```

Properties of the request object can then be assigned values that will be sent to the API. Note that you may have to create instances of other classes, such as [\DTS\eBaySDK\Finding\Types\PaginationInput](https://github.com/davidtsadler/ebay-sdk-finding/blob/master/src/DTS/eBaySDK/Finding/Types/PaginationInput.php), in order to build up a complete request.

```php
// Assign the keywords.
$request->keywords = 'Harry Potter';

// Ask for the first 25 items.
$request->paginationInput = new Types\PaginationInput();
$request->paginationInput->entriesPerPage = 25;
$request->paginationInput->pageNumber = 1;

// Ask for the results to be sorted from high to low price.
$request->sortOrder = 'CurrentPriceHighest';
```

## <a id="service-operation"></a>Calling a service operation

You call a service operation by calling the appropriate method on the service object. There will be one method for each  operation that the service provides. All methods, such as `findItemsByKeywords`, accept the request object as their only parameter. The SDK takes the information assigned to the properties of the request object and uses it to construct the raw XML that is sent to the API.

```php
// Send the request.
$response = $service->findItemsByKeywords($request);
```

## <a id="response-object"> </a>Working with the service response object

The result of calling a service operation is a **response** object that contains the data returned from the API. The SDK uses the raw XML response to assign values to the properties on the response object. The type and contents of the object depend on the service operation that was called. In this example the object will be an instance of the [\DTS\eBaySDK\Finding\Types\FindItemsByKeywordsResponse](https://github.com/davidtsadler/ebay-sdk-finding/blob/master/src/DTS/eBaySDK/Finding/Types/FindItemsByKeywordsResponse.php) class.

```php
// Output the response from the API.
if ($response->ack !== 'Success') {
    foreach ($response->errorMessage->error as $error) {
        printf("Error: %s\n", $error->message);
    }
} else {
    foreach ($response->searchResult->item as $item) {
        printf("(%s) %s:%.2f\n", $item->itemId, $item->title, $item->sellingStatus->currentPrice->value);
    }
}
```

This guide is by no means an exhausted look at how to use the SDK. More information can be found in the [in-depth](/sdk/guides/index.html#in-depth-guides) and [service specific](/sdk/guides/index.html#service-guides) guides.
