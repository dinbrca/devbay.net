---
layout: blog
title: Deprecated Repositories
description: Information regarding the deprecated repositories of the eBay SDK for PHP
sitemap:
  lastmod: 2015-08-03
comments: true
---
As [previously announced](/blog/2015/07/05/the-future-of-the-ebay-sdk-for-php/) the many GitHub repositories that make up the SDK have now been combined into a new single repository that can be found at [ebay-sdk-php](https://github.com/davidtsadler/ebay-sdk-php). As a result of this the existing repositories have been issued with an end of life notice for the 6th December 2015. After that date the repositories will no longer be supported. Until then they will continue to receive support for the following:-

- Bug fixes.
- Updates to ensure the SDK is compatible with the latest eBay API version.

This means that you can continue to use the old repositories in your current projects for the time been. If you would like to use the new repository with your existing projects there is a [migration guide](/sdk/guides/migration/) available. Since the code for the SDK has not changed it should be possible to migrate without to many changes to the project's code. If you are starting a new project then you will do better by using the ebay-sdk-php repository from the beginning. 

New features that improve the SDK will be developed for the ebay-sdk-php repository. These *may* be ported to the old repositories but this will be dependant upon the code complexity and the cost of supporting a feature.

The result of combining the repositories is that work on releasing version 1.0.0 of the SDK can now begin. More details regarding this will be available in September.
