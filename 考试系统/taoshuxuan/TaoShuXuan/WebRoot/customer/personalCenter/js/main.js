$(document).ready(function () {
	$(".mySidebar").click(function(){
			$("#iframe").attr("src",$(this).attr("href"));
			return false;
	});
	var trigger =$("#trigger").val();
		if(trigger=="myOrder"){
			$("#myOrderHref").trigger("click");
		}else if(trigger=="myGoods"){
			$("#myGoodsHref").trigger("click");
		}else if(trigger=="myCollection"){				
			$("#myCollectionHref").trigger("click");
		}else if(trigger=="myComment"){
			$("#myCommentHref").trigger("click");
		}
});