
	function check(){
	var gn = $("#gn").attr("value");
    if(gn == null || gn.length <= 0){
    	alert("请输入筛选格子名称.");
    	return false;
    }
    return true;
	}

	function refreshSize() {
		var goodstatu = $("#goodstatu").attr("value");
		
		if(goodstatu == '1'){
			$("#status0").attr("class","nuselect");
			$("#status1").attr("class","select");
			$("#status2").attr("class","nuselect");
			$("#status11").attr("class","nuselect");
		}else if(goodstatu == '0'){
			$("#status0").attr("class","select");
			$("#status1").attr("class","nuselect");
			$("#status2").attr("class","nuselect");
			$("#status11").attr("class","nuselect");
		}else if(goodstatu == '2'){
			$("#status0").attr("class","nuselect");
			$("#status1").attr("class","nuselect");
			$("#status2").attr("class","select");
			$("#status11").attr("class","nuselect");
		}else{
			$("#status0").attr("class","nuselect");
			$("#status1").attr("class","nuselect");
			$("#status2").attr("class","nuselect");
			$("#status11").attr("class","select");
		}
	}	