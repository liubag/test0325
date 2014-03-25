$(function(){
	
	$("#ya").jSuggest({
		url: "findKeyWord_By_Rate.do",
		type: "GET",
		data: "searchQuery",
		autoChange: true
	});
	$("#send").click(function(){
		var val=$("#ya").val();
		var rowName=$("#rowName").val();
		
		top.location.href = "gainGoods_by_keyWord.do?otherOrderBy=&keyWord="+val+"&rowName="+rowName;
	});
	$("#ya").attr("value",$("#forYa").val());
});

function Yaonfocus(){
	if($("#ya").val()==$("#forYa").val()){
		$("#ya").attr("value","");
	}
}
function Yaonblur(){
	if($("#ya").val()==''){
		$("#ya").attr("value",$("#forYa").val());
	}
}