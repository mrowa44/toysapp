// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function ready(){
  (function nameBorder() {
    var $nameField = $('#room_toys_attributes_0_name');
    var borderDelay = 500;
    var borderStyle = '4px solid';
    var lightRed = '#F06868';
    function redBorder() {
      $nameField.css('border', borderStyle + lightRed);
      window.setTimeout(function() { transparentBorder() }, borderDelay);
    };
    function transparentBorder() {
      $nameField.css('border', borderStyle + ' transparent');
      window.setTimeout(function() { redBorder() }, borderDelay);
    };
    redBorder();
  })();

  $('#room_form li').mouseenter(function() {
    $(this).css("font-size", "200%");
  });
  $('#room_form li').mouseleave(function() {
    $(this).css("font-size", "100%");
  });
}

$(document).on('page:load', ready);
$(document).ready(ready);
