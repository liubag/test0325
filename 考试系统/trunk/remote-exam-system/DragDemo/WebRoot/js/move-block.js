 var deleDivs="";
 $(document).ready(function () {
 			
 			if($("#moveDivs_id").val()!=null){
 				$.ajax({
						type: "POST",
						url: "getMoveDivsById.do",
						dataType: 'text',
						data:{moveDivs_id:$("#moveDivs_id").val()},
						async: false,
 						error:function(data){
							
						},
						success: function(data){
							if(data!="empty"){
								$("#moveDivs").html(data);
								$(".drag").each(function(){
									var t=$(this);
									$.ajax({
										type: "POST",
										url: "findTitle.do?title.div_id="+$(this).attr("id")+"&title.moveDivs_id="+$("#moveDivs_id").val(),
										dataType: 'text',
										async: false,
				 
										error:function(data){
											
										},
										success: function(data){
											t.attr("title",data);									
										}	
									});	
								});	
							}
							
						}		
					});	
 			}
 			
            $(".drag").each(function(){
				$(this).Drag();
			});
			
			$('.dragParent').each(function(){
				$(this).DragParent();
			});
		//右键菜单
		$('.drag').bindContextMenu();
         
         //保存地图
			$("#save").click(function(){
				var jsonTitlesArray =new Array();
				var jsonTitles;
				var moveDivs_id =$("#moveDivs_id").val();
				$(".drag").each(function(){
					var t = $(this);
					var title_file="#"+t.attr('id')+""+moveDivs_id+"tite_file";
					var title_version="#"+t.attr('id')+""+moveDivs_id+"tite_version";
					if($(title_file).attr('name')!=undefined && $(title_version).attr('name')!=undefined){
						var jsonTitle={"div_id":t.attr("id"),"file":$(title_file).attr('name'),"version":$(title_version).attr('name'),"moveDivs_id":moveDivs_id};
						jsonTitlesArray.push(jsonTitle);
					}
				});
				jsonTitles=arrayToJson(jsonTitlesArray);
				$(".drag").each(function(){
					$(this).removeAttr("title");
				});
				 $.ajax({
						type: "POST",
						url: "saveOrUpdateMoveDivs.do",
						dataType: 'text',
						data:{"deleDivs":deleDivs,moveDivs_id:moveDivs_id,div_content:$("#moveDivs").html(),jsonTitles:jsonTitles},
						async: false,
 						error:function(data){
							
						},
						success: function(data){
							if(data=="success"){
								alert("保存地图成功！");
							}else{
								alert("保存地图失败！");
							}								
						}
							
					});	
			});
			
			$("#send").click(function(){
				var div_id=$("#div_id").val();
				var moveDivs_id =$("#moveDivs_id").val();
				var title_file="#"+div_id+""+moveDivs_id+"title_file";
				var tite_version="#"+div_id+""+moveDivs_id+"title_version";
					$.ajax({
						type: "POST",
						url: "updateTitle.do?title.div_id="+div_id+"&title.moveDivs_id="+moveDivs_id+"&title.file="+$('#file').attr("value")+"&title.version="+$('#version').attr("value"),
						dataType: 'text',
						async: false,
 
						error:function(data){
						
						},
						success: function(data){
							console.log(data);
							if(data=="success"){
								$(title_file).html($('#file').attr("value"));
								$(title_file).attr("name",$('#file').attr("value"));
								$(tite_version).html($('#version').attr("value"));
								$(tite_version).attr("name",$('#version').attr("value"));
								$('.close').trigger("click");	
							}else{
								alert("请先保存地图！！！");
								$('.close').trigger("click");	
							}					
							
																			
						}		
					});
					
					});	
					
				$('.close').click($.unblockUI); 
				
			//js数组转换成json数据
			function arrayToJson(o) { 
				var r = []; 
				if (typeof o == "string") return "\"" + o.replace(/([\'\"\\])/g, "\\$1").replace(/(\n)/g, "\\n").replace(/(\r)/g, "\\r").replace(/(\t)/g, "\\t") + "\""; 
				if (typeof o == "object") { 
					if (!o.sort) { 
						for (var i in o) {
							r.push(i + ":" + arrayToJson(o[i])); 
						}			
						if (!!document.all && !/^\n?function\s*toString\(\)\s*\{\n?\s*\[native code\]\n?\s*\}\n?\s*$/.test(o.toString)) { 
							r.push("toString:" + o.toString.toString()); 
						} 
						r = "{" + r.join() + "}"; 
					} else { 
						for (var i = 0; i < o.length; i++) { 
							r.push(arrayToJson(o[i])); 
						} 
						r = "[" + r.join() + "]"; 
					} 
					return r; 
				} 
				return o.toString(); 
			};
        });	

  (function (document) {
            //Usage: $("#id").drag()  
            //Author: hooyes
            $.fn.Drag = function () {
                var M = false;
                var Rx, Ry;
                var t = $(this);	
                var title;
                var moveDivs_id =$("#moveDivs_id").val();	
                 var title_file="#"+t.attr('id')+""+moveDivs_id+"title_file";
				var tite_version="#"+t.attr('id')+""+moveDivs_id+"title_version";	
                var moveDivs_id=$("#moveDivs_id").val();
                var maxTop=parseInt($("#moveDivs").css("height"))-parseInt(t.css("height"))-2;
                var maxLeft=parseInt($("#moveDivs").css("width"))-parseInt(t.css("width"))-2;
               // console.log(maxTop+"---"+maxLeft);
                
               // console.log(moveDivs_id);
				t.mousedown(function (event) {
                    Rx = event.pageX - (parseInt(t.css("left")) || 0);
                    Ry = event.pageY - (parseInt(t.css("top")) || 0);
                    t.css("position", "absolute").css('cursor', 'move').fadeTo(20, 0.5);
                    M = true;
                })
				.mouseup(function (event) {
					M = false;
					t.fadeTo(20, 1);
				});
                $(document).mousemove(function (event) {    
                     if (M) {
                     	var top =parseInt(t.css('top'));
                     	var left=parseInt(t.css('left'));
                     	var newTop=event.pageY - Ry;
                     	var newLeft =event.pageX - Rx;
						if(left >= 0 && top >= 0 && top <= maxTop && left <= maxLeft){
						
							t.css({ top: newTop,left: newLeft });
						} 
						if (top < 0 && left >= 0 && left <=maxLeft)  {
							M=false;
							t.css({ top: 0, left: newLeft});
							
						}else if(top < 0 && left < 0){
							M=false;
							t.css({ top: 0, left: 0});
							
						}else if(top < 0 && left > maxLeft){
							M=false;
							t.css({ top: 0, left: maxLeft});
							
						}else if(left < 0 && top >= 0 && top <= maxTop){
							M=false;
							t.css({ top: newTop, left: 0 });
							
						}else if (left < 0 && top > maxTop) {
							M=false;
							t.css({ top: maxTop, left: 0 });
							
						}else if(top > maxTop && left >= 0 && left <= maxLeft ) {
							M=false;
							t.css({ top: maxTop, left: newLeft });
							
						}else if(top > maxTop && left > maxLeft){
							M=false;
							t.css({ top: maxTop, left: maxLeft });
							
						}else if (left > maxLeft && top >=0 && top <= maxLeft) {
							M=false;
							t.css({ top: newTop, left: maxLeft });
						};
					
                    }
                });

				t.mouseover(function () {								
				 	t.css("background-color","yellow");	
					
					$.ajax({
						type: "POST",
						url: "findTitle.do?title.div_id="+t.attr("id")+"&title.moveDivs_id="+moveDivs_id,
						dataType: 'text',
						async: false,
 
						error:function(data){
						
						},
						success: function(data){
							
							title=data;
							t.attr("title",data);
							$('.tooltip').html(data);
							t.removeAttr("title");											
						}	
					});	
					
				
					//t.tooltip();
					//t.removeAttr("title");
				});

				t.mouseout(function () {
					$(this).css("background-color","#E9E9E4");
				 })
				.dblclick(function(){	
					//设置弹出层			
					$.blockUI({ 
						message: $('#login_box'),
						css:{
							width: '280px',
						// 随着拖拽层而变化
						//	top: t.css("top"),
						//	left: t.css("left")
						//居中
							top: (Math.round((document.body.scrollHeight-280)/2)).toString()+ "px ",
							left: (Math.round((document.body.scrollWidth-280)/2)).toString()+ "px "
							
						}
					});	
					//复原数据														
					$('#div_id').attr('value',t.attr('id'));
								
					if(title!="你还没有设置属性"){						
						$('#file').attr('value',$(title_file).attr('name'));
						console.log(title_file);
						console.log($(title_file).attr('name'));
						$('#version').attr('value',$(tite_version).attr('name'));
					}else{
						$('#file').removeAttr('value');
						$('#version').removeAttr('value');
					}
					
					//关闭弹出层									
					$('.blockOverlay').attr('title','单击关闭').click($.unblockUI);
					$('.close').click($.unblockUI); 
				}).tooltip();

           };
      
          	//右键菜单
         $.fn.bindContextMenu=function(){
         	
         	
			$(this).contextMenu('menu', 
	         { 
	             bindings: 
	          { 
	              'edit': function(t, target) {
	                  $(target).trigger("dblclick");
	              }, 
	              'delete': function(t, target) { 
	              	if(confirm("删除元素?")){
	              		deleDivs +=","+$(target).attr("id");
	              		$(target).remove();
	              		$(".tooltip").css("display","none");
	              		
	              		 // $.ajax({
							// type: "POST",
							// url: "deleTitleAndSaveMovedivs.do",
							// dataType: 'text',
							// data:{"title.moveDivs_id":$("#moveDivs_id").val(),div_content:$("#moveDivs").html(),"title.div_id":$(target).attr("id")},
							// async: false,
	 						// error:function(data){
// 								
							// },
								// success: function(data){
								// alert("删除成功！");
							// }	
						// });	
	              	};
	                 
	              }
	          }, 
	             onShowMenu: function(e, menu) { 
	
	                 $(e.currentTarget).siblings().removeClass("SelectedRow").end().addClass("SelectedRow"); 
	                 return menu; 
	             } 
				
	         }); 
         };
        })(document);

	