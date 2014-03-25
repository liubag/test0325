
$(document).ready(function () {
	$(".del").click(function(){
		
		var Exam_id = $(this).parent().attr("class");
		var Exam_name = $(this).attr("name");
		var begin_time=$(this).attr("id");
		var month=begin_time.substring(begin_time.indexOf("-")+1,begin_time.lastIndexOf("-"));
		var day=begin_time.substring(begin_time.lastIndexOf("-")+1,begin_time.indexOf(" "));
		var hours=begin_time.substring(begin_time.indexOf(" ")+1,begin_time.indexOf(":"));
		var minutes=begin_time.substring(begin_time.indexOf(":")+1,begin_time.lastIndexOf(":"));		
		today = new Date();//申明一个时间对象
		intDate = today.getDate();//返回当前的天日期
		intHours = today.getHours();//返回当前小时
		intMinutes = today.getMinutes();//分钟
		intSeconds = today.getSeconds();//秒
		intMonth = today.getMonth() + 1;//月加1
		intYear = today.getYear();//返回年
		if(confirm("真的要删除吗？？")){
			if(intMonth>month){
				alert("此试卷已经考完或者正在考试中！！");
			}else if(intMonth==month&& intDate>day){
				alert("此试卷已经考完或者正在考试中！！");
			}else if(intMonth==month&& intDate==day && intHours>hours){
				alert("此试卷已经考完或者正在考试中！！");
			}else if(intMonth==month&& intDate==day && intHours==hours && intSeconds>minutes){
				alert("此试卷已经考完或者正在考试中！！");
			}else{
				alert("此试卷可以删除");
				top.location.href = "deletExam.do?exam.exam_id="+Exam_id;
			}
		
		}
		
	});
	
	$("#delAll").click(function () {
		flag = false;
		str = "";
		today = new Date();//申明一个时间对象
		intDate = today.getDate();//返回当前的天日期
		intHours = today.getHours();//返回当前小时
		intMinutes = today.getMinutes();//分钟
		intSeconds = today.getSeconds();//秒
		intMonth = today.getMonth() + 1;//月加1
		intYear = today.getYear();//返回年
		$(".checkDel").each(function () {
			if ($(this).attr("checked") === true) {
				var begin_time=$(this).attr("id");
		
				var month=begin_time.substring(begin_time.indexOf("-")+1,begin_time.lastIndexOf("-"));
				var day=begin_time.substring(begin_time.lastIndexOf("-")+1,begin_time.indexOf(" "));
				var hours=begin_time.substring(begin_time.indexOf(" ")+1,begin_time.indexOf(":"));
				var minutes=begin_time.substring(begin_time.indexOf(":")+1,begin_time.lastIndexOf(":"));
	
				if(intMonth>month){
					flag = true;
				}else if(intMonth==month&& intDate>day){
					flag = true;
				}else if(intMonth==month&& intDate==day && intHours>hours){
					flag = true;
				}else if(intMonth==month&& intDate==day && intHours==hours && intSeconds>minutes){
					flag = true;
				}
				str = str + this.value + ",";
			}
		});
		if (str !== "") {
			if (confirm("真的要删除吗？？")) {
				if (flag) {
					alert("有试卷已经考完或者正在考试中！！");
				} else {
					top.location.href = "deletExamBatch.do?idArray=" + str;
					alert("此试卷可以删除");
				}
			}
		} else {
			alert("请选择要删除的选项");
		}
	});
});

