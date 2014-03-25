 $(document).ready(function () {
 	 			if($("#moveDivs_id").val()!=null){
 				$.ajax({
						type: "POST",
						url: "getMoveDivsById.do",
						dataType: 'text',
						data:{moveDivs_id:$("#moveDivs_id").val()},
						async: false,
 						error:function(data){
							
						},
						success: function(data){
							if(data!="empty"){
								$("#userMoveDivs").html(data);
								$(".drag").each(function(){
									var t=$(this);
									$.ajax({
										type: "POST",
										url: "findTitle.do?title.div_id="+$(this).attr("id")+"&title.moveDivs_id="+$("#moveDivs_id").val(),
										dataType: 'text',
										async: false,
				 
										error:function(data){
											
										},
										success: function(data){
											t.attr("title",data);									
										}	
									});	
								});	
							}
							
						}		
					});	
 			}
            $(".drag").each(function(){
				$(this).Drag();
			});	
        });	

  (function (document) {
            //Usage: $("#id").drag()  
            //Author: hooyes
            $.fn.Drag = function () {

                var M = false;
                var t = $(this);	
                var title;		
                var moveDivs_id=$("#moveDivs_id").val();
				
               		t.mouseover(function () {								
				 	t.css("background-color","yellow");	
					
					$.ajax({
						type: "POST",
						url: "findTitle.do?title.div_id="+t.attr("id")+"&title.moveDivs_id="+moveDivs_id,
						dataType: 'text',
						async: false,
 
						error:function(data){
						
						},
						success: function(data){
							
							title=data;
							t.attr("title",data);
							$('.tooltip').html(data);
							t.removeAttr("title");											
						}	
					});	
					
				
					//t.tooltip();
					//t.removeAttr("title");
				});

				t.tooltip();
				t.mouseout(function () { //鼠标离开元素时
					$(this).css("background-color","#E9E9E4");
				 });
				
            };
        })(document);

	