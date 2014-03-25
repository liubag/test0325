
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
				$('tbody>tr',this).click(function() {
					//判断当前是否选中
					var hasSelected=$(this).hasClass(options.selected);
					//如果选中，则移出selected类，否则就加上selected类
					$(this)[hasSelected?"removeClass":"addClass"](options.selected)
						//查找内部的checkbox,设置对应的属性。
						.find(':checkbox').attr('checked',!hasSelected);
				});
				// 如果单选框默认情况下是选择的，则高色.
				$('tbody>tr:has(:checked)',this).addClass(options.selected);
				return this;  //返回this，使方法可链。
			}
		});
	})(jQuery);
	   
	

	//插件应用
	$(function(){
		
		$("#table2")
				.alterBgColor()  //应用插件
				.find("th").css("color","red");//可以链式操作
		
		 //全选
	     $("#CheckedAll").click(function(){
				//所有checkbox跟着全选的checkbox走。
				$('[name=choice]:checkbox').attr("checked", this.checked );
		 });
		 $('[name=choice]:checkbox').click(function(){
					//定义一个临时变量，避免重复使用同一个选择器选择页面中的元素，提升程序效率。
					var $tmp=$('[name=choice]:checkbox');
					//用filter方法筛选出选中的复选框。并直接给CheckedAll赋值。
					$('#CheckedAll').attr('checked',$tmp.length==$tmp.filter(':checked').length);

		 });
		 
		 $("#sx").click(function(){
			 var time = $("#rangeB").val();
			 if(time=='点击选择筛选时间'){
				 alert("请选择筛选时间！");
			 }else{
				 $("#rightIframe",parent.document.body).attr("src","/WangGe/showDoGoodsNote_by_page.do?page=1&time=" + time); 	  
			 }
		 });
		 $("#dele").click(function(){
			 var str= "";
			 $('[name=choice]:checkbox:checked').each(function(){
					str+=$(this).val()+",";
					
			 })
			 if(str==""){
				 alert("未选中商品");
				 return;
			 }
			 if(!confirm('删除商品，同时会删除相关记录信息！是否确定删除操作？')){
				 return false;
			 }
			 
			 var page = $("#page2").html();
			 var goodstatu = $("#goodstatu").attr("value");
			 $.ajax({
				 type: "POST",
				 url: "/WangGe/deleGoodsChoice_user.do?choice=" + str,
				 dataType: 'text',
				 beforeSend:function(){
				 	$("#zhuanghu").hide();
				 	$("#myDialog").show();
				 },
				 error:function(data){
					 $("#myDialog").hide();
					 $("#zhuanghu").show();
					 alert("删除失败！");
				 },
				 success: function(data){
					 if(data.length <= 7){
						 alert("删除失败");
					 }				 
				 },
				 complete:function(data){
					 $("#rightIframe",parent.document.body).attr("src","/WangGe/showAllGoods_by_page_user.do?page=" + page + "&goodstatu=" + goodstatu); 	  
				 }
			});
			 
			 
		 });
	});
	
	function refreshSize() {
		var height = $(document).height();
		$("#rightIframe",parent.document.body).height(height);
		$('#rangeB').daterangepicker({arrows:true});
	}	