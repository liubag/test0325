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
$(document).ready(function(){
	$('.select_w').change(function(){
		$('#div_country_province_city').html(
		"中国,"+$('#s_province').val()+","+$('#s_city').val()+","+$('#s_county').val());
	});
	
	$('#btn_consignee_save').click(function(){
		$('#li_refer_m').html(
			$('#txt_ship_name').val() + ","+
			$('#s_province').val()+","+$('#s_city').val()+","+$('#s_county').val() + ","+
			$('#txt_ship_zip').val() +"," +
			$('#txt_ship_mb').val() + "'" + 
			$('#txt_ship_tel').val()
		)
		
		var options = {
							url: "updateShippingAddress.do",
							type : "POST",
							dataType : "script",
							async: false,
							error:function(data){
									
							},
							success : function(msg) {
								alert("修改成功");
							}
					};
					$("#form_consignee").ajaxSubmit(options);
							
	})
	$('#parmPaymentMethod').attr('value',$("input[name=order.paymentMethod.payment_method_id][checked]").val());
	$('.button_ts').click(function(){
		$('#payment_result').html($("input[name=order.paymentMethod.payment_method_id][checked]").next().text());
		$('#parmPaymentMethod').attr('value',$("input[name=order.paymentMethod.payment_method_id][checked]").val());
	});
	
	$('#submitOrder').click(function(){
		$('#submitOrderButton').click();
		return false;
	})
});
