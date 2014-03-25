$(document).ready(function () {
		$('.pass').click(function(){
			var t = $(this);
			
			$.ajax({
						type: "POST",
						url: "audit_order.do?order.order_id="+this.name+"&isPass="+1,
						dataType: 'text',
						async: false,
						error:function(data){	
								alert("error");			
						},
						success: function(data){
							
							if((data=="success")){									
								//alert("订单审核通过");
							}
							
							t.parent().html("<a href='#' style='color: #3C3'>审核已通过</a>");															
						}				
				});	
			});
			
		$('.unPass').click(function(){
			t = $(this);
			$.ajax({
						type: "POST",
						url: "audit_order.do?order.order_id="+this.name+"&isPass="+0,
						dataType: 'text',
						async: false,
						error:function(data){
						alert("error");			
						},
						success: function(data){
								
							if((data=="success")){									
								//alert("订单审核不通过");
							}
							t.parent().html("<a href='#' style='color:red'> 审核不通过 </a>");																
						}				
				});	
		});
		$('.unPass').confirm({
				msg:'确定操作？',
				timeout:3000
		});
		$('.pass').confirm({
				msg:'确定操作？',
				timeout:3000
		});
});
