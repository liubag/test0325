$(document).ready(function () {
	var page=$(".page").val();

	$(".modify").each(function(){
		$(this).Drag();
	});
	
	$(".paymentMethod_name_box :input.required1").each(function(){
		var $required=$("<strong class='high'>*</strong>");	
		$(this).parent().append($required);
	});
	$(".paymentMethod_name_box :input").blur(function(){
		var $parent=$(this).parent();
		$parent.find(".formtips").remove();
				
		if($(this).is('#name')){
			var errorMsg='不能为空';
			var okMsg='正确';		
			var PaymentMethodName=this.value;												
			if(this.value==""){
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
								var errorMsg='已存在';
								var okMsg='可用';
								var name=$("#send").attr("name");				
								if((data=="success")){													
									if(name==PaymentMethodName){
										$parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
									}else{
										$parent.append('<span class="formtips onError">'+errorMsg+'</span>');
									}												
								}else{												
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
				$(".paymentMethod_name_box .required1:input").trigger('blur');
				var numError=$('.paymentMethod_name_box .onError').length;
				if(numError!=0){
					return false;
				}else{
					var id=$("#id").val();
					var name=$("#name").val();
					$.ajax({
						type: "POST",
						url: "changePaymentMethodName.do?paymentMethod.payment_method_id="+id+"&paymentMethod.name="+name,
						dataType: 'text',
						error:function(data){
								
						},
						success: function(data){								
							if((data=="success")){									
								alert("修改成功");
								location.href = "showPaymentMethod_by_page.do?page="+page ;	
							}else if((data=="input")){
								alert("修改失败");
							}																		
						}						
					});
				}				
			});
			
			$('.delete').click(function(){
				var id=$(this).attr("id");
				$.ajax({
						type: "POST",
						url: "findPaymentMethod_use.do?paymentMethod.payment_method_id="+id,
						dataType: 'text',
						error:function(data){
								
						},
						success: function(data){								
							if((data=="success")){									
								alert("删除成功");
								location.href = "showPaymentMethod_by_page.do?page=1" ;	
							}else if((data=="input")){
								alert("删除失败");
							}																		
						}						
					});		
			});
			
});
(function (document) {
            //Usage: $("#id").drag()  
            //Author: hooyes
            $.fn.Drag = function () {
                var M = false;
                var Rx, Ry;
                var t = $(this);							
				
				t.click(function(){
				var id=t.attr("id");
				var name=t.attr("name");
				$("#id").attr("value",id);
				$("#name").attr("value",name);
					$.blockUI({ 
						message: $('#modify_box'),
						css:{
							width: '280px',
					//		top: (Math.round((document.body.scrollHeight-280)/2)).toString()+ "px ",
							left: (Math.round((document.body.scrollWidth-280)/2)).toString()+ "px "
						}
					});
					$("#send").attr("name",name);
					$('.blockOverlay').attr('title','单击关闭').click($.unblockUI);
					$('.close').click($.unblockUI); 
				});

            }
})(document);

