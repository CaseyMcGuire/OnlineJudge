(function($){
    'use strict';

    $(document).ready(function(){
	var expectedResultEditor = ace.edit("expected-result-editor");
	var inputEditor = ace.edit("input-editor");

	var sampleInputEditor = ace.edit("sample-input-editor");
	var sampleOutputEditor = ace.edit("sample-output-editor");
	


	expectedResultEditor.getSession().on('change', function(e){
	    $('#expected-result').val(expectedResultEditor.getSession().getValue());
	});

	inputEditor.getSession().on('change', function(e){
	    $('#input').val(inputEditor.getSession().getValue());
	});

	sampleInputEditor.getSession().on('change', function(e){
	    console.log('sampleinputeditor');
	    $('#sample_input').val(sampleInputEditor.getSession().getValue());
	});

	sampleOutputEditor.getSession().on('change', function(e){
	    console.log('sampleoutputeditor');
	    $('#sample_output').val(sampleOutputEditor.getSession().getValue());
	});

				     

	var expectedResult = $('#expected-result-input').val();
	var input = $('#result-input').val();

	var sampleOutput = $('#sample_output').val();
	var sampleInput = $('#sample_input').val();

	
	expectedResultEditor.setValue(expectedResult, -1);
	inputEditor.setValue(input, -1);
	sampleInputEditor.setValue(sampleInput, -1);
	sampleOutputEditor.setValue(sampleOutput, -1);

    });
    
})(jQuery);
