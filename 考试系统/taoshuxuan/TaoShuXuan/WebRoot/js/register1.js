$(function(){
	  //文本框失去焦点后
	    $("input").blur(function(){
			 var $parent = $(this).parent();
			 $parent.find(".formtips").remove();
			 
		});
});
