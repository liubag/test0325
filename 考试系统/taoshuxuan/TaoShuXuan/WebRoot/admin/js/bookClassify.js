$(document).ready(function () {	
	var page=$(".page").val();
	$(".modifyCatagory").each(function(){
		$(this).Drag();
	});
	$(".discount").each(function(){
		$(this).Drag1();
	});
	$(".login_box :input.required1").each(function(){
		var $required=$("<strong class='high'>*</strong>");	
		$(this).parent().append($required);
	});
	$(".login_box :input").blur(function(){
		var $parent=$(this).parent();
		$parent.find(".formtips").remove();
				
		if($(this).is('#name')){
			var catagoryName=this.value;												
		if(this.value==""){
			var errorMsg='不能为空';
			$parent.append('<span class="formtips onError">'+errorMsg+'</span>');								
		}else{	
												
			$.ajax({
			type: "POST",
			url: "findCatagory.do?catagory.catagory_name="+this.value,
			dataType: 'text',
			async: false,
			error:function(data){
								
			},
			success: function(data){
				var errorMsg='已存在';
				var okMsg='可用';
				var name=$("#send").attr("name");				
				if((data=="success")){													
					if(name==catagoryName){
						$parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
					}else{
						$parent.append('<span class="formtips onError">'+errorMsg+'</span>');
					}												
				}else{												
					$parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
				}															
			}
							
			});												
		}
		}
							
		}).keyup(function(){
			$(this).triggerHandler("blur");
		}).focus(function(){
			$(this).triggerHandler("blur");	
		});
		$('#send').click(function(){
				$(".login_box .required1:input").trigger('blur');
				var numError=$('.login_box .onError').length;
				if(numError!=0){
					return false;
				}else{
					var catagoryId=$("#id").val();
					var catagoryName=$("#name").val();
					$.ajax({
						type: "POST",
						url: "changeCatagoryName.do?catagory.catagory_id="+catagoryId+"&catagory.catagory_name="+catagoryName,
						dataType: 'text',
						error:function(data){
								
						},
						success: function(data){
								
						if((data=="success")){									
							alert("修改成功");
							location.href = "showCatagory_by_page.do?page="+page ;
						}else if((data=="input")){
							alert("修改失败");
						}	
																	
					}						
					});
				}				
			});
	
	$(".discount_box :input.required1").each(function(){
		var $required=$("<strong class='high'>*</strong>");	
		$(this).parent().append($required);
	});
	$(".discount_box :input").blur(function(){
		var $parent=$(this).parent();
		$parent.find(".formtips").remove();
				
		if($(this).is('#newDiscount')){
			var discoun=this.value;
			var errorMsg='不能为空';
			var okMsg='正确';												
			if(this.value==""){
				$parent.append('<span class="formtips onError">'+errorMsg+'</span>');								
			}else if(/^(?:0|1|0\.[0-9]+)$/.test(this.value)){													
				$parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');										
			}else{
				errorMsg="输入0~1的浮点数";
				$parent.append('<span class="formtips onError">'+errorMsg+'</span>');
			}
		}
							
		}).keyup(function(){
			$(this).triggerHandler("blur");
		}).focus(function(){
			$(this).triggerHandler("blur");	
		});
		$('#sendDiscount').click(function(){
				$(".discount_box .required1:input").trigger('blur');
				var numError=$('.discount_box .onError').length;
				if(numError!=0){
					return false;
				}else{
					var catagoryId=$("#id2").val();
					var newDiscount=$("#newDiscount").val();
					$.ajax({
						type: "POST",
						url: "changeCatagoryDiscount.do?catagory.catagory_id="+catagoryId+"&catagory.discount="+newDiscount,
						dataType: 'text',
						error:function(data){
								
						},
						success: function(data){								
							if((data=="success")){									
								alert("修改成功");
								location.href = "showCatagory_by_page.do?page="+page ;
							}else if((data=="input")){
								alert("修改失败");
							}																		
						}						
					});
				}				
			});
			

	
	$(".deleteCatagory").click(function(){
		var catagoryId=$(this).attr("id");
		$.ajax({
			type: "POST",
			url: "findSubCatagory.do?catagory.catagory_id="+catagoryId,
			dataType: 'text',
			error:function(data){
								
			},
			success: function(data){
								
				if((data=="success")){									
					alert("此分类存在子类或图书，不能删除");
					
				}else if((data=="input")){
					alert("删除成功");
					location.href = "showCatagory_by_page.do?page=1" ;
				}	
																	
			}
							
		});
	});

});
(function (document) {
            //Usage: $("#id").drag()  
            //Author: hooyes
            $.fn.Drag = function () {
                var M = false;
                var Rx, Ry;
                var t = $(this);							
				
				t.click(function(){
				var id=t.attr("id");
				var name=t.attr("name");
				$("#id").attr("value",id);
				$("#name").attr("value",name);
					$.blockUI({ 
						message: $('#login_box'),
						css:{
							width: '280px',
					//		top: (Math.round((document.body.scrollHeight-280)/2)).toString()+ "px ",
							left: (Math.round((document.body.scrollWidth-280)/2)).toString()+ "px "
						}
					});
					$("#send").attr("name",name);
					$('.blockOverlay').attr('title','单击关闭').click($.unblockUI);
					$('.close').click($.unblockUI); 
				});

            }
        })(document);
(function (document) {
            //Usage: $("#id").drag()  
            //Author: hooyes
            $.fn.Drag1 = function () {
                var M = false;
                var Rx, Ry;
                var t = $(this);							
				
				t.click(function(){
				var id=t.attr("id");
				var name=t.attr("name");
				$("#id2").attr("value",id);
				$("#oldDiscount").attr("value",name);
					$.blockUI({ 
						message: $('#discount_box'),
						css:{
							width: '280px',
					//		top: (Math.round((document.body.scrollHeight-280)/2)).toString()+ "px ",
							left: (Math.round((document.body.scrollWidth-280)/2)).toString()+ "px "
						}
					});
					$("#sendDiscount").attr("name",name);
					$('.blockOverlay').attr('title','单击关闭').click($.unblockUI);
					$('.close').click($.unblockUI); 
				});

            }
})(document);
