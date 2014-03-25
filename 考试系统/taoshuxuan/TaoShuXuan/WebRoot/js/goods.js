$(document).ready(function () {
	var title=$("#book_title").val();
	document.title=title;
	var all=$(".all").val();
	if(all!=0){
		var one=$(".oneStar").val();
		var two=$(".twoStar").val();
		var three=$(".threeStar").val();
		var four=$(".fourStar").val();
		var five=$(".fiveStar").val();
		var str=[one,two,three,four,five];
		var rate=five/all*100+four/all*100;  //好评率
		var max=150;         //设置最大的显示值
		str=Array.sort(str);  //排序
		var maxStar=str[4];  //最大星
		var oneStarRate=one/maxStar*max;
		var twoStarRate=two/maxStar*max;
		var threeStarRate=three/maxStar*max;
		var fourStarRate=four/maxStar*max;
		var fiveStarRate=five/maxStar*max;
		$(".goodPLv").html(rate+"%");
		$(".fiveRate").html(five/all*100+"%");
		$(".fourRate").html(four/all*100+"%");
		$(".threeRate").html(three/all*100+"%");
		$(".twoRate").html(two/all*100+"%");
		$(".oneRate").html(one/all*100+"%");
		$(".fiveStarRate").attr("style","width: "+fiveStarRate+"px");
		$(".fourStarRate").attr("style","width: "+fourStarRate+"px");
		$(".threeStarRate").attr("style","width: "+threeStarRate+"px");
		$(".twoStarRate").attr("style","width: "+twoStarRate+"px");
		$(".oneStarRate").attr("style","width: "+oneStarRate+"px");
	}else{
		$(".goodPLv").html("100%");
		$(".fiveRate").html("100%");
		$(".fourRate").html("0%");
		$(".threeRate").html("0%");
		$(".twoRate").html("0%");
		$(".oneRate").html("0%");
		$(".fiveStarRate").attr("style","width:150px");
		$(".fourStarRate").attr("style","width:150px");
		$(".threeStarRate").attr("style","width:150px");
		$(".twoStarRate").attr("style","width:150px");
		$(".oneStarRate").attr("style","width:150px");
	}
	$('a#buy').click(function(){
		var t = $(this);
		var amountCount = $('#buy_num').val();
		$.ajax({
			type: "POST",
				url: "addBooksToCart.do?book.book_id="+this.name+"&amountCount="+amountCount,
				dataType: 'text',
				async: false,
				error:function(data){	
						alert("error");			
				},
				success: function(data){
							
					if((data=="success")){									
						alert("已放入购物车");
					}else{
						alert("input")
					}															
			}		
		});
	});
	$('a#collect').click(function(){
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