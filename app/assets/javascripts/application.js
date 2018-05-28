// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require twitter/bootstrap
//= require_tree .
//= require Chart.min.js
//= require jquery
//= require raty-js

$(function() {
  let post_score_array = [
    "#post_score_0_point",
    "#post_score_1_point",
    "#post_score_2_point",
    "#post_score_3_point",
    "#post_score_4_point"
  ];

  //raty-jsの設定、クリックされたらhidden_fieldに値をセットする
  $.each(post_score_array, function(index, value){
    $(".points" + index).raty({score: 0, starType: 'i'})
    $(".points" + index).raty('set', {
      click: function(score) {
        $(value).val(score);
      }
    });
  })
})
