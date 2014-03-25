$(function(){
	
		var height = $("body").height();
		$("#rightIframe",parent.document.body).height(height + 50);
		
		
		//如果是必填的，则加红星标识.
		$("form :input.required").each(function(){
			var $required = $("<strong class='high'> *</strong>"); //创建元素
			$(this).parent().append($required); //然后将它追加到文档中
		});
		$("form :input.required2").each(function(){
			var $required = $("<strong class='high'> *</strong>"); //创建元素
			$(this).parent().append($required); //然后将它追加到文档中
		});
         //文本框失去焦点后
	    $('form :input').blur(function(){
			 
			 //验证用户名
			 if( $(this).is('#username') ){
					if( this.value=="" || this.value.length < 6 ){
						var $parent = $(this).parent();
			 			$parent.find(".formtips").remove();
						var errorMsg = '请输入至少6位的用户名.';
                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}
			 }
			 //密码
			 if( $(this).is('#oldPw1') ){
				 	var $parent = $(this).parent();
		 			$parent.find(".formtips").remove();
					if( this.value==""){
					    var errorMsg = '密码不能为空.';
                        $parent.append('<span class="formtips onError2">'+errorMsg+'</span>');
					}
					return;
			 }
			 
			 var $parent = $(this).parent();
			 $parent.find(".formtips2").remove();
			 //旧密码
			 if( $(this).is('#oldPw') ){
					if( this.value=="" || this.value.length < 6 ){
					    var errorMsg = '请输入至少6位的密码.';
                        $parent.append('<span class="formtips2 onError2">'+errorMsg+'</span>');
					}else{
					    var okMsg = '输入正确.';
					    $parent.append('<span class="formtips2 onSuccess">'+okMsg+'</span>');
					}
			 }
			 
			  //新密码
			 if( $(this).is('#newPw') ){
					if( this.value=="" || this.value.length < 6 ){
					    var errorMsg = '请输入至少6位的密码.';
                        $parent.append('<span class="formtips2 onError2">'+errorMsg+'</span>');
					}else{
					    var okMsg = '输入正确.';
					    $parent.append('<span class="formtips2 onSuccess">'+okMsg+'</span>');
					}
			 }
			   //再输入密码
			 if( $(this).is('#againPw') ){
					if( this.value=="" || this.value != $("#newPw").attr("value") ){
					    var errorMsg = '两次输入密码不一致.';
                        $parent.append('<span class="formtips2 onError2">'+errorMsg+'</span>');
					}else{
					    var okMsg = '输入正确.';
					    $parent.append('<span class="formtips2 onSuccess">'+okMsg+'</span>');
					}
			 }
			 
		}).keyup(function(){
		   $(this).triggerHandler("blur");
		}).focus(function(){
	  	   $(this).triggerHandler("blur");
		});//end blur

		
		//提交，最终验证。
		 $('#send').click(function(){
				$("form :input.required").trigger('blur');
				var numError = $('form .onError').length;
				if(numError){
					return false;
				} 
		 });
		 
		 //提交，最终验证。
		 $('#send2').click(function(){
				$("form :input.required2").trigger('blur');
				var numError = $('form .onError2').length;
				if(numError){
					return false;
				} 
		 });
		
		//重置
		 $('#res').click(function(){
				$(".formtips").remove(); 
		 });
		 //重置
		 $('#res2').click(function(){
				$(".formtips2").remove(); 
		 });
	})
	 
	 function usernamekeyup(){
	 		var username = $("#username").attr("value")
	 		var $parent = $("#username").parent();
			$parent.find(".formtips").remove();
	  		var param = "username=" + username;
	  		if(username.length>=6){
				$.ajax({
					type: "POST",
					url: "/WangGe/justUsername.do",
					data: param,
					dataType: 'text',
					error:function(data){
						alert("error");
					},
					success: function(data){
						if(data.length > 7){
							var okMsg = '该用户名可用.';
					    	$parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
						}else{
							var errorMsg = '该用户名已经存在.';
                        	$parent.append('<span class="formtips onError">'+errorMsg+'</span>');
						}	
					}
				});
			}
	  	}