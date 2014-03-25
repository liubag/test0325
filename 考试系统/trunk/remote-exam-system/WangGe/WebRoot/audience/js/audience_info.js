$(function(){
	$(".field input").focus(function(){
		$(".field").removeClass("hover");
		$(this).parents(".field").addClass("hover");
	});
	
	//如果是必填的，则加红星标识.
		$(".required").each(function(){
			var $required = $("<strong class='high'> *</strong>"); //创建元素
			$(this).parent().append($required); //然后将它追加到文档中
		});
		
		  //文本框失去焦点后
	    $("input").blur(function(){
			 var $parent = $(this).parent();
			 $parent.find(".formtips").remove();
			 
			//验证联系方式
			 if( $(this).is('#phone') ){
					if( this.value=="" || this.value.length < 6|| this.value.length > 15 ){
					    var errorMsg = '请正确输入电话号码.';
                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}else{
					    var okMsg = '输入正确.';
					    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
					}
					return;
			 }		
				 		 
		});//end blur
		
		$("input").keyup(function(){
			var $parent = $(this).parent();
			 $parent.find(".formtips").remove();	
		 			  
		});
		
		//提交，最终验证。
		 $('#submit-btn').click(function(){
			 	$("form .input .required").trigger('blur');
				var numError = $('form .onError').length;
					if(numError){
						return false;
					} 		
				
				
		 });
		//重置
		$("#reset-btn").click(function(){
			$(".formtips").remove(); 
		});
		
		//
});