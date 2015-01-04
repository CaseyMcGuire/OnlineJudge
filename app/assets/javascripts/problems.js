//= require ace/ace

var editor;
var textarea;
var latestResult;

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
	//disable our button
	$('#submit_button').prop('disabled', true);
	var form = $(this),
	url = form.attr('action'),
	data ={};

	console.log(url);
	
	
	//go through form and the values of all names attributes
	//to the data object
	form.find('[name]').each(function(index, value) {
	    var that = $(this),
	    name = that.attr('name'),
	    value = that.val();

	    data[name] = value;
	});
	
	console.log(data);
	
	$.post(
	    url,
	    data, 
	    function(data, status){
		console.log(status);
		if(status === 'success'){
		    console.log(data);
		    latestResult = data.submission;
		    $('#old').remove();
		    $('#result').append("<div id='old'>" + data.text + "</div>");
		}else{
		    console.log("error");
		}
		console.log(data);
	    }, 
	    "JSON");
	
	getResult();
	/*
	$.ajax({
	    url: url,
	    type: method,
	    data: data,
	    success: function(response){
		console.log(response.text);
		
	    },
	    error: function(jqXHR, textStatus, errorThrown){
		console.log(errorThrown);
		console.log(textStatus);
		console.log("error2");
	    },
	    dataType: 'JSON'
	});
	*/
	return false;
    });
    
});

/*
  This method repeatedly queries the server for the result of the user's 
  submission.

*/
function getResult(){

    //This method needs to:
    //repeatedly query the server as to the status of the user's submission
    //perhaps pass a data object with problem and submission id

    window.setInterval(function(){
	console.log(latestResult);
	$.get(
	    "/check/" + latestResult.id,
	    latestResult,
	    function(data, status){
		if(status === "success"){
		    console.log("success");
		}else{
		    console.log("something other than success");
		    console.log(status);
		}
	    },
	    "JSON");

    }, 5000);
    

}




