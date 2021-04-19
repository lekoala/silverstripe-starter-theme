<div class="toast hide" role="alert" aria-live="assertive" aria-atomic="true">
  <div class="toast-header">
    <% if Icon %>
    <img src="$Icon.Link" class="rounded me-2" alt="$Icon.Title">
    <% end_if %>
    <strong class="me-auto">$Title</strong>
    <small>$Created.Ago</small>
    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
  </div>
  <div class="toast-body">
    $Message
  </div>
</div>
