//使用者需要  id="table2"s	

//插件编写
	;(function($) {
		$.fn.extend({
			"alterBgColor":function(options){
				//设置默认值
				options=$.extend({
					odd:"odd",	/* 偶数行样式*/
					even:"even", /* 奇数行样式*/
					selected:"selected" /* 选中行样式*/ 
				},options);
				$("tbody>tr:odd",this).addClass(options.odd);
				$("tbody>tr:even",this).addClass(options.even);
				return this;  //返回this，使方法可链。
			}
		});
	
	})(jQuery);
	
	
	$(function(){
		$("#table2")
				.alterBgColor()  //应用插件  
				.find("th").css("color","red");//可以链式操作
	});