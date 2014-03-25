$(document).ready(function () {	
	$("#Check_All_Up").click(function() {  
		$("input[name='Check_up']").attr("checked",$(this).attr("checked"));
		 var arrChk=$("input[name='Check_up']:checked");
	});
	
	$("#totalbuy").click(function(){
		var arrChk=$("input[name='Check_up']:checked");
		var str="";
		$(arrChk).each(function() {   str+=this.value+",";  });
		if(str==""){
			alert("请选择要购买的图书");
		}else{
			//批量购买
		}
	});
	
	$("#totaldelete").click(function(){
		var arrChk=$("input[name='Check_up']:checked");
		var str="";
		$(arrChk).each(function() {   str+=this.value+",";  });
		if(str==""){
			alert("请选择要删除的图书");
		}else{
			//批量删除
			if(confirm("真的要删除吗？？")){
				$.ajax({
					type: "POST",
					url: "deleteBatchCollection.do?collectionIdStr="+str,
					dataType: 'text',
					error:function(data){
												
					},
					success: function(data){									
						if((data=="success")){									
							alert("删除成功");
							location.href = "show_collection_by_page.do?page=1" ;
						}else if((data=="input")){
							alert("删除失败");
						}	
																						
					}
											
				});	
			}
		}
	});
	
	$(".delete").click(function(){
		var id=$(this).attr("name");
		if(confirm("真的要删除吗？？")){
			$.ajax({
				type: "POST",
				url: "deleteCollection.do?colletion.collection_id="+id,
				dataType: 'text',
				error:function(data){
											
				},
				success: function(data){									
					if((data=="success")){									
						alert("删除成功");
						location.href = "show_collection_by_page.do?page=1" ;
					}else if((data=="input")){
						alert("删除失败");
					}	
																					
				}
										
			});	
		}
	});
});