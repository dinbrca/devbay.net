---
layout: blog
title: Announcing Manual Installation of the SDK
sitemap:
  lastmod: 2015-03-01
comments: true
---

I am pleased to announce that it is now possible to manually install the SDK. While I will always recommend that you use Composer in your projects, you now have the choice of installing via a [Phar](http://php.net/manual/en/book.phar.php) or Zip archive. Each file contains all the classes and dependencies you need to run the SDK and what's more you can [download them directly from Github](https://github.com/davidtsadler/ebay-sdk-trading/releases) each time there is a new release. The [Installation section of the User Guide](http://devbay.net/sdk/guides/installation/) contains more information on how to use these new methods.

Using a Phar or Zip is great if you:

* Don't want to or cannot use Composer.
* Are unable to use Phar files due to limitations in your project's environment.
* Want to pick and choose specific files from the SDK.

If you are interested in creating Phar or Zip files for your own projects I definitely recommend using [Burgomaster](https://github.com/mtdowling/Burgomaster) to simplify the process as it can be used to:

<blockquote>
  <ol>
    <li>Easily create a staging directory for your package.</li>
    <li>Build a class-map autoloader of all of your PHP files.</li>
    <li>Create a zip file containing your project, its dependencies, and an autoloader.</li>
    <li>Create a phar file that contains all of your project's dependencies and registers an autoloader when it's loaded.</li>
   </ol> 
  <cite><a href="https://github.com/mtdowling/Burgomaster/blob/master/README.rst">Burgomaster README</a></cite>
</blockquote>

I think manual installation is a good step forward for the SDK and I hope it helps.

