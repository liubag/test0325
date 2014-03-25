// JavaScript Document
$(function(){		   
		var min = $("#min").val();
		//如果是必填的，则加红星标识.
		$("input.required").each(function(){
			var $required = $("<strong class='high'>*</strong>"); //创建元素
			$(this).parent().append($required); //然后将它追加到文档中
		});
         //文本框失去焦点后
	    $("input").blur(function(){
			 var $parent = $(this).parent();
			 $parent.find(".formtips1").remove();			
			//
			 if( $(this).is('#shangpin') ){
					if( this.value=="" || this.value.length > 20 ){
                        var errorMsg = '输入正确商品名称.';
                        $parent.append('<span class="formtips1 onError">'+errorMsg+'</span>');
					}else{
					    var okMsg = '输入正确.';
					    $parent.append('<span class="formtips1 onSuccess">'+okMsg+'</span>');
					}
					return;
			 }

			 if( $(this).is('#shuliang') ){
					if(this.value!=="" && this.value <9999999&& this.value >= 0){
						if(this.value < min){
							 var okMsg = '最小值为:' + min + '.';
							 $parent.append('<span class="formtips1 onError">'+okMsg+'</span>');
						}else{
						    var errorMsg = '输入正确.';
	                        $parent.append('<span class="formtips1 onSuccess">'+errorMsg+'</span>');
	                        $("#syu").attr("value",this.value - min);
						}
					}else{
					    var okMsg = '请输入正确数量,且最小值为:' + min + '.';
					    $parent.append('<span class="formtips1 onError">'+okMsg+'</span>');
					}
					return;
			 }
			 
			 if( $(this).is('#dangqianjiage') ){
					if(this.value!=="" && this.value <99999999&& this.value >= 0){
					    var errorMsg = '输入正确.';
                        $parent.append('<span class="formtips1 onSuccess">'+errorMsg+'</span>');
					}else{
					    var okMsg = '请输入正确价格.';
					    $parent.append('<span class="formtips1 onError">'+okMsg+'</span>');
					}
					return;
			 }
			 
			 if( $(this).is('#shichangjiage') ){
					if(this.value!=="" && this.value <99999999&& this.value >= 0){
					    var errorMsg = '输入正确.';
                        $parent.append('<span class="formtips1 onSuccess">'+errorMsg+'</span>');
					}else{
					    var okMsg = '请输入正确价格.';
					    $parent.append('<span class="formtips1 onError">'+okMsg+'</span>');
					}
					return;
			 }
});
		
		//提交，最终验证。
		 $('#yes1').click(function(){
				$("#form1 input.required").trigger('blur');
				if($("#type_name").val()==0){
					alert("请选择商品类型.");
					return false;
				}
				var numError = $('#form1 .onError').length;
				if(numError){
					return false;
				}else{
					if(check()){
						$(this).css("background-color","#D3D3D3");
						$(this).attr("value","上传中...");
						$(this).attr("readonly","readonly");
						$("#no1").hide();
						return true;
					}else{
						return false;	
					}
				}			   
 
		 });
		

		//重置
		 $('#no1').click(function(){
				$(".formtips1").remove(); 
		 });
		 
		 
})

 			var namebeforevalue = "";
			function goodsnamekeyup(){
			 		var goodsname = $("#shangpin").attr("value");
			 		var $parent = $("#shangpin").parent();
			 		$parent.find(".formtips1").remove();
			 		var goods_id = "";
			  		var param = "goods_name=" + goodsname +"&brandgrid_goods_id=" + goods_id;
			  		if(goodsname!=""){
						$.ajax({
							type: "POST",
							url: "/WangGe/justGoodsName_util.do",
							data: param,
							dataType: 'text',
							error:function(data){
								
							},
							success: function(data){
								if(data=="success"){
									var okMsg = '该名称可用.';
							    	$parent.append('<span class="formtips1 onSuccess">'+okMsg+'</span>');
								}else{
									var errorMsg = '该名称已经存在.';
		                        	$parent.append('<span class="formtips1 onError">'+errorMsg+'</span>');
								}	
							},
							complete:function(data){
								if(goodsname.length >20){
						  			$("#shangpin").val(namebeforevalue);		
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