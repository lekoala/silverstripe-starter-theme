<% require css('silverstripe/blog: client/dist/styles/main.css') %>

<div class="container">
    <div class="row">
        <div class="blog-entry <% if SideBarView %>col-md-9<% else %>col-md-12<% end_if %>">
            <article>
                <h1>
                    <% if $ArchiveYear %>
                        <%t SilverStripe\\Blog\\Model\\Blog.Archive 'Archive' %>:
                        <% if $ArchiveDay %>
                            $ArchiveDate.Nice
                        <% else_if $ArchiveMonth %>
                            $ArchiveDate.format('MMMM, y')
                        <% else %>
                            $ArchiveDate.format('y')
                        <% end_if %>
                    <% else_if $CurrentTag %>
                        <%t SilverStripe\\Blog\\Model\\Blog.Tag 'Tag' %>: $CurrentTag.Title
                    <% else_if $CurrentCategory %>
                        <%t SilverStripe\\Blog\\Model\\Blog.Category 'Category' %>: $CurrentCategory.Title
                    <% else %>
                        $Title
                    <% end_if %>
                </h1>

                <% if Content %>
                <div class="content">$Content</div>
                <hr>
                <% end_if %>


                <% if $PaginatedList.Exists %>
                    <% loop $PaginatedList %>
                        <% include SilverStripe\\Blog\\PostSummary %>
                        <hr/>
                    <% end_loop %>
                <% else %>
                    <p><%t SilverStripe\\Blog\\Model\\Blog.NoPosts 'There are no posts' %></p>
                <% end_if %>
            </article>

            $Form
            $CommentsForm

            <% with $PaginatedList %>
                <% include SilverStripe\\Blog\\Pagination %>
            <% end_with %>
        </div>
        <% include SilverStripe\\Blog\\BlogSideBar %>
    </div>
</div>
