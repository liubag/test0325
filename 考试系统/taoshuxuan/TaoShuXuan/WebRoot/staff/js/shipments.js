$(document).ready(function () {
		$('.shipments').click(function(){
			var t = $(this);
			$.ajax({
						type: "POST",
						url: "deliver_goods.do?order.order_id="+this.name,
						dataType: 'text',
						async: false,
						error:function(data){			
						},
						success: function(data){
							
							if((data=="success")){									
								
							}
							t.parent().html("<a href='#' style='color: #3C3'>已成功发货</a>");															
						}				
				});	
			});
		$('.shipments').confirm({
				msg:'确定操作？',
				timeout:3000
		});
});
