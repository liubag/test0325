$(function(){
	var page=1;
	var i=6;  //一次显示的条数
	var j=3; //一次显示的热销书籍条数
	var hotsale_page=1; 
	function show(){
		var $v_show=$("#hotcollection");
		 var len = $v_show.find("dl").length;
		 var page_count = Math.ceil(len / i) ;   //只要不是整数，就往大的方向取最小的整数
		 var v_height=$("div.main1421").height();
		  if( !$v_show.is(":animated") ){    //判断“视频内容展示区域”是否正在处于动画
			  if( page == page_count ){  //已经到最后一个版面了,如果再向后，必须跳转到第一个版面。
				$v_show.animate({ top : '0px'}, "slow"); //通过改变top值，跳转到第一个版面
				page = 1;
				}else{
				$v_show.animate({ top : '-='+v_height }, "slow");  //通过改变top值，达到每次换一个版面
				page++;
			 }
		 }
	}
	function show_hotsale(){
		var $v_show=$("#hotsale_div2");
		 var len = $v_show.find("dl").length;
		 var page_count = Math.ceil(len / j) ;   //只要不是整数，就往大的方向取最小的整数
		 var v_width=$(".hotsale_div1").width();
		  if( !$v_show.is(":animated") ){    //判断"视频内容展示区域"是否正在处于动画
			  if( hotsale_page == page_count ){  //已经到最后一个版面了,如果再向后，必须跳转到第一个版面。
				$v_show.animate({ left : '0px'}, "slow"); //通过改变top值，跳转到第一个版面
				hotsale_page = 1;
				}else{
				$v_show.animate({ left : '-='+v_width }, "slow");  //通过改变top值，达到每次换一个版面
				hotsale_page++;
			 }
		 }
	}
	setInterval(function(){show()},5000);
	
	setInterval(function(){show_hotsale()},6000);
});