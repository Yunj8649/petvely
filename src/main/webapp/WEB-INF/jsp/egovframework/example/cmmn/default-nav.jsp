<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="egovframework.rte.psl.dataaccess.util.EgovMap" %>
<body class="index-template sarahmarket_1">
<!--  171114 @김병직 최상단 배너 script -->
<script> 
	$(document).ready(function() {

		$("#dogFood").click(function (e){
			header.pageSubmitFn("dogFood");
		});
		$("#snack").click(function (e){
			header.pageSubmitFn("snack");
		});
		$("#beauty").click(function (e){
			header.pageSubmitFn("beauty");
		});
		$("#bathing").click(function (e){
			header.pageSubmitFn("bathing");
		});
		$("#supplements").click(function (e){
			header.pageSubmitFn("supplements");
		});
		$("#clean").click(function (e){
			header.pageSubmitFn("clean");
		});
		$("#house").click(function (e){
			header.pageSubmitFn("house");
		});
		$("#feed").click(function (e){
			header.pageSubmitFn("feed");
		});
		$("#walk").click(function (e){
			header.pageSubmitFn("walk");
		});
		$("#toyList").click(function (e){
			header.pageSubmitFn("toyList");
		});			
		$("#nameCard").click(function (e){
			header.pageSubmitFn("nameCard");
		});			
		$("#fashion").click(function (e){
			header.pageSubmitFn("fashion");
		});
		
		
	});

	var header = 
	{
		pageSubmitFn : function(pageName) {
			
			$("#pageHeaderName").val(pageName);
			
			if (pageName === "dogFood") {
				$("#ctCd").val("1");
				$("#subCtCd").val("1");
			}else if (pageName === "snack") {
				$("#ctCd").val("1");
				$("#subCtCd").val("2");
			}else if (pageName === "beauty") {
				$("#ctCd").val("2");
				$("#subCtCd").val("1");
			}else if (pageName === "bathing") {
				$("#ctCd").val("2");
				$("#subCtCd").val("2");
			}else if (pageName === "supplements") {
				$("#ctCd").val("2");
				$("#subCtCd").val("3");
			}else if (pageName === "clean") {
				$("#ctCd").val("2");
				$("#subCtCd").val("4");
			}else if (pageName === "house") {
				$("#ctCd").val("3");
				$("#subCtCd").val("1");
			}else if (pageName === "feed") {
				$("#ctCd").val("3");
				$("#subCtCd").val("2");
			}else if (pageName === "walk") {
				$("#ctCd").val("3");
				$("#subCtCd").val("3");
			}else if (pageName === "toyList") {
				$("#ctCd").val("4");
				$("#subCtCd").val("1");
			}else if(pageName === "nameCard") {
				$("#ctCd").val("4");
				$("#subCtCd").val("2");
			}else if(pageName === "fashion") {
				$("#ctCd").val("4");
				$("#subCtCd").val("3");
			}
			
			$("#headerFrm").attr("action", "frtPrdList.do");
			$("#headerFrm").attr("method", "POST");
			
			$("#headerFrm").submit();
		}
	} 

    $(function(){
        $('#banner_top').dropdownbanner({
            todayClose:'.todayclose', //오늘은 더 이상 보지 않기 버튼을 설정 합니다.
            close:'.banner_close', //닫기 버튼을 설정 합니다.
            speed:400 //상단배너 닫힐 때 속도를 설정 합니다.
        });
    });
    
    function addaffix(scr) {
		if ($(window).innerWidth() >= 992) {
			if (scr > 170) {
				if (!$('#top').hasClass('affix')) {
					$('#top').addClass('affix').addClass('fadeInDown animated');
				}
			} else {
				if ($('#top').hasClass('affix')) {
					$('#top').prev().remove();
					$('#top').removeClass('affix').removeClass('fadeInDown animated');
				}
			}
		} else $('#top').removeClass('affix');
	}
    
	$(window).scroll(function() {
		var scrollTop = $(this).scrollTop();
		addaffix(scrollTop);
	});
	$(window).resize(function() {
		var scrollTop = $(this).scrollTop();
		addaffix(scrollTop);
	});
	
	$(function() {
	<%if (session.getAttribute("sessionID") != null){ %>
			var login_tag = '<li class="nav-item active"><span style="color: blue; font-weight: bold; font-size: 15px;"><%=session.getAttribute("sessionNM")%></span>님 안녕하세요</li><li class="nav-item"><span>|</span></li>';
			
			var logout_tag = '<li class="nav-item active"><a href="./logout.do"><span>로그아웃</span></a></li><li class="nav-item"><span>|</span></li>'
			
			$("#top_menu").prepend(logout_tag);
			
			$("#top_menu").prepend(login_tag);
			
			<% if (("9").equals(session.getAttribute("sessionGRP").toString())) { %>
				var admin_tag = '<li class="nav-item active"><a href="./admin_main.do"><span>관리자 페이지</span></a></li><li class="nav-item"><span>|</span></li>';
	
				$("#top_menu").prepend(admin_tag);
			<%	}%>
	<%	} else { %>
			var not_login_tag = '<li class="nav-item active" id="login_menu"><a href="./login.do"><span>로그인</span></a></li><li class="nav-item"><span>|</span></li><li class="nav-item active" id="register_menu"><a href="./register.do"><span>회원가입</span></a></li><li class="nav-item"><span>|</span></li>';
			
			$("#top_menu").prepend(not_login_tag);
	<% } %>
	});
</script>
<!--Header-->
<header id="top" class="header clearfix">

	<div id="shopify-section-theme-header" class="shopify-section">
		<div data-section-id="theme-header" data-section-type="header-section">
			<section class="top-header">
				<div class="top-header-wrapper">
<!--	171114 @김병직 최상단 배너-->
					<div id="banner_top">
						<div class='bannerimg' style="overflow:hidden; width:100%; height:auto; position:relative;">
						       <a href="./eventBoard.do">
						           <img src="./assets/images/banner/banner_top_kakao_fb.jpg">
						       </a>
						       	<div class="closeimg" style="position:absolute; top:65%; left:85%;">
						    		오늘은 더이상 보지 않기
								    <input class="todayclose" type='checkbox' value="todayclose">
								    <button type="button" class="close banner_close"><img src="./assets/images/banner/banner_close_btn.png" alt="닫기" /></button>
								</div>
						</div>
					</div>
<!--  171114 @김병직 최상단 배너 end-->
					<div class="container">
						<div class="row">
							<div class="top-header-inner">
								<ul class="unstyled top-menu" id="top_menu">
									<!-- Menu Top -->
									<!--20171127 봉성철 수정, 로그인 링크 수정 -->
									<!-- 2017.12.14 : 김효진 : 관리자 페이지용 메뉴 시작 -->
									<!-- <li class="nav-item active" style="display: none;">
										<a href="./admin_main.do">
											<span>관리자 페이지</span>
										</a>
									</li>
									<li class="nav-item">
											<span>|</span>
									</li> -->
									<!-- 2017.12.14 : 김효진 : 관리자 페이지용 메뉴 종료 -->
									<!-- <li class="nav-item active" id="login_menu">
										<a href="./login.do">
											<span>로그인</span>
										</a>
									</li>
									<li class="nav-item">
											<span>|</span>
									</li>
									20171127 봉성철 수정, 회원가입 링크 수정
									<li class="nav-item active" id="register_menu">
										<a href="./register.do">
											<span>회원가입</span>
										</a>
									</li>
									<li class="nav-item">
											<span>|</span>
									</li> -->
									<li class="nav-item active">
										<a href="./myPage.do">
											<span>My Page</span>
										</a>
									</li>
									<li class="nav-item">
											<span>|</span>
									</li>
									<li class="nav-item active">
										<a href="./helpdesk.do">
											<span>고객센터</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</section>

			<section class="main-header">
				<div class="main-header-wrapper">
					<div class="container clearfix">
						<div class="row">
							<div class="main-header-inner">
								<div class="nav-top">
									<div class="nav-logo">
										<a href="./main.do"><img src="./assets/images/pet_photo_ver2.png" alt="" title="PETvely"></a>
										<h1 style="display:none"><a href="./main.do">PETvely</a></h1>
									</div>
									<div class="group-search-cart">
										<div class="nav-search">
											<form class="search" action="./search.do">
												<input type="hidden" name="type" value="product">
												<input type="text" name="keyword" class="search_box" placeholder="Enter your keyword ..." value="">
												<!-- 171129 @김병직 검색창 카테고리 드롭다운 메뉴 삭제 #1 -->
												<button class="search_submit" type="submit">
													<svg aria-hidden="true" role="presentation" class="icon icon-search" viewBox="0 0 37 40"><path d="M35.6 36l-9.8-9.8c4.1-5.4 3.6-13.2-1.3-18.1-5.4-5.4-14.2-5.4-19.7 0-5.4 5.4-5.4 14.2 0 19.7 2.6 2.6 6.1 4.1 9.8 4.1 3 0 5.9-1 8.3-2.8l9.8 9.8c.4.4.9.6 1.4.6s1-.2 1.4-.6c.9-.9.9-2.1.1-2.9zm-20.9-8.2c-2.6 0-5.1-1-7-2.9-3.9-3.9-3.9-10.1 0-14C9.6 9 12.2 8 14.7 8s5.1 1 7 2.9c3.9 3.9 3.9 10.1 0 14-1.9 1.9-4.4 2.9-7 2.9z"></path></svg>
												</button>
											</form>
										</div>
										<!-- Customer Links -->
										<div class="toolbar-customer my-wishlist">
											<a href="./wish-list.do"> <img src="./assets/images/wishList.png" alt=""></a>
										</div>
										<div class="nav-cart " id="cart-target">
											<div class="cart-info-group">
												<div class="num-items-in-cart">
													<div class="items-cart-left">
														<a href="./cart.do">
															<img class="cart_img" src="./assets/images/bg-cart.png" alt="Image Cart">
															<span class="cart_text icon"><span class="number">2</span></span>
														</a>
													</div>
													<div class="items-cart-right">
														<a href="./cart.do">
															<span class="title_cart">장바구니</span>
														</a>
													</div>
												</div>
												<!-- 2017.12.10 : 김효진 : 장바구니 Dropdown 메뉴 삭제 -->
											</div>
										</div>
									</div>
								</div>
								<div class="mobile-navigation">
									<button id="showLeftPush" class="visible-xs"><i class="fa fa-bars fa-2x"></i></button>
									<div class="nav-logo visible-xs">
										<div><a href="./index.do"><img src="./assets/images/logo.png" alt="" title="Sarahmarket 1"></a></div>
									</div>
									<div class="icon_cart visible-xs">
										<div class="cart-info-group">
											<div class="num-items-in-cart">
												<div class="items-cart-left">
													<a href="./cart.do">
														<img class="cart_img" src="./assets/images/bg-cart.png">
														<span class="cart_text icon"><span class="number">2</span></span>
													</a>
												</div>
											</div>
										</div>
									</div>
									<div class="nav-search visible-xs">
										<form class="search" action="./search.do">
											<input type="hidden" name="type" value="product">
											<input type="text" name="keyword" class="search_box" placeholder="Enter your keyword ..." value="">
											<button class="search_submit" type="submit">
												<svg aria-hidden="true" role="presentation" class="icon icon-search" viewBox="0 0 37 40"><path d="M35.6 36l-9.8-9.8c4.1-5.4 3.6-13.2-1.3-18.1-5.4-5.4-14.2-5.4-19.7 0-5.4 5.4-5.4 14.2 0 19.7 2.6 2.6 6.1 4.1 9.8 4.1 3 0 5.9-1 8.3-2.8l9.8 9.8c.4.4.9.6 1.4.6s1-.2 1.4-.6c.9-.9.9-2.1.1-2.9zm-20.9-8.2c-2.6 0-5.1-1-7-2.9-3.9-3.9-3.9-10.1 0-14C9.6 9 12.2 8 14.7 8s5.1 1 7 2.9c3.9 3.9 3.9 10.1 0 14-1.9 1.9-4.4 2.9-7 2.9z"></path></svg>
											</button>
										</form>
									</div>
									<div class="mobile-navigation-inner">
										<div class="mobile-navigation-content">
											<div class="mobile-top-navigation visible-xs">
												<div class="mobile-content-top">
													<div class="mobile-language-currency">
														<div class="currencies-switcher">
															<div class="currency btn-group uppercase">
																<a class="currency_wrapper dropdown-toggle" data-toggle="dropdown">
																	<i class="sub-dropdown1 visible-sm visible-md visible-lg"></i>
																	<i class="sub-dropdown visible-sm visible-md visible-lg"></i>
																	<span class="currency_code heading hidden-xs">USD</span>
																	<span class="currency_code visible-xs">USD</span>
																	<i class="fa fa-angle-down"></i>
																</a>
																<ul class="currencies dropdown-menu text-left">
																	<li class="currency-USD active">
																		<a href="javascript:;">USD</a>
																		<input type="hidden" value="USD">
																	</li>
																	<li class="currency-GBP">
																		<a href="javascript:;">GBP</a>
																		<input type="hidden" value="GBP">
																	</li>
																	<li class="currency-AUD">
																		<a href="javascript:;">AUD</a>
																		<input type="hidden" value="AUD">
																	</li>
																	<li class="currency-EUR">
																		<a href="javascript:;">EUR</a>
																		<input type="hidden" value="EUR">
																	</li>
																</ul>
															</div>
														</div>
													</div>
													<div class="mobile-top-account">
														<div class="is-mobile-login">
															<ul class="customer">
																<li class="logout">
																	<a href="./login.do"><i class="fa fa-user" aria-hidden="true"></i>
																		<span>Login</span>
																	</a>
																</li>
																<li class="account">
																	<a href=".register.do"><i class="fa fa-user-plus" aria-hidden="true"></i>
																		<span>Register</span>
																	</a>
																</li>
																<li class="is-mobile-cart">
																	<a href="./cart.do">
																		<div class="num-items-in-cart">
																			<i class="fa fa-shopping-cart"></i>
																			<span>Cart</span>
																			<div class="ajax-subtotal" style="display:none;"></div>
																		</div>
																	</a>
																</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section class="navigation-header">
				<div class="navigation-header-wrapper">
					<div class="container clearfix">
						<div class="row">
							<div class="main-navigation-inner">
								<div class="navigation_area">
									<div class="navigation_right">
										<ul class="navigation_links">								
											<%-- @김병직 메인메뉴시작 --%>
											<li class="nav-item dropdown navigation">
												<a href="#" class="dropdown-toggle dropdown-link" data-toggle="dropdown">
													<span>FOOD</span>
													<i class="fa fa-angle-down"></i>
													<i class="sub-dropdown1  visible-sm visible-md visible-lg"></i>
													<i class="sub-dropdown visible-sm visible-md visible-lg"></i>
												</a>
												<ul class="dropdown-menu">
													<li class="li-sub-mega" id="dogFood">
														<a tabindex="-1" href="#">사료</a>
													</li>
													<li class="li-sub-mega" id="snack">
														<a tabindex="-1" href="#">간식 / 캔</a>
													</li>
												</ul>
											</li>
											<li class="nav-item dropdown navigation">
												<a href="#" class="dropdown-toggle dropdown-link" data-toggle="dropdown">
													<span>CARE</span>
													<i class="fa fa-angle-down"></i>
													<i class="sub-dropdown1  visible-sm visible-md visible-lg"></i>
													<i class="sub-dropdown visible-sm visible-md visible-lg"></i>
												</a>
												<ul class="dropdown-menu">
													<li class="li-sub-mega" id="beauty">
														<a tabindex="-1" href="#">미용용품</a>
													</li>
													<li class="li-sub-mega" id="bathing">
														<a tabindex="-1" href="#">목욕용품</a>
													</li>
													<li class="li-sub-mega" id="supplements">
														<a tabindex="-1" href="#">영양제</a>
													</li>
													<li class="li-sub-mega" id="clean">
														<a tabindex="-1" href="#">위생 / 배변 / 패드</a>
													</li>
												</ul>
											</li>
											<li class="nav-item dropdown navigation">
												<a href="#" class="dropdown-toggle dropdown-link" data-toggle="dropdown">
													<span>LIVING & LIFE</span>
													<i class="fa fa-angle-down"></i>
													<i class="sub-dropdown1  visible-sm visible-md visible-lg"></i>
													<i class="sub-dropdown visible-sm visible-md visible-lg"></i>
												</a>
												<ul class="dropdown-menu">
													<li class="li-sub-mega" id="house"> 
														<a tabindex="-1" href="#">하우스 / 울타리</a>
													</li>
													<li class="li-sub-mega" id="feed">
														<a tabindex="-1" href="#">급수기 / 급식기</a>
													</li>
													<li class="li-sub-mega" id="walk">
														<a tabindex="-1" href="#">외출</a>
													</li>
												</ul>
											</li>
											<li class="nav-item dropdown navigation">
												<a href="#" class="dropdown-toggle dropdown-link" data-toggle="dropdown">
													<span>ACCESSORY</span>
													<i class="fa fa-angle-down"></i>
													<i class="sub-dropdown1  visible-sm visible-md visible-lg"></i>
													<i class="sub-dropdown visible-sm visible-md visible-lg"></i>
												</a>
												<ul class="dropdown-menu">
													<li class="li-sub-mega" id="toyList" >
														<a tabindex="-1" href="#">장난감 / 훈련용품</a>
													</li>
													<li class="li-sub-mega" id="nameCard">
														<a tabindex="-1" href="#">줄 / 이름표</a>
													</li>
													<li class="li-sub-mega" id="fashion">
														<a tabindex="-1" href="#">패션의류 / 신발</a>
													</li>
												</ul>
											</li>
											<li class="nav-item dropdown navigation">
												<a href="#" class="dropdown-toggle dropdown-link" data-toggle="dropdown">
													<span>COMMUNITY</span>
													<i class="fa fa-angle-down"></i>
													<i class="sub-dropdown1  visible-sm visible-md visible-lg"></i>
													<i class="sub-dropdown visible-sm visible-md visible-lg"></i>
												</a>
												<ul class="dropdown-menu">
													<li class="li-sub-mega">
														<a tabindex="-1" href="./notice.do">공지</a>
													</li>
													<li class="li-sub-mega">
														<a tabindex="-1" href="./helpdesk.do">Q&amp;A</a>
													</li>
													<li class="li-sub-mega">
														<a tabindex="-1" href="./customReview.do">고객후기모음</a>
													</li>
												</ul>
											</li>
											<li class="nav-item dropdown navigation">
												<a href="#" class="dropdown-toggle dropdown-link" data-toggle="dropdown">
													<span>EVENT</span>
													<i class="fa fa-angle-down"></i>
													<i class="sub-dropdown1  visible-sm visible-md visible-lg"></i>
													<i class="sub-dropdown visible-sm visible-md visible-lg"></i>
												</a>
												<ul class="dropdown-menu">
													<li class="li-sub-mega">
														<a tabindex="-1" href="./eventBoard.do">전체 이벤트</a>
													</li>
													<li class="li-sub-mega">
														<a tabindex="-1" href="./returnMall.do">반품몰</a>
													</li>
													<li class="li-sub-mega">
														<a tabindex="-1" href="./test.do">TEST</a>
													</li>
												</ul>
											</li>
											<%-- @김병직 메인메뉴 끝 --%>
										</ul>
									</div>
									<div class="navigation_icon">
										<div class="navigation_icon_group">
											<div class="toolbar-customer my-wishlist">
												<a href="./wish-list.do"> <img src="./assets/images/wishList.png" alt=""></a></div>
											<div class="icon_cart">
												<div class="cart-info-group">
													<a href="./cart.do" class="cart" >
														<div class="num-items-in-cart">
															<div class="items-cart-left">
																<img class="cart_img" src="./assets/images/bg-cart.png" alt="Image Cart" title="Image Cart">
																<span class="cart_text icon"><span class="number">2</span></span>
															</div>
														</div>
													</a>
													<!-- 2017.12.10 : 김효진 : 장바구니 Dropdown 메뉴 삭제 -->
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</header>
<div class="fix-sticky"></div>
<form id="headerFrm" name="headerFrm">
	<input type="hidden" id="pageHeaderName"  	name="pageHeaderName" />
	<input type="hidden" id="ctCd" name="ctCd" value=""/>
	<input type="hidden" id="subCtCd" name="subCtCd" value=""/>
</form>
