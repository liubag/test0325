$(document).ready(function(){
	
		$(".update").click(function(){
		var ques_id=$(this).parent().attr('class');	
		var path=$(this).attr('name');	
		
		$.ajax({
			type: "GET",
			url: "checkQuestions.do?questions.ques_id="+ques_id,
			dataType: 'text',
			async: false,
 
			error:function(data){
						
			},
			success: function(data){
			if(confirm("真的要修改吗？")){								
				if((data=="success")){											
					alert("此题目已在试卷里，不能修改！！");
						
				}else{
					top.location.href = path+"/admin/admin_luTiModify.jsp?ques_id="+ques_id;														
				}
			}															
			}
							
		});	
	});
	
	$(".del").click(function(){
		var ques_id=$(this).parent().attr('class');	
		var path=$(this).attr('name');	
		
		$.ajax({
			type: "GET",
			url: "checkQuestions.do?questions.ques_id="+ques_id,
			dataType: 'text',
			async: false,
 
			error:function(data){
						
			},
			success: function(data){
			if(confirm("真的要删除吗？")){								
				if((data=="success")){											
					alert("此题目已在试卷里，不能删除！！");
						
				}else{
					top.location.href = "delQuestions.do?ques_id="+ques_id;														
				}
			}															
			}
							
		});	
	});
	
	$("#delAll").click(function(){
		flag=false;
		str="";
		$(".checkDel").each(function(){
			if($(this).attr("checked")===true){										
				$.ajax({
					type: "GET",
					url: "checkQuestions.do?questions.ques_id="+this.value,
					dataType: 'text',
					async: false,
					error:function(data){
						
					},
					success: function(data){								
						if((data=="success")){											
							flag=true;
						}															
					}							
				});	
				str=str+this.value+",";		
			}													
		});
			
		if(str!==""){
			if(confirm("真的要删除吗？")){
				if(flag){
					alert("此题目已在试卷里，不能删除！！");				
				}else{				
					top.location.href = "deletQuestionsBatch.do?idArray="+str ;																	
				}
			}			
		}else{
			alert("请选择要删除的题目？？");
		}
					
	});
});
