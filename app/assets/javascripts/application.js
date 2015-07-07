$(function () {
  $('#investors th a').live('click', function () {
    $.getScript(this.href);
    return false;
  });
})

$('#investors_search input').keyup(function () {
  $.get($('#investors_search').attr('action'), &crarr;
    $('#investors_search').serialize(), null, 'script');
  return false;
});
