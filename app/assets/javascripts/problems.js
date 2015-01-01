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


    $('form').on('submit', function(){

	event.preventDefault();
	var form = $(this),
	url = form.attr('action'),
	method = form.attr('method'),
	data ={};


	//go through form and the values of all names attributes
	//to the data object
	form.find('[name]').each(function(index, value) {
	    var that = $(this),
	    name = that.attr('name'),
	    value = that.val();

	    data[name] = value;
	});
	
	console.log(data);


	$.ajax({
	    url: url,
	    type: method,
	    data: data,
	    success: function(response){
		console.log(response);
	    },
	    error: function(data){
		console.log("error");
	    },
	    dataType: 'JSON'
	});
	
	return false;
    });
    
});



