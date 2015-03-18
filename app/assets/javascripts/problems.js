//= require ace/ace
'use strict';
$(document).ready(function(){
    var editor = ace.edit("editor");
    var textarea = $('textarea[name="textarea"]').hide();

    var curLanguage = document.getElementById('language').getAttribute('value');
    editor.setTheme("ace/theme/monokai");
    editor.getSession().setMode("ace/mode/" + curLanguage);
    editor.setValue($('#' + curLanguage +'-starter-code').val(), -1);
    editor.setFontSize(18);

    document.getElementById('language-selector').value = capitalize(curLanguage);

    //When the submit button is pressed, insert the text from the code
    //editor into the hidden textarea so it can be posted.
    $("#submit_button").click(function() {
	textarea.val(editor.getSession().getValue());
    });

   

    $('#language-selector').click(function(){
	console.log($(this).val());
	if($(this).val().toLowerCase() === curLanguage ||
	   !window.confirm("Are you sure? You will lose all progress")){ 	   	    document.getElementById('language-selector').value = capitalize(curLanguage);
	    	    
											    return;
	}
	
	curLanguage = $(this).val().toLowerCase();
	editor.getSession().setMode('ace/mode/' + curLanguage);
	editor.setValue($('#' + curLanguage + '-starter-code').val(), -1);
    });
    

    $('form').on('submit', function(){
	
	event.preventDefault();
	//disable our button
	$('#submit_button').prop('disabled', true);
	var form = $(this),
	url = form.attr('action'),
	data ={};

	console.log(url);
	
	
	//go through form and put the values of all names attributes
	//into the data object
	form.find('[name]').each(function(index, value) {
	    var that = $(this),
	    name = that.attr('name'),
	    value = that.val();

	    data[name] = value;
	});
	
	console.log(data);

	//Send the result back to the server
	$.post(
	    url,
	    data, 
	    function(data, status){
		console.log(status);
		if(status === 'success'){
		    console.log(data);
		   
		    $('#old').remove();//What does this do?
		    $('#result').append("<div class='alert alert-info' role='alert'>" + data.text + "</div>");
		    queryServerForResult(data.submission, function(result){
			$('.alert.alert-info').remove();

			//This is pretty brittle... probably want to change it
			if(result.status_id === 2){
			    //if the result was correct, put a green pass banner
			    $('#result').append("<div class='alert alert-success' role='alert'>PASS</div>");
			}else{
			    //if the result was not correct, put a red FAIL banner
			    $('#result').append("<div class='alert alert-danger' role='alert'>FAIL</div>");
			}
			console.log("We're in the callback!");
			console.log(result);
			$("#submit_button").prop('disabled', false);

		    });
		}else{
		    console.log("error");
		}
		console.log(data);
	    }, 
	    "JSON");
	
	

	return false;
    });
    
});

/*
  This method repeatedly queries the server for the result of the user's 
  submission.
  
  @param {Object} An object containing the details of the submission.
  @param {Function} Function to be called when the submission has been graded.
*/
function queryServerForResult(submission, callback){

    //This method needs to:
    //repeatedly query the server as to the status of the user's submission
    //perhaps pass a data object with problem and submission id

    var intervalId = window.setInterval(function(){
	
	$.get(
	    "/submission/" + submission.id +"/check",
	    submission,
	    function(data, status){
		if(status === "success"){
		    console.log("success");
		    console.log("data");
		    console.log(data);
		    console.log(data.submission.completed);
		    
		    //if the submission has been graded, stop querying the server
		   if(data.submission.completed === true){
		       window.clearInterval(intervalId);
		       console.log("The submission has been graded");
		       callback(data.submission);
		   }
		}else{
		    console.log("something other than success");
		    console.log(status);
		}
	    },
	    "JSON");

    }, 5000);
    

}

function capitalize(str){
    console.log(str);
    return str.charAt(0).toUpperCase() + str.slice(1);
}


