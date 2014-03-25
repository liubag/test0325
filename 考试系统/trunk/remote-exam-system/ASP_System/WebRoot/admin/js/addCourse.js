$(function(){ 
			flag=false;
			$("form :input.required1").each(function(){
				var $required=$("<strong class='high'>*</strong>");	
				$(this).parent().append($required);
			});
			$("form :input").blur(function(){
				var $parent=$(this).parent();
				$parent.find(".formtips").remove();
				
				if($(this).is('#course_name')){							
					if(this.value==""){	
						var errorMsg='请输入科目名称';
						$parent.append('<span class="formtips onError">'+errorMsg+'</span>');	
					}else{											
						$.ajax({
							type: "POST",
							url: "findCourseByName.do?course.course_name="+this.value,
							dataType: 'text',
							error:function(data){
								
							},
							success: function(data){
								
								if((data=="success")){									
									var errorMsg='该科目名称不可以用';
									flag=true;
									$parent.append('<span class="formtips onError">'+errorMsg+'</span>');
								}else{
									var okMsg='该科目名称可用';
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