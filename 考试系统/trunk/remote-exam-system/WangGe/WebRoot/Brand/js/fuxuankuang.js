// JavaScript Document
$(function(){
     //ȫѡ
     $("#CheckedAll").click(function(){
			if(this.checked){				 //�����ǰ����Ķ�ѡ��ѡ��
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