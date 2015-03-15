//= require ace/ace
'use strict';
(function($){
    $(document).ready(function(){
	

	var testEditor = ace.edit("test-code-editor");
	var startEditor = ace.edit("starter-code-editor");
	var languageName = $("#language-name").val();
	
	
	
	testEditor.getSession().setMode("ace/mode/" + languageName);
	startEditor.getSession().setMode("ace/mode/" + languageName);


	


    });

    
})(jQuery);

