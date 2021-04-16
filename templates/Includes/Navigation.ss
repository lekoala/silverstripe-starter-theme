<ul class="nav me-auto">
    <% loop $Menu(1) %>
    <li class="nav-item">
        <a class="nav-link link-dark px-2<% if LinkingMode="current" %> active<% end_if %>"<% if LinkingMode="current" %> aria-current="page"<% end_if %> href="$Link" title="$Title.XML">$MenuTitle.XML</a>
    </li>
    <% end_loop %>
</nav>
