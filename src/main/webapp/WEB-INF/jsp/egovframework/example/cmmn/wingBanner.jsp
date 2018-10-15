<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
/* 따라다니는 장바구니 script */
$(function() {
	$(window).scroll(function() {
		var top = $(window).scrollTop();
		if(top > 100){
			$(".wing_cart").css({position:'fixed'});
			$(".wing_cart").css({top:'250px'});
		} else {
			$(".wing_cart").css({position:'absolute'});
			$(".wing_cart").css({top:'350px'});
		}
	});
	
	/* $(".wing_cart_title").click(function(){
		if($(".wing_cart_img").css("display") == "block"){
			$(".wing_cart_img").slideUp(300);
		} else {
			$(".wing_cart_img").slideDown(300);
			$(".wing_focus_img").slideUp(300);
			$(".wing_history_img").slideUp(300);
		}
	});
	
	$(".wing_focus_title").click(function(){
		if($(".wing_focus_img").css("display") == "block"){
			$(".wing_focus_img").slideUp(300);
		} else {
			$(".wing_focus_img").slideDown(300);
			$(".wing_cart_img").slideUp(300);
			$(".wing_history_img").slideUp(300)
		}
	}); */
	
	$(".wing_history_title").click(function(){
		if($(".wing_history_img").css("display") == "block"){
			$(".wing_history_img").slideUp(300);
		} else {
			$(".wing_history_img").slideDown(300);
			/* $(".wing_focus_img").slideUp(300);
			$(".wing_cart_img").slideUp(300) */
		}
	});
});

var favoritesCheck = {
		asTarget : null,
		
		init : function() {
			this.asTarget = $(".goPaging img");
		},
		
		initFn : function() {
			
			var $that = this;

			this.asTarget.click(function() {
				var $imgFile = $(this).data("img");
				var $prkey = $(this).data("prkey");
				
				$that.favoritesFn($imgFile, $prkey);
			});
		},
		
		favoritesFn : function (fileNm, prkey) {
			var str = "",		
			
			$favorites = $("#wing_history_area"),
			
			duplicateChk = false,
			duplicateTarget = null,
			arry = new Array();
					
			var imgSize = $favorites.children().size();
			
			$favorites.find("img").each(function (index){
				if($(this).data("cartimg") === fileNm) {
					duplicateChk = true;
					duplicateTarget = $(this).parent();
				}
			});
			
			if(duplicateChk) {
				duplicateTarget.remove();
			} else if (imgSize >= 3){
				$favorites.children().last().remove();
			}
			
			str = "<h4 class='wing_history_img'>";
			str += 		"<a href='#'><img src='" + fileNm + "' data-cartimg='" + fileNm + "' data-cartkey='" + prkey + "' alt='최근본상품 '></a>";
			str += "</h4>";
			
			$favorites.prepend(str);
			
			$favorites.find("img").each(function (index) {
				arry.push($(this).data("cartimg"));
				arry.push($(this).data("cartkey"));
			});
			
			$.cookie("cartBanner", arry);
		}
}

$(document).ready(function() {
	
	var cartBanner = $.cookie("cartBanner");
	
	if (cartBanner != undefined && cartBanner !== "" && cartBanner !== null) {
		var arr = cartBanner.split(",");
		
		for (var i = 0; i < arr.length; i++) {
			if ((i % 2) == 0) {
				var str = "";
				
				str = "<h4 class='wing_history_img'>";
				str += 		"<a href='#'><img src='" + arr[i] + "' data-cartimg='" + arr[i] + "' data-cartkey='" + arr[i + 1] + "' alt='최근본상품'></a>";
				str += "</h4>";
				
				$("#wing_history_area").append(str);
			}
		}
	}
	
	favoritesCheck.init();
	favoritesCheck.initFn();
	
	$("#wing_history_area a img").click(function(){
		var $pageFrm = $("#pageFrm") ,
			$prCd = $(this).data("cartkey");
		
		$("#prCd").val($prCd);
			
		$pageFrm.attr("action", "detailPrd.do");
		
		$pageFrm.submit();
	});
});
</script>
<form id="pageFrm" name="pageFrm">
	<input type="hidden" id="prCd" name="prCd" value=""/>
</form>

<!-- 2017.11.17 : 김효진 : 장바구니 영역 : 장바구니, 찜한 상품, 최근 본 상품  -->
<!-- 상단 nav 영역보다 50px 아래에 생성, content영역 width(1170px)에서 50px우측(1220px)에 생성 -->
<!-- 기본 : 3개 영역 닫힘 / 클릭 : 해당 영역 열림, 나머지 영역 닫힘 / 열린 영역 클릭 : 해당 영역 닫힘 -->
<!-- img 태그의 id는 지워도 아무 영향 없음 / 추후 image database에서 받아서 넣기 위해서 만들어만 놓은것 -->
<div class="wing_cart" id="wing_cart">
	<!-- <div>
		<h4 class="wing_cart_title">
			장바구니
		</h4>
		<div id="wing_cart_area">
		</div>
		<h4 class="wing_cart_img" style="color:#000000">
			<a href="#">&#60;</a>&#09;1&#09;&#47;&#09;2&#09;<a href="#">&#62;</a>
		</h4>
	</div>
	<div>
		<h4 class="wing_focus_title">
			찜한 상품
		</h4>
		<div id="wing_focus_area">
		</div>
		<h4 class="wing_focus_img">
			<a href="./bathing_1.do"><img id="focus_img1" src="./assets/images/bathing/bathing_1.png" alt="찜한상품 1"></a>
		</h4>
		<h4 class="wing_focus_img">
			<a href="./bathing_2.do"><img id="focus_img2" src="./assets/images/bathing/bathing_2.png" alt="찜한상품 2"></a>
		</h4>
		<h4 class="wing_focus_img">
			<a href="./bathing_3.do"><img id="focus_img3" src="./assets/images/bathing/bathing_3.png" alt="찜한상품 3"></a>
		</h4>
		<h4 class="wing_focus_img" style="color:#000000">
			<a href="#">&#60;</a>&#09;1&#09;&#47;&#09;2&#09;<a href="#">&#62;</a>
		</h4>
	</div> -->
	<div>
		<h4 class="wing_history_title">
			최근 본 상품
		</h4>
		<div id="wing_history_area">
			<!-- <h4 class="wing_history_img">
				<a href="./bathing_4.do"><img id="history_img1" src="./assets/images/bathing/bathing_4.png" alt="최근본상품 1"></a>
			</h4>
			<h4 class="wing_history_img">
				<a href="./supplements_1.do"><img id="history_img2" src="./assets/images/supplements/supplements_1.png" alt="최근본상품 2"></a>
			</h4>
			<h4 class="wing_history_img">
				<a href="./supplements_2.do"><img id="history_img3" src="./assets/images/supplements/supplements_2.png" alt="최근본상품 3"></a>
			</h4> -->
		</div>
		<!-- <h4 class="wing_history_img" style="color:#000000">
			<a href="#">&#60;</a>&#09;1&#09;&#47;&#09;2&#09;<a href="#">&#62;</a>
		</h4> -->
	</div>
</div>