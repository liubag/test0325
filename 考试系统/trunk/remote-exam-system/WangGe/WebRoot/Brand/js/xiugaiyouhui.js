// JavaScript Document
$(function(){
	var $select1 = "";
	var $select2 = "";
	var $text = $("#zkxinxi");
	$text.attr("value","");
	var grid_ownerid = $("#grid_ownerid").val();
	var check = "";
	$("#zdzk").attr("checked", false );
	$("#qczk").attr("checked", false );
	$("#qd").hide();
	//移到右边
	$('#zd').click(function() {
	//获取选中的选项，删除并追加给对方
		$select1 = $('#select1 option:selected');
		if($select1.length>1){
			alert("不能多选！");
			return;
		}
		var sele_text = $select1.text();
		if(sele_text.length > 0){
			$("#goodunm").attr("value",sele_text);
			$("#qd").show();
			$('#zd').hide();
		}
	});
	
	$("#qd").click(function(){
		var zk = $("#zk").attr("value");
		if(zk.length==0){
			alert("请选择折扣。");
		}
		$("#goodunm").attr("value","");
		var str2 = $select1.text()+"[折扣："+zk+"]";
		var str = "<a href='/WangGe/findGN_u.do?goid="+grid_ownerid+"&gn="+$select1.text()+"'>"+str2+"</a>" ;
		$select1.attr("text",str2);
		$select1.attr("selected",false);
		$select1.appendTo('#select2');
		$select1 = null;
		$text.attr("value",$text.val() + "" +str + "");
		$("#qd").hide();
		$('#zd').show();
		zhekoukeyup();
	});
	$("#hf").click(function(){
		$select2 = $('#select2 option:selected');
		if($select2.length>1){
			alert("不能多选恢复！");
			return;
		}
		var sele_text = $select2.text();
		var text_str = $text.val();
		var index2 = text_str.indexOf(sele_text);
		var ttt = text_str.substring(0, index2);
		index2 = index2 *1 + 4;
		var index3 = ttt.lastIndexOf("<");
		text_str = text_str.substring(0, index3) + text_str.substring(index2 + sele_text.length, text_str.length);
		$text.attr("value",text_str);
		var index = sele_text.indexOf("[");
		sele_text = sele_text.substring(0, index);
		$select2.attr("text",sele_text);
		$select2.attr("selected",false);
		$select2.appendTo('#select1');
		$select2 = null;
		zhekoukeyup();
		
	});
	
	$("#zdzk").click(function(){
		if($(this).attr("checked")==false){
			check = "";
			var arr = new Array();
			var str = "";
			$("#select2").each(
			  function()
			  {
			   str = str + $(this).text();
			  }
			 );
			if(str.length > 13){
				alert("需要恢复所有折扣才能取消制定折扣优惠.");
				return false;
			}
			$("#zdyh").hide();
		}else{
			check = "2";
			$("#qczk").attr("checked", false );
			$("#zdyh").show();
			$("#quanczk").hide();
			$(this).attr("checked", this.checked );
		}
		return true;
	});
	$("#qczk").click(function(){
		if($(this).attr("checked")==false){
			$("#quanczk").hide();
			check = "";
		}else{
			$("#zdzk").attr("checked", false );
			$("#zdyh").hide();
			$("#quanczk").show();
			$(this).attr("checked", this.checked );
			check = "1";
		}
		return true;
	});
	$("#reset1").click(function(){
		$("#giframe",parent.document.body).attr("src","/WangGe/Brand/gridmanage/fabutongshishenqingshangjia.jsp");
		return false;
	});
});
var beforevalue = null;
var beforevalue2 = null;
	  	function infokeyup(){
	  		var goodsinfo = $("#text").attr("value");
	  		if(goodsinfo.length >100){
	  			$("#text").val(beforevalue);
	  			$("#wordcount").attr("class","text_red");
	  			return;
	  		}
	  		if(goodsinfo.length == 100){
	  			$("#wordcount").attr("class","text_red");
	  		}else{
	  			$("#wordcount").attr("class","text_black");
	  		}
	  		beforevalue = goodsinfo;
	  		$("#wordcount").html(goodsinfo.length + "/100字");
	  		return;
	  	}
	  	function zhekoukeyup(){
	  		var zkxinxi = $("#zkxinxi").attr("value");
	  		if(zkxinxi.length >1700){
	  			$("#zkxinxi").val(beforevalue);
	  			$("#wordcount2").attr("class","text_red");
	  			return;
	  		}
	  		if(zkxinxi.length == 1700){
	  			$("#wordcount2").attr("class","text_red");
	  		}else{
	  			$("#wordcount2").attr("class","text_black");
	  		}
	  		beforevalue2 = zkxinxi;
	  		$("#wordcount2").html(zkxinxi.length + "/1700字");
	  		return;
	  	}
	  	function onload(){
	  		beforevalue = $("#text").attr("value");
	  		$("#wordcount").html(beforevalue.length + "/100字");
	  		beforevalue2 = $("#zkxinxi").attr("value");
	  		$("#wordcount2").html(beforevalue2.length + "/1700字");
	  	}
	  	
		function  line3(){
	  		var text = $("#text").val(); 
			var zkxinxi = $("#zkxinxi").val();
			if($("#qczk").attr("checked")==true ){
				return true;
			}
			if($("#zdzk").attr("checked")==true){
				if(zkxinxi.length == 0){
					alert("未制定折扣优惠.");
					return false;
				}else{
					return true;
				}
			}
			if(text.length == 0){
				alert("优惠信息不能为空.");
				return false;
			}
			return true;
	  	}