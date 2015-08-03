---
layout: sdk
title: Migration Guide
description: Learn how to migrate to the new eBay SDK for PHP repository
sitemap:
  lastmod: 2015-08-03
pagination:
  prev:
    url: installation/
    title: Installation
  next:
    url: getting-started/
    title: Getting Started Guide
---
As [announced](/blog/2015/07/05/the-future-of-the-ebay-sdk-for-php/) the SDK, which was split across several repositories, is now combined into a new single repository that can be found at [ebay-sdk-php](https://github.com/davidtsadler/ebay-sdk-php). If you are currently using the old repositories in your projects this guide will help you to migrate over to using the new one. The method of migration is dependant upon how the SDK was originally installed onto your project's system.

## Composer

Remove the old packages from your project's dependencies list.

```
php composer.phar remove \
    ebay-sdk-bulk-data-exchange \
    ebay-sdk-business-policies-management \
    ebay-sdk-file-transfer \
    ebay-sdk-finding \
    ebay-sdk-half-finding \
    ebay-sdk-merchant-data \
    ebay-sdk-resolution-case-management \
    ebay-sdk-shopping \
    ebay-sdk-trading 
```

Install the new package.

```
php composer.phar require dts/ebay-sdk-php
```

## Phar

Download the Phar for the [current release](https://github.com/davidtsadler/ebay-sdk-php/releases/latest). The name of this file is ebay-sdk-php.phar. Your project's code will be using PHP's require statement to include the old Phar file. You should update these statements with the location of the new Phar.

```php
require '/path/to/phar/download/ebay-sdk-php.phar';
```

## Zip

Download the Zip archive for the [current release](https://github.com/davidtsadler/ebay-sdk-php/releases/latest) and unzip it into the directory of your choice. Your project's code will be using PHP's require statement to include the old class autoloader. You should update these statements with the location of the new autoloader.

```php
require '/path/to/zip/download/ebay-sdk-php-autoloader.php';
```
