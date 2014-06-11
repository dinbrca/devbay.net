---
layout: sdk
title: SDK Versions
description: Learn which version of the eBay API the SDK for PHP supports.
sitemap:
  lastmod: 2014-06-11
pagination:
  prev:
    url: sample-project/
    title: Sample Project
  next:
    url: configuring/
    title: Configuring the SDK
---
Due to the vast size of the eBay API, the SDK is composed of several individual SDKs that are maintained within their own projects. Each one provides the means to use a specific eBay API service in your project.

## Versioning

Each project uses its own [Semantic Versioning](http://semver.org/) number, and it should be noted that they do not follow the numbers used by the services as they are maintained separately by eBay.

To help determine which version of a SDK you require, a list is provided below that contains each SDK and the API version they support.

### <a id="finding"> </a>[Finding](https://github.com/davidtsadler/ebay-sdk-finding)

| SDK/API Versions | [1.12.0][12-01] |
|:----------------:|:---------------:|
| [0.0.3][11-04]   | &#10004;        |
| [0.0.2][11-03]   | &#10004;        |
| [0.0.1][11-02]   | &#10004;        |
| [0.0.0][11-01]   | &#10004;        |

### <a id="trading"> </a>[Trading](https://github.com/davidtsadler/ebay-sdk-trading)

| SDK/API Versions | [869][22-06] | [867][22-05] | [865][22-04] | [863][22-03] | [861][22-02] | [859][22-01] |
|:----------------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|
| [0.0.7][21-08]   | &#10004;     |              |              |              |              |              |
| [0.0.6][21-07]   |              | &#10004;     |              |              |              |              |
| [0.0.5][21-06]   |              |              | &#10004;     | &#10004;     |              |              |
| [0.0.4][21-05]   |              |              |              |              | &#10004;     |              |
| [0.0.3][21-04]   |              |              |              |              |              | &#10004;     |
| [0.0.2][21-03]   |              |              |              |              |              | &#10004;     |
| [0.0.1][21-02]   |              |              |              |              |              | &#10004;     |
| [0.0.0][21-01]   |              |              |              |              |              | &#10004;     |

### <a id="shopping"> </a>[Shopping](https://github.com/davidtsadler/ebay-sdk-shopping)

| SDK/API Versions | [869][32-04] | [867][32-03] | [861][32-02] | [857][32-01] |
|:----------------:|:------------:|:------------:|:------------:|:------------:|
| [0.0.6] [31-07]  | &#10004;     |              |              |              |
| [0.0.5] [31-06]  |              | &#10004;     |              |              |
| [0.0.4] [31-05]  |              |              | &#10004;     |              |
| [0.0.3] [31-04]  |              |              | &#10004;     |              |
| [0.0.2] [31-03]  |              |              |              | &#10004;     |
| [0.0.1] [31-02]  |              |              |              | &#10004;     |
| [0.0.0] [31-01]  |              |              |              | &#10004;     |

### <a id="business"> </a>[Business Policies Management](https://github.com/davidtsadler/ebay-sdk-business-policies-management)

| SDK/API Versions | [1.0.0][42-01] |
|:----------------:|:--------------:|
| [0.0.0] [41-01]  | &#10004;       |

[11-04]: https://github.com/davidtsadler/ebay-sdk-finding/tree/0.0.3
[11-03]: https://github.com/davidtsadler/ebay-sdk-finding/tree/0.0.2
[11-02]: https://github.com/davidtsadler/ebay-sdk-finding/tree/0.0.1
[11-01]: https://github.com/davidtsadler/ebay-sdk-finding/tree/0.0.0

[12-01]: https://developer.ebay.com/DevZone/finding/ReleaseNotes.html#1.12.0

[21-08]: https://github.com/davidtsadler/ebay-sdk-trading/tree/0.0.7
[21-07]: https://github.com/davidtsadler/ebay-sdk-trading/tree/0.0.6
[21-06]: https://github.com/davidtsadler/ebay-sdk-trading/tree/0.0.5
[21-05]: https://github.com/davidtsadler/ebay-sdk-trading/tree/0.0.4
[21-04]: https://github.com/davidtsadler/ebay-sdk-trading/tree/0.0.3
[21-03]: https://github.com/davidtsadler/ebay-sdk-trading/tree/0.0.2
[21-02]: https://github.com/davidtsadler/ebay-sdk-trading/tree/0.0.1
[21-01]: https://github.com/davidtsadler/ebay-sdk-trading/tree/0.0.0

[22-06]: http://developer.ebay.com/devzone/xml/docs/releasenotes.html#869
[22-05]: http://developer.ebay.com/devzone/xml/docs/releasenotes.html#867
[22-04]: http://developer.ebay.com/devzone/xml/docs/releasenotes.html#865
[22-03]: http://developer.ebay.com/devzone/xml/docs/releasenotes.html#863
[22-02]: http://developer.ebay.com/devzone/xml/docs/releasenotes.html#861
[22-01]: http://developer.ebay.com/devzone/xml/docs/releasenotes.html#859

[31-07]: https://github.com/davidtsadler/ebay-sdk-shopping/tree/0.0.6
[31-06]: https://github.com/davidtsadler/ebay-sdk-shopping/tree/0.0.5
[31-05]: https://github.com/davidtsadler/ebay-sdk-shopping/tree/0.0.4
[31-04]: https://github.com/davidtsadler/ebay-sdk-shopping/tree/0.0.3
[31-03]: https://github.com/davidtsadler/ebay-sdk-shopping/tree/0.0.2
[31-02]: https://github.com/davidtsadler/ebay-sdk-shopping/tree/0.0.1
[31-01]: https://github.com/davidtsadler/ebay-sdk-shopping/tree/0.0.0

[32-04]: http://developer.ebay.com/DevZone/shopping/docs/ReleaseNotes.html#869
[32-03]: http://developer.ebay.com/DevZone/shopping/docs/ReleaseNotes.html#867
[32-02]: http://developer.ebay.com/DevZone/shopping/docs/ReleaseNotes.html#861
[32-01]: http://developer.ebay.com/DevZone/shopping/docs/ReleaseNotes.html#857

[41-01]: https://github.com/davidtsadler/ebay-sdk-business-policies-management/tree/0.0.0

[42-01]: http://developer.ebay.com/DevZone/business-policies/ReleaseNotes.html#1.0.0
