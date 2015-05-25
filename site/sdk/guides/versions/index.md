---
layout: sdk
title: SDK Versions
description: Learn which version of the eBay API the SDK for PHP supports.
sitemap:
  lastmod: 2015-03-01
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

| SDK/API Versions | [1.13.0][12-02] | [1.12.0][12-01] |
|:----------------:|:---------------:|:---------------:|
| [0.2.1][11-11]   | &#10004;        |                 |
| [0.2.0][11-10]   | &#10004;        |                 |
| [0.1.3][11-09]   |                 | &#10004;        |
| [0.1.2][11-08]   |                 | &#10004;        |
| [0.1.1][11-07]   |                 | &#10004;        |
| [0.1.0][11-06]   |                 | &#10004;        |
| [0.0.4][11-05]   |                 | &#10004;        |
| [0.0.3][11-04]   |                 | &#10004;        |
| [0.0.2][11-03]   |                 | &#10004;        |
| [0.0.1][11-02]   |                 | &#10004;        |
| [0.0.0][11-01]   |                 | &#10004;        |

### <a id="trading"> </a>[Trading](https://github.com/davidtsadler/ebay-sdk-trading)

| SDK/API Versions | [921][22-29] | [919][22-28] | [917][22-27] | [911][22-26] | [909][22-25] | [907][22-24] | [905][22-23] | [903][22-22] | [901][22-21] | [899][22-20] | [897][22-19] | [895][22-18] | [893][22-17] | [891][22-16] | [889][22-15] | [887][22-14] | [885][22-13] | [883][22-12] | [881][22-11] |
|:----------------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|
| [0.15.0][21-26]  | &#10004;     | &#10004;     | &#10004;     | &#10004;     | &#10004;     |              |              |              |              |              |              |              |              |              |              |              |              |              |              |
| [0.14.0][21-25]  |              |              |              |              |              | &#10004;     |              |              |              |              |              |              |              |              |              |              |              |              |              |
| [0.13.0][21-24]  |              |              |              |              |              |              | &#10004;     |              |              |              |              |              |              |              |              |              |              |              |              |
| [0.12.0][21-23]  |              |              |              |              |              |              |              | &#10004;     |              |              |              |              |              |              |              |              |              |              |              |
| [0.11.0][21-22]  |              |              |              |              |              |              |              |              | &#10004;     | &#10004;     |              |              |              |              |              |              |              |              |              |
| [0.10.0][21-21]  |              |              |              |              |              |              |              |              |              |              | &#10004;     |              |              |              |              |              |              |              |              |
| [0.9.0][21-20]   |              |              |              |              |              |              |              |              |              |              |              | &#10004;     | &#10004;     |              |              |              |              |              |              |
| [0.8.0][21-19]   |              |              |              |              |              |              |              |              |              |              |              |              |              | &#10004;     |              |              |              |              |              |
| [0.7.0][21-18]   |              |              |              |              |              |              |              |              |              |              |              |              |              |              | &#10004;     |              |              |              |              |
| [0.6.0][21-17]   |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              | &#10004;     | &#10004;     |              |              |
| [0.5.0][21-16]   |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |  &#10004;    |              |
| [0.4.0][21-15]   |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              | &#10004;     |

### <a id="shopping"> </a>[Shopping](https://github.com/davidtsadler/ebay-sdk-shopping)

| SDK/API Versions | [907][32-20] | [905][32-19] | [903][32-18] | [901][32-17] | [899][32-16] | [897][32-15] | [895][32-14] | [893][32-13] | [891][32-12] | [889][32-11] | [887][32-10] | [885][32-09] | [883][32-08] | [879][32-07] | [873][32-06] | [871][32-05] | [869][32-04] | [867][32-03] | [861][32-02] | [857][32-01] |
|:----------------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|:------------:|
| [0.5.1] [31-17]  | &#10004;     |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |
| [0.5.0] [31-16]  |              | &#10004;     | &#10004;     |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |
| [0.4.0] [31-15]  |              |              |              | &#10004;     | &#10004;     | &#10004;     |              |              |              |              |              |              |              |              |              |              |              |              |              |              |
| [0.3.0] [31-14]  |              |              |              |              |              |              | &#10004;     | &#10004;     | &#10004;     | &#10004;     | &#10004;     | &#10004;     |              |              |              |              |              |              |              |              |
| [0.2.0] [31-13]  |              |              |              |              |              |              |              |              |              | &#10004;     | &#10004;     | &#10004;     |              |              |              |              |              |              |              |              |
| [0.1.3] [31-12]  |              |              |              |              |              |              |              |              |              |              |              |              | &#10004;     | &#10004;     | &#10004;     |              |              |              |              |              |
| [0.1.2] [31-11]  |              |              |              |              |              |              |              |              |              |              |              |              | &#10004;     | &#10004;     | &#10004;     |              |              |              |              |              |
| [0.1.1] [31-10]  |              |              |              |              |              |              |              |              |              |              |              |              | &#10004;     | &#10004;     | &#10004;     |              |              |              |              |              |
| [0.1.0] [31-09]  |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              | &#10004;     |              |              |              |              |
| [0.0.7] [31-08]  |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              | &#10004;     |              |              |              |
| [0.0.6] [31-07]  |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              | &#10004;     |              |              |              |
| [0.0.5] [31-06]  |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              | &#10004;     |              |              |
| [0.0.4] [31-05]  |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              | &#10004;     |              |
| [0.0.3] [31-04]  |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              | &#10004;     |              |
| [0.0.2] [31-03]  |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              | &#10004;     |
| [0.0.1] [31-02]  |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              | &#10004;     |
| [0.0.0] [31-01]  |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              | &#10004;     |

### <a id="business"> </a>[Business Policies Management](https://github.com/davidtsadler/ebay-sdk-business-policies-management)

| SDK/API Versions | [1.0.0][42-01] |
|:----------------:|:--------------:|
| [0.1.4] [41-07]  | &#10004;       |
| [0.1.3] [41-06]  | &#10004;       |
| [0.1.2] [41-05]  | &#10004;       |
| [0.1.1] [41-04]  | &#10004;       |
| [0.1.0] [41-03]  | &#10004;       |
| [0.0.1] [41-02]  | &#10004;       |
| [0.0.0] [41-01]  | &#10004;       |

### <a id="transfer"> </a>[File Transfer](https://github.com/davidtsadler/ebay-sdk-file-transfer)

| SDK/API Versions | [1.1.0][52-01] |
|:----------------:|:--------------:|
| [0.2.1] [51-03]  | &#10004;       |
| [0.2.0] [51-02]  | &#10004;       |
| [0.1.0] [51-01]  | &#10004;       |

### <a id="exchange"> </a>[Bulk Data Exchange](https://github.com/davidtsadler/ebay-sdk-bulk-data-exchange)

| SDK/API Versions | [1.5.0][62-01] |
|:----------------:|:--------------:|
| [0.1.2] [61-03]  | &#10004;       |
| [0.1.1] [61-02]  | &#10004;       |
| [0.1.0] [61-01]  | &#10004;       |

### <a id="half"> </a>[Half Finding](https://github.com/davidtsadler/ebay-sdk-half-finding)

| SDK/API Versions | [1.2.0][72-01] |
|:----------------:|:--------------:|
| [0.1.1] [71-02]  | &#10004;       |
| [0.1.0] [71-01]  | &#10004;       |

[11-11]: https://github.com/davidtsadler/ebay-sdk-finding/releases/tag/0.2.1
[11-10]: https://github.com/davidtsadler/ebay-sdk-finding/tree/0.2.0
[11-09]: https://github.com/davidtsadler/ebay-sdk-finding/tree/0.1.3
[11-08]: https://github.com/davidtsadler/ebay-sdk-finding/tree/0.1.2
[11-07]: https://github.com/davidtsadler/ebay-sdk-finding/tree/0.1.1
[11-06]: https://github.com/davidtsadler/ebay-sdk-finding/tree/0.1.0
[11-05]: https://github.com/davidtsadler/ebay-sdk-finding/tree/0.0.4
[11-04]: https://github.com/davidtsadler/ebay-sdk-finding/tree/0.0.3
[11-03]: https://github.com/davidtsadler/ebay-sdk-finding/tree/0.0.2
[11-02]: https://github.com/davidtsadler/ebay-sdk-finding/tree/0.0.1
[11-01]: https://github.com/davidtsadler/ebay-sdk-finding/tree/0.0.0

[12-02]: https://developer.ebay.com/DevZone/finding/ReleaseNotes.html#1.13.0
[12-01]: https://developer.ebay.com/DevZone/finding/ReleaseNotes.html#1.12.0

[21-26]: https://github.com/davidtsadler/ebay-sdk-trading/releases/tag/0.15.0
[21-25]: https://github.com/davidtsadler/ebay-sdk-trading/releases/tag/0.14.0
[21-24]: https://github.com/davidtsadler/ebay-sdk-trading/tree/0.13.0
[21-23]: https://github.com/davidtsadler/ebay-sdk-trading/tree/0.12.0
[21-22]: https://github.com/davidtsadler/ebay-sdk-trading/tree/0.11.0
[21-21]: https://github.com/davidtsadler/ebay-sdk-trading/tree/0.10.0
[21-20]: https://github.com/davidtsadler/ebay-sdk-trading/tree/0.9.0
[21-19]: https://github.com/davidtsadler/ebay-sdk-trading/tree/0.8.0
[21-18]: https://github.com/davidtsadler/ebay-sdk-trading/tree/0.7.0
[21-17]: https://github.com/davidtsadler/ebay-sdk-trading/tree/0.6.0
[21-16]: https://github.com/davidtsadler/ebay-sdk-trading/tree/0.5.0
[21-15]: https://github.com/davidtsadler/ebay-sdk-trading/tree/0.4.0

[22-29]: http://developer.ebay.com/devzone/xml/docs/releasenotes.html#921
[22-28]: http://developer.ebay.com/devzone/xml/docs/releasenotes.html#919
[22-27]: http://developer.ebay.com/devzone/xml/docs/releasenotes.html#917
[22-26]: http://developer.ebay.com/devzone/xml/docs/releasenotes.html#911
[22-25]: http://developer.ebay.com/devzone/xml/docs/releasenotes.html#909
[22-24]: http://developer.ebay.com/devzone/xml/docs/releasenotes.html#907
[22-23]: http://developer.ebay.com/devzone/xml/docs/releasenotes.html#905
[22-22]: http://developer.ebay.com/devzone/xml/docs/releasenotes.html#903
[22-21]: http://developer.ebay.com/devzone/xml/docs/releasenotes.html#901
[22-20]: http://developer.ebay.com/devzone/xml/docs/releasenotes.html#899
[22-19]: http://developer.ebay.com/devzone/xml/docs/releasenotes.html#897
[22-18]: http://developer.ebay.com/devzone/xml/docs/releasenotes.html#895
[22-17]: http://developer.ebay.com/devzone/xml/docs/releasenotes.html#893
[22-16]: http://developer.ebay.com/devzone/xml/docs/releasenotes.html#891
[22-15]: http://developer.ebay.com/devzone/xml/docs/releasenotes.html#889
[22-14]: http://developer.ebay.com/devzone/xml/docs/releasenotes.html#887
[22-13]: http://developer.ebay.com/devzone/xml/docs/releasenotes.html#885
[22-12]: http://developer.ebay.com/devzone/xml/docs/releasenotes.html#883
[22-11]: http://developer.ebay.com/devzone/xml/docs/releasenotes.html#881

[31-17]: https://github.com/davidtsadler/ebay-sdk-shopping/releases/tag/0.5.1 
[31-16]: https://github.com/davidtsadler/ebay-sdk-shopping/tree/0.5.0
[31-15]: https://github.com/davidtsadler/ebay-sdk-shopping/tree/0.4.0
[31-14]: https://github.com/davidtsadler/ebay-sdk-shopping/tree/0.3.0
[31-13]: https://github.com/davidtsadler/ebay-sdk-shopping/tree/0.2.0
[31-12]: https://github.com/davidtsadler/ebay-sdk-shopping/tree/0.1.3
[31-11]: https://github.com/davidtsadler/ebay-sdk-shopping/tree/0.1.2
[31-10]: https://github.com/davidtsadler/ebay-sdk-shopping/tree/0.1.1
[31-09]: https://github.com/davidtsadler/ebay-sdk-shopping/tree/0.1.0
[31-08]: https://github.com/davidtsadler/ebay-sdk-shopping/tree/0.0.7
[31-07]: https://github.com/davidtsadler/ebay-sdk-shopping/tree/0.0.6
[31-06]: https://github.com/davidtsadler/ebay-sdk-shopping/tree/0.0.5
[31-05]: https://github.com/davidtsadler/ebay-sdk-shopping/tree/0.0.4
[31-04]: https://github.com/davidtsadler/ebay-sdk-shopping/tree/0.0.3
[31-03]: https://github.com/davidtsadler/ebay-sdk-shopping/tree/0.0.2
[31-02]: https://github.com/davidtsadler/ebay-sdk-shopping/tree/0.0.1
[31-01]: https://github.com/davidtsadler/ebay-sdk-shopping/tree/0.0.0

[32-20]: http://developer.ebay.com/DevZone/shopping/docs/ReleaseNotes.html#907
[32-19]: http://developer.ebay.com/DevZone/shopping/docs/ReleaseNotes.html#905
[32-18]: http://developer.ebay.com/DevZone/shopping/docs/ReleaseNotes.html#903
[32-17]: http://developer.ebay.com/DevZone/shopping/docs/ReleaseNotes.html#901
[32-16]: http://developer.ebay.com/DevZone/shopping/docs/ReleaseNotes.html#899
[32-15]: http://developer.ebay.com/DevZone/shopping/docs/ReleaseNotes.html#897
[32-14]: http://developer.ebay.com/DevZone/shopping/docs/ReleaseNotes.html#895
[32-13]: http://developer.ebay.com/DevZone/shopping/docs/ReleaseNotes.html#893
[32-12]: http://developer.ebay.com/DevZone/shopping/docs/ReleaseNotes.html#891
[32-11]: http://developer.ebay.com/DevZone/shopping/docs/ReleaseNotes.html#889
[32-10]: http://developer.ebay.com/DevZone/shopping/docs/ReleaseNotes.html#887
[32-09]: http://developer.ebay.com/DevZone/shopping/docs/ReleaseNotes.html#885
[32-08]: http://developer.ebay.com/DevZone/shopping/docs/ReleaseNotes.html#883
[32-07]: http://developer.ebay.com/DevZone/shopping/docs/ReleaseNotes.html#879
[32-06]: http://developer.ebay.com/DevZone/shopping/docs/ReleaseNotes.html#873
[32-05]: http://developer.ebay.com/DevZone/shopping/docs/ReleaseNotes.html#871
[32-04]: http://developer.ebay.com/DevZone/shopping/docs/ReleaseNotes.html#869
[32-03]: http://developer.ebay.com/DevZone/shopping/docs/ReleaseNotes.html#867
[32-02]: http://developer.ebay.com/DevZone/shopping/docs/ReleaseNotes.html#861
[32-01]: http://developer.ebay.com/DevZone/shopping/docs/ReleaseNotes.html#857

[41-07]: https://github.com/davidtsadler/ebay-sdk-business-policies-management/releases/tag/0.1.4 
[41-06]: https://github.com/davidtsadler/ebay-sdk-business-policies-management/tree/0.1.3
[41-05]: https://github.com/davidtsadler/ebay-sdk-business-policies-management/tree/0.1.2
[41-04]: https://github.com/davidtsadler/ebay-sdk-business-policies-management/tree/0.1.1
[41-03]: https://github.com/davidtsadler/ebay-sdk-business-policies-management/tree/0.1.0
[41-02]: https://github.com/davidtsadler/ebay-sdk-business-policies-management/tree/0.0.1
[41-01]: https://github.com/davidtsadler/ebay-sdk-business-policies-management/tree/0.0.0

[42-01]: http://developer.ebay.com/DevZone/business-policies/ReleaseNotes.html#1.0.0

[51-03]: https://github.com/davidtsadler/ebay-sdk-file-transfer/releases/tag/0.2.1 
[51-02]: https://github.com/davidtsadler/ebay-sdk-file-transfer/tree/0.2.0
[51-01]: https://github.com/davidtsadler/ebay-sdk-file-transfer/tree/0.1.0

[52-01]: http://developer.ebay.com/DevZone/file-transfer/ReleaseNotes.html#1.1.0

[61-03]: https://github.com/davidtsadler/ebay-sdk-bulk-data-exchange/releases/tag/0.1.2 
[61-02]: https://github.com/davidtsadler/ebay-sdk-bulk-data-exchange/tree/0.1.1
[61-01]: https://github.com/davidtsadler/ebay-sdk-bulk-data-exchange/tree/0.1.0

[62-01]: http://developer.ebay.com/DevZone/bulk-data-exchange/ReleaseNotes.html#1.5.0

[71-02]: https://github.com/davidtsadler/ebay-sdk-half-finding/releases/tag/0.1.1 
[71-01]: https://github.com/davidtsadler/ebay-sdk-half-finding/tree/0.1.0

[72-01]: http://developer.ebay.com/DevZone/half-finding/ReleaseNotes.html#1.2.0
