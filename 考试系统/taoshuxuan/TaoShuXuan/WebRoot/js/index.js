$(function(){
	$.ajax({
		type: "GET",
		url: "getIndexPageLists.do",
		dataType : "json",
		beforeSend:function(){
	 		//alert("beforeSend");
		},
		error:function(){
	 		alert("error");
		},
		success: function(msg){

			//1.新书热卖榜数据
			var hotsale_newbook_l=msg[0];
			var hotsale_newbook_length=hotsale_newbook_l.length;
			//新书热卖榜最多为前七
			if(hotsale_newbook_length>7){
				hotsale_newbook_length=7;
			}
			
			for(var i=0;i<hotsale_newbook_length;i++){
				var obj=eval(hotsale_newbook_l[i]);
				var hotsale_newbook_html="<li><a href='showbook.do?book.book_id="+obj[0]+"'>"+obj[1]+"</a></li>";
				$("#hotsale_newbook ul").append(hotsale_newbook_html);				
			}
			
			//2.热门图书
			var hotsale_l=msg[1];
			for(var i=0;i<hotsale_l.length;i++){
				var obj=eval(hotsale_l[i]);
				var hotsale_html="<dl class='main1221'>"
								+"<div class='hotsale_title'><a target='_blank' title='showbook.do?book.book_id="+obj[1]+"' href='showbook.do?book.book_id="+obj[0]+"'>"+obj[1]+"</a></div>"
								+"<div class='hotsale_img'><a href='showbook.do?book.book_id="+obj[0]+"'><img src='../BookImages/cover/"+obj[2]+"' title='"+obj[1]+"'/></a></div>"
								+"<div class='hotsale_price'>"
								+"<span class='price_d'>¥<em>"+showPrice(obj[3])+"</em></span ><span class='discount'>"+parseInt(obj[4].toString())+"折</span>"
								+"</div></dl>";			
				$("#hotsale_div2").append(hotsale_html);
			}
			
			//3.热门作者
			var hotAuthor_l=msg[2];
			var hotAuthor_length=hotAuthor_l.length;
			if(hotAuthor_length>4){
				hotAuthor_length=4;
			}
			for(var i=0;i<hotAuthor_length;i++){
				var obj=eval(hotAuthor_l[i]);
				var hotAuthor_html="<dl class='hotauthor'>"
								+"<div class='book_img'><a href='showbook.do?book.book_id="+obj[0]+"' ><img src='../BookImages/cover/"+obj[2]+"' title='"+obj[1]+"'/></a></div>"
								+" <span class='book_name'><a href='showbook.do?book.book_id="+obj[0]+"' title='"+obj[1]+"' target='_blank'>"+obj[1]+"</a></span>"
								+"<span class='author_name'><a href='search.do?type=author&author="+obj[5]+"' target='_blank'>"+obj[5]+"</a></span>"
								+"<div class='price'>"
								+"<span class='price_d'>¥<em>"+showPrice(obj[3])+"</em></span ><span class='discount'>"+parseInt(obj[4].toString())+"折</span>"
								+"</div></dl>";
				$("#main132").append(hotAuthor_html);
			}
			
			//4.热门收藏
			var hotCollection_l=msg[3];
			for(var i=0;i<hotCollection_l.length;i++){
				var obj=eval(hotCollection_l[i]);
				var hotCollection_html="<dl class='hotcollection_bookinfo'>"
									+"<div class='book_img'><a href='showbook.do?book.book_id="+obj[0]+"'><img src='../BookImages/cover/"+obj[2]+"' title='"+obj[1]+"'/></a></div>"
									+"<span class='book_name'><a href='showbook.do?book.book_id="+obj[0]+"' target='_blank'>"+obj[1]+"</a></span>"
									+"<div class='price'>"
									+"<span class='price_d'>¥<em>"+showPrice(obj[3])+"</em></span ><span class='discount'>"+parseInt(obj[4].toString())+"折</span>"
									+"</div><div class='collection_num'><em>"+obj[5]+"</em>次收藏 </div></dl>";	
				$("#hotcollection").append(hotCollection_html);
			}
		}
	});
	
	//显示价格
	function showPrice(obj){
		var f=parseFloat(obj.toString());
		var showStr=f.toFixed(1).toString();
		return showStr+"0";	
	}
});