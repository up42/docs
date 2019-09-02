// Make sure that all external links open in a separate tab.
if (window.jQuery) {
  $(function () {
      $('a[class="reference external"]').each(
      function () {
        $(this).attr('target', '_blank');
      });
    });
}
