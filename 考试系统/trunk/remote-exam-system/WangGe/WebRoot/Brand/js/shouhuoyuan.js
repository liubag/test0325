// JavaScript Document
$(function(){
		   
		//如果是必填的，则加红星标识.
		$("input.required").each(function(){
			var $required = $("<strong class='high'> *</strong>"); //创建元素
			$(this).after($required); //然后将它追加到文档中
		});
         //文本框失去焦点后
	    $("input").blur(function(){
			 var $parent = $(this).parent();
			 
			 //验证用户名
			 if( $(this).is('#name') ){
					if( this.value=="" || this.value.length < 6|| this.value.length > 10 ){
						$parent.find(".formtips").remove();
						var errorMsg = '请输入6-10位的用户名.';
                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}
					return;
			 }
			 //验证姓名
			 if( $(this).is('#shenfenzheng') ){
					if( this.value=="" || this.value.length < 18|| this.value.length > 20 ){
						$parent.find(".formtips").remove();
						var errorMsg = '请输入至少18位数.';
                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}
					return;
			 }
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
			 if( $(this).is('#qq') ){
					if( this.value=="" || this.value < 9999|| this.value.length > 15 ){
					    var errorMsg = '请正确输入QQ号码.';
                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}else{
					    var okMsg = '输入正确.';
					    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
					}
					return;
			 }
			 if( $(this).is('#mail') ){
				     if( this.value=="" || ( this.value!="" && !/.+@.+\.[a-zA-Z]{2,4}$/.test(this.value) )|| this.value.length > 30 ){
                      var errorMsg = '请输入正确的E-Mail地址且长度不大于30.';
					  $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
				    }else{
                      var okMsg = '输入正确.';
					  $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
				}
				return;
			 }
		});//end blur
		
	    var brandgrid_salesman_id = $("#bgs_id").val();
		 $("input").keyup(function(){
			var $parent = $(this).parent();
			 $parent.find(".formtips").remove();
			 //验证用户名
			 if( $(this).is('#name') ){
					if( this.value=="" || this.value.length < 6 || this.value.length > 10){
					    var errorMsg = '请输入6-10位的用户名.';
                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}else{
					   //异步：
						 $.ajax({
								type: "POST",
								url: "/WangGe/justsalesmanUserName.do?username=" + this.value + "&brandgrid_salesman_id=" + brandgrid_salesman_id,
								dataType: 'text',
								contentType:"text/html;charset=utf-8",
								error:function(data){
									
								},
								success: function(data){
									if(data=="success"){
										$parent.find(".formtips").remove();
										var okMsg = '该名字可用.';
								    	$parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
									}else{
										$parent.find(".formtips").remove();
										var errorMsg = '该名字已经存在.';
			                        	$parent.append('<span class="formtips onError">'+errorMsg+'</span>');
									}	
								},
								complete:function(data){
									
							  		return;
								}
							});
					}
			 }
			 if( $(this).is('#shenfenzheng') ){
					if( this.value=="" || this.value.length < 18 || this.value.length > 20){
					    var errorMsg = '请输入至少18位数.';
                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}else{
					    //异步：
						 $.ajax({
								type: "POST",
								url: "/WangGe/justsalesmanIdcard.do?idcard=" + this.value + "&brandgrid_salesman_id=" + brandgrid_salesman_id,
								dataType: 'text',
								contentType:"text/html;charset=utf-8",
								error:function(data){
									
								},
								success: function(data){
									if(data=="success"){
										$parent.find(".formtips").remove();
										var okMsg = '该身份证可用.';
								    	$parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
									}else{
										$parent.find(".formtips").remove();
										var errorMsg = '该身份证已经存在.';
			                        	$parent.append('<span class="formtips onError">'+errorMsg+'</span>');
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
		 $('#tianjia').click(function(){
				$("input.required").trigger('blur');
				$("input.required").trigger('keyup');
				var numError = $('.onError').length;
				if(numError){
					return false;
				} 
		 });

		//重置
		 $('#res').click(function(){
				$(".formtips").remove(); 
		 });
})