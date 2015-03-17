'use strict';
(function($){
    $(document).ready(function(){
	var expectedResultEditor = ace.edit("expected-result-editor");
	var inputEditor = ace.edit("input-editor");
	


	expectedResultEditor.getSession().on('change', function(e){
	    $('#expected-result').val(expectedResultEditor.getSession().getValue());
	});

	
	inputEditor.getSession().on('change', function(e){
	    $('#input').val(inputEditor.getSession().getValue());
	});

	var expectedResult = $('#expected-result-input').val();
	var input = $('#result-input').val();

	
	expectedResultEditor.setValue(expectedResult, -1);
	inputEditor.setValue(input, -1);

    });
})(jQuery);
