$(function(){ 
			flag=false;
			$("form :input.required1").each(function(){
				var $required=$("<strong class='high'>*</strong>");	
				$(this).parent().append($required);
			});
			$("form :input").blur(function(){
				var $parent=$(this).parent();
				$parent.find(".formtips").remove();
				
				if($(this).is('#stu_id')){							
					if(this.value==""){	
						var errorMsg='请输入学号';
						$parent.append('<span class="formtips onError">'+errorMsg+'</span>');	
					}else{											
						$.ajax({
							type: "POST",
							url: "findStudentById.do?student.stu_id="+this.value,
							dataType: 'text',
							error:function(data){
								
							},
							success: function(data){
								
								if((data=="success")){									
									var errorMsg='该学号不可以用';
									flag=true;
									$parent.append('<span class="formtips onError">'+errorMsg+'</span>');
								}else{
									var okMsg='该学号可用';
									flag=false;
									$parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
								}															
							}
							
						});												
					}
				}
				if($(this).is('#name')){
					var Msg='请正确输入名称';							
					if(this.value==""){							
						$parent.append('<span class="formtips onError">'+Msg+'</span>');	
					}else{
						$parent.append('<span class="formtips onSuccess">'+Msg+'</span>');
					}
				}

			}).keyup(function(){
				$(this).triggerHandler("blur");
			}).focus(function(){
				$(this).triggerHandler("blur");	
			});
			$('#send').click(function(){
				$("form .required1:input").trigger('blur');
				$("#class_id").parent().find(".formtips").remove();
				if($("#class_id option:selected").text()!="--请选择班级--"){
					$("#class_id").parent().append('<span class="formtips onSuccess">'+"请选择班级"+'</span>');		
				}else{
					$("#class_id").parent().append('<span class="formtips onError">'+"请选择班级"+'</span>');
				}
				var numError=$('form .onError').length;
				if(numError!=0||flag){
					return false;
				}				
			});
		});