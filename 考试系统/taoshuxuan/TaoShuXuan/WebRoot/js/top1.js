$(function(){
	var page=1;
	var i=6;  //һ����ʾ������
	var j=3; //һ����ʾ�������鼮����
	var hotsale_page=1; 
	function show(){
		var $v_show=$("#hotcollection");
		 var len = $v_show.find("dl").length;
		 var page_count = Math.ceil(len / i) ;   //ֻҪ����������������ķ���ȡ��С������
		 var v_height=$("div.main1421").height();
		  if( !$v_show.is(":animated") ){    //�жϡ���Ƶ����չʾ�����Ƿ����ڴ��ڶ���
			  if( page == page_count ){  //�Ѿ������һ��������,�������󣬱�����ת����һ�����档
				$v_show.animate({ top : '0px'}, "slow"); //ͨ���ı�topֵ����ת����һ������
				page = 1;
				}else{
				$v_show.animate({ top : '-='+v_height }, "slow");  //ͨ���ı�topֵ���ﵽÿ�λ�һ������
				page++;
			 }
		 }
	}
	function show_hotsale(){
		var $v_show=$("#hotsale_div2");
		 var len = $v_show.find("dl").length;
		 var page_count = Math.ceil(len / j) ;   //ֻҪ����������������ķ���ȡ��С������
		 var v_width=$(".hotsale_div1").width();
		  if( !$v_show.is(":animated") ){    //�ж�"��Ƶ����չʾ����"�Ƿ����ڴ��ڶ���
			  if( hotsale_page == page_count ){  //�Ѿ������һ��������,�������󣬱�����ת����һ�����档
				$v_show.animate({ left : '0px'}, "slow"); //ͨ���ı�topֵ����ת����һ������
				hotsale_page = 1;
				}else{
				$v_show.animate({ left : '-='+v_width }, "slow");  //ͨ���ı�topֵ���ﵽÿ�λ�һ������
				hotsale_page++;
			 }
		 }
	}
	setInterval(function(){show()},5000);
	
	setInterval(function(){show_hotsale()},6000);
});