$(function(){
	  //�ı���ʧȥ�����
	    $("input").blur(function(){
			 var $parent = $(this).parent();
			 $parent.find(".formtips").remove();
			 
		});
});
