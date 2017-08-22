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
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require select2-full
//= require react
//= require react_ujs
//= require components
//= require_tree .

$(document).ready(function() {
	$( '.select2' ).select2({
		theme: "bootstrap"
		containerCssClass: ':all:'
	});
});

$(document).ready(function () {
    var text_max = 200;
    $('#post_feedback').html(0 + ' / ' + text_max);

    $('#postarea').keyup(function() {
        var text_length = $('#postarea').val().length;

        $('#post_feedback').html(text_length + ' / ' + text_max);
    });
});

$(document).ready(function () {
    $('.sendButton').attr('disabled',true);
    
    $('#postarea').keyup(function(){
        if($(this).val().length !=0){
            $('.sendButton').attr('disabled', false);
        }
        else
        {
            $('.sendButton').attr('disabled', true);        
        }
    })
});