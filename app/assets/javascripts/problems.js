//= require ace/ace

$(document).ready(function(){
    var editor = ace.edit("editor");
    var textarea = $('textarea[name="textarea"]').hide();

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
			$(".alert.alert-info").remove();
			$('#result').append("<div class='alert alert-success' role='alert'>" + result + "</div>");
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
	    "/check/" + submission.id,
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




