$(document).ready(function() {
	var height = $("body").height();
	$("#rightIframe",parent.document.body).height(height + 50);
	
	
	var $x = $("#xia");
	var $s = $("#shang");
	var $btn = $("#btn");

	var $x2 = $("#xia2");
	var $s2 = $("#shang2");
	var $btn2 = $("#btn2");

	var $x3 = $("#xia3");
	var $s3 = $("#shang3");
	var $btn3 = $("#btn3");

	var $x4 = $("#xia4");
	var $s4 = $("#shang4");
	var $btn4 = $("#btn4");

	
	var $x5 = $("#xia5");
	var $s5 = $("#shang5");
	var $btn5 = $("#btn5");
	
	var $div_sure = $("#div_sure");
	var tip_value = $("#tipdd").attr("value");
	if (tip_value != null && tip_value.length > 0) {
		$s.hide();
		$x.show();
		$btn.val("取消");
		$div_sure.show();
		var isamend = 1;
	} else {
		$x.hide();
		$s.show();
		$div_sure.hide();
		var isamend = 0;
	}

	$btn.click(function() {
		var value = $btn.attr("value");
		if (value == "修改") {
			$s.hide();
			$x.show();
			$btn.val("取消");
			isamend = isamend + 1;
			$div_sure.show();
		} else {
			$s.show();
			$x.hide();
			$btn.val("修改");
			isamend = isamend - 1;
			if (isamend == 0) {
				$div_sure.hide();
			}
		}
	});

	$btn2.click(function() {
		var value = $btn2.attr("value");
		if (value == "修改") {
			$s2.hide();
			$x2.show();
			$btn2.val("取消");
			isamend = isamend + 1;
			$div_sure.show();
		} else {
			$s2.show();
			$x2.hide();
			$btn2.val("修改");
			isamend = isamend - 1;
			if (isamend == 0) {
				$div_sure.hide();
			}
		}
	});

	$btn3.click(function() {
		var value = $btn3.attr("value");
		if (value == "修改") {
			$s3.hide();
			$x3.show();
			$btn3.val("取消");
			isamend = isamend + 1;
			$div_sure.show();
		} else {
			$s3.show();
			$x3.hide();
			$btn3.val("修改");
			isamend = isamend - 1;
			if (isamend == 0) {
				$div_sure.hide();
			}
		}
	});
	
	
	
	
	$btn4.click(function() {
		var tipinfo = $("#tipinfo").attr("value");
		var value = $btn4.attr("value");
		if (value == "修改") {
			if(tipinfo.length == 50){
				$("#wordcount").attr("class","text_red");	
			}
			$("#wordcount").html(tipinfo.length + "/50字");
			$s4.hide();
			$x4.show();
			$btn4.val("取消");
			isamend = isamend + 1;
			$div_sure.show();
		} else {
			$s4.show();
			$x4.hide();
			$btn4.val("修改");
			isamend = isamend - 1;
			if (isamend == 0) {
				$div_sure.hide();
			}
		}
	});
	
	$btn5.click(function() {
		var value = $btn5.attr("value");
		if (value == "修改") {
			$s5.hide();
			$x5.show();
			$btn5.val("取消");
			isamend = isamend + 1;
			$div_sure.show();
		} else {
			$s5.show();
			$x5.hide();
			$btn5.val("修改");
			isamend = isamend - 1;
			if (isamend == 0) {
				$div_sure.hide();
			}
		}
	});
	
});

function check(){
	var gridname = $("#gridname").attr("value");
	var phone = $("#phone").attr("value");
	var address = $("#address").attr("value");
	var tipInfo = $("#tipinfo").attr("value");
	var qq_number = $("#qq_number").attr("value");
	if($("#shang").is(":hidden")){
		if(gridname == null || gridname.length <= 0){
			alert("格子名称不能为空！");
			return false;
		}
	}
	if($("#shang2").is(":hidden")){
		if(phone == null || phone.length <= 0){
			alert("联系电话不能为空！");
			return false;
		}
	}
	if($("#shang3").is(":hidden")){
		if(address == null || address.length <= 0){
			alert("地址不能为空！");
			return false;
		}
	}
	if($("#shang4").is(":hidden")){
		if(tipInfo == null || tipInfo.length <= 0){
			alert("提示不能为空！");
			return false;
		}
	}
	if($("#shang5").is(":hidden")){
		if(qq_number == null || qq_number.length <= 5){
			alert("请正确填入QQ客服.");
			return false;
		}
	}
	
}

var beforevalue = null;
	function goodsinfokeyup(){
		var tipinfo = $("#tipinfo").attr("value");
		if(tipinfo.length >50){
			$("#tipinfo").val(beforevalue);
			
			return;
		}
		if(tipinfo.length == 50){
			$("#wordcount").attr("class","text_red");
		}else{
			$("#wordcount").attr("class","text_black");
		}
		beforevalue = tipinfo;
		$("#wordcount").html(tipinfo.length + "/50字");
		return;
	}