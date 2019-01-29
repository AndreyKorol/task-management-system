// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready (function() {
  for (var i = 0; i < $('td.check-box input').length; i++) {
    if (($('td.check-box input')[i]).getAttribute('data-params') == 'complete=true') {
      $('td.check-box input')[i].checked = true
      $($('td.check-box input')[i].parentNode.previousSibling).toggleClass('withline');
    }
  }

  $('tbody').on('click', 'tr .checkbox', function(){
    $(this.parentNode.previousSibling).toggleClass('withline');
  })

  $('tbody').sortable({
    axis: "y",
    cursor: "move",

    update: function (event, ui) {
        var data = $(this).sortable('serialize');

        $.ajax({
            url: '/goals',
            type: 'PUT',
            data: data
        });
    }
  });
})