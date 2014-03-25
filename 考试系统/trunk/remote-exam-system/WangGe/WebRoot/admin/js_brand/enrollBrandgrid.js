$(function(){
	

		var height = $("body").height();
		$("#rightIframe",parent.document.body).height(height + 50);
	
		//如果是必填的，则加红星标识.
		$("form :input.required").each(function(){
			var $required = $("<strong class='high'> *</strong>"); //创建元素
			$(this).parent().append($required); //然后将它追加到文档中
		});
		
		var months = null;
		var unitprice = null;
		var brandgrid_hasgrids = null;
		var result = null;
		
		var brandgrid_id = $("#brandgrid_id").attr("value");
		var differ = $("#differ").html();
		var brandgrid_owner_id = $("#brandgrid_owner_id").attr("value");
		
		var brandgrid_gridtype_id = $("#brandgrid_gridtype_id").attr("value");
		if(brandgrid_id.length > 0){
			
			months = $("#hireTime").attr("value");
			unitprice = $('#unitprice'+brandgrid_gridtype_id).html();
			brandgrid_hasgrids = $("#brandgrid_hasgrids2").attr("value");
			result = unitprice * brandgrid_hasgrids * months;
			
			$("#result").val(result);
			$('[name=brandgrid_gridtype_id]').each(function(){
				if($(this).val()==brandgrid_gridtype_id){
					$(this).attr("checked", "checked" );
				}
			})
			var sex = $("#sex").attr("value");
			$('.sex').each(function(){
				if($(this).val()==sex){
					$(this).attr("checked", "checked" );
				}
			})
		}
		
		$(".grid_type_id").change(function() {
			$('[name=brandgrid_gridtype_id]:radio:checked').each(function(){
				unitprice = $('#unitprice'+$(this).val()).html();
				if(unitprice !=null && brandgrid_hasgrids != null && months != null){
					result = unitprice * brandgrid_hasgrids * months;
					$("#result").val(result);
				}
			})
			
		});

		$("#brandgrid_hasgrids").keyup(function(){
			brandgrid_hasgrids = $(this).attr("value");
			if(unitprice !=null && brandgrid_hasgrids != null && months != null){
				result = unitprice * brandgrid_hasgrids * months;
				$("#result").val(result);
			}
		}).focus(function(){
	  	   $(this).triggerHandler("blur");
		});
		
		$("#hireTime").keyup(function(){
			months = $(this).attr("value");
			if(unitprice !=null && brandgrid_hasgrids != null && months != null){
				result = unitprice * brandgrid_hasgrids * months;
				$("#result").val(result);
			}
		}).focus(function(){
	  	   $(this).triggerHandler("blur");
		});
		
	    
	    //文本框失去焦点后
	    $('form :input').blur(function(){
	    	var $parent = $(this).parent();
			 if( $(this).is('#brandgrid_name') ){
					if( this.value=="" ){
						 $parent.find(".formtips").remove();
					    var errorMsg = '不能为空.';
                        $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}
					return;
			 }
			 if( $(this).is('#brandgrid_address') ){
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
			 if( $(this).is('#brandgrid_qq') ){
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
			 if( $(this).is('#hireTime') ){
				 	$parent.find(".formtips").remove();
				 	if(this.value=="" || this.value.length < 1){
					    var errorMsg = '请正确输入.';
					    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}else{
						if(differ.length > 0 && differ > this.value){
							var errorMsg = '可修改租用月数最小值为：' + differ + '.';
						    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
						}else{
							var okMsg = '输入正确.';
							$parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
						}
					}
					return;
			 }
			 if( $(this).is('#brandgrid_hasgrids') ){
				 	$parent.find(".formtips").remove();
				 	if(this.value=="" || this.value.length < 1){
					    var errorMsg = '请正确输入.';
					    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}else{
						var okMsg = '输入正确.';
						$parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
					}
					return;
			 }
			 if( $(this).is('#brandgrid_owner_name') ){
					if( this.value=="" ){
						 $parent.find(".formtips").remove();
					    var errorMsg = '不能为空.';
                     $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}
					return;
			 }
			 if( $(this).is('#brandgrid_owner_username') ){
					if( this.value=="" ){
						 $parent.find(".formtips").remove();
					    var errorMsg = '不能为空.';
                  $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}
					return;
			 }
			 if( $(this).is('#brandgrid_owner_pw') ){
				 	$parent.find(".formtips").remove();
				 	if(this.value=="" || this.value.length < 6){
					    var errorMsg = '密码不少于6位，阿拉伯数字、字母..';
					    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}else{
						var okMsg = '输入正确.';
						$parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
					}
					return;
			 }
			 if( $(this).is('#brandgrid_owner_phone') ){
				 	$parent.find(".formtips").remove();
				 	if(this.value=="" || this.value.length < 7){
					    var errorMsg = '请正确输入.';
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
				 $('[name=brandgrid_gridtype_id]:radio:checked').each(function(){
						str1+=",";
				 })
				 if(str1==""){
					 alert("未选中格子类型");
					 return false;
				 }
				 if(numError){
					return false;
				 }
				 $("#enroll").hide();
				 $("#myDialog").show();
		 });
		 
		//重置
		 $('#res').click(function(){
				$(".formtips").remove(); 
		 });
		 
		 $('form :input').keyup(function(){
			 var $parent = $(this).parent();
			 if( $(this).is('#brandgrid_name') ){
				 if( this.value=="" ){
					 $parent.find(".formtips").remove();
				    var errorMsg = '不能为空.';
				    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
				}else{
				 $.ajax({
						type: "POST",
						url: "/WangGe/justBrandgridName.do?brandgrid_name=" + this.value + "&brandgrid_id="+ brandgrid_id,
						dataType: 'text',
						error:function(data){
							
						},
						success: function(data){
							if(data=="success"){
								$parent.find(".formtips").remove();
								var okMsg = '该品牌店店名可用.';
						    	$parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
							}else{
								$parent.find(".formtips").remove();
								var errorMsg = '该品牌店店名已经存在.';
	                        	$parent.append('<span class="formtips onError">'+errorMsg+'</span>');
							}	
						},
						complete:function(data){
							
					  		return;
						}
					});	
				}
			 }
			 
			 if( $(this).is('#brandgrid_owner_name') ){
				 if( this.value==""){
						$parent.find(".formtips").remove();
						 var errorMsg = '不能为空.';
					    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}else{
						 $.ajax({
								type: "POST",
								url: "/WangGe/justOwnerName.do?brandgrid_owner_name=" + this.value + "&brandgrid_owner_id=" +brandgrid_owner_id,
								dataType: 'text',
								error:function(data){
									
								},
								success: function(data){
									if(data=="success"){
										$parent.find(".formtips").remove();
										var okMsg = '该法人名字可用.';
								    	$parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
									}else{
										$parent.find(".formtips").remove();
										var errorMsg = '该法人名字已经注册.';
			                        	$parent.append('<span class="formtips onError">'+errorMsg+'</span>');
									}	
								},
								complete:function(data){
									
							  		return;
								}
						});	
					}
				 
			 }
			 if( $(this).is('#brandgrid_owner_username') ){
				 if( this.value==""){
						$parent.find(".formtips").remove();
						 var errorMsg = '不能为空.';
					    $parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}else{
						 $.ajax({
								type: "POST",
								url: "/WangGe/justOwnerUserName.do?brandgrid_owner_username=" + this.value+"&brandgrid_owner_id="+brandgrid_owner_id,
								dataType: 'text',
								error:function(data){
									
								},
								success: function(data){
									
									if(data=="success"){
										$parent.find(".formtips").remove();
										var okMsg = '该登录名可用.';
								    	$parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
									}else{
										$parent.find(".formtips").remove();
										var errorMsg = '该登录名已经注册.';
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
	})
	  	
	  	
