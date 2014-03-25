$(function(){
	var type=$("#type").val();
	if(type=="0"){
		$("#myGrid").attr("class","yes");
		$("#myGoods").attr("class","no");
	}else if(type=="1"){
		$("#myGrid").attr("class","no");
		$("#myGoods").attr("class","yes");
	}
});