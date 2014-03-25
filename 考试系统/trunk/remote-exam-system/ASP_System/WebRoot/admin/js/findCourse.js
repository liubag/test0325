$(document).ready(function(){
	
	$(".del").click(function(){
		var course_id=$(this).parent().attr('class');	
		$.ajax({
			type: "GET",
			url: "findCourse.do?course.course_id="+course_id,
			dataType: 'text',
			async: false,
 
			error:function(data){
						
			},
			success: function(data){
			if(confirm("真的要删除吗？")){								
				if((data=="success")){											
					alert("你不能删除！！");
						
				}else{
					alert("可以删除");
					top.location.href = "deletCourse.do?course.course_id="+course_id ;														
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
					url: "findCourse.do?course.course_id="+this.value,
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
					alert("你不能删除！！");				
				}else{				
					top.location.href = "deletCourseBatch.do?idArray="+str ;																	
				}
			}			
		}else{
			alert("请选择要删除的科目？？");
		}
					
	});
});
