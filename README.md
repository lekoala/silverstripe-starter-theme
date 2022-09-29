# Using the Starter theme

-   Copy the theme into the `themes/` directory of your SilverStripe project. If you've named it correctly, there should be a directory called `themes/[your-theme]/templates`.
-   Add the following to your `app/config/theme.yml` file.

```yml
SilverStripe\View\SSViewer:
    themes:
        - "$public"
        - "[your-theme]"
        - "$default"
```

-   Update composer.json to fit your new theme name.
-   Run `composer vendor-expose` if needed
-   Happy hacking!

_This theme is not meant to be used by itself ! It is only a starting point for your own developments._

## Themes helper

Some features have been made available as a convenience as a trait unde `src/StarterTheme.php`.

```php

<?php

require_once BASE_PATH . '/themes/starter/src/StarterTheme.php';

use SilverStripe\View\Requirements;
use LeKoala\DeferBackend\DeferBackend;
use SilverStripe\CMS\Controllers\ContentController;

class PageController extends ContentController
{
    use StarterTheme;
    ...
```

# Features

This theme is basically build around recommendations made in this article https://www.matuzo.at/blog/html-boilerplate/ which is a brilliant introduction for
a modern boilerplate.

It is bundled with bootstrap 5 but feel free to use whatever you like. The scss files are compiled with dart sass and prefixed with autoprefixer.

# Favicon

Favicon needs to be set in /images folder. Use an icon generator:

-   [https://realfavicongenerator.net/](https://realfavicongenerator.net/)
-   [https://formito.com/tools/favicon](https://formito.com/tools/favicon)

Please use a svg icon if possible!

Provided icon has been made with [https://www.blobmaker.app/](https://www.blobmaker.app/).

# Fonts

Please use [fonts helper](https://google-webfonts-helper.herokuapp.com/fonts/) to create a local version of your google fonts or use your own.
Use only woff2 fonts for modern browsers.

Fonts needs to be preloaded for best results, see how to preload fonts in StarterTheme trait.

# Search form

By default, the search form works on all pages. But this leads to a lot of problems.
In general, I'd rather use a custom search controller to display results. This should be provided with $SearchControllerLink.

You can use [simple search](https://github.com/lekoala/silverstripe-simple-search) to enable this.

# Javascript

No js is required by default in the theme. This is because I highly recommend to manage things from your controller instead.

Here is a sample bit of code you can include in `PageController::init`.

```php
protected function init()
{
    parent::init();
    DeferBackend::replaceBackend();
    Requirements::themedJavascript("javascript/all.min.js", ['type' => 'module']);
}
```

Js is using modern standard and is compiled using esbuild.

Please note we are using js modules here as it allows using modern js safely and defer js loading by default.
You need to use my module [defer backend](https://github.com/lekoala/silverstripe-defer-backend) module with `enable_js_modules` set to `true` for this to work.
