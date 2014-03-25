$(function(){
			 	$(document).ready(function(){
			 		$("#formupload").show();
			 		$("#myDialog").hide();	
			  	});
		 		
		 		
		 		//如果是必填的，则加红星标识.
				$("form :input.required").each(function(){
					var $required = $("<strong class='high'> *</strong>"); //创建元素
					$(this).parent().append($required); //然后将它追加到文档中
				});
				
				$("#goodsinfo").each(function(){
					var $required = $("<strong class='high'> *</strong>"); //创建元素
					$(this).parent().append($required); //然后将它追加到文档中
				});
				
		         //文本框失去焦点后
			    $('form :input').blur(function(){
			    	var $parent = $(this).parent();
					$parent.find(".formtips").remove();
					  if( $(this).is('#file11') ){
							if( this.value=="" ){
							    var errorMsg = '不能为空.';
		                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
							}else{
							    var okMsg = '输入正确.';
							    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
							}
					 }
					 
					  if( $(this).is('#file12') ){
							if( this.value=="" ){
							    var errorMsg = '不能为空.';
		                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
							}else{
							    var okMsg = '输入正确.';
							    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
							}
					 }
					 
					 if( $(this).is('#file13') ){
							if( this.value=="" ){
							    var errorMsg = '不能为空.';
		                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
							}else{
							    var okMsg = '输入正确.';
							    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
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
						$("#goodsinfo").trigger('blur');
						var numError = $('form .onError').length;
						if(numError){
							return false;
						}
						var txt = $("#editor").val();
						var arr = new Array();
						arr = txt.split("<img src=");
						var hm = arr.length;
						hm = hm *1 - 1;
						if(hm >= 10){
							alert("图片不能超过10张！当前为" + hm + "张.");
							return false;
						}
		
						if(txt.length >=1500){
							alert("内容不能超过1500字符！当前为："+txt.length+ "字.");
							return false;
						}
						$("#formupload").hide();
			 			$("#myDialog").show();
				 });
				 
				//重置
				 $('#res').click(function(){
						$(".formtips").remove(); 
				 });
		 		
		 	});