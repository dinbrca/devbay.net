---
layout: blog
title: The Future Of The eBay SDK For PHP
description: Information regarding the future development of the eBay SDK for PHP
sitemap:
  lastmod: 2015-07-05
comments: true
---
The purpose of this post to provide some information regarding the future development of the eBay SDK for PHP. Specifically I would like to discuss some issues with the current development and my plans to solve them. I would also like to provide information about the version 1.0 release of the SDK.

## Current Development Issues

As you may know the SDK is currently maintained in following Github repositories.

* [ebay-sdk](https://github.com/davidtsadler/ebay-sdk)
* [ebay-sdk-bulk-data-exchange](https://github.com/davidtsadler/ebay-sdk-bulk-data-exchange)
* [ebay-sdk-business-policies-management](https://github.com/davidtsadler/ebay-sdk-business-policies-management)
* [ebay-sdk-file-transfer](https://github.com/davidtsadler/ebay-sdk-file-transfer)
* [ebay-sdk-finding](https://github.com/davidtsadler/ebay-sdk-finding)
* [ebay-sdk-half-finding](https://github.com/davidtsadler/ebay-sdk-half-finding)
* [ebay-sdk-merchant-data](https://github.com/davidtsadler/ebay-sdk-merchant-data)
* [ebay-sdk-resolution-case-management](https://github.com/davidtsadler/ebay-sdk-resolution-case-management)
* [ebay-sdk-shopping](https://github.com/davidtsadler/ebay-sdk-shopping)
* [ebay-sdk-trading](https://github.com/davidtsadler/ebay-sdk-trading)

The ebay-sdk repository is the core of the SDK and is where the bulk of the functionality can be found. The other repositories build upon the core to provide a way for you to integrate a particular eBay service into your PHP projects. Back when the SDK was first developed it seemed OK to maintain a separate repository for each service. As more services have been added it's become clear that this is no longer the case. For each new service it's become obvious that the cost of maintaining the SDK as a whole is increasing.

* Multiple [version numbers](http://devbay.net/sdk/guides/versions/) have to be maintained.
* The [installation guide](http://devbay.net/sdk/guides/installation/) must be kept up to date with each new repository that is created.
* The reporting and tracking of issues is now spread over several repositories.
* [Code](https://github.com/davidtsadler/ebay-sdk-trading/blob/master/Makefile) is been [duplicated](https://github.com/davidtsadler/ebay-sdk-shopping/blob/master/Makefile) across the repositories.
* Much of the [documentation](http://devbay.net/sdk/guides/trading/) for each [service](http://devbay.net/sdk/guides/shopping/) is also been duplicated.

## The Solution

It is the increasing cost of maintenance that has lead to idea of combining the separate repositories into a new repository that will:

* Reduce the installation of the SDK to a single Composer command or Phar/Zip archive.
* Simplify the user guides as repeated information can be removed.
* Make it easier to report and track issues.
* Simplify the ongoing development and maintenance of the SDK as all the duplicated work will be removed.

At this point it is important to state that the SDK code will not be changing during the transition to the new repository. Existing namespaces and classes will remain untouched to ensure that the SDK remains compatible with your projects. Since the code is not changing it should be possible to migrate a project over to the new repository with a few Composer commands. A migration guide will be available to explain the process. I would also like to stress that the current repositories will not be removed until the end of the 2015. Once the new repository is live the existing repositories will be deprecated. They will still receive bug fixes and API updates, but the development of new features will be done on the new repository. As there are many existing projects that currently use the SDK I plan to maintain the old repositories until the end of this year. This should provide enough time for you to start using the new one.

## Version 1.0

By reducing the SDK to a single repository I will be able to focus on releasing version 1.0 at the start of 2016. At the present time I have a few ideas as to how I would like the SDK to be for this release. My plan is to make a more detailed announcement in September when development of version 1.0 will start. The September announcement will also give you a change to provide feedback on what you would expect from the release.

## Timetable

Below is the current timetable regarding the future of the SDK.

* July

  Begin the transition of existing SDK code over to a new single repository.

* 2nd August

  - Release a new single repository for the SDK.
  - Provide a migration guide for existing users of the SDK.
  - Provide updated guides on devbay.net.
  - Archive existing guides on devbay.net so that current users of old SDK repositories still have access to them.
  - Deprecation warnings and End Of Life notices will appear in the documentation and guides for the old repositories. New users of the SDK will be encouraged to use the new repository.

* 6th September

  A detailed announcement regarding the planned release of version 1.0 in 2016.

* 6th December

  End Of Life for old SDK repositories.

* 3rd January 2016

  Release version 1.0.

## Frequently asked questions

<dl>
  <dt>Is this a new SDK?</dt>
  <dd>No. The SDK is currently spread across several repositories and the current code is been migrated into a single new repository.</dd>
  <dt>Why the need for a new repository?</dt>
  <dd>The cost of maintaining several repositories is increasing. By reducing the SDK to a single repository development time can be better spent on improving it.</dd>
  <dt>Where is this new repository?</dt>
  <dd>The new repository will be hosted on GitHub and will be called <a href="https://github.com/davidtsadler/ebay-sdk-php">ebay-sdk-php</a>.</dd>
  <dt>The new repository doesn't exist at <a href="https://github.com/davidtsadler/ebay-sdk-php">ebay-sdk-php</a>?</dt>
  <dd>It is currently a private repository so access is limited until the release.</dd>
  <dt>So when is the release?</dt>
  <dd>The repository will go public on the 2nd August 2015.</dd>
  <dt>What will happen to the old repositories once the new one is released?</dt>
  <dd>Once the new repository is released the existing old repositories will be marked as deprecated and given an End Of Live notice for the 6th December 2015.</dd>
  <dt>Will the old repositories be maintained?</dt>
  <dd>Yes. They will receive bug fixes and API updates until the 6th December 2015.</dd>
  <dt>What happens on the 6th December 2015?</dt>
  <dd>The End Of Life notice for the old repositories will come into effect and they will no longer be available via Composer or GitHub.</dd>
  <dt>Do I have to use this new repository for my existing projects?</dt>
  <dd>No. If you current projects are using the old repositories you can continue to do so until the 6th December 2015.</dd>
  <dt>Can I migrate my current projects so that they use the new repository?</dt>
  <dd>Yes. A migration guide will be made available to assist in moving existing projects over to using the new repository.</dd>
  <dt>Will I have to rewrite my existing project code?</dt>
  <dd>No. The SDK code will remain unchanged during the transition to the new repository. Your existing code will work with the SDK code provided by the new repository.</dd>
  <dt>Should I use the old repositories when starting a new project?</dt>
  <dd>No. Once the new repository is released I would strongly recommend that you use it in any new projects.</dd>
</dl>





