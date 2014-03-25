$(document).ready(function () {
			$("form :input.required1").each(function(){
				var $required=$("<strong class='high'>*</strong>");	
				$(this).parent().append($required);
			});
			$("form :input").blur(function(){
				var $parent=$(this).parent();
				$parent.find(".formtips").remove();
				
				if($(this).is('#staff_id')){
												
					if(this.value==""){
						var errorMsg='请正确输入员工工号';
						$parent.append('<span class="formtips onError">'+errorMsg+'</span>');	
												
					}else{											
						$.ajax({
							type: "POST",
							url: "findStaff.do?staff.staff_id="+this.value,
							dataType: 'text',
							async: false,
							error:function(data){
								
							},
							success: function(data){
								
								if((data=="success")){									
									var errorMsg='此工号不可用';								
									$parent.append('<span class="formtips onError">'+errorMsg+'</span>');
								}else{
									var okMsg='此工号可用';
									
									$parent.append('<span class="formtips onSuccess">'+okMsg+'</span>');
								}															
							}
							
						});												
					}
				}
				
				if($(this).is('#staff_name')){
					var Msg='请正确输入员工名字';
					if(this.value==""){						
						$parent.append('<span class="formtips onError">'+Msg+'</span>');													
					}else{
						$parent.append('<span class="formtips onSuccess">'+Msg+'</span>');
					}
				}
				
				if($(this).is('#identity_card')){
					var Msg='请正确输入员工身份证';
					if(this.value==""||this.value.length!=18){						
						$parent.append('<span class="formtips onError">'+Msg+'</span>');													
					}else{
						$parent.append('<span class="formtips onSuccess">'+Msg+'</span>');
					}
				}
				
				if($(this).is('#phone')){
					var Msg='请正确输入手机号码';
					if(this.value==""||this.value.length!=11){						
						$parent.append('<span class="formtips onError">'+Msg+'</span>');													
					}else{
						$parent.append('<span class="formtips onSuccess">'+Msg+'</span>');
					}
				}
				
				if($(this).is('#address')){
					var Msg='请正确输入员工地址';
					if(this.value==""){						
						$parent.append('<span class="formtips onError">'+Msg+'</span>');													
					}else{
						$parent.append('<span class="formtips onSuccess">'+Msg+'</span>');
					}
				}
			}).keyup(function(){
				$(this).triggerHandler("blur");
			}).focus(function(){
				$(this).triggerHandler("blur");	
			});
			$('#send').click(function(){
				$("form .required1:input").trigger('blur');
				$(".date").parent().find(".formtips").remove();
				if($(".date").val()==""){
					$(".date").parent().append('<span class="formtips onError">'+"请正确输入日期"+'</span>');
				}else{
					$(".date").parent().append('<span class="formtips onSuccess">'+"请正确输入日期"+'</span>');
				}
				var numError=$('form .onError').length;
				if(numError!=0){
					return false;
				}				
			});
			
			$("#search").click(function(){
				var id=$("#sId").val();
				var name=$("#sName").val();
				var status=$("#sStatus").val();
				location.href = "showStaff_by_page.do?staff_id="+id+"&staff_name="+name+"&staff_status="+status ;
			});
});