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
//= require activestorage

//= require_tree .
//= require jquery
//= require bootstrap-sprockets

$(function () {
	//posts#new,createでの画像プレビュー
	function readURL(input) {
		console.log(input);
		if(input.files && input.files[0]){
			var reader = new FileReader();
			reader.onload = function (e) {
				$('.img_prev').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

    $('.img_field').change(function () {
      readURL(this);
    });
});