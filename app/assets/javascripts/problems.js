//= require ace/ace

$(document).ready(function(){
    'use strict';
    var editor = ace.edit("editor");
    var textarea = $('textarea[name="textarea"]').hide();

    var curLanguage = document.getElementById('language').getAttribute('value');
    editor.setTheme("ace/theme/monokai");
    /*
    if(curLanguage === "C" ||curLanguage === "C++"){
	editor.getSession().setMode("ace/mode/c_cpp");
    }else{
	editor.getSession().setMode("ace/mode/" + curLanguage);
    }
    */
    changeLanguage(editor, curLanguage);
    editor.setValue($('#' + curLanguage +'-running-code').val(), -1);
    editor.setFontSize(18);

    document.getElementById('language-selector').value = capitalize(curLanguage);

    //When the submit button is pressed, insert the text from the code
    //editor into the hidden textarea so it can be posted.
    $("#submit_button").click(function() {
	textarea.val(editor.getSession().getValue());
	$('#result').empty();
    });

    $('#language-selector').click(function(){
	console.log($(this).val());
	if($(this).val().toLowerCase() === curLanguage){ 
	    document.getElementById('language-selector').value = capitalize(curLanguage);
	    	    
											    return;
	}

	document.getElementById(curLanguage + '-running-code').value = editor.getSession().getValue();
	
	curLanguage = $(this).val().toLowerCase();
	document.getElementById('language').value = curLanguage;
	
	//change the editor's language setting.
	changeLanguage(editor, curLanguage);
	editor.setValue($('#' + curLanguage + '-running-code').val(), -1);

	//modify the edit test button if necessary
	var editTestButton = document.getElementById('edit-test-button');
	if(editTestButton !== undefined){
	    editTestButton.href = getNewQueryString(editTestButton.href, curLanguage);
	}
    });
    

    $('form').on('submit', function(event){
	
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
		 		 
		    $('#result').append("<div class='alert alert-info' role='alert'>" + data.text + "</div>");
		    queryServerForResult(data.submission, updateSubmissionStatus);
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
  Updates the page with an appropriate banner when called.

  @param {Object} result An object that should have an attribute 'result'
*/
function updateSubmissionStatus(result){

    //remove the running banner
    $('.alert.alert-info').remove();
    
    console.log(result);
    
    if(result.result === "Success"){
	//if the result was correct, put a green pass banner
	$('#result').append("<div class='alert alert-success' role='alert'>PASS</div>");
    }else{
	//if the result was not correct, put a red FAIL banner
	$('#result').append("<div class='alert alert-danger' role='alert'>FAIL</div>");
    }
    
    //make it so the user can click the button already
    $("#submit_button").prop('disabled', false);
    
}

/*
  This method repeatedly queries the server for the result of the user's 
  submission.
  
  @param {Object} An object containing the details of the submission.
  @param {Function} Function to be called when the submission has been graded.
*/
function queryServerForResult(submission, callback){
    var intervalId = window.setInterval(function(){
	$.get(
	    "/submission/" + submission.id +"/check",
	    submission,
	    function(data, status){
		if(status === "success"){
		    //console.log("success");
		    //console.log("data");
		  		    
		    //if the submission has been graded, stop querying the server
		   if(data.completed === true){
		       window.clearInterval(intervalId);
		       console.log("The submission has been graded");
		       callback(data);
		   }
		}else{
		    console.log("something other than success");
		    console.log(status);
		}
	    },
	    "JSON");

    }, 5000);
}

/*
  Returns the passed string with first letter capitalized.

  @param {String} str The string to be capitalized.
*/
function capitalize(str){
    return str.charAt(0).toUpperCase() + str.slice(1);
}

/*
  Given the ace editor object and the current programming language, sets 
  appropriate syntax highlighting rules in the editor.

  @param {Object} editor The ace editor object
  @param {String} curLanguage The name of the current language in lowercase.
*/
function changeLanguage(editor, curLanguage){
    if(curLanguage === "c" || curLanguage === "c++"){
	editor.getSession().setMode("ace/mode/c_cpp");
    }else{
	editor.getSession().setMode("ace/mode/" + curLanguage);
    }
}

function getNewQueryString(url, language){
    var indexOfQueryString = url.indexOf("?") + 1;
    var queryString = url.substring(indexOfQueryString);
    var uri = url.substring(0, indexOfQueryString);
    
    var problemId = queryString.substring(queryString.indexOf("&"));

    var newUrl = uri + "language_name=" + language + problemId;
    return newUrl;

}
