---
layout: sdk
title: Getting Started Guide
pagination:
  prev:
    url: installation
    title: Installation
  next:
    url: sample_project
    title: Sample Project
---
This guide will take you through the basics of using the eBay SDK for PHP. By the end of it you should have enough knowledge to start using the SDK in your projects. It is assumed that you have already [downloaded and installed the SDK](/sdk/guides/installation.html) and [retrieved your application keys](/sdk/guides/application_keys.html).

## Including the SDK

As Composer was used to install the SDK an autoloader is provided so that you can include the SDK in your project. This is achived by adding the following line to your project files. Note that you should replace `/path/to/` with the actual path used on your system. 

{% highlight php startinline %}
require '/path/to/vendor/autoload.php';
{% endhighlight %}

## Creating a service object

To use the SDK, you first need to instaniate a **service** object for the eBay API service you are using. The object's type will depend on which service is been used. This guide will use the [Finding](http://developer.ebay.com/Devzone/finding/Concepts/FindingAPIGuide.html) service as an example and so the object will be an instance of the [\DTS\eBaySDK\Finding\Services\FindingService](https://github.com/davidtsadler/ebay-sdk-finding/blob/master/src/DTS/eBaySDK/Finding/Services/FindingService.php) class.

{% highlight php %}
<?php

// Use the Composer autoloader to include the SDK.
require 'vendor/autoload.php';

use \DTS\eBaySDK\HttpClient\HttpClient;
use \DTS\eBaySDK\Finding\Services as Services;
use \DTS\eBaySDK\Finding\Types as Types;

// Instantiate a service.
$service = new Services\FindingService(new HttpClient(), array(
    'appId' => 'YOUR_APPID_APPLICATION_KEY',
    'globalId' => 'EBAY-US'
));
{% endhighlight %}

You can provide your application keys and other configuration options when creating the service object. For more information see [Configuring the SDK](/sdk/guides/configuring.html). 

## Creating a request object

Before sending data to the API you will need to instaniate a **request** object. This example will call the [findItemsByKeywords](http://developer.ebay.com/DevZone/finding/CallRef/findItemsByKeywords.html) operation and so the object will be an instance of the [\DTS\eBaySDK\Finding\Types\FindItemsByKeywordsRequest](https://github.com/davidtsadler/ebay-sdk-finding/blob/master/src/DTS/eBaySDK/Finding/Types/FindItemsByKeywordsRequest.php) class.

{% highlight php startinline %}
// Create the API request object.
$request = new Types\FindItemsByKeywordsRequest();
{% endhighlight %}

Properties of the request object can then be assigned values that will be sent to the API.

{% highlight php startinline %}
// Assign the keywords.
$request->keywords = 'Harry Potter';

// Ask for the first 25 items.
$request->paginationInput = new Types\PaginationInput();
$request->paginationInput->entriesPerPage = 25;
$request->paginationInput->pageNumber = 1;

// Ask for the results to be sorted from high to low price.
$request->sortOrder = 'CurrentPriceHighest';
{% endhighlight %}

## Calling a service operation

You call a service operation by calling the appropriate method on the service object. There will be one method for each of the service operations that the API provides. All methods, such as `findItemsByKeywords`, accept the request object as their only parameter.

{% highlight php startinline %}
// Send the request.
$response = $service->findItemsByKeywords($request);
{% endhighlight %}

## Working with the service response object

The result of calling a service operation is a **response** object that contains the data returned from the API. The type and contents of the object depend on the service operation that was called. In this example the object will be an instance of the [\DTS\eBaySDK\Finding\Types\FindItemsByKeywordsResponse](https://github.com/davidtsadler/ebay-sdk-finding/blob/master/src/DTS/eBaySDK/Finding/Types/FindItemsByKeywordsResponse.php) class.

{% highlight php startinline %}
// Output the response from the API.
if ($response->ack === 'Failure') {
    foreach ($response->errors as $error) {
        printf("Error: %s\n", $error->shortMessage);
    }
} else {
    foreach ($response->searchResult->item as $item) {
        printf("(%s) %s:%.2f\n", $item->itemId, $item->title, $item->sellingStatus->currentPrice->value);
    }
}
{% endhighlight %}
