$(document).ready(function(){
	$('a.put_into_cart').click(function(){
		var t = $(this);
		$.ajax({
			type: "POST",
				url: "/TaoShuXuan/addBookToCart.do?book.book_id="+this.name,
				dataType: 'text',
				async: false,
				error:function(data){	
						alert("error");			
				},
				success: function(data){
							
					if((data=="success")){									
						alert(" 放入购物车成功");
					}else{
						alert("input")
					}															
			}		
		});
	});
		$('a.cut_from_cart').click(function(){
		var t = $(this);
		if(confirm("真的要删除吗？？")){
			$.ajax({
				type: "POST",
					url: "cutBookToCart.do?book.book_id="+this.name,
					dataType: 'text',
					async: false,
					error:function(data){	
							alert("error");			
					},
					success: function(data){
								
						if((data=="success")){									
							alert("移出购物车成功");
						}else{
							alert("input")
						}															
				}		
			});
		}
	});
	
	$('a.collect').click(function(){
		var t = $(this);
		$.ajax({
			type: "POST",
				url: "addToCollection.do?book.book_id="+this.name,
				dataType: 'text',
				async: false,
				error:function(data){	
						alert("error");			
				},
				success: function(data){
							
					if((data=="success")){									
						alert("已添加到个人收藏");
					}else if(data=="repeat"){
						alert("收藏夹内已存在");
					}else{
						alert("收藏出错");
					}														
			}		
		});
	});
	
	$('input.number').change(function(){
		var number = $(this).val();
		
		$.ajax({
			type: "POST",
				url: "updateAmount.do?book.book_id="+this.name+"&amountCount="+number,
				dataType: 'text',
				async: false,
				error:function(data){	
						alert("error");
						return false;			
				},
				success: function(data){
							
					if(data){
															
						return true;
					}else{
						return false;
					}												
			}		
		});
		
	});
	$('.add').click(function(){
		var i = $(this).parent().children("input");
		i.attr("value",i.val()-0+1);
		i.change();
		
	});
	$('.cut').click(function(){
		var i = $(this).parent().children("input.number");
		var amount = i.val()-0 ;
		if(amount >1){
			i.attr("value",amount-1);
			i.change();
		}
	});
});
