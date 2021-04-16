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

# Misc

- SiteConfig.ThemeColor to be defined

# Todo

- Find a way to support js modules properly with requirements backend
