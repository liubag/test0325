// JavaScript Document
$(function(){		   
		//如果是必填的，则加红星标识.
		$("input.required").each(function(){
			var $required = $("<strong class='high'>*</strong>"); //创建元素
			$(this).parent().append($required); //然后将它追加到文档中
		});
         //文本框失去焦点后
	    $("input").blur(function(){
			 var $parent = $(this).parent();
			
			//验证用户名
			 if( $(this).is('#newuser') ){
					if( this.value=="" || this.value.length < 6|| this.value.length > 10 ){
						$parent.find(".formtips1").remove();
						var errorMsg = '请输入6-10位的用户名.';
                        $parent.append('<span class="formtips1 onError">'+errorMsg+'</span>');
                        
					}
					return;
			 }
			 $parent.find(".formtips1").remove();
			 $parent.find(".formtips2").remove();
			 //验证密码
			 if( $(this).is('#pw') ){
					if( this.value=="" || this.value.length < 6|| this.value.length > 20 ){
					    var errorMsg = '请输入6-20个字符.';
                        $parent.append('<span class="formtips1 onError">'+errorMsg+'</span>');
					}else{
					    var okMsg = '输入正确.';
					    $parent.append('<span class="formtips1 onSuccess">'+okMsg+'</span>');
					}
					return;
			 }
			 
			 //验证密码
			 if( $(this).is('#ppw') ){
					if( this.value=="" || this.value.length < 6|| this.value.length > 20 ){
					    var errorMsg = '请输入6-20个字符.';
                        $parent.append('<span class="formtips1 onError">'+errorMsg+'</span>');
					}
					return;
			 }
			 if( $(this).is('#npw') ){
					if( this.value=="" || this.value.length < 6|| this.value.length > 20 ){
					    var errorMsg = '请输入6-20个字符.';
                        $parent.append('<span class="formtips2 onError">'+errorMsg+'</span>');
					}else{
					    var okMsg = '输入正确.';
					    $parent.append('<span class="formtips2 onSuccess">'+okMsg+'</span>');
					}
					return;
			 }
			 if( $(this).is('#rpw') ){
					if( $(this).val()==$("#npw").val()&&this.value !==""){
					    var errorMsg = '输入正确.';
                        $parent.append('<span class="formtips2 onSuccess">'+errorMsg+'</span>');
					}else{
					    var okMsg = '两次密码输入不一致.';
					    $parent.append('<span class="formtips2 onError">'+okMsg+'</span>');
					}
					return;
			 }			  
		});
		
	    $("input").keyup(function(){
			
			 //验证用户名
			 if( $(this).is('#newuser') ){
				 	var $parent = $(this).parent();
				 	 $parent.find(".formtips1").remove();
					if( this.value=="" || this.value.length < 6 || this.value.length > 10){
						var errorMsg = '请输入6-10位的姓名.';;
						$parent.append('<span class="formtips1 onError">'+errorMsg+'</span>');
					}else{
					    //异步：
						$.ajax({
							type: "POST",
							url: "/WangGe/jusrOwnerUsername_brandowner.do?brandgrid_owner_username=" + this.value,
							dataType: 'text',
							contentType:"text/html;charset=utf-8",
							error:function(data){
								
							},
							success: function(data){
								if(data=="success"){
									$parent.find(".formtips1").remove();
									var okMsg = '该用户名可用.';
							    	$parent.append('<span class="formtips1 onSuccess">'+okMsg+'</span>');
								}else if(data=="fail"){
									$parent.find(".formtips1").remove();
									var errorMsg = '该用户名已经注册.';
		                        	$parent.append('<span class="formtips1 onError">'+errorMsg+'</span>');
								}else{
									$parent.find(".formtips1").remove();
									var errorMsg = '该用户名为当前用户名.';
		                        	$parent.append('<span class="formtips1 onError">'+errorMsg+'</span>');
								}
							},
							complete:function(data){
								
						  		return;
							}
						});	
					}
			 }	
		});

		//提交，最终验证。
		 $('#yes1').click(function(){
				$("#form1 input.required").trigger('blur');
				$("#form1 input.required").trigger('keyup');
				var numError = $('#form1 .onError').length;
				if(numError){
					alert("请正确输入");
					return false;
				} 
		 });
		 $('#yes2').click(function(){
				$("#form2 input.required").trigger('blur');
				var numError = $('#form2 .onError').length;
				if(numError){
					alert("请正确输入");
					return false;
				} 
		 });

		//重置
		 $('#no1').click(function(){
				$(".formtips1").remove(); 
		 });
		 $('#no2').click(function(){
				$(".formtips2").remove(); 
		 });
})