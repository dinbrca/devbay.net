---
layout: sdk
title: Debugging the request and response
description: Learn how to debug with the SDK.
sitemap:
  lastmod: 2015-11-02
pagination:
  prev:
    url: uploading-and-downloading-files/
    title: Uploading and downloading files
  next:
    url: finding/
    title: Finding
---
The SDK provides a simply way to debug the request and response when calling a service operation. Passing `true` to the `debug` configuration option enables debugging in the SDK. The SDK passes debug messages to a logger that can be attached via the `logger` method. As long as the logger object implements the [PSR-3 logger interface](http://www.php-fig.org/psr/psr-3/) the SDK will pass messages via the object's `debug` method.

```php
class DebugLogger implements Psr\Log\LoggerInterface
{
    public function debug($message, array $context = array())
    {
        echo $message;
    }
}
```

The `$message` parameter function will be passed a string that will be either  `Request` or `Response`. The `$context` parameter is an associative array that contains information relating to the either the request or response.

The example below shows how to attach a logger that extends the [PSR-3 AbstractLogger](https://github.com/php-fig/log/blob/master/Psr/Log/AbstractLogger.php) class. 

```php
require __DIR__.'vendor/autoload.php';

use \DTS\eBaySDK\Constants;
use \DTS\eBaySDK\Trading\Services;
use \DTS\eBaySDK\Trading\Types;

class EchoLogger extends Psr\Log\AbstractLogger
{
    public function log($level, $message, array $context = array())
    {
        if ($message === 'Request') {
            /**
             * When debugging a request the following values are available
             *
             * url     - The API endpoint.
             * headers - Associative array of HTTP headers and values.
             * body    - The XML request.
             */
            printf("URL: %s\n", $context['url']);

            foreach($context['headers'] as $header => $value) {
                printf("Header %s : %s\n", $header, $value);
            }

            printf("Request XML: %s\n", $context['body']);

        } elseif ($message === 'Response') {
            /**
             * When debugging the response only the body is available.
             */
            printf("Response XML: %s\n", $context['body']);
        }
    }
}

$service = new Services\TradingService(array(
    'apiVersion' => '903',
    'siteId' => Constants\SiteIds::US,
    'authToken' => <YOUR AUTH TOKEN>,
    'debug' => true
));

/**
 * Attach the logger.
 */
$service->logger(new EchoLogger());

$request = new Types\GeteBayOfficialTimeRequestType();

$response = $service->geteBayOfficialTime($request);
```
