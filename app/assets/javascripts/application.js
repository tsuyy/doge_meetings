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
//= require turbolinks
//= require bootstrap
//= require_tree .

$(document).on('turbolinks:load', function() {
  // missing all the semicolons. this is javascript now.
  setTimeout(function(){
    $('.flash').slideToggle(300)
  },4000)
  $('.sublinks.playdates li').on('click', function(){
    var id = this.id;
    var playdate = $(`.playdate.${id}`)
    if (playdate.css("display") != "block") {
      $('.dogs').hide()
      $('.playdate').hide()
      playdate.toggle(300);
    }
  })
  $('.my-dogs').on('click', function(){
    $('.playdate').hide()
    $('.dogs').show(300)
  })
})
