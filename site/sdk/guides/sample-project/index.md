---
layout: sdk
title: Sample Project
description: Install the sample project and find examples of using the eBay SDK for PHP.
sitemap:
  lastmod: 2014-12-03
pagination:
  prev:
    url: getting-started/
    title: Getting Started Guide
  next:
    url: versions/
    title: SDK Versions
---
The [sample project](https://github.com/davidtsadler/ebay-sdk-examples) contains examples of using the eBay SDK for PHP. This guide will show how to install the project and run the examples.

## Installation

  1. Download the project.

     ```
     git clone https://github.com/davidtsadler/ebay-sdk-examples.git
     ```

  1. From the `ebay-sdk-examples` directory install Composer with:

     ```
     curl -sS https://getcomposer.org/installer | php
     ```

  1. Install the dependencies.

     ```
     php composer.phar install
     ```

## Configuration

All the examples load configuration settings from a `configuration.php` file located in the root of the project directory. This file can be created by running the following command inside the `ebay-sdk-examples` directory:

```
cp configuration.php.example configuration.php
```

Edit the resulting `configuration.php` file and specify your eBay application keys. Ensure that you enter values for both the sandbox and production enviroments. A guide is available to [help get your application keys](/sdk/guides/application-keys/).

**Be careful not to commit the `configuration.php` file into an SCM repository as you risk exposing your eBay application keys to more people than intended.**

## Examples

There are several examples for each service that the SDK supports and they are listed in the `README` file for each service.

  1. [Finding](https://github.com/davidtsadler/ebay-sdk-examples/blob/master/finding/README.md)

  1. [Trading](https://github.com/davidtsadler/ebay-sdk-examples/blob/master/trading/README.md)

  1. [Shopping](https://github.com/davidtsadler/ebay-sdk-examples/blob/master/shopping/README.md)

  1. [Business Policies Management](https://github.com/davidtsadler/ebay-sdk-examples/blob/master/business-policies-management/README.md)

  1. [Large Merchange Services](https://github.com/davidtsadler/ebay-sdk-examples/blob/master/large-merchant-services/README.md)

  1. [Half Finding](https://github.com/davidtsadler/ebay-sdk-examples/blob/master/half-finding/README.md)

To run an example from the command line use the `php` command followed by the name of the example file.

```
php finding/01-simple-keywords-search.php
```
