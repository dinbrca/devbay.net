---
layout: sdk
title: Installation
description: Learn how to install the eBay SDK for PHP.
sitemap:
  lastmod: 2015-08-03
pagination:
  prev:
    url: requirements/
    title: Requirements
  next:
    url: migration
    title: Migration Guide
---
## Installing via Composer

Using [Composer](http://getcomposer.org) is the recommended way of installing the eBay SDK for PHP.

<blockquote>
Composer is a tool for dependency management in PHP. It allows you to declare the dependent libraries your project needs and it will install them in your project for you.<cite><a href="http://getcomposer.org">Composer website</a></cite>
</blockquote>

Installing the SDK with Composer is done as follows:

  1. Download and install Composer.

     ```
     curl -sS https://getcomposer.org/installer | php
     ```

  1. Install the SDK.

     ```
     php composer.phar require dts/ebay-sdk-php
     ```

  1. Require Composer's autoloader by adding the following line to the top of your code.

     ```php
     <?php
     require 'vendor/autoload.php';
     ```

It is highly recommended that you read the Composer documentation at [getcomposer.org](http://getcomposer.org) to fully understand how to install Composer, define dependencies and configure the autoloading.

## Installing via Phar and Zip

The SDK comes with both a [phar](http://php.net/manual/en/book.phar.php) and Zip archive. These files contain all the classes and dependencies you need to run the SDK. You can download either the phar or Zip from the [SDK releases](https://github.com/davidtsadler/ebay-sdk-php/releases).

Using the phar in your project is as simple as including it in your scripts.

```php
require '/path/to/phar/download/ebay-sdk-php.phar';
```

To use the Zip in your project you will first have to unzip it into the directory of your choice. The files within a Zip are in a [PSR-0](https://github.com/php-fig/fig-standards/blob/master/accepted/PSR-0.md) compatible directory structure. In addition the SDK provides its own autoloader that you can include in your project's code.

```php
require '/path/to/zip/download/ebay-sdk-php-autoloader.php';
```

Alternatively you can use an existing autoloader from your project or develop your own.
