$(document).ready(function () {
		var height = $(document).height();
		$("#rightIframe",parent.document.body).height(height + 50);
			
	
    	//如果是必填的，则加红星标识.
		$("form :input.required").each(function(){
			var $required = $("<strong class='high'> *</strong>"); //创建元素
			$(this).parent().append($required); //然后将它追加到文档中
		});
		var ownerid = $("#ownerid").attr("value");
		
		
		 
		
		//文本框失去焦点后
	    $('form :input').blur(function(){
	    	var $parent = $(this).parent();
			 if( $(this).is('#username') ){
					if( this.value=="" ){
						 $parent.find(".formtips").remove();
					    var errorMsg = '不能为空.';
                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}
					return;
			 }
			 if( $(this).is('#idcard') ){
					if( this.value=="" || this.value.length < 18){
						 $parent.find(".formtips").remove();
					    var errorMsg = '请正确输入身份证.';
					    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}
					return;
			 }
			 
			 if( $(this).is('#truename') ){
					if( this.value=="" ){
						 $parent.find(".formtips").remove();
					    var errorMsg = '不能为空,且要正确输入.';
					    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}
					return;
			 }
			 
			 if( $(this).is('#phone') ){
				 	$parent.find(".formtips").remove();
				 	if(this.value==""){
					    var errorMsg = '不能为空,且要正确输入.';
					    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}else{
						var okMsg = '输入正确.';
						$parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
					}
					return;
			 }
			 
			 if( $(this).is('#qq_number') ){
				 	$parent.find(".formtips").remove();
				 	if(this.value=="" || this.value.length < 5){
					    var errorMsg = '请正确输入.';
					    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}else{
						var okMsg = '输入正确.';
						$parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
					}
					return;
			 }
			 if( $(this).is('#address') ){
				 	$parent.find(".formtips").remove();
					if( this.value==""){
					    var errorMsg = '不能为空,且要正确输入.';
					    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}else{
						var okMsg = '输入正确.';
						$parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
					}
					return;
			 }
	    });
	    
	  //提交，最终验证。
		 $('#send').click(function(){
				$("form :input.required").trigger('blur');
				$("form :input.required").trigger('keyup');
				var numError = $('form .onError').length;
				var str1= "";
				 $('[name=grid_type_id]:radio:checked').each(function(){
						str1+=",";
				 })
				 var str2 = "";
				 $('[name=scatteredGridUser.sex]:radio:checked').each(function(){
						str2+=",";
				 })
				 if(str2==""){
					 alert("请正确选择性别.");
					 return false;
				 }
				if(numError){
					return false;
				} 
		 });
		 
		//重置
		 $('#res').click(function(){
				$(".formtips").remove(); 
		 });
		 
		 $('form :input').keyup(function(){
			 var $parent = $(this).parent();
			 
			 if( $(this).is('#username') ){
			 	if( this.value=="" ){
					 $parent.find(".formtips").remove();
				    
				    var errorMsg = '不能为空.';
				    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
				}else{
				 $.ajax({
						type: "POST",
						url: "/WangGe/find_username.do?username=" + this.value + "&owner_id=" + ownerid,
						dataType: 'text',
						error:function(data){
							
						},
						success: function(data){
							if(data.length > 7){
								$parent.find(".formtips").remove();
								var okMsg = '该用户名可用.';
						    	$parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
							}else{
								$parent.find(".formtips").remove();
								var errorMsg = '该用户名已经存在.';
	                        	$parent.append('<span class="formtips onError">'+errorMsg+'</span>');
							}	
						},
						complete:function(data){
							
					  		return;
						}
					});	
				}
			 }
			 if( $(this).is('#idcard') ){
				 if( this.value=="" || this.value.length < 18){
					 $parent.find(".formtips").remove();
				    var errorMsg = '请正确输入身份证.';
				    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
				}else{
				 $.ajax({
						type: "POST",
						url: "/WangGe/find_idcard.do?idcard=" + this.value + "&owner_id=" + ownerid,
						dataType: 'text',
						error:function(data){
							
						},
						success: function(data){
							if(data.length > 7){
								$parent.find(".formtips").remove();
								var okMsg = '该身份证可用.';
						    	$parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
							}else{
								$parent.find(".formtips").remove();
								var errorMsg = '该身份证已经注册.';
	                        	$parent.append('<span class="formtips onError">'+errorMsg+'</span>');
							}	
						},
						complete:function(data){
							
					  		return;
						}
						
					});	
				}
				return;
			 }
			 
			 if( $(this).is('#truename') ){
			 	if( this.value=="" ){
					 $parent.find(".formtips").remove();
				    
				    var errorMsg = '不能为空.';
				    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
				}else{
				 $.ajax({
						type: "POST",
						url: "/WangGe/find_truename.do?truename=" + this.value + "&owner_id=" + ownerid,
						dataType: 'text',
						error:function(data){
							
						},
						success: function(data){
							if(data.length < 7){
								$parent.find(".formtips").remove();
								var okMsg = '该真实姓名可用.';
						    	$parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
							}else{
								$parent.find(".formtips").remove();
								var errorMsg = '该真实姓名已经注册.';
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
		
		
		var months = null;
		var rendtype_agio = null;
		var unitprice = null;
		var result = null;
		$(".grid_type_id").change(function() {
			$('[name=grid_type_id]:radio:checked').each(function(){
				unitprice = $('#unitprice'+$(this).val()).html();
				if(unitprice !=null && rendtype_agio != null && months != null){
					result = unitprice * rendtype_agio * months;
					$("#result").val(result);
				}
			})
			
		});

		$(".rendtype_id").change(function() {
			$('[name=rendtype_id]:radio:checked').each(function(){
				var id = $(this).val();
				months = $('#months'+id).html();
				rendtype_agio = $('#rendtype_agio' + id).html();
				if(unitprice !=null && rendtype_agio != null && months != null){
					result = unitprice * rendtype_agio * months;
					$("#result").val(result);
				}
				
			})
		});
		
		//提交，最终验证。
		 $('#send2').click(function(){
		 		 var str1= "";
				 $('[name=grid_type_id]:radio:checked').each(function(){
						str1+=",";
				 })
				 
				 if(str1==""){
					 alert("未选中格子类型");
					 return false;
				 }
				 var str2 = "";
				 $('[name=rendtype_id]:radio:checked').each(function(){
						str2+=",";
				 })
				 if(str2==""){
					 alert("未选中租用类型");
					 return false;
				 }
				 if($("#status").val()=="2"){
					 if(!confirm('修改合约可能会导致当前所有上架商品自动下架，是否确定要修改？')){return false;}
			   			 return true;
			   	}
			   	return true;
		 });

		
        var $x = $("#xia");
        var $s = $("#shang");
        var $x1 = $("#xia1");
        var $s1 = $("#shang1"); 
        var $s2 = $("#shang2"); 
        $x.hide();
        $("#btn").click(function () {
            var value = $("#btn").attr("value");
            //alert("触发");
            if (value == "修改用户信息" ) {
                $s.slideToggle();
                $x.slideToggle();
                $("#btn1").hide();
                //$x.show();
                //$s.hide();
                $(".btn1").hide();
                $("#btn").val("取消");
            } else {
                //$x.hide();
                $s.slideToggle();
                $x.slideToggle();
                //$s.show();
                $(".btn1").show();
                $("#btn").val("修改用户信息");
            }
        });
        var value1 = "";
         $(".btn1").click(function () {
            var value = $(this).attr("value");
            //alert("触发");
            if (value == "修改当前合约信息" || value == "续约" || value == "激活") {
            	if(value == "续约"){
            		var $xuyue = $(".div_title11");
            		if($xuyue.size() >= 2){
            			alert("只能同时存在两个未过期合约.");
            			return false;
            		}
            	}
            	value1 = value;
                $s1.slideToggle();
                $x1.slideToggle();
                $s2.slideToggle();
                //$x.show();
                //$s.hide();
                $("#btn").hide();
                $(this).val("取消");
            } else {
                //$x.hide();
                $s1.slideToggle();
                $x1.slideToggle();
                $s2.slideToggle();
                $("#btn").show();
                //$s.show();
                $(this).val(value1);
            }
        });
         
         
        
    });
function forcedo2(){
    if(!confirm('是否确定要注销合约？')){return false;}
    return true;
}
function forcedo1(){
    if(!confirm('是否确定毁约？')){return false;}
    return true;
}