// JavaScript Document
$(function(){
     //全选
     $("#CheckedAll").click(function(){
			if(this.checked){				 //如果当前点击的多选框被选中
				 $('input[type=checkbox][name=items]').attr("checked", true );
			}else{								
			     $('input[type=checkbox][name=items]').attr("checked", false );
			}
	 });
	 $('input[type=checkbox][name=items]').click(function(){
			   var flag=true;
               $('input[type=checkbox][name=items]').each(function(){
					if(!this.checked){
						 flag = false;
					}
			   });

			   if( flag ){
					 $('#CheckedAll').attr('checked', true );
			   }else{
					 $('#CheckedAll').attr('checked', false );
			   }
	 })
})