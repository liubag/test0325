$(document).ready(function(){
	  validate({"course_name":{
				required:true,
				ajax:['ajaxCheckCourseName']
            }
           });
});
