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

To use the SDK, you first need to instaniate a **service** object for the eBay API service you are using. This guide will use the Finding service as example and for the most part the process will be the same for all the services. To find out more about a particular service please see the appropriate [service specific guide](/sdk/guides/index.html#service-guides).

{% highlight php %}
<?php

// Use the Composer autoloader to include the SDK.
require 'vendor/autoload.php';

use \DTS\eBaySDK\HttpClient\HttpClient;
use \DTS\eBaySDK\Finding\Services\FindingService;

// Instantiate an eBay service.
$service = new FindingService(new HttpClient(), array(
    'appId' => 'YOUR_APPID_APPLICATION_KEY'
));
{% endhighlight %}

## Creating a request object

## Calling service operations

## Working with the service response object
