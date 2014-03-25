$(document).ready(function () {
	$('#search').click(function(){
		var url = $('#url').val();
		var parm = $('select.search').val();
		var v = $('input.search').val();
		if("time" == $("#se option:selected").attr('id')){
			var beginTime = $('.beginTime').val();
			var endTime = $('.endTime').val();
			this.href = url + '&parm ='+parm+'&beginTime='+beginTime+'&endTime='+endTime;
		}else{
			this.href = url + '&parm ='+parm +'&value=' + v;
		}
	}
	);
	$('select.search').change(function(){
		var flag =$('#se option:selected').attr('id');
		if(flag == "time"){
			$('label.search,input.search').hide();
			$('td.time').show();
		}else{
			$('label.search,input.search').show();
			$('td.time').hide();
		}
	})
});