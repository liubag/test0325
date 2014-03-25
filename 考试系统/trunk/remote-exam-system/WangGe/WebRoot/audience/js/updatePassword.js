$(function(){
	//如果是必填的，则加红星标识.
		$("input.required").each(function(){
			var $required = $("<strong class='high'>*</strong>"); //创建元素
			$(this).parent().append($required); //然后将它追加到文档中
		});
		
		  $("input").blur(function(){
			 var $parent = $(this).parent();
			 $parent.find(".formtips").remove();
			 
			 if($(this).is("#oldPw")){
			 	if( this.value=="" || this.value.length < 6 ){
					    var errorMsg = '请输入密码 最短6字符.';
                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}
			 }
			 
			 if( $(this).is('#newPw') ){
					if( this.value=="" || this.value.length < 6 ){
					    var errorMsg = '请输入密码 最短6字符.';
                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}else{
					    var okMsg = '输入正确.';
					    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
					}
					return;
			 }
			 
			 if( $(this).is('#rePw') ){
					if( this.value=="" || this.value.length < 6 ){
					    var errorMsg = '请再次输入密码 最短6字符.';
                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}else if($(this).val()!=$("#newPw").val()){
						 var errorMsg = '两次密码输入不一致.';
                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}else{
					    var okMsg = '输入正确.';
					    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
					}
					return;
			 }				 
		  });
		  
		  $('#yes2').click(function(){
				$("#form2 input.required").trigger('blur');
				var numError = $('#form2 .onError').length;
				if(numError){
					return false;
				}
		 });
		 
		 //重置
		$("#no2").click(function(){
			$(".formtips").remove(); 
		});
});
