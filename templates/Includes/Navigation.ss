<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
</button>
<div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
        <% loop $Menu(1) %>
        <li class="nav-item">
            <a class="nav-link link-dark px-2<% if LinkingMode="current" %> active<% end_if %>"<% if LinkingMode="current" %> aria-current="page"<% end_if %> href="$Link" title="$Title.XML">$MenuTitle.XML</a>
        </li>
        <% end_loop %>
    </ul>
</div>
