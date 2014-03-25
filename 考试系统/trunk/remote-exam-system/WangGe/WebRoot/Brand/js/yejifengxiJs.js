var owner_status = 0;
var n_statu = 0;
function refreshSize() {
	owner_status = $("#owner_status").val();
		if(owner_status == '1'){
			$("#zhou").attr("class","yes");
			$("#yue").attr("class","no");
		}else if(owner_status == '2'){
			$("#zhou").attr("class","no");
			$("#yue").attr("class","yes");
		}	
}	



function szhou(){
	$("#y").hide();
	$("#z").show();
	n_statu = 0;
	owner_status = 1;
	doAjax();
	$("#zhou").attr("class","yes");
	$("#yue").attr("class","no");
	return false;
}

function syue(){
	$("#z").hide();
	$("#y").show();
	n_statu = 0; 
	owner_status = 2;
	doAjax();
	$("#zhou").attr("class","no");
	$("#yue").attr("class","yes");
	return false;
}


function zup(){
	n_statu = n_statu - 1; 
	doAjax();
	return false;
}

function zdown(){
	if(n_statu >= 0){
		n_statu = 0;
		alert("没有往下的数据.");
	}else{
		
		n_statu = n_statu + 1; 
		doAjax();
	}
	return false;
}

function yup(){
	n_statu = n_statu - 1;
	doAjax();
	return false;
}

function ydown(){
	if(n_statu >= 0){
		n_statu = 0;
		alert("没有往下的数据.");
	}else{
		n_statu = n_statu + 1; 
		doAjax();
	}
	return false;
}

function doAjax(){
	var $shijian_min = $(".shijian_min");
	var $m = $("#myDialog");
	var $b = $("#baobiao");
	var $f = $("#fail_for");
	var $f_value = $("#waiting");
	//异步：
	 $.ajax({
			type: "POST",
			url: "getShijian_min_owner.do?n_statu=" + n_statu + "&owner_status=" + owner_status,
			dataType: 'text',
			contentType:"text/html;charset=utf-8",
			beforeSend:function(){
		 		$shijian_min.html("分析数据中...");
		 		$b.hide();
		 		$f.hide();
		 		$m.show();
			},
			error:function(){
				$m.hide();
				$b.hide();
				$f.show();
				$shijian_min.html("网络出错.");
				$f_value.html("网络出错.");
			},
			success: function(shijian_min){
				if(shijian_min.length > 0){
					$f.hide();
			 		$m.hide();
			 		$shijian_min.slideToggle();
			 		$shijian_min.html(shijian_min);
			 		$shijian_min.slideToggle();
			 		$("#fengxi",document.body).attr("src","yejifengxi_.jsp?owner_status=" + owner_status + "&n_statu=" + n_statu);
					$b.show();
					
				}else{
					$m.hide();
					$b.hide();
					$f.show();
					$shijian_min.html("没有相应的数据.");
					$f_value.html("没有相应的数据.");
				}	
			},
			complete:function(){
				
		  		return;
			}
		});	
	
}

