$(document).ready(function(){
	  validate({"newpw":{
				required:true,
				custom:['noSpecialCaracters'],
				length:[6,11]         
            },"confirmednewpw":{
            	required:true,
            	confirm:['newpw']
            },"oldpw":{
            	required:true
            }
           });
});
