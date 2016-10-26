// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

$(function() {
  var LEFT_ARROW_KEY_CODE = 37
  var RIGHT_ARROW_KEY_CODE = 39

  $(document).on('keydown', function(e) {
    if (e.keyCode === LEFT_ARROW_KEY_CODE) {
      $("a.js-left-arrow:visible").click()
      console.log("left arrow key pressed")
    } else if (e.keyCode === RIGHT_ARROW_KEY_CODE) {
      $("a.js-right-arrow:visible").click()
    }
  })
})
