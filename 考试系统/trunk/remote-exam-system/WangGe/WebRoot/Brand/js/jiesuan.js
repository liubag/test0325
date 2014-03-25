var goodsname = "";
var goodsid = "";
var goodspic = "";
var foucsObj = $("#text1");
var leibiao = "";
var leibiao_str = "";
// JavaScript Document
$(document).ready(function(){
	$("#text1").focus();
	goodspic = $("#goodspic").attr("src");
	var x = 1;
	$("#tianjia").click(function(){
		var a = $("#text1").val();
		var b = $("#text2").val();
		var c = $("#text3").val();
		var d = $("#select1").val();
		var e = $("#text4").val();
		if(a == ''){
			return;
		}
		if(d == null || d.length == 0){
			alert("该商品已经缺货.");
			return false;
		}
		if($('.no').length > 0){
			alert("商品数据不正确.");
			return false;
		}
		if(isNaN(c)){  
			alert("价钱需要输入数字.");
			return false;
		}
		
		if(isNaN(e) || e > 10){  
			alert("请正确输入折扣,且折扣小于等于10.");
			return false;
		}
		leibiao = goodsid + ":" + c + "," + d + "," + e;
		var f = c*e/10*d;
		var f = f.toFixed(2);
		var g = $("#text5").text();
		var h = (g*1.0+f*1.0)+"";
		$("#text5").html(h); 
		$("#tr1").before("<tr id=\"x"+x+"\"><td\tclass=\"td2\"><input type=\"hidden\" class=\"leibiao\" value=\""+leibiao+"\"/>"+a+"-"+b+"</td><td\tclass=\"td2\">" + goodsname + "</td><td\tclass=\"td2\">"+c+"\t*\t"+d+"\t*\t"+e+"折\t=\t"+"<span class='text6'>"+f+"</span>"+"</td><td\tclass=\"td2\"><input type='submit' id='del"+x+"' class='del sumbit' value='删除' onclick='test("+x+");'/></td></tr>");
		x = x +1;
		$("#cz").trigger('click');
		return false;
	});
	
	$("#cz").click(function(){
		$("#yes1").attr("class","no");  
		$("#yes3").attr("class","no");
		$("#yes4").attr("class","no"); 
		doStatu('2');
		$("#text1").focus();
	});
	
	$("#jiesuan").click(function(){
		var $leibiao = $(".leibiao");
		if($leibiao.length > 0){
			$leibiao.each(function(){
				leibiao_str+=$(this).val()+";";	
			})
			$(this).hide();
			$(".del").hide();
			$("#chushou").slideToggle();
			$("#sure").slideToggle();
			$("#goods_how").html($leibiao.length);
			$("#how").html($("#text5").text());
			$("#shishou").focus();
			$("#shishou").attr("value","");
			$("#zl").html();
			$("#yes5").attr("class","no");
		}
		return false;
	});
	
	$("#quxiao").click(function(){   //取消
		leibiao_str = "";
		$("#jiesuan").show();
		$(".del").show();
		$("#chushou").slideToggle();
		$("#sure").slideToggle();
		$("#text1").focus();
		$("#yes5").attr("class","yes");
	});
	
	$("#makesure").click(function(){   //确定结算
		var classname = $("#yes5").attr("class");
		if(classname == 'no'){
			alert("请输入实收数据.");
		}else{//实现结算
			$.ajax({
				type: "GET",
				timeout:"5000",
				url: "jieSuan_salesman.do?leibiao_str="+leibiao_str,
				dataType : "text",
				beforeSend:function(){
					$("#sure").slideToggle();
					$("#myDialog").slideToggle();
				},
				error:function(){
					alert("结算超时.");
					$("#sure").slideToggle();
					$("#myDialog").slideToggle();
				},
				success: function(msg){
					if(msg == 'success'){
						alert("交易成功.");
						$("#siframe",parent.document.body).attr("src","jiesuan.jsp");
					}else if(msg == 'fail'){
						alert("结算出错.");
						$("#sure").slideToggle();
						$("#myDialog").slideToggle();
					}else if(msg == 'fail_sales'){
						alert("登录状态丢失，请重新登录.");
						top.location.href = "exit_salesowner.do";
					}
					
				},
				complete:function(){
					
				}
			});
			
		}
	});
	
	$("#shuaxin").click(function(){   //重新刷新
		var a = $("#text1").val();
		var b = $("#text2").val();
		$("#text1").trigger('keyup');
		return false;
	});
	 //文本框失去焦点后
	    $("input").blur(function(){
			 if( $(this).is('#text3') ){
					if( this.value=="" || isNaN(this.value)){
						$("#yes3").attr("class","no");                  
					}else{
						$("#yes3").attr("class","yes"); 
					}
					return;
			 }
			 if( $(this).is('#text4')){
					if( this.value=="" || isNaN(this.value) || this.value > 10){
						$("#yes4").attr("class","no");                  
					}else{
						$("#yes4").attr("class","yes"); 
					}
					return;
			 }
		});//end blur
		
		$("input").keyup(function(){
			 if( $(this).is('#text1') ||  $(this).is('#text2')){
					var qz = $('#text1').val();
					var hz = $('#text2').val();
					if( qz=="" || hz==""){
						$("#yes1").attr("class","no");  
					}else{
					   //异步：
						$.ajax({
							type: "GET",
							timeout:"2000",
							url: "justGoodsFor_salesman.do?addgoods_no="+qz+"&goods_no="+hz,
							dataType : "json",
							beforeSend:function(){
								$("#show").attr("src","../pic/waiting.gif");
							},
							error:function(){
								doStatu('0');  //失败，包括超时
							},
							success: function(msg){
								var m = msg;
								if(m[0]['goodsid'].length > 0){  //成功
									var goodspicstr = goodspic + m[0]['goodspicstr'];
									$("#goodspic").attr("src",goodspicstr);
									goodsid = m[0]['goodsid'];
									$("#text3").attr("value", m[0]['goodspick']);
									$("#text4").attr("value", m[0]['goodszk']);
									var goodsmount = m[0]['goodsmount'];
									var optionstring = "";
									if(m[0]['goodsmount'].length==0){  //缺货
										doStatu('3');
									}else{
										for (var i = 0; i < goodsmount.length; i++) {
			                                optionstring += "<option value=\"" + goodsmount[i] + "\" >" + goodsmount[i] + "</option>"; ;
			                            }
										$("#select1").html(optionstring);
										goodsname = m[0]['goodsname'];
										doStatu('1');
									}		
								}else{//未找到
									doStatu('2');
								}
								
							},
							complete:function(){
								
							}
						});
						  
					}
			 }
			 else if($(this).is('#shishou')){
				 var how = $("#how").text();
				 if(this.value=="" || isNaN(this.value) || this.value*1 < how*1){
					 $("#yes5").attr("class","no");
				 }else{
					 $("#yes5").attr("class","yes");
					 $("#zl").html(this.value - how);
				 }
			 }
		});
		
		$(".text").focusin(function(){
			foucsObj = $(this);
		});
		
		$(".text").focusout(function(){
			foucsObj = null;
		});
		
		$("#shishou").focusin(function(){
			foucsObj = $(this);
		});
		$("#shishou").focusout(function(){
			foucsObj = null;
		});
});

//键盘事件，为了确保 按下 backspace不丢失当前页面,及快捷键处理
$(document).keypress(function(e) {
	if (e.ctrlKey && e.keyCode == 13) {  //结算快捷键 ctrl + enter
		$("#jiesuan").trigger('click');
		return;
	}
	else if(e.keyCode == 13){  //添加回车快捷键
		if(!$("#makesure").is(":hidden")){
			$("#makesure").trigger('click');
			return ;
		}
		if(!$("#tianjia").is(":hidden")){
			$("#tianjia").trigger('click');
		}
		return;
	}
	else if(e.keyCode == 8){
		if(foucsObj == null){  //焦点不在输入框中，屏蔽backspace
			e.preventDefault();
		}
		return;
	}
})

function doStatu(b){
	if(b=='1'){
		$("#yes1").attr("class","yes");
		$("#yes3").attr("class","yes");
		$("#yes4").attr("class","yes");
		$("#text3").show();
		$("#select1").show();
		$("#text4").show();
		$(".buttn1").show();
		$("#fail").hide();
		$("#goodspic").show();
		$("#show").hide();
		$("#qh").hide();
	}else if(b=='3'){
		$("#yes1").attr("class","no");
		$("#qh").show();
		$("#goodspic").show();
		$("#fail").hide();
		$("#show").hide();
	}else {
		$("#show").attr("src","../pic/gezi1.jpg"); 
		$("#yes1").attr("class","no");
		$("#yes3").attr("class","");
		$("#yes4").attr("class","");
		$("#text3").hide();
		$("#select1").hide();
		$("#text4").hide();
		$(".buttn1").hide();
		$("#goodspic").hide();
		$("#show").show();
		$("#qh").hide();
		if(b=='0'){
			$("#fail").show();
		}
	}
}
function test(x){
	var i = $("#del" + x).parent().parent().find(".text6").text();
	var g = $("#text5").text();
	var h = (g*1.0-i*1.0)+"";
	$("#text5").html(h);
	var del = $("#del" + x).parent().parent().remove();
	}