$(document).ready(function () {
		$('.pass').click(function(){
			var t = $(this);
			var url = this.href;
			$.ajax({
						type: "POST",
						url: url+"="+this.name+"&isPass="+1,
						dataType: 'text',
						async: false,
						error:function(data){	
							alert("error");			
						},
						success: function(data){
							if(data == "audit")
								t.parent().html("<a href='#' style='color: #3C3'>审核已通过</a>");
							if(data == "complete")
								t.parent().html("<a href='#' style='color: #3C3'>确认成功</a>");															
						}				
				});	
			});
			
		$('.unPass').click(function(){
			t = $(this);
			var url = this.href;
			$.ajax({
						type: "POST",
						url: url+"="+this.name+"&isPass="+0,
						dataType: 'text',
						async: false,
						error:function(data){	
							alert("error");		
						},
						success: function(data){
							if(data == "audit")
								t.parent().html("<a href='#' style='color:red'> 审核不通过 </a>");
							if(data == "complete")
								t.parent().html("<a href='#' style='color: #3C3'>确认失败</a>");																	
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
