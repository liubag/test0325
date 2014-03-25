$(document).ready(function () {
			$("form :input.required1").each(function(){
				var $required=$("<strong class='high'>*</strong>");	
				$(this).parent().append($required);
			});
			$("form :input").blur(function(){
				var $parent=$(this).parent();
				$parent.find(".formtips").remove();
				
				if($(this).is('#name')){
												
					if(this.value==""){
						var errorMsg='请正确输入支付名称';
						$parent.append('<span class="formtips onError">'+errorMsg+'</span>');	
												
					}else{											
						$.ajax({
							type: "POST",
							url: "findPaymentMethod.do?paymentMethod.name="+this.value,
							dataType: 'text',
							async: false,
							error:function(data){
								
							},
							success: function(data){
								
								if((data=="success")){									
									var errorMsg='此支付名称已存在';								
									$parent.append('<span class="formtips onError">'+errorMsg+'</span>');
								}else{
									var okMsg='此支付名称可用';
									
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
				if(numError!=0){
					return false;
				}				
			});
});