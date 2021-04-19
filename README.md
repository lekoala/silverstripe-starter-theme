# Using the Starter theme

* Copy the theme into the `themes/` directory of your SilverStripe project.  If you've named it correctly, there should be a directory called `themes/[your-theme]/templates`.
* Add the following to your `app/config/theme.yml` file.

 ```yml
 SilverStripe\View\SSViewer:
  themes:
    - '$public'
    - '[your-theme]'
    - '$default'
```

* Update composer.json to fit your new theme name.
* Copy src/StarterPageExtension.php to app/src and make your page uses it

 ```yml
SilverStripe\CMS\Model\SiteTree:
  extensions:
    - StarterPageExtension
```

* Happy hacking!

# Features

This theme is basically build around recommendations made in this article https://www.matuzo.at/blog/html-boilerplate/ which is a brilliant introduction for
a modern boilerplate.

It is bundled with bootstrap 5 but feel free to use whatever you like.

# Favicon

Favicon needs to be set in /images folder. Use https://realfavicongenerator.net/ to create your icon. Please use a svg icon.
Provided icon has been made with https://www.blobmaker.app/.

# Fonts

Please use https://google-webfonts-helper.herokuapp.com/fonts/ to create a local version of your google fonts or use your own.
Use only woff/woff2 fonts.

Fonts needs to be preloaded for best results, see StarterPageExtension::PreloadResources

# Search form

By default, the search form works on all pages. But this leads to a lot of problems.
In general, I'd rather use a custom search controller to display results. This should be provided with $SearchControllerLink.

You can use https://github.com/lekoala/silverstripe-simple-search to enable this.

# Javascript

No js is required by default in the theme. This is because I highly recommend to manage things from your controller instead.

Here is a sample bit of code you can include in `PageController::init`.

```php
//This is not needed, because we use js modules
//Requirements::themedJavascript("javascript/vendor/bootstrap/src/toast.js");
Requirements::themedJavascript("javascript/script.js");
$script = <<<JS
import Modal from "/_resources/themes/starter/javascript/vendor/bootstrap/src/modal.js"

var myModal = new Modal(document.getElementById('DemoModal'));
myModal.show();
JS;
Requirements::customScript($script);
```

Please note we are using js modules here and this require the usage of my defer backend module with `enable_js_modules` set to `true`
for this to work.

NOTE: Dropdown, Tooltip and Popover are not [usable with js modules](https://getbootstrap.com/docs/5.0/getting-started/javascript/#using-bootstrap-as-a-module)

# Misc

- SiteConfig.ThemeColor to be defined
