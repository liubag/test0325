/* Copyright 源续网络设计公司
 * Version: 1.0 (2012-03-24)
 * Requires: jQuery 1.2.6+
 */
(function($) {
		  
	$.fn.jSuggest = function(options) {
		var opts = $.extend({}, $.fn.jSuggest.defaults, options);		
		var jH = ".jSuggestHover";
		var jsH = "jSuggestHover";
		var jN=".name";
		var jsN="name";
		var iniVal = this.value;
		var textBox = this;
		var textVal = this.value;	
		var jC = "#jSuggestContainer";
		
		$("body").append('<div id="jSuggestContainer"></div>');
		$(jC).hide();
		$(this).bind("keyup click", function(e){
			textBox = this;
			textVal = this.value;
			if (this.value.length >= opts.minchar && $.trim(this.value)!="Search Terms") {
				var offSet = $(this).offset();
				
				$(jC).css({
					position: "absolute",
					top: offSet.top + $(this).outerHeight() + "px",
					left: offSet.left,
					width: $(this).outerWidth()-2 + "px",
					opacity: opts.opacity,
					zIndex: opts.zindex
				}).show();
				if (e.keyCode == 27 ) {
					$(jC).hide();
				}
				else if (e.keyCode == 13 ) {
					if ($(jH).length == 1)
						$(textBox).val($(jN).text());
						$(jC).hide();
						iniVal = textBox.value;
						top.location.href = "gainGoods_by_keyWord.do?otherOrderBy=&keyWord="+iniVal;
				}
				else if (e.keyCode == 40) {
					if ($(jH).length == 1) {
						if (!$(jH).next().length == 0) {
							var $s = $(jH).next();
							$s.addClass(jsH);							
							$(".jSuggestHover:eq(0)").removeClass(jsH);
							
							$(jN).removeClass(jsN);
							$s.find("span:first-child").addClass(jsN);
							
							if (opts.autoChange)
							$(textBox).val($(jN).text());
						}else{			
							$(jH).removeClass(jsH);
							$(jN).removeClass(jsN);														
							var $s = $("#jSuggestContainer ul li:first-child");
							$s.addClass(jsH);
							var span = $s.find("span:first-child");
							span.addClass(jsN);
							if (opts.autoChange){
								$(textBox).val($(jN).text());
							}
						}
					}
					else {
						var $s = $("#jSuggestContainer ul li:first-child");
						$s.addClass(jsH);
						var span = $s.find("span:first-child");
						span.addClass(jsN);
						if (opts.autoChange){
							$(textBox).val($(jN).text());
						}
							
					}
					
				}
				
				else if (e.keyCode == 38) {
					if ($(jH).length == 1 ) {
						if (!$(jH).prev().length == 0) {
							var $s=$(jH).prev();
							$s.addClass(jsH);
							$(".jSuggestHover:eq(1)").removeClass(jsH);
							
							$(jN).removeClass(jsN);
							$s.find("span:first-child").addClass(jsN);
							if (opts.autoChange)
							$(textBox).val($(jN).text());
						}
						else {
							$(jH).removeClass(jsH);
							$(textBox).val(iniVal);
						}
					}
				}
				// new query detected
				else if (textBox.value != iniVal){
					iniVal = textBox.value;
					$(jC).find('ul').remove();
					
					if (opts.data == '')
						opts.data = $(this).serialize();
					else 
						opts.data = opts.data + "=" + $(this).val();
					
					setTimeout(function () {
					
						$.ajax({
							type: opts.type,
							url: opts.url+"?keyWord="+iniVal,
							data: opts.data,
							dataType : "json",
							success: function(msg){
								$(jC).find('ul').remove();								
								var message="<ul>";															
								for(var i=0;i<msg.length;i++){
									message+="<li><span class='key'>"+msg[i].keyword_content+ "</span><span class='number'>大约" +msg[i].keyword_has_goods+"个宝贝</span></li>";
								}							
								message+="</ul>";					
								$(jC).append(message);
								$("#jSuggestContainer ul li").bind("mouseover",	function(){
										$(jH).removeClass(jsH);
										$(this).addClass(jsH);										
										$(jN).removeClass(jsN);
										$(this).find("span:first-child").addClass(jsN);																		
										textVal = $(jN).text();									
										if (opts.autoChange)
											$(textBox).val($(jN).text());
								});
								$("#jSuggestContainer ul li").click(function(){
									$(this).addClass(jsH);
									$(textBox).val(textVal);
									top.location.href = "gainGoods_by_keyWord.do?otherOrderBy=&keyWord="+textBox.value;
								});
								$(".jSuggestLoading").hide();
							}
						});
					}, opts.delay);
				}
			}
			else {
				$(jH).removeClass(jsH);
				$(jC).hide();
			}
			return false;
		});
		
		$(document).bind("click", function(){
			$(jC).hide();
			iniVal = textBox.value;
			
		});

	};
	
	$.fn.jSuggest.defaults = {
		minchar: 1,
		opacity: 1.0,
		zindex: 20000,
		delay: 500,
		loadingImg: 'image/ajax-loader.gif',
		loadingText: 'Loading...',
		autoChange: false,
		url: "",
		type: "GET",
		data: ""
	};
		
	
		  

})(jQuery);