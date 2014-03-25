/* Copyright 源续网络设计公司
 * Version: 1.0 (2012-03-24)
 * Requires: jQuery 1.2.6+
 */
$(function(){
	 test="test";
	$.ajax({
		type: "GET",
		url: "showHome_aa.do",
		dataType : "json",
		beforeSend:function(){
	 		//alert("beforeSend");
		},
		error:function(){
	 		alert("error");
		},
		success: function(msg){
			// console.log(msg);
			
			var m = msg;
			var str = "";
			var brandGoods_l = msg[0]['brandGoods_l'];
			var brandGoods_length=brandGoods_l.length;
			if(brandGoods_length >10){
				brandGoods_length=10;
			}
			for (var i=0; i < brandGoods_length; i++) {
			  var brandGoodsHtml="<span class='sale'><dl>"
								  +"<dt><img src='images/sale.jpg' alt='sale'/></dt>"
								  +"<dd>商品名:"+brandGoods_l[i].goods_name+"</dd>"
								  +"<dd class='sale1' >当前价:"+brandGoods_l[i].goods_price+"</dd>"
								  +"<dd>市场价:"+brandGoods_l[i].goods_price+"</dd>"
								  +"<dd class='sale1'>浏览量:"+100+"</dd>"
								  +"<dd>折扣:"+brandGoods_l[i].zk+"</dd>"
								  +" </dl></span>";
			  $("#brandsale").append(brandGoodsHtml);
			  //console.log(brandGoods_l[i]);
			};
			
			var brandP_l = msg[0]['brandP_l'];
			
			for (var i=0; i < brandP_l.length; i=i+2) {
				var brandPHtml="<li><a href='findPre_aa.do?p_id="+brandP_l[i].p_id+"' target='_blank'><div style='left:0; top:0; width:220px; height:200px;'><table style='width:100%;'>"
							   +"<tr><td class='yh_title'>"+brandP_l[i].owner+"</td></tr>"
							   +"<tr><td class='yh_content'>"+brandP_l[i].p_text+"</td></tr></table></div></a>";
				var endPHtml="</li>";
				if (i+1<brandP_l.length) {
					brandPHtml+="<a href='findPre_aa.do?p_id="+brandP_l[i+1].p_id+"' target='_blank'><div style='left:0; top:200px; width:220px; height:200px;'><table style='width:100%;'>"
								+"<tr><td class='yh_title'>"+brandP_l[i+1].owner+"</td></tr>"
								+"<tr><td class='yh_content'>"+brandP_l[i+1].p_text+"</td></tr></table></div></a>";
				}
				brandPHtml+=endPHtml;
				$("#focus1 ul").append(brandPHtml);
				console.log(brandP_l[i]);
			}
			showBrandP();
			var scatteredGoods_l = msg[0]['scatteredGoods_l'];
			var scatteredGoods_length=scatteredGoods_l.length;
			if(scatteredGoods_length >10){
				scatteredGoods_length=10;
			}
			//alert(scatteredGoods_l.length);
			for (var i=0; i < scatteredGoods_length; i++) {
				 var studentGoodsHtml="<span class='sale'><dl>"
			  +"<dt><img src='images/sale.jpg' alt='sale'/></dt>"
			  +"<dd>商品名:"+scatteredGoods_l[i].goods_name+"</dd>"
			  +"<dd class='sale1' >当前价:"+scatteredGoods_l[i].goods_price+"</dd>"
			  +"<dd>市场价:"+scatteredGoods_l[i].goods_price+"</dd>"
			  +"<dd class='sale1'>浏览量:"+100+"</dd>"
			  +"<dd>折扣:"+scatteredGoods_l[i].zk+"</dd>"
			  +" </dl></span>";
			  $("#studentsale").append(studentGoodsHtml);
				console.log(scatteredGoods_l[i]);
			}
			//showBrandP();
			var scatteredP_l = msg[0]['scatteredP_l'];
			for (var i=0; i < scatteredP_l.length; i=i+2) {
				var scatteredPHtml="<li><a href='findPre_aa.do?p_id="+scatteredP_l[i].p_id+"' target='_blank'><div style='left:0; top:0; width:220px; height:200px;'><table style='width:100%;'>"
							   +"<tr><td class='yh_title'>"+scatteredP_l[i].owner+"</td></tr>"
							   +"<tr><td class='yh_content'>"+scatteredP_l[i].p_text+"</td></tr></table></div></a>";
				var endPHtml="</li>";
				if (i+1<scatteredP_l.length) {
					scatteredPHtml+="<a href='findPre_aa.do?p_id="+scatteredP_l[i+1].p_id+"' target='_blank'><div style='left:0; top:200px; width:220px; height:200px;'><table style='width:100%;'>"
								+"<tr><td class='yh_title'>"+scatteredP_l[i+1].owner+"</td></tr>"
								+"<tr><td class='yh_content'>"+scatteredP_l[i+1].p_text+"</td></tr></table></div></a>";
				}
				scatteredPHtml+=endPHtml;
				$("#focus2 ul").append(scatteredPHtml);
				console.log(scatteredP_l[i]);
			}
			showStudentP();
			//alert(scatteredP_l.length);
			
		},
		complete:function(){
			//alert("complete");
		}
	});
	
	$(".goods_type").click(function(){
		var id = $(this).attr("id");
		alert(id);
		top.location.hre
		
		f = "showAllGoods_aa.do?type_id="+id+"&show_type=LZ_time&filter_type=all_type";
		return false;
	});
	
	$(".menu").click(function(){
		var id = $(this).attr("id");
		alert(id);
		hurl = ""
		if(id=='home'){
			hurl = "index.jsp"
		}else if(id=='brand'){
			hurl = "showAllGrid_aa.do?filter_type=" + id;
		}else if(id=='scattered'){
			hurl = "showAllGrid_aa.do?filter_type=" + id;
		}else if(id=='about'){
			hurl = "about.html"
		}
		top.location.href = hurl;
		return false;
	});
	
	/**
	 * 品牌网格优惠信息
	 */
	
	//显示图片函数，根据接收的index值显示相应的内容
	function showPics(index,sHight) { //普通切换
		var nowTop = -index*sHight; //根据index值计算ul元素的left值
		$("#focus1 ul").stop(true,false).animate({"top":nowTop},500); //通过animate()调整ul元素滚动到计算出的position
		$("#focus1 .btn2 span").removeClass("on").eq(index).addClass("on"); //为当前的按钮切换到选中的效果
	}
	
	function showFirPic(len,sHight) { //最后一张图自动切换到第一张图时专用
	
		$("#focus1 ul").append($("#focus1 ul li:first").clone());
		var nowTop = -len*sHight; //通过li元素个数计算ul元素的left值，也就是最后一个li元素的右边
		$("#focus1 ul").stop(true,false).animate({"top":nowTop},500,function() {
				//通过callback，在动画结束后把ul元素重新定位到起点，然后删除最后一个复制过去的元素
		$("#focus1 ul").css("top","0");
		$("#focus1 ul li:last").remove();
		}); 
		$("#focus1 .btn2 span").removeClass("on").eq(0).addClass("on"); //为第一个按钮添加选中的效果
	}
	
	function showBrandP(){
		var sWidth = $("#focus1").width(); //获取焦点图的宽度（显示面积）
		var sHight = $("#focus1").height();
		var len = $("#focus1 ul li").length; //获取焦点图个数
		var index = 0;
		var picTimer;
		
		//以下代码添加数字按钮和按钮后的半透明长条
		var btn2 = "<div class='btnBg2'></div><div class='btn2'>";
		for(var i=0; i < len; i++) {
			btn2 += "<span>" + (i+1) + "</span>";
		}
		btn2 += "</div>";
		$("#focus1").append(btn2);
		$("#focus1 .btnBg2").css("opacity",0.5);
		
		//为数字按钮添加鼠标滑入事件，以显示相应的内容
		$("#focus1 .btn2 span").mouseenter(function() {
			index = $("#focus1 .btn2 span").index(this);
			showPics(index,sHight);
		}).eq(0).trigger("mouseenter");
		//本例为左右滚动，即所有li元素都是在同一排向左浮动，所以这里需要计算出外围ul元素的宽度
		$("#focus1 ul").css("top",sHight * (len + 1));
		
		//鼠标滑入某li中的某div里，调整其同辈div元素的透明度，由于li的背景为黑色，所以会有变暗的效果
		$("#focus1 ul li div").hover(function() {
			$(this).siblings().css("opacity",0.7);
		},function() {
			$("#focus1 ul li div").css("opacity",1);
		});
		
		//鼠标滑上焦点图时停止自动播放，滑出时开始自动播放
		$("#focus1").hover(function() {
			clearInterval(picTimer);
		},function() {
			picTimer = setInterval(function() {
				if(index == len) { //如果索引值等于li元素个数，说明最后一张图播放完毕，接下来要显示第一张图，即调用showFirPic()，然后将索引值清零
					showFirPic(len,sHight);
					index = 0;
				} else { //如果索引值不等于li元素个数，按普通状态切换，调用showPics()
					showPics(index,sHight);
				}
				index++;
			},3000); //此3000代表自动播放的间隔，单位：毫秒
		}).trigger("mouseleave");
		
	}
	
	
	/**
	 * 学生网格优惠信息
	 */
	
	function showStudentP(){
		var sWidth = $("#focus2").width(); //获取焦点图的宽度（显示面积）
		var sHight = $("#focus2").height();
		var len = $("#focus2 ul li").length; //获取焦点图个数
		var index = 0;
		var picTimer;
		
		//以下代码添加数字按钮和按钮后的半透明长条
		var btn2 = "<div class='btnBg2'></div><div class='btn2'>";
		for(var i=0; i < len; i++) {
			btn2 += "<span>" + (i+1) + "</span>";
		}
		btn2 += "</div>";
		$("#focus2").append(btn2);
		$("#focus2 .btnBg2").css("opacity",0.5);
		
		//为数字按钮添加鼠标滑入事件，以显示相应的内容
		$("#focus2 .btn2 span").mouseenter(function() {
			index = $("#focus2 .btn2 span").index(this);
			showPics2(index,sHight);
		}).eq(0).trigger("mouseenter");
		//本例为左右滚动，即所有li元素都是在同一排向左浮动，所以这里需要计算出外围ul元素的宽度
		$("#focus2 ul").css("top",sHight * (len + 1));
		
		//鼠标滑入某li中的某div里，调整其同辈div元素的透明度，由于li的背景为黑色，所以会有变暗的效果
		$("#focus2 ul li div").hover(function() {
			$(this).siblings().css("opacity",0.7);
		},function() {
			$("#focus2 ul li div").css("opacity",1);
		});
		
		//鼠标滑上焦点图时停止自动播放，滑出时开始自动播放
		$("#focus2").hover(function() {
			clearInterval(picTimer);
		},function() {
			picTimer = setInterval(function() {
				if(index == len) { //如果索引值等于li元素个数，说明最后一张图播放完毕，接下来要显示第一张图，即调用showFirPic2()，然后将索引值清零
					showFirPic2(len,sHight);
					index = 0;
				} else { //如果索引值不等于li元素个数，按普通状态切换，调用showPics2()
					showPics2(index,sHight);
				}
				index++;
			},3000); //此3000代表自动播放的间隔，单位：毫秒
		}).trigger("mouseleave");
		
		
	}
	
	
	
	//显示图片函数，根据接收的index值显示相应的内容
	function showPics2(index,sHight) { //普通切换
		var nowTop = -index*sHight; //根据index值计算ul元素的left值
		$("#focus2 ul").stop(true,false).animate({"top":nowTop},500); //通过animate()调整ul元素滚动到计算出的position
		$("#focus2 .btn2 span").removeClass("on").eq(index).addClass("on"); //为当前的按钮切换到选中的效果
	}
	
	function showFirPic2(len,sHight) { //最后一张图自动切换到第一张图时专用
		$("#focus2 ul").append($("#focus2 ul li:first").clone());
		var nowTop = -len*sHight; //通过li元素个数计算ul元素的left值，也就是最后一个li元素的右边
		$("#focus2 ul").stop(true,false).animate({"top":nowTop},500,function() {
				//通过callback，在动画结束后把ul元素重新定位到起点，然后删除最后一个复制过去的元素
		$("#focus2 ul").css("top","0");
		$("#focus2 ul li:last").remove();
		}); 
		$("#focus2 .btn2 span").removeClass("on").eq(0).addClass("on"); //为第一个按钮添加选中的效果
	}
});