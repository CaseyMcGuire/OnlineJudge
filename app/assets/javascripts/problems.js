//= require ace/ace

var editor;
var textarea;

$(document).ready(function(){
    editor = ace.edit("editor");
    textarea = $('textarea[name="textarea"]').hide();

    //at some point, the user should be able to 
    editor.setTheme("ace/theme/monokai");
    editor.getSession().setMode("ace/mode/python");


    $("#submit_button").click(function() {
	textarea.val(editor.getSession().getValue());
    });

    $("#submit_button").hover(function() {
	console.log("hello there");
    });

});
