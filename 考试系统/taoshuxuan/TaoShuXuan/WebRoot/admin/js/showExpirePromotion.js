$(document).ready(function () {
	var page=$(".page").val();
	
		$('.delete').click(function(){
		if(confirm("真的要删除吗？？")){
			var id=$(this).attr("id");
			$.ajax({
				type: "POST",
				url: "deletePromotion.do?promotion.promotion_id="+id,
				dataType: 'text',
				error:function(data){
								
				},
				success: function(data){								
					if((data=="success")){									
						alert("删除成功");
						location.href = "showPromotion_by_page.do?page=1&status=1" ;	
					}else if((data=="input")){
						alert("删除失败");
					}																		
				}						
			});	
			}	
		});
			
});
