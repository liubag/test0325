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
			 
			//验证用户名
			 	 if( $(this).is('#nickname') ){
					if( this.value=="" || this.value.length < 3 || this.value.length > 20 ){
						$parent.find(".formtips").remove();
						var errorMsg = '请输入3-20位的用户名.';
                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
                        return;
					}else{
					   //异步：
						 $.ajax({
								type: "POST",
								url: "/WangGe/checkNickname.do?audience.audience_nickname=" + this.value,
								dataType: 'text',
								contentType:"text/html;charset=utf-8",
								async:false,
								error:function(){
								},
								success: function(data){
									if(data=="success"){
										$parent.find(".formtips").remove();
										var okMsg = '该会员名可用.';
								    	$parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
									}else{
										$parent.find(".formtips").remove();
										var errorMsg = '该会员名已经存在.';
			                        	$parent.append('<span class="formtips onError">'+errorMsg+'</span>');
									}	
								},
								complete:function(){
							  		return;
								}
							});	
					}
					return;
			 } 
			
			 if( $(this).is('#idcard') ){
					if( this.value=="" || this.value.length < 18|| this.value.length > 20 ){
					    var errorMsg = '请正确输入身份证号码.';
                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}else{
					    //异步：
						 $.ajax({
								type: "POST",
								url: "/WangGe/checkAudienceIdcard.do?audience.audience_idcard=" + this.value,
								dataType: 'text',
								contentType:"text/html;charset=utf-8",
								async:false,
								error:function(){
								},
								success: function(data){
									if(data=="success"){
										$parent.find(".formtips").remove();
										var okMsg = '身份证可用.';
								    	$parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
									}else{
										$parent.find(".formtips").remove();
										var errorMsg = '身份证已经被注册.';
			                        	$parent.append('<span class="formtips onError">'+errorMsg+'</span>');
									}	
								},
								complete:function(){
							  		return;
								}
							});	
					}
					return;
			 }
			  if( $(this).is('#pw') ){
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
					}else if($(this).val()!=$("#pw").val()){
						 var errorMsg = '两次密码输入不一致.';
                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}else{
					    var okMsg = '输入正确.';
					    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
					}
					return;
			 }
			 if( $(this).is('#truename') ){
					if( this.value=="" || this.value.length > 10 ){
						$parent.find(".formtips").remove();
						var errorMsg = '请输入真实姓名.';
                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}else{
						 var okMsg = '输入正确.';
					    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
					}
					return;
			 }
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
			 if( $(this).is('#randomNum') ){
					if(!check()){
					    var errorMsg = '验证码错误.';
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
			 	$("form .input #randomNum").trigger('blur');
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