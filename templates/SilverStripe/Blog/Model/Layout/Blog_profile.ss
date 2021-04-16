<% require css('silverstripe/blog: client/dist/styles/main.css') %>

<div class="container">
    <div class="row">
        <div class="blog-entry <% if SideBarView %>col-md-9<% else %>col-md-12<% end_if %>">

	<% include SilverStripe\\Blog\\MemberDetails %>
    <hr/>

	<% if $PaginatedList.Exists %>
        <h2><%t SilverStripe\\Blog\\Model\\Blog.PostsByUser 'Posts by {firstname} {surname} for {title}' firstname=$CurrentProfile.FirstName surname=$CurrentProfile.Surname title=$Title %></h2>
		<% loop $PaginatedList %>
			<% include SilverStripe\\Blog\\PostSummary %>
            <hr/>
		<% end_loop %>
	<% end_if %>

	$Form
	$CommentsForm

	<% with $PaginatedList %>
		<% include SilverStripe\\Blog\\Pagination %>
	<% end_with %>

        </div>
        <% include SilverStripe\\Blog\\BlogSideBar %>
    </div>
</div>


