<% if ToastMessages %>
<div class="toast-container position-fixed top-0 end-0 p-3" style="z-index: 5">
<% loop ToastMessages %>
<% include Toast %>
<% end_loop %>
</div>
<% end_if %>
