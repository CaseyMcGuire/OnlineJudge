//= require ace/ace

(function($){
    $(document).ready(function(){
	'use strict';
	

	var testEditor = ace.edit("test-code-editor");
	var startEditor = ace.edit("starter-code-editor");
	var languageName = $("#language-name").val();
	
	//testEditor.getSession().setMode("ace/mode/" + languageName);
//	startEditor.getSession().setMode("ace/mode/" + languageName);
	changeLanguage(testEditor, languageName);
	changeLanguage(startEditor, languageName);
	testEditor.setTheme("ace/theme/monokai");
	startEditor.setTheme("ace/theme/monokai");
	
	testEditor.setFontSize(18);
	startEditor.setFontSize(18);
	/*
	$("#submit-button").click(function(){
	    $("#start_code").val(startEditor.getSession().getValue());
	    $("#test_code").val(testEditor.getSession().getValue());
	    console.log($("#start_code").val());
	    console.log($("#test_code").val());
	});
	*/

	
	testEditor.getSession().on('change', function(e){
	    $('#test_code').val(testEditor.getSession().getValue());
	    console.log($('#starter_code').val());
	});

	startEditor.getSession().on('change', function(e){
	    $('#starter_code').val(startEditor.getSession().getValue());
	});


	var starterCode = $("#old-starter-code").val();
	var testCode = $("#old-test-code").val();
	

	//if we're editing an old test, we have to insert the old 
	//text into the editors 
	console.log(starterCode);
	console.log(testCode);

	//insert starter code into the editor
	//-1 makes the cursor go to the beginning of editor
	startEditor.setValue(starterCode, -1);
	
	//insert test code into the editor
	//-1 makes the cursor go to beginning of editor
	testEditor.setValue(testCode, -1);

    });
})(jQuery);

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

