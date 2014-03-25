 (function (document) {
            //Usage: $("#id").drag()  
            //Author: hooyes
            $.fn.DragParent = function () {
                var M = false;
                var Rx, Ry;
                var t = $(this);
				var cloneDiv = "";
				$(this).mousedown(function (event) {
					//console.log($(this));
                    Rx = event.pageX - (parseInt($(this).css("left")) || 0);
                    Ry = event.pageY - (parseInt($(this).css("top")) || 0);
                    $(this).css("position", "absolute").css('cursor', 'move').fadeTo(20, 0.5);
					cloneDiv = $(this).clone(true).appendTo("#parentDiv");
					cloneDiv.attr("id","cloneDiv");
                    M = true; 
                    var handler =function (event) {
                    
						M = false;
						t.fadeTo(20,1);
						
						if(parseInt(cloneDiv.css('left')) < parseInt($("#parentDiv").width()) 
							|| parseInt(cloneDiv.css('left')) > (parseInt($("#map").width())-parseInt(cloneDiv.css('height')))
							|| parseInt(cloneDiv.css('top')) < 0 
							|| parseInt(cloneDiv.css('top'))>(parseInt($("#moveDivs").css('height'))-parseInt(cloneDiv.css('height'))))
						{
							cloneDiv.remove();
						}else{
							var newCloneDiv=cloneDiv.appendTo("#moveDivs");
							var temp = ""+$(".drag:last").attr("id");
							if(temp == "undefined"){
								newCloneDiv.unbind().attr({"class":"drag","id":"Div1","title":"你还没有设置属性"});
								newCloneDiv.css("left",parseInt(newCloneDiv.css("left"))-parseInt(newCloneDiv.css("width"))-8);
							}else{
								var str = parseInt(temp.substring(3))+1;
								newCloneDiv.unbind().attr({"class":"drag","id":"Div"+str ,"title":"你还没有设置属性"});
								console.log(newCloneDiv.css("left"));
								newCloneDiv.css("left",parseInt(newCloneDiv.css("left"))-parseInt(newCloneDiv.css("width"))-8);
							console.log(newCloneDiv.css("left"));
							}
							newCloneDiv.Drag();
							newCloneDiv.bindContextMenu();
							$(this).unbind("mouseup",handler);
					}
				};
                 $(document).mouseup(handler);
               });
				 
                $(document).mousemove(function (event) {
                    if (M) {
                        cloneDiv.css({ top: event.pageY - Ry, left: event.pageX - Rx });
                    }
					
                });

				$(this).mousemove(function () {
				 	$(this).css("background-color","yellow");
					
				});

				$(this).mouseout(function () {
					$(this).css("background-color","#E9E9E4");
				 });
           };
        })(document);