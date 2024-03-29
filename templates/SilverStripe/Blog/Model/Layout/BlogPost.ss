<% require css('silverstripe/blog: client/dist/styles/main.css') %>

<div class="container">
    <div class="row">
        <div class="blog-entry <% if SideBarView %>col-md-9<% else %>col-md-12<% end_if %>">
	<article>
		<h1>$Title</h1>

		<% if $FeaturedImage %>
			<p class="post-image">$FeaturedImage.ScaleWidth(795)</p>
		<% end_if %>

		<div class="content">$Content</div>

		<% include SilverStripe\\Blog\\EntryMeta %>
	</article>

	$Form
	$CommentsForm
        </div>
        <% include SilverStripe\\Blog\\BlogSideBar %>
    </div>
</div>


