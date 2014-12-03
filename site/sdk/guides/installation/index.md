---
layout: sdk
title: Installation
description: Learn how to install the eBay SDK for PHP.
sitemap:
  lastmod: 2014-12-03
pagination:
  prev:
    url: requirements/
    title: Requirements
  next:
    url: getting-started/
    title: Getting Started Guide
---
## Installing via Composer

Using [Composer](http://getcomposer.org) is the recommended way of installing the eBay SDK for PHP.

<blockquote>
Composer is a tool for dependency management in PHP. It allows you to declare the dependent libraries your project needs and it will install them in your project for you.<cite><a href="http://getcomposer.org">Composer website</a></cite>
</blockquote>

Installing the SDK with Composer is done as follows:

  1. Edit your project's `composer.json` file so that is contains the following:

     ```javascript
     {
         "require": {
             "dts/ebay-sdk-finding": "~0.1",
             "dts/ebay-sdk-trading": "~0.1",
             "dts/ebay-sdk-shopping": "~0.1",
             "dts/ebay-sdk-business-policies-management": "~0.1",
             "dts/ebay-sdk-file-transfer": "~0.1",
             "dts/ebay-sdk-bulk-data-exchange": "~0.1",
             "dts/ebay-sdk-half-finding": "~0.1"
         }
     }
     ```

     Note that this will install all of the SDK. It is explained later how the installation can be customized to only include the parts that you need.

  1. Download and install Composer.

     ```
     curl -sS https://getcomposer.org/installer | php
     ```

  1. Install the SDK and its dependencies.

     ```
     php composer.phar install
     ```

  1. Require Composer's autoloader by adding the following line to the top of you code.

     ```php
     require 'vendor/autoload.php';
     ```

It is highly recommended that you read the Composer documentation at [getcomposer.org](http://getcomposer.org) to fully understand how to install Composer, define dependencies and configure the autoloading.

## Customizing the installation

Due to the vast size of the eBay API, the SDK is actually composed of several smaller individual SDKs that provide the means to use a specific eBay API service in your project.

Using the method outlined earlier installs all of the SDK, but by only declaring the services that you require you can install just what you need. For example, if you are only using the Finding API service your `composer.json` file will be as follows:

```javascript
{
    "require": {
        "dts/ebay-sdk-finding": "~0.1"
    }
}
```

## Versions

Because each SDK is its own project they will be at different versions to one another. To help determine which version of a SDK you require there is a [complete list of each SDK, and the API version they support](/sdk/guides/versions/) available. If during the development of your project you want to keep up with the latest changes you can specify `dev-master` as the version.

```javascript
{
    "require": {
        "dts/ebay-sdk-trading": "dev-master"
    }
}
```
