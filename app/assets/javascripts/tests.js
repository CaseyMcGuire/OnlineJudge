//= require ace/ace
'use strict';
(function($){
    $(document).ready(function(){
	

	var testEditor = ace.edit("test-code-editor");
	var startEditor = ace.edit("starter-code-editor");
	var languageName = $("#language-name").val();
	
	
	
	testEditor.getSession().setMode("ace/mode/" + languageName);
	startEditor.getSession().setMode("ace/mode/" + languageName);
	
	
	/*
	$("#submit-button").hover(function(){
	    $("#start_code").val(startEditor.getSession().getValue());
	    $("#test_code").val(testEditor.getSession().getValue());
	    console.log($("#start_code").val());
	    console.log($("#test_code").val());
	});
	*/

	testEditor.getSession().on('change', function(e){
	    $('#test_code').val(testEditor.getSession().getValue());
	    $('#starter_code').val(startEditor.getSession().getValue());
	    console.log($('#starter_code').val());
	});


	var starterCode = $("#old-starter-code").val();
	var testCode = $("#old-test-code").val();
	

	//if we're editing an old test, we have to insert the old 
	//text into the editors 
	console.log(starterCode);
	console.log(testCode);

	//insert starter code into the editor
	//-1 makes the cursor go to the beginning of editor
	if(starterCode !== undefined){
	    startEditor.setValue(starterCode, -1);
	}
	
	//insert test code into the editor
	//-1 makes the cursor go to beginning of editor
	if(testCode !== undefined){
	    testEditor.setValue(testCode, -1);
	}
	


    });

    
})(jQuery);

