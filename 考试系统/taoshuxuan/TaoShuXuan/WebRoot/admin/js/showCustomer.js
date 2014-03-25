$(document).ready(function () {
	var page=$(".page").val();
//	alert(page);
	$(".changeState").click(function(){
		var email=$(this).attr("name");
		var status=$(this).attr("id");
//		alert(staffId);
		if(status==2){
			alert("此会员还没有激活");
		}else{
		$.ajax({
			type: "POST",
			url: "changeCustomerState.do?customer.email="+email,
			dataType: 'text',
			error:function(data){
								
			},
			success: function(data){
								
				if((data=="success1")){									
					alert("成功激活会员"+email);
					
				}else if((data=="success2")){
					alert("成功禁用会员"+email);
				}else if((data=="success3")){
					alert("操作失败");
				}	
				location.href = "showCustomer_by_page.do?page="+page ;														
			}
							
		});												
		}	
	});
});