<% if $Tags %>
	<ul class="list-unstyled">
		<% loop $Tags %>
			<li>
				<a href="$Link" title="$Title">
					<span class="text">$Title</span>
				</a>
			</li>
		<% end_loop %>
	</ul>
<% end_if %>
