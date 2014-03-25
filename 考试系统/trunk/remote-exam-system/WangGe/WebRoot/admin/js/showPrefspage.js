	
$(function(){
		$("#rightIframe",parent.document.body).height(800);
		$('#rangeB').daterangepicker({arrows:true});
		 $("#sx").click(function(){
			 var time = $("#rangeB").val();
			 var gn = $("#gn").val();
			 if(gn == '输入格子名称'){
				 gn = "";
			 }
			 if(time=='点击选择筛选时间'){
				 time = "";
			 }
			 if(time.length<=0 && gn.length <= 0){
				 alert("输入或选择筛选条件！");
			 }else{
				 $("#rightIframe",parent.document.body).attr("src","showDoGoodsNote_by_page_admin.do?page=1&time="+time + "&gridname=" + gn); 	  
			 }
		 });
})

	function test(select){
	  		$("#rightIframe",parent.document.body).attr("src","showDoGoodsNote_by_page_admin.do?page="+select.value );
	  	}	

	function refreshSize() {
		var PStatus = $("#PStatus").attr("value");
		
		if(PStatus == '1'){
			$("#status0").attr("class","nuselect");
			$("#status1").attr("class","select");
			$("#status11").attr("class","nuselect");
		}else if(PStatus == '0'){
			$("#status0").attr("class","select");
			$("#status1").attr("class","nuselect");
			$("#status11").attr("class","nuselect");
		}else{
			$("#status0").attr("class","nuselect");
			$("#status1").attr("class","nuselect");
			$("#status11").attr("class","select");
		}
	}	