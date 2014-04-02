---
layout: sdk
title: Configuring the SDK
pagination:
  prev:
    url: sample_project
    title: Sample Project
---
The eBay SDK for PHP can be configured to suit your needs and this guide will show the various ways you can do this in your projects.

## Configuration options

Configuring of the SDK is done by passing configuration options to the service objects that you create. To see what options are supported by each service it is recommended that you read the [service specific guides](/sdk/guides/index.html#service-guides).

There are two ways in which configuration options can be passed to a service object:

  1. [Via the class constructor](/sdk/guides/configuring.html#class-constructor)
  1. [With the config method](/sdk/guides/configuring.html#config-method)

### <a name="class-constructor"></a>Configuring via the class constructor

When instantiating a service object an array of configuration options can be passed as the second parameter to the class constructor.

{% highlight php %}
<?php

require 'vendor/autoload.php';

use \DTS\eBaySDK\HttpClient;
use \DTS\eBaySDK\Constants;
use \DTS\eBaySDK\Finding\Services;
use \DTS\eBaySDK\Finding\Types;

// Pass array of configuration options. 
$service = new Services\FindingService(new HttpClient\HttpClient(), array(
    'appId' => 'YOUR_APPID_APPLICATION_KEY',
    'globalId' => Constants\GlobalIds::US,
    'sandbox' => true
));
{% endhighlight %}

### <a name="config-method"></a>Calling the config method
