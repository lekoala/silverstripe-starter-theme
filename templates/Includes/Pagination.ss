<%-- NOTE: Before including this, you will need to wrap the include in a with block  --%>

<% if $MoreThanOnePage %>
<nav aria-label="blog navigation">
  <ul class="pagination">
		<% if $NotFirstPage %>
			 <li class="page-item">
                <a class="page-link" href="{$PrevLink}" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
                </a>
             </li>
		<% end_if %>

		<% loop $PaginationSummary(4) %>
			<% if $CurrentBool %>
				 <li class="page-item active" aria-current="page"><span class="page-link">$PageNum</span></li>
			<% else %>
				<% if $Link %>
					 <li class="page-item"><a class="page-link" href="$Link">$PageNum</a></li>
				<% else %>
					 <li class="page-item"><span class="page-link">...</span></li>
				<% end_if %>
			<% end_if %>
		<% end_loop %>

		<% if $NotLastPage %>
			 <li class="page-item">
                <a class="page-link" href="{$NextLink}" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
                </a>
             </li>
		<% end_if %>
  </ul>
</nav>
<% end_if %>
