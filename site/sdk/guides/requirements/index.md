---
layout: sdk
title: Requirements
description: Check the minimum requirements for using the eBay SDK for PHP.
sitemap:
  lastmod: 2014-06-11
pagination:
  prev:
    url: application-keys/
    title: Application Keys
  next:
    url: installation/
    title: Installation
---
There are a few minimum system requirements to start using the SDK. Many of these are installed by default in most PHP environments.

## Minimum requirements

  - PHP 5.3.9 or greater with the following extensions:
    - cURL
    - libxml
  - 64 bit version of PHP recommended as there are some [issues when using the SDK with 32 bit](/sdk/guides/requirements/#issues).
  - SSL enabled on the cURL extension so that https requests can be made.

## Checking requirements

Run the [requirements_check.php](https://github.com/davidtsadler/ebay-sdk/blob/master/requirements_check.php) file in the SDK to check that your system meets the minimum requirements. It can be run from the command line or a web browser and will report which checks your system passes and fails.

It is often helpful to include information about your sytem when reporting an issue with the SDK. Using the output from the requirements check may help identify the cause of an issue and speed up the resolution.

## <a id="issues"> </a> Using the SDK with 32 bit systems

It is important to note that for most developers the SDK can be installed and used on 32 bit systems without any problems. However, depending upon your project requirements you may come across an issue with the largest possible 32 bit integer size as some fields in the eBay API are represented in the XML using the [long schema type](http://www.w3.org/TR/xmlschema-2/#long).

```php
$item->Quantity = (int)51874727017;
echo $item->Quantity;
# Quantity is actual 335119465
```
