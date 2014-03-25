$(function(){
		var height = $("body").height();
		$("#rightIframe",parent.document.body).height(height + 50);
		
		
		
		
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
			 
			
			 if( $(this).is('#goodsname') ){
					if( this.value=="" ){
						var $parent = $(this).parent();
						 $parent.find(".formtips").remove();
					    var errorMsg = '不能为空.';
                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}
					return;
			 }
			 
			 var $parent = $(this).parent();
			 $parent.find(".formtips").remove();
			 if( $(this).is('#hasamount') ){
					if( this.value=="" ){
					    var errorMsg = '不能为空,且只能输入数字.';
                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}else{
						var okMsg = '输入正确.';
						$parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
						
					}
			 }
			 
			  if( $(this).is('#price') ){
					if( this.value=="" ){
					    var errorMsg = '不能为空,且要正确输入.';
                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}else{
						if($("#decimal_price").attr("value") ==""){
							var errorMsg = '不能为空,且要正确输入.';
		                    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
						}else{
						    var okMsg = '输入正确.';
						    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
						}
					}
			 }
			  
			  if( $(this).is('#decimal_price') ){
					if( this.value=="" ){
					    var errorMsg = '不能为空,且要正确输入.';
                      $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}else{
						if($("#price").attr("value") ==""){
							var errorMsg = '不能为空,且要正确输入.';
		                    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
						}else{
						    var okMsg = '输入正确.';
						    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
						}
					}
			 }
			 
			  if( $(this).is('#market_price') ){
					if( this.value=="" ){
					    var errorMsg = '不能为空，且要正确输入.';
                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}else{
						if($("#decimal_market_price").attr("value") ==""){
							var errorMsg = '不能为空,且要正确输入.';
		                    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
						}else{
						    var okMsg = '输入正确.';
						    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
						}
					}
			 }
			  
			  if( $(this).is('#decimal_market_price') ){
					if( this.value=="" ){
					   var errorMsg = '不能为空,且要正确输入.';
                      $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}else{
						if($("#market_price").attr("value") ==""){
							var errorMsg = '不能为空,且要正确输入.';
		                    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
						}else{
						    var okMsg = '输入正确.';
						    $parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
						}
					}
			 }
			 
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
			 
			 
		});//end blur

		
	  //提交，最终验证。
		 $('#send').click(function(){
				$("form :input.required").trigger('blur');
				if($("#type_name").val()==0){
					alert("请选择商品类型.");
					return false;
				}
				goodsnamekeyup();
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
				var numError = $('form .onError').length;
				
				if(numError){
					return false;
				} else{
					if(check()){
						$(this).css("background-color","#D3D3D3");
						$(this).attr("value","上传中...");
						$(this).attr("readonly","readonly");
						$("#res").hide();
						return true;
					}else{
						return false;	
					}
				}
		 });
		 
		//重置
		 $('#res').click(function(){
				$(".formtips").remove(); 
		 });
		 
		 $("#price").keypress(function(event) {
			 if (!$.browser.mozilla) {
		            if (event.keyCode && (event.keyCode < 48 || event.keyCode > 57) && event.keyCode != 46) {
		                // ie6,7,8,opera,chrome管用
		                event.preventDefault();
		            }
		        } else {
		        if (event.charCode && (event.charCode < 48 || event.charCode > 57) && event.keyCode != 46) {
		                // firefox管用
		                event.preventDefault();
		            }
		        }

		    });
	})
	var namebeforevalue = null;
	function goodsnamekeyup(){
	 		var goodsname = $("#goodsname").attr("value");
	 		var $parent = $("#goodsname").parent();
	 		var goods_id = $("#goods_id2").attr("value");
	  		var param = "goodsname=" + goodsname +"&goods_id=" + goods_id;
	  		if(goodsname!=""){
				$.ajax({
					type: "POST",
					url: "/WangGe/justGoodsname.do",
					data: param,
					dataType: 'text',
					error:function(data){
						alert("error");
					},
					success: function(data){
						if(data.length > 7){
							$parent.find(".formtips").remove();
							var okMsg = '该名称可用.';
					    	$parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
						}else{
							$parent.find(".formtips").remove();
							var errorMsg = '该名称已经存在.';
                        	$parent.append('<span class="formtips onError">'+errorMsg+'</span>');
						}	
					},
					complete:function(data){
						if(goodsname.length >20){
				  			$("#goodsname").val(namebeforevalue);		
				  			return;
				  		}
				  		if(goodsname.length == 20){
				  			$("#namewordcount").attr("class","text_red");
				  		}else{
				  			$("#namewordcount").attr("class","text_black");
				  		}
				  		namebeforevalue = goodsname;
				  		$("#namewordcount").html(goodsname.length + "/20字");
				  		return;
					}
				});
			} 		
	  	}
	 
	  	
