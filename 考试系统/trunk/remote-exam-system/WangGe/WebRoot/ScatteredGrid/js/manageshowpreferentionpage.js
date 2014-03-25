$(function(){
	
		var height = $("body").height();
		$("#rightIframe",parent.document.body).height(height + 50);
		//如果是必填的，则加红星标识.
	
		$("#preferential_text").each(function(){
			var $required = $("<strong class='high'> *</strong>"); //创建元素
			$(this).parent().append($required); //然后将它追加到文档中
		});
		
         //文本框失去焦点后
	    $('form :input').blur(function(){
			 
			 var $parent = $(this).parent();
			 $parent.find(".formtips").remove();
			 
			 if( $(this).is('#preferential_text') ){
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
				$("#preferential_text").trigger('blur');
				var numError = $('form .onError').length;
				if(numError){
					return false;
				} 
		 });
		 
		//重置
		 $('#res').click(function(){
				$(".formtips").remove(); 
		 });
		 
	})
		
		function justUpPage(){
			if(page == hasPages){
				 alert("已经是最后一页了！");
				 return false;
			}	 
		}
		
		function justNextPage(){
			if(page == 0 || page == 1){
				 alert("已经是第一页了！");
				 return false;
			}	 
		}
		
		function test(select){
	  		$("#rightIframe",parent.document.body).attr("src","showAllPreferential_user.do?page="+select.value);
	  	}
	  	
	  	var beforevalue = null;
	  	function preferentialtextkeyup(){
	  		var preferential_text = $("#preferential_text").attr("value");
	  		if(preferential_text.length >100){
	  			$("#preferential_text").val(beforevalue);
	  			
	  			return;
	  		}
	  		if(preferential_text.length == 100){
	  			$("#wordcount").attr("class","text_red");
	  		}else{
	  			$("#wordcount").attr("class","text_black");
	  		}
	  		beforevalue = preferential_text;
	  		$("#wordcount").html(preferential_text.length + "/100字");
	  		return;
	  	}