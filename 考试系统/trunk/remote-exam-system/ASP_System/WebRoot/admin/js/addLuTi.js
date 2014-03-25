
$(document).ready(function () {
	
	$("form .required1").each(function () {
		var $required = $("<strong class='high'>*</strong>");
		$(this).parent().append($required);
	});
	
	$("form :input").blur(function () {							
		var $parent = $(this).parent();
		$parent.find(".formtips").remove();
	
		if($(this).is("#answer")){
			var Msg = "请正确输入答案"	;
			if (this.value == "") {				
				$parent.append('<span class="formtips onError">'+Msg+'</span>');
			}else{
				$parent.append('<span class="formtips onSuccess">'+Msg+'</span>');
			}	
		}
		if($(this).is("#topic")){
			var Msg = "请正确输入题目"	;
			if (this.value == "") {				
				$parent.append('<span class="formtips onError">'+Msg+'</span>');
			}else{
				$parent.append('<span class="formtips onSuccess">'+Msg+'</span>');
			}	
		}
		
		if($(this).is("#options")){
			var Msg = "请正确输入题目选项"	;
			if (this.value == "") {				
				$parent.append('<span class="formtips onError">'+Msg+'</span>');
			}else{
				$parent.append('<span class="formtips onSuccess">'+Msg+'</span>');
			}	
		}
		
		if($(this).is("#analysis")){
			var Msg = "请正确输入答案解析"	;
			if (this.value == "") {				
				$parent.append('<span class="formtips onError">'+Msg+'</span>');
			}else{
				$parent.append('<span class="formtips onSuccess">'+Msg+'</span>');
			}	
		}
	}).keyup(function () {
		$(this).triggerHandler("blur");
	}).focus(function () {
		$(this).triggerHandler("blur");
	});
	
	
	$("#submit").click(function () {		
		$("form .required1:input").trigger('blur');
	
		
		$("#course_id").parent().find(".formtips").remove();
		$("#type").parent().find(".formtips").remove();
		$("#teacher_id").parent().find(".formtips").remove();
				
		if($("#course_id option:selected").text()!="--请选择科目--"){
			$("#course_id").parent().append('<span class="formtips onSuccess">'+"请选择科目"+'</span>');
			
		}else{
			$("#course_id").parent().append('<span class="formtips onError">'+"请选择科目"+'</span>');
		}
		
		
		if($("#teacher_id option:selected").text()!="--请选择出题老师--"){
			$("#teacher_id").parent().append('<span class="formtips onSuccess">'+"请选择老师"+'</span>');
		}else{
			$("#teacher_id").parent().append('<span class="formtips onError">'+"请选择老师"+'</span>');
			
		}		
		if($("#type option:selected").text()!="--请选择类型--"){
			$("#type").parent().append('<span class="formtips onSuccess">'+"请选择类型"+'</span>');
		}else{
			$("#type").parent().append('<span class="formtips onError">'+"请选择类型-"+'</span>');
			
		}	
	
		var numError = $("form .onError").length;
		
		if (numError != 0) {			
			  return false;
			  
		}
	});
});

