
$(document).ready(function () {
	
	$("form .required1").each(function () {
		var $required = $("<strong class='high'>*</strong>");
		$(this).parent().append($required);
	});
	
	$("form :input").blur(function () {							
		var $parent = $(this).parent();
		$parent.find(".formtips").remove();
		if ($(this).is("#exam_name")) {			
			$(this).val($.trim($(this).val()));  //消除文本框的空格
			var Msg = "试卷名称不能为空";				
			if (this.value == "") {				
				$parent.append('<span class="formtips onError">'+Msg+'</span>');
			}else{
				$parent.append('<span class="formtips onSuccess">'+Msg+'</span>');
			}
		}

		if ($(this).is("#single")) {			
			var Msg = "请正确输入(0~50)";					
			if (this.value == "" || ( this.value!="" && !/^[0-9]+$/.test(this.value) )|| this.value>50||this.value<0) {				
				$parent.append('<span class="formtips onError">'+Msg+'</span>');
			}else{
				$parent.append('<span class="formtips onSuccess">'+Msg+'</span>');
			}
			
		}
		
		if ($(this).is("#many")) {
			var Msg = "请正确输入(0~50)"					
			if (this.value == "" || ( this.value!="" && !/^[0-9]+$/.test(this.value) )|| this.value>50||this.value<0) {				
				$parent.append('<span class="formtips onError">'+Msg+'</span>');
			}else{
				$parent.append('<span class="formtips onSuccess">'+Msg+'</span>');
			}
						
		}
		
		if ($(this).is("#uncertain")) {
			var Msg = "请正确输入(0~50)"				
			if (this.value == "" || ( this.value!="" && !/^[0-9]+$/.test(this.value) )|| this.value>50||this.value<0) {				
				$parent.append('<span class="formtips onError">'+Msg+'</span>');
			}else{
				$parent.append('<span class="formtips onSuccess">'+Msg+'</span>');
			}		
		}
		
		if($(this).is("#time")){
			var Msg = "请正确输入考试时长"	
			if (this.value == "" || ( this.value!="" && !/^[0-9]+$/.test(this.value) )||this.value<0) {				
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
		var single=new Number($("#single").val());
		var many=new Number($("#many").val());
		var uncertain=new Number($("#uncertain").val());
		
		$("form .required1:input").trigger('blur');
		$("#all").parent().find(".formtips").remove();
		$("#course_id").parent().find(".formtips").remove();
		$("#test-1").parent().find(".formtips").remove();
		$("#teacher_id").parent().find(".formtips").remove();
		$("#begin_time").parent().find(".formtips").remove()
		$("#begin_date").parent().find(".formtips").remove()
		
		
		
		if(single+many+uncertain!=10){
			$("#all").parent().append('<span class="formtips onError">'+"单选题,多选题,不定选题和起来要50道"+'</span>');
		}else{
			$("#all").parent().append('<span class="formtips onSuccess">'+"单选题,多选题,不定选题和起来要50道"+'</span>');
		}

		if($("#course_id option:selected").text()!="--请选择科目--"){
			$("#course_id").parent().append('<span class="formtips onSuccess">'+"请选择科目"+'</span>');
			
		}else{
			$("#course_id").parent().append('<span class="formtips onError">'+"请选择科目"+'</span>');
		}
		
		if($(".hid").val()!=""){
			$("#test-1").parent().append('<span class="formtips onSuccess">'+"请选择班级"+'</span>');
		}else{
			$("#test-1").parent().append('<span class="formtips onError">'+"请选择班级"+'</span>');			
		}
		
		if($("#teacher_id option:selected").text()!="--请选择老师--"){
			$("#teacher_id").parent().append('<span class="formtips onSuccess">'+"请选择老师"+'</span>');
		}else{
			$("#teacher_id").parent().append('<span class="formtips onError">'+"请选择老师"+'</span>');
			
		}		
	
		if($(".begin_time").val()==""){
			$(".begin_time").parent().append('<span class="formtips onError">'+"请选择开考时间"+'</span>');
		}else{
			$(".begin_time").parent().append('<span class="formtips onSuccess">'+"请选择开考时间"+'</span>');
		}
		if($(".begin_date").val()==""){
			$(".begin_date").parent().append('<span class="formtips onError">'+"请选择开考日期"+'</span>');
		}else{
			$(".begin_date").parent().append('<span class="formtips onSuccess">'+"请选择开考日期"+'</span>');
		}
		
		var numError = $("form .onError").length;
		if (numError != 0) {			
			  return false;
			  
		}
	});
});

