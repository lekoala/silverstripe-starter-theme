<!DOCTYPE html>
<html lang="$ContentLocale" class="no-js">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<% base_tag %>
	<title><% if $MetaTitle %>$MetaTitle<% else %>$Title<% end_if %> | $SiteConfig.Title</title>

	$AugmentedMetaTags(false)
    $PreloadResources

	<% require themedCSS('all.min.css') %>
	<% require themedCSS('print.min.css','print') %>

    <% if CanonicalLink %>
    <link rel="canonical" href="$CanonicalLink">
    <% end_if %>

    <link rel="icon" href="$ThemeDir/images/icons/favicon.ico">
    <link rel="icon" href="$ThemeDir/images/icons/favicon.svg" type="image/svg+xml">
    <link rel="apple-touch-icon" href="$ThemeDir/images/icons/apple-touch-icon.png">
    <link rel="manifest" href="$ThemeDir/images/icons/site.webmanifest">
    <% if $MetaThemeColor %>
    <meta name="theme-color" content="$MetaThemeColor">
    <%--
    <meta name="theme-color" content="#f8f9fa" media="(prefers-color-scheme: light)">
    <meta name="theme-color" content="#212529" media="(prefers-color-scheme: dark)">
    --%>
    <% end_if %>

</head>
<body class="$ClassName.ShortName<% if not $Menu(2) %> no-sidebar<% end_if %>" <% if $i18nScriptDirection %>dir="$i18nScriptDirection"<% end_if %>>
<% include Header %>
<section class="main typography" role="main">
    $Layout
</section>
<% include Footer %>
<% include ToastMessages %>
<% include Modal %>
</body>
</html>
