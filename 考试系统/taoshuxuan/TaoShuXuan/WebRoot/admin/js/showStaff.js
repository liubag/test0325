$(document).ready(function () {
	var page=$(".page").val();
//	alert(page);
	$(".changeState").click(function(){
		var staffId=$(this).attr("name");
//		alert(staffId);
		$.ajax({
			type: "POST",
			url: "changeStaffState.do?staff.staff_id="+staffId,
			dataType: 'text',
			error:function(data){
								
			},
			success: function(data){
								
				if((data=="success1")){									
					alert("成功激活员工"+staffId);
					
				}else if((data=="success2")){
					alert("成功禁用员工"+staffId);
				}	
				location.href = "showStaff_by_page.do?page="+page ;														
			}
							
		});												
			
	});
});