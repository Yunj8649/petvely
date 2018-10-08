/*
name : dropdownbanner.js
*/
(function($){
				
	var speed=800,ele;

	$.fn.dropdownbanner = function(opt){
		
		ele = $(this);
		
		if(getCookie('dropdownbanneractive')==''){
			
			if(opt.speed) speed = opt.speed;

			$(opt.close).click(function(){
				closebanner(ele,speed);
			});
			
			$(opt.todayClose).click(function(){
				setCookie('dropdownbanneractive', 'close', 1);
				closebanner(ele,speed);
			});

		}else{
			$(this).css({'overflow':'hidden','height':'0px'});
		}

		function setCookie(cName, cValue, cDay){
			var expire = new Date();
			expire.setDate(expire.getDate() + cDay);
			cookies = cName + '=' + escape(cValue) + '; path=/ '; 
			if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
			document.cookie = cookies;
		}

		function getCookie(cName) {
			cName = cName + '=';
			var cookieData = document.cookie;
			var start = cookieData.indexOf(cName);
			var cValue = '';
			if(start != -1){
				start += cName.length;
				var end = cookieData.indexOf(';', start);
				if(end == -1)end = cookieData.length;
				cValue = cookieData.substring(start, end);
			}
			return unescape(cValue);
		}

		function closebanner(ele,speed){
			$(ele).css('overflow','hidden');
			$(ele).animate({
				height:'0px'
			},speed);
		}
	}
})(jQuery);