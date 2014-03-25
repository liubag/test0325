$(document).ready(function () {
	$('a.buy').click(function(){
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
						alert("加入购物车成功");
					}else{
						alert("input");
					}															
			}		
		});
	});
	
	//将图书加入收藏
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
	
});
