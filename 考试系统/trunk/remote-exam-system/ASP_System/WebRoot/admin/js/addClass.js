$(function(){ 
			flag=false;
			var value=$("#oldName").val();
			$("form :input.required1").each(function(){
				var $required=$("<strong class='high'>*</strong>");	
				$(this).parent().append($required);
			});
			$("form :input").blur(function(){
				var $parent=$(this).parent();
				$parent.find(".formtips").remove();
				
				if($(this).is('#class_name')){
												
					if(this.value==""){
						var errorMsg='请输入班级名称';
						$parent.append('<span class="formtips onError">'+errorMsg+'</span>');	
							
					}else if(this.value==value){
						flag=false;
						var okMsg='请输入班级名称';
						$parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
						return;
					}else{											
						$.ajax({
							type: "POST",
							url: "findClassByName.do?myClass.class_name="+this.value,
							dataType: 'text',
							error:function(data){
								
							},
							success: function(data){
								
								if((data=="success")){									
									var errorMsg='该班级名称不可以用';
									flag=true;
									$parent.append('<span class="formtips onError">'+errorMsg+'</span>');
								}else{
									var okMsg='该班级名称可用';
									flag=false;
									$parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
								}															
							}
							
						});												
					}
				}

			}).keyup(function(){
				$(this).triggerHandler("blur");
			}).focus(function(){
				$(this).triggerHandler("blur");	
			});
			$('#send').click(function(){
				$("form .required1:input").trigger('blur');
				var numError=$('form .onError').length;
				if(numError!=0||flag){
					return false;
				}				
			});
		});