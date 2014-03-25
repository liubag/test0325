function msgToggle(t){
  console.log( $(t).parents('.consignee').find('.btn_close'));
  console.log( $(t).parents('.consignee').find('.info'));
  if($(t).parents('.consignee').find('.info').hasClass('close')){
	  $(t).parents('.consignee').find('.btn_close').text("[关闭]");
	  $(t).parents('.consignee').find('.info').removeClass('close');
	  $(t).parents('.consignee').find('.info').toggle(1000,function(){
		  $(t).parents('.consignee').find('.refer_m').toggle(500,false);
	  });
  }else{
	  $(t).parents('.consignee').find('.btn_close').text("[修改]");
	  $(t).parents('.consignee').find('.info').addClass('close');
	  $(t).parents('.consignee').find('.info').toggle(1000,function(){
		  $(t).parents('.consignee').find('.refer_m').toggle(500,false);
	  });
  }
  return false;
};
