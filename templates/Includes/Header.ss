<nav class="navbar navbar-expand-lg text-bg-light">
  <div class="container d-flex flex-wrap">
    <% include Navigation %>
  </div>
</nav>
<header class="py-5 mb-4 border-bottom">
  <div class="container d-flex flex-wrap justify-content-center">
    <a href="$BaseHref" class="d-flex align-items-center mb-3 text-dark text-decoration-none">
        <%-- h1 is reserved for the page title --%>
        <p class="display-3 mb-0 mx-2">$SiteConfig.Title</p>
        <% if $SiteConfig.Tagline %>
		<p class="">$SiteConfig.Tagline</p>
		<% end_if %>
    </a>
    <% if SearchControllerLink %>
    <form class="col-12 col-lg-auto mb-3 mb-lg-0" action="$SearchControllerLink">
        <input type="search" name="q" class="form-control" placeholder="Search..." spellcheck="false">
    </form>
    <% end_if %>
  </div>
</header>
