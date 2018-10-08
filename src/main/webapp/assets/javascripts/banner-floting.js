$(document).ready(function(e) {
	var $win = $(window);
	var top = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다. 

	/*사용자 설정 값 시작*/
	var speed = 0; // 따라다닐 속도 : "slow", "normal", or "fast" or numeric(단위:msec) 
	var easing = 'linear'; // 따라다니는 방법 기본 두가지 linear, swing 
	var $layer = $('.float_sidebar'); // 레이어 셀렉팅 
	var layerTopOffset = 1500; // 레이어 높이 상한선, 단위:px 

	$layer.css('z-index', '10');
	/*사용자 설정 값 끝*/

	// 스크롤 바를 내린 상태에서 리프레시 했을 경우를 위해 
	if (top > 0)
		$win.scrollTop(layerTopOffset + top);
	else
		$win.scrollTop(0);

	//스크롤이벤트가 발생하면 
	$(window).scroll(function() {
		yPosition = $win.scrollTop() + 350; //이부분을 조정해서 화면에 보이도록 맞추세요 
		if (yPosition < 0) {			
			yPosition = 0;
		}
		$layer.animate({
			"top" : yPosition
		}, {
			duration : speed,
			easing : easing,
			queue : false
		});
	});
	
	$(".float_sidebar_close_btn").click(function(){
		$(".float_sidebar").css( 'visibility', 'hidden' );
	});
});