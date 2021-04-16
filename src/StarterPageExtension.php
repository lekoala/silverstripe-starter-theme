<?php

use SilverStripe\i18n\i18n;
use SilverStripe\Core\Convert;
use SilverStripe\Control\Director;
use SilverStripe\ORM\DataExtension;
use SilverStripe\Control\Controller;
use SilverStripe\ErrorPage\ErrorPage;
use SilverStripe\SiteConfig\SiteConfig;

class StarterPageExtension extends DataExtension
{
    private static $casting = [
        'PreloadResources' => 'HTMLFragment',
    ];

    public function PreloadResources()
    {
        $dir = $this->owner->ThemeDir();
        $themeFolder = Director::publicFolder() . $dir;
        $fontFolder = $themeFolder . '/fonts';

        $html = '';

        // Preload fonts
        if (is_dir($fontFolder)) {
            $fonts = glob($fontFolder . '/*.woff2');
            foreach ($fonts as $font) {
                $font = basename($font);
                $html .= "<link rel=\"preload\" href=\"$dir/fonts/$font\" as=\"font\" type=\"font/woff2\">\n";
            }
        }

        $this->owner->extend('updatePreloadResources', $html);

        return $html;
    }

    protected function createMetaTag($property, $content)
    {
        $content = Convert::raw2att($content);
        return "<meta property=\"{$property}\" content=\"{$content}\" />\n";
    }

    public function getShareDescription()
    {
        // The page provides its own meta description
        if ($this->owner->MetaDescription) {
            return $this->owner->MetaDescription;
        }
        // Or fetch summary from content
        return preg_replace('/\s+/', ' ', $this->owner->dbObject('Content')->Summary());
    }

    /**
     * Update meta tags
     * @link https://github.com/tractorcow/silverstripe-opengraph
     * @param string $tags
     * @return void
     */
    public function MetaTags(&$tags)
    {
        $owner = $this->getOwner();
        $className = $owner->ClassName;
        $ignoredClasses = [ErrorPage::class];
        if (in_array($className, $ignoredClasses)) {
            return;
        }

        $controller = Controller::curr();
        $sourceObject = $owner;

        // Source object can be a DataObject
        try {
            if ($controller->hasMethod("getRequestedRecord")) {
                $sourceObject = $controller->getRequestedRecord();
                if (!$sourceObject) {
                    $sourceObject = $owner;
                }
            }
        } catch (Exception $ex) {
            // Keep page as source
        }

        // meta desc
        $SiteConfig = SiteConfig::current_site_config();
        $descriptionText = '';
        if ($sourceObject->hasField('MetaDescription')) {
            $descriptionText = trim($sourceObject->MetaDescription);
        }
        if (!$descriptionText && $sourceObject->hasMethod('getShareDescription')) {
            $descriptionText = $sourceObject->getShareDescription();
        }
        if (!$descriptionText && $sourceObject->hasField('Content')) {
            $descriptionText = preg_replace('/\s+/', ' ', $sourceObject->dbObject('Content')->Summary());
        }
        $descriptionText = trim($descriptionText);

        // image
        $imageLink = '';
        if ($sourceObject->hasMethod('getMetaImage')) {
            $imageLink = $sourceObject->getMetaImage();
            if ($imageLink && !is_string($imageLink)) {
                throw new Exception("getMetaImage should return a string");
            }
        }

        $ogType = "website";
        if ($sourceObject->hasMethod('getOGType')) {
            $ogType = $sourceObject->getOGType();
        }
        $shareTitle = $sourceObject->getTitle();
        if ($sourceObject->hasMethod('getShareTitle')) {
            $shareTitle = $sourceObject->getShareTitle();
        }

        $locale = i18n::get_locale();
        if ($sourceObject->Locale) {
            $locale = $sourceObject->Locale;
        }


        $tags = '';

        // Regular tags
        if ($descriptionText) {
            $tags .= $this->createMetaTag("description", $descriptionText);
        }

        // OpenGraph
        $tags .= "\n<!-- OpenGraph Meta Tags -->\n";
        // og:type
        $siteTitle = $SiteConfig->Title;
        $tags .= $this->createMetaTag('og:site_name', $siteTitle);
        // og:site_name
        $tags .= $this->createMetaTag('og:type', $ogType);
        // og:title
        $tags .= $this->createMetaTag('og:title', $shareTitle);
        // og:image
        if (!empty($imageLink)) {
            $tags .= $this->createMetaTag('og:image', $imageLink);
        }
        // og:locale
        $tags .= $this->createMetaTag('og:locale', i18n::convert_rfc1766($locale));
        // og:description
        if (!empty($descriptionText)) {
            $tags .= $this->createMetaTag('og:description', $descriptionText);
        }
        // og:url
        $link = $owner->AbsoluteLink();
        $tags .= $this->createMetaTag('og:url', $link);

        // Twitter
        // @link https://developer.twitter.com/en/docs/tweets/optimize-with-cards/overview/markup.html
        $tags .= "\n<!-- Twitter Meta Tags -->\n";
        // twitter:site
        // @username of website. Either twitter:site or twitter:site:id is required.
        $twitterSite = $SiteConfig->Twitter;
        if ($twitterSite) {
            $tags .= $this->createMetaTag('twitter:site', $twitterSite);
        }
        // twitter:title
        if (!empty($shareTitle)) {
            $tags .= $this->createMetaTag('twitter:title', $shareTitle);
        }
        // twitter:image
        if (!empty($imageLink)) {
            $tags .= $this->createMetaTag('twitter:image', $imageLink);
        }
        // twitter:description
        if (!empty($descriptionText)) {
            $tags .= $this->createMetaTag('twitter:description', $descriptionText);
        }
        // twitter:card - summary / summary_large_image
        $cardType = 'summary';
        if (!empty($imageLink)) {
            $cardType = 'summary_large_image';
        }
        $tags .= $this->createMetaTag('twitter:card', $cardType);
    }
}