$(document).ready(function () {
	var page=$(".page").val();
	
	$(".discount").each(function(){
		$(this).Drag1();
	});
	
	$(".storage_num").each(function(){
		$(this).Drag();
	});
	
	$(".added").click(function(){
		var bookId=$(this).attr("id");
		var status=$(this).attr("name");
		var newStatus=$(".shangjia").val();
		if(status==1){
			alert("此图书已上架");
		}else{
		$.ajax({
			type: "POST",
			url: "findBookInventory.do?book.book_id="+bookId+"&book.status="+newStatus,
			dataType: 'text',
			error:function(data){
								
			},
			success: function(data){
								
				if((data=="success")){									
					alert("此图书上架成功");
					location.href = "showBook_by_page.do?page="+page ;						
				}else if((data=="input")){
					alert("此图书库存为0，上架失败");
				}																		
			}
							
		});												
		}	
	});
	
	$(".drops").click(function(){
		var bookId=$(this).attr("id");
		var status=$(this).attr("name");
		var newStatus=$(".xiajia").val();
		if(status==2){
			alert("此图书已下架");
		}else if(status==0){
			alert("此图书还没有上架，下架失败");
		}else{
		$.ajax({
			type: "POST",
			url: "findBookInventory.do?book.book_id="+bookId+"&book.status="+newStatus,
			dataType: 'text',
			error:function(data){
								
			},
			success: function(data){
								
				if((data=="success")){									
					alert("此图书下架成功");
					location.href = "showBook_by_page.do?page="+page ;						
				}else if((data=="input")){
					alert("操作失败");
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
					var book_id=$("#id2").val();
					var newDiscount=$("#newDiscount").val();
					$.ajax({
						type: "POST",
						url: "changeBookDiscount.do?book.book_id="+book_id+"&book.discount="+newDiscount,
						dataType: 'text',
						error:function(data){
								
						},
						success: function(data){								
							if((data=="success")){									
								alert("修改成功");
								location.href = "showBook_by_page.do?page="+page ;	
							}else if((data=="input")){
								alert("修改失败");
							}																		
						}						
					});
				}				
			});
			
		$(".storage_num_box :input.required1").each(function(){
			var $required=$("<strong class='high'>*</strong>");	
			$(this).parent().append($required);
		});
		$(".storage_num_box :input").blur(function(){
			var $parent=$(this).parent();
			$parent.find(".formtips").remove();
				
			if($(this).is('#newStorage_num')){
				var discoun=this.value;
				var errorMsg='不能为空';
				var okMsg='正确';												
				if(this.value==""){
					$parent.append('<span class="formtips onError">'+errorMsg+'</span>');								
				}else if(/^[0-9]+$/.test(this.value)){													
					$parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');										
				}else{
					errorMsg="输入正整数";
					$parent.append('<span class="formtips onError">'+errorMsg+'</span>');
				}
			}							
			}).keyup(function(){
				$(this).triggerHandler("blur");
			}).focus(function(){
				$(this).triggerHandler("blur");	
			});
			$('#sendStorage_num').click(function(){
				$(".storage_num_box .required1:input").trigger('blur');
				var numError=$('.storage_num_box .onError').length;
				if(numError!=0){
					return false;
				}else{
					var book_id=$("#id").val();
					var newStorage_num=$("#newStorage_num").val();
					$.ajax({
						type: "POST",
						url: "changeBookStorage_num.do?book_id="+book_id+"&storage_num="+newStorage_num,
						dataType: 'text',
						error:function(data){
								
						},
						success: function(data){								
							if((data=="success")){									
								alert("修改成功");
								location.href = "showBook_by_page.do?page="+page ;
							}else if((data=="input")){
								alert("修改失败");
							}																		
						}						
					});
				}				
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
				var name=t.attr("charset");
				var storage_num=t.attr("name");
				$("#id").attr("value",id);
				$("#name").attr("value",name);
				$("#oldStorage_num").attr("value",storage_num);
					$.blockUI({ 
						message: $('#storage_num_box'),
						css:{
							width: '280px',
					//		top: (Math.round((document.body.scrollHeight-280)/2)).toString()+ "px ",
							left: (Math.round((document.body.scrollWidth-280)/2)).toString()+ "px "
						}
					});
					$("#sendStorage_num").attr("name",name);
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
				var name=t.attr("charset");
				var discount=t.attr("name");
				$("#id2").attr("value",id);
				$("#name2").attr("value",name);
				$("#oldDiscount").attr("value",discount);
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