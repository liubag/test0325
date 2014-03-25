$(document).ready(function(){
	  validate({"account":{  
                required:true, 
                custom:['onlyLetterNumber'],
                ajax:['ajaxUser'],
                length:[6,20]                
            }, "name":{
                required:true
            },"pw":{
				required:true,
				custom:['onlyLetterNumber'],
				length:[6,11]         
            },"confirmedPw":{
            	required:true,
            	equals:['pw']
            }
           });
});
