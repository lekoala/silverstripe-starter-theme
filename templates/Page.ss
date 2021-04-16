<!DOCTYPE html>
<html lang="$ContentLocale" class="no-js">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<% base_tag %>
	<title><% if $MetaTitle %>$MetaTitle<% else %>$Title<% end_if %> | $SiteConfig.Title</title>

	$MetaTags(false)

    <script type="module">
        document.documentElement.classList.remove('no-js');
        document.documentElement.classList.add('js');
    </script>

    $PreloadResources

	<% require themedCSS('all.min.css') %>
	<% require themedCSS('print.min.css','print') %>

    <% if CanonicalLink %>
    <link rel="canonical" href="$CanonicalLink">
    <% end_if %>

    <link rel="icon" href="$ThemeDir/images/favicon.ico">
    <link rel="icon" href="$ThemeDir/images/favicon.svg" type="image/svg+xml">
    <link rel="apple-touch-icon" href="$ThemeDir/images/apple-touch-icon.png">
    <link rel="manifest" href="$ThemeDir/images/site.webmanifest">
    <% if SiteConfig.ThemeColor %>
    <meta name="theme-color" content="$SiteConfig.ThemeColor">
    <% end_if %>

</head>
<body class="$ClassName.ShortName<% if not $Menu(2) %> no-sidebar<% end_if %>" <% if $i18nScriptDirection %>dir="$i18nScriptDirection"<% end_if %>>
<% include Header %>
<div class="main typography" role="main">
    $Layout
</div>
<% include Footer %>

<% require themedJavascript('script', 'module') %>

</body>
</html>
