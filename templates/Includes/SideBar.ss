<% if $Menu(2) %>
<div class="col-md-3">
    <aside class="sidebar">
            <nav class="secondary">
                <% with $Level(1) %>
                    <h3>
                        $MenuTitle
                    </h3>
                    <ul>
                        <% include SidebarMenu %>
                    </ul>
                <% end_with %>
            </nav>
    </aside>
</div>
<% end_if %>
