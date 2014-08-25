---
layout: sdk
title: Configuring the SDK
description: Learn how to configure the eBay SDK for PHP.
sitemap:
  lastmod: 2014-08-25
pagination:
  prev:
    url: versions/
    title: SDK Versions
  next:
    url: uploading-and-downloading-files/
    title: Uploading and downloading files
---
The eBay SDK for PHP can be configured to suit your needs and this guide will show the various ways you can do this in your projects.

## Configuration options

Configuring the SDK is done by passing configuration options to the service objects that you create. To see what options are supported by each service it is recommended that you read the [service specific guides](/sdk/guides/#service-guides).

### Configuring via the class constructor

When instantiating a service object an associative array of configuration options can be passed as the first parameter to the class constructor.

```php
<?php

require 'vendor/autoload.php';

use \DTS\eBaySDK\Constants;
use \DTS\eBaySDK\Finding\Services;
use \DTS\eBaySDK\Finding\Types;

// Pass associative array of configuration options.
$service = new Services\FindingService(array(
    'globalId' => Constants\GlobalIds::US,
    'sandbox' => true
));
```

### Calling the config method

The `config` method allows you to set configuration options after the service object has been created. You set a single option by passing its name and value as the method parameters.

```php
$service->config('globalId', Constants\GlobalIds::US);
```

The method also allows multiple options to be set in a single call by passing in an associative array of option names and their values.

```php
$service->config(array(
    'globalId' => Constants\GlobalIds::US,
    'sandbox' => true
));
```

You can get the value of any configuration option by just passing its name.

```php
$globalId = $service->config('globalId');

assert('$globalId === \DTS\eBaySDK\Constants\GlobalIds::US');
```

By passing no paramters all options are returned as an associative array.

```php
$options = $service->config();

assert('$options["globalId"] === \DTS\eBaySDK\Constants\GlobalIds::US');
assert('$options["sandbox"] === true');
```

## Handling configuration errors

The SDK will throw an exception of the type `\DTS\eBaySDK\Exceptions\UnknownConfigurationOptionException` if a non-existent option is passed to either the class constructor or `config` method.

```php
try {
    $service->config(array(
        'non-existent' => true,
        'globalId' => Constants\GlobalIds::US,
        'sandbox' => true
    ));
} catch (\DTS\eBaySDK\Exceptions\UnknownConfigurationOptionException $e) {
    // Unknown configuration option: DTS\eBaySDK\Finding\Services\FindingService::non-existent
    echo $e->getMessage();
}
```
