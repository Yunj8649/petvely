<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>	
	
<!-- Main Content -->
<div class="page-container" id="PageContainer">
	<!-- 171114 @김병직 메인 플로팅 배너  
		1. 위치 바꾸려면 .float_sidebar의 top와 left 수정하고, 
		banner-floting.js에 가서 yPosition = $win.scrollTop() + 350; 의 
		숫자부분을 top값과 같게 해주면 됨. -->
	<!-- 171207 @김병직
	1.메인 레이아웃 변경
		div.main-empty 인기상품 카테고리 사이에 삽입. 
		div 배경색을 전체 페이지 배경색으로 지정. helpdesk.css에 있음.
	2.고객님을 위한 상품 하단 롱배너 교체	
	 -->
	<div class="float_sidebar" style="top:350px; left:50px; position:absolute;">
	  <a href="#form"><img src="./assets/images/banner/banner_floting_01.jpg" style="width:250px"></a>
       	<div class="closeimg" style="position:absolute; top:5%; left:85%;">
			<button type="button" class="close float_sidebar_close_btn"><img src="./assets/images/banner/banner_close_btn.png" alt="닫기"  /></button>		    
		</div>
	</div> 
	<!-- 171114 @김병직 메인 플로팅 배너 end -->	
	<main class="main-content" id="MainContent" role="main">
		<!-- BEGIN content_for_index -->
		<div id="shopify-section-1490952756465" class="shopify-section index-section index-section-slideshow">
			<div data-section-id="1490952756465" data-section-type="slideshow-section">
				<section class="home_slideshow main-slideshow">
					<div class="home-slideshow-wrapper">
						<div class="container">
							<div class="row">
								<div class="group-home-slideshow">
									<div class="home-slideshow-inner col-sm-8">
										<div class="home-slideshow">
											<div id="home_main-slider" class="carousel slide  main-slider">
												<ol class="carousel-indicators">	<!-- 여기도 동적으로 -->
													<li data-target="#home_main-slider" data-slide-to="0" class="carousel-1 active"></li>
													<li data-target="#home_main-slider" data-slide-to="1" class="carousel-2"></li>
													<li data-target="#home_main-slider" data-slide-to="2" class="carousel-3"></li>
													<li data-target="#home_main-slider" data-slide-to="3" class="carousel-4"></li>
													<li data-target="#home_main-slider" data-slide-to="4" class="carousel-5"></li>
												</ol>
												<div class="carousel-inner"> <!-- 메인 슬라이드 배너 -->
<!-- 												display = yes,no -->
												<!--  {banId=3, banNm=testtesttest, banLocNm=메인, banLocCd=2, banTypeNm=메인_중단_슬라이드배너, banTypeCd=2, banImg1=./assets/images/banner/nn1.jpg, banChecked=N, banSlide=Y} 
													${banStatus.count} , ${banStatus.index} , ${banStatus.current}, ${banStatus.first}-->												
 												<c:forEach items="${bannerList}" var="banList" varStatus="banStatus">
 													<c:choose>
 														<c:when test="${banStatus.first}">
															<div class="item image active">
																<img src="<c:out value='${banList.banImg1}'/>" alt="" title="Image Slideshow"/>
																<div class="slideshow-caption position-bottom">
																	<div class="slide-caption">
																		<div class="flex-action"><a class="btn" href="./house.do">Shop Now</a></div>
																	</div>
																</div>
															</div>	   														
 														</c:when>
 														<c:otherwise>
															<div class="item image">
																<img src="<c:out value='${banList.banImg1}'/>" alt="" title="Image Slideshow">
																<div class="slideshow-caption position-bottom">
																	<div class="slide-caption">
																		<div class="flex-action"><a class="btn" href="./house.do">Shop Now</a></div>
																	</div>
																</div>
															</div>	 															
 														</c:otherwise>
 													</c:choose>
												</c:forEach>
												</div>
												<a class="left carousel-control" href="#home_main-slider" data-slide="prev">
													<span class="icon-prev"></span>
												</a>
												<a class="right carousel-control" href="#home_main-slider" data-slide="next">
													<span class="icon-next"></span>
												</a>
											</div>										
<!-- 											<div id="home_main-slider" class="carousel slide  main-slider">
												<ol class="carousel-indicators">
													<li data-target="#home_main-slider" data-slide-to="0" class="carousel-1 active"></li>
													<li data-target="#home_main-slider" data-slide-to="1" class="carousel-2"></li>
													<li data-target="#home_main-slider" data-slide-to="2" class="carousel-3"></li>
													<li data-target="#home_main-slider" data-slide-to="3" class="carousel-4"></li>
													<li data-target="#home_main-slider" data-slide-to="4" class="carousel-5"></li>
												</ol>
												<div class="carousel-inner">
													<div class="item image active">
														<img src="./assets/images/mainSlide/slide_01.png" alt="" title="Image Slideshow">
														<div class="slideshow-caption position-bottom">
															<div class="slide-caption">
																<div class="flex-action"><a class="btn" href="./house.do">Shop Now</a></div>
															</div>
														</div>
													</div>
													<div class="item image">
														<img src="./assets/images/mainSlide/slide_07.png" alt="" title="Image slideshow">
														<div class="slideshow-caption position-bottom">
															<div class="slide-caption">
																<div class="group-caption">
																	<div class="flex-action"><a class="btn" href="./bathing.do">Shop Now</a></div>
																</div>
															</div>
														</div>
													</div>
													<div class="item image">
														<img src="./assets/images/mainSlide/slide_03.png" alt="" title="Image slideshow">
														<div class="slideshow-caption position-bottom">
															<div class="slide-caption">
																<div class="group-caption">
																	<div class="flex-action"><a class="btn" href="./dogFood2.do">Shop Now</a></div>
																</div>
															</div>
														</div>
													</div>
													<div class="item image">
														<img src="./assets/images/mainSlide/slide_04.png" alt="" title="Image slideshow">
														<div class="slideshow-caption position-bottom">
															<div class="slide-caption">
																<div class="group-caption">
																	<div class="flex-action"><a class="btn" href="./house.do">Shop Now</a></div>
																</div>
															</div>
														</div>
													</div>
													<div class="item image">
														<img src="./assets/images/mainSlide/slide_05.png" alt="" title="Image slideshow">
														<div class="slideshow-caption position-bottom">
															<div class="slide-caption">
																<div class="group-caption">
																	<div class="flex-action"><a class="btn" href="./dogFood4.do">Shop Now</a></div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<a class="left carousel-control" href="#home_main-slider" data-slide="prev">
													<span class="icon-prev"></span>
												</a>
												<a class="right carousel-control" href="#home_main-slider" data-slide="next">
													<span class="icon-next"></span>
												</a>
											</div> -->
										</div>
									</div>
									<div class="home-banner-inner col-sm-4">
										<div class="banner-content">
											<div class="banner-1">
												<a href="./freeDelivery.do">
													<img src="./assets/images/mainSlide/freeshipping.png" alt="">
												</a>
											</div>
											<div class="banner-2">
												<a href="./freeDelivery.do">
													<img src="./assets/images/mainSlide/register_event.png" alt="">
												</a>
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
		<div id="shopify-section-1490952827558" class="shopify-section index-section index-section-prosli">
			<div data-section-id="1490952827558" data-section-type="prosli-section">
				<section class="home_prosli_layout">
					<div class="home_prosli_wrapper">
						<div class="container">
							<div class="row">
								<div class="prosli_group">
									<div class="page-title">
										<h2>고객님을 위한 상품</h2>
									</div>
									<div class="home_prosli_inner">
										<div class="home_prosli_content">
											<div class="content_product col-sm-2">
												<div class="row-container product list-unstyled clearfix">
													<div class="row-left">
														<a href="./dogFood2.do" class="hoverBorder container_item">
															<div class="hoverBorderWrapper">
																<img src="./assets/images/Food/DogFood/dogFood (2).png" class="not-rotation img-responsive front" alt="Riley's Organic">
																<div class="mask"></div>
																<img src="./assets/images/Food/DogFood/dogFood (2).png" class="rotation img-responsive" alt="Riley's Organic">
															</div>
														</a>
														<span class="sale_banner">
															<span class="sale_text">18%</span>
														</span>
														<div class="hover-mask">
															<div class="group-mask">
																<div class="inner-mask">
																	<div class="group-actionbutton">
																		<form action="./cart.do" method="post">
																			<div class="effect-ajax-cart">
																				<input type="hidden" name="quantity" value="1">
																				<button class="btn add-to-cart" data-parent=".parent-fly" type="submit" name="add"><i class="fa fa-shopping-bag"></i></button>
																			</div>
																		</form>
																		<ul class="quickview-wishlist-wrapper">
																			<li class="wishlist hidden-xs">
																				<a class="wish-list" href="./wish-list.do"><span class="hidden-xs"><i class="fa fa-heart" title="Wishlist"></i></span></a>
																			</li>
																		</ul>
																	</div>
																</div>
																<!--inner-mask-->
															</div>
															<!--Group mask-->
														</div>
													</div>
													<div class="row-right animMix">
														<div class="product-title"><a class="title-5" href="./dogFood2.do">[라일리스] 오가닉 L 3개 + S 1개 (set) </a></div>
														<div class="rating-star">
															</span>
														</div>
														<div class="product-price">
															<span class="price_sale"><span class="money" data-currency-kr="32,000">32,000원</span></span>
															<del class="price_compare"> <span class="money" data-currency-kr="38,000">38,000원</span></del>
														</div>
													</div>
												</div>
											</div>
											<div class="content_product col-sm-2">
												<div class="row-container product list-unstyled clearfix">
													<div class="row-left">
														<a href="./snack1.do" class="hoverBorder container_item">
															<div class="hoverBorderWrapper">
																<img src="./assets/images/Food/Snack/snack (7).png" class="not-rotation img-responsive front" alt="아침애 오리떡갈비 와퍼">
																<div class="mask"></div>
																<img src="./assets/images/Food/Snack/snack (7).png" class="rotation img-responsive" alt="아침애 오리떡갈비 와퍼">
															</div>
														</a>
														<div class="hover-mask">
															<div class="group-mask">
																<div class="inner-mask">
																	<div class="group-actionbutton">
																		<form action="./cart.do" method="post">
																			<div class="effect-ajax-cart">
																				<input type="hidden" name="quantity" value="1">
																				<button class="btn add-to-cart" data-parent=".parent-fly" type="submit" name="add"><i class="fa fa-shopping-bag"></i></button>
																				
																			</div>
																		</form>
																		<ul class="quickview-wishlist-wrapper">
																			<li class="wishlist hidden-xs">
																				<a class="wish-list" href="./wish-list.do"><span class="hidden-xs"><i class="fa fa-heart" title="Wishlist"></i></span></a>
																			</li>
																		</ul>
																	</div>
																</div>
																<!--inner-mask-->
															</div>
															<!--Group mask-->
														</div>
													</div>
													<div class="row-right animMix">
														<div class="product-title"><a class="title-5" href="./snack1.do">[아침애] 수제간식 오리떡갈비 치즈 (80g)</a></div>
														<div class="rating-star">
															<span class="spr-badge" data-rating="0.0"><span class="spr-starrating spr-badge-starrating"><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i></span><span class="spr-badge-caption">No reviews</span>
															</span>
														</div>
														<div class="product-price">
															<span class="price_sale"><span class="money" data-currency-kr="5,400">5,400원</span></span>
														</div>
													</div>
												</div>
											</div>
											<div class="content_product col-sm-2">
												<div class="row-container product list-unstyled clearfix">
													<div class="row-left">
														<a href="./bathing_4.do" class="hoverBorder container_item">
															<div class="hoverBorderWrapper">
																<img src="./assets/images/Accessory/Wear/0229.png" class="not-rotation img-responsive front" alt="강아지  스카프">
																<div class="mask"></div>
																<img src="./assets/images/Accessory/Wear/0229.png" class="rotation img-responsive" alt="강아지  스카프">
															</div>
														</a>
														<div class="hover-mask">
															<div class="group-mask">
																<div class="inner-mask">
																	<div class="group-actionbutton">
																		<form action="./cart.do" method="post">
																			<div class="effect-ajax-cart">
																				<input type="hidden" name="quantity" value="1">
																				<button class="btn add-to-cart" data-parent=".parent-fly" type="submit" name="add"><i class="fa fa-shopping-bag"></i></button>
																			</div>
																		</form>
																		<ul class="quickview-wishlist-wrapper">
																			<li class="wishlist hidden-xs">
																				<a class="wish-list" href="./wish-list.do"><span class="hidden-xs"><i class="fa fa-heart" title="Wishlist"></i></span></a>
																			</li>
																		</ul>
																	</div>
																</div>
																<!--inner-mask-->
															</div>
															<!--Group mask-->
														</div>
													</div>
													<div class="row-right animMix">
														<div class="product-title"><a class="title-5" href="./bathing_4.do">러블리 땡땡이 스카프 (red)</a></div>
														<div class="rating-star">
															<span class="spr-badge" data-rating="0.0"><span class="spr-starrating spr-badge-starrating"><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i></span><span class="spr-badge-caption">No reviews</span>
															</span>
														</div>
														<div class="product-price">
															<span class="price_sale"><span class="money" >8,000원</span></span>
														</div>
													</div>
												</div>
											</div>
											<div class="content_product col-sm-2">
												<div class="row-container product list-unstyled clearfix">
													<div class="row-left">
														<a href="./bathing_4.do" class="hoverBorder container_item">
															<div class="hoverBorderWrapper">
																<img src="./assets/images/Living_Life/House/house (11).png" class="not-rotation img-responsive front" alt="마약 방석">
																<div class="mask"></div>
																<img src="./assets/images/Living_Life/House/house (11).png" class="rotation img-responsive" alt="마약 방석">
															</div>
														</a>
														<div class="hover-mask">
															<div class="group-mask">
																<div class="inner-mask">
																	<div class="group-actionbutton">
																		<form action="./cart.do" method="post">
																			<div class="effect-ajax-cart">
																				<input type="hidden" name="quantity" value="1">
																				<button class="btn add-to-cart" data-parent=".parent-fly" type="submit" name="add"><i class="fa fa-shopping-bag"></i></button>
																			</div>
																		</form>
																		<ul class="quickview-wishlist-wrapper">
																			<li class="wishlist hidden-xs">
																				<a class="wish-list" href="./wish-list.do"><span class="hidden-xs"><i class="fa fa-heart" title="Wishlist"></i></span></a>
																			</li>
																		</ul>
																	</div>
																</div>
																<!--inner-mask-->
															</div>
															<!--Group mask-->
														</div>
													</div>
													<div class="row-right animMix">
														<div class="product-title"><a class="title-5" href="./bathing_4.do"> 도넛 마약 방석 L (pink)</a></div>
														<div class="rating-star">
															<span class="spr-badge" data-rating="0.0"><span class="spr-starrating spr-badge-starrating"><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i></span><span class="spr-badge-caption">No reviews</span>
															</span>
														</div>
														<div class="product-price">
															<span class="price_sale"><span class="money">54,000원</span></span>
														</div>
													</div>
												</div>
											</div>
											<div class="content_product col-sm-2">
												<div class="row-container product list-unstyled clearfix">
													<div class="row-left">
														<a href="./bathing_4.do" class="hoverBorder container_item">
															<div class="hoverBorderWrapper">
																<img src="./assets/images/Care/Bath/bath (17).png" class="not-rotation img-responsive front" alt="Spa Aroma">
																<div class="mask"></div>
																<img src="./assets/images/Care/Bath/bath (17).png" class="rotation img-responsive" alt="Spa Aroma">
															</div>
														</a>
														<span class="sale_banner">
															<span class="sale_text">10%</span>
														</span>
														<div class="hover-mask">
															<div class="group-mask">
																<div class="inner-mask">
																	<div class="group-actionbutton">
																		<form action="./cart.do" method="post">
																			<div class="effect-ajax-cart">
																				<input type="hidden" name="quantity" value="1">
																				<button class="btn add-to-cart" data-parent=".parent-fly" type="submit" name="add"><i class="fa fa-shopping-bag"></i></button>
																			</div>
																		</form>
																		<ul class="quickview-wishlist-wrapper">
																			<li class="wishlist hidden-xs">
																				<a class="wish-list" href="./wish-list.do"><span class="hidden-xs"><i class="fa fa-heart" title="Wishlist"></i></span></a>
																			</li>
																		</ul>
																	</div>
																</div>
																<!--inner-mask-->
															</div>
															<!--Group mask-->
														</div>
													</div>
													<div class="row-right animMix">
														<div class="product-title"><a class="title-5" href="./bathing_4.do">스파 소다 라벤더향 (3 Sets)</a></div>
														<div class="rating-star">
															<span class="spr-badge" data-rating="0.0"><span class="spr-starrating spr-badge-starrating"><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i></span><span class="spr-badge-caption">No reviews</span>
															</span>
														</div>
														<div class="product-price">
															<span class="price_sale"><span class="money">52,800원</span></span>
															<del class="price_compare"> <span class="money">58,000원</span></del>
														</div>
													</div>
												</div>
											</div>
											<div class="content_product col-sm-2">
												<div class="row-container product list-unstyled clearfix">
													<div class="row-left">
														<a href="./bathing_4.do" class="hoverBorder container_item">
															<div class="hoverBorderWrapper">
																<img src="./assets/images/Accessory/Lead/0124.png" class="not-rotation img-responsive front" alt="강아지 이름표">
																<div class="mask"></div>
																<img src="./assets/images/Accessory/Lead/0124.png" class="rotation img-responsive" alt="강아지 이름표">
															</div>
														</a>
														<span class="sale_banner">
															<span class="sale_text">3 0 %</span>
														</span>
														<div class="hover-mask">
															<div class="group-mask">
																<div class="inner-mask">
																	<div class="group-actionbutton">
																		<form action="./cart.do" method="post">
																			<div class="effect-ajax-cart">
																				<input type="hidden" name="quantity" value="1">
																				<button class="btn add-to-cart" data-parent=".parent-fly" type="submit" name="add"><i class="fa fa-shopping-bag"></i></button>
																			</div>
																		</form>
																		<ul class="quickview-wishlist-wrapper">
																			<li class="wishlist hidden-xs">
																				<a class="wish-list" href="./wish-list.do"><span class="hidden-xs"><i class="fa fa-heart" title="Wishlist"></i></span></a>
																			</li>
																		</ul>
																	</div>
																</div>
																<!--inner-mask-->
															</div>
															<!--Group mask-->
														</div>
													</div>
													<div class="row-right animMix">
														<div class="product-title"><a class="title-5" href="./bathing_4.do">펫블리 럭셔리 발바닥 이름표</a></div>
														<div class="rating-star">
															<span class="spr-badge" data-rating="0.0"><span class="spr-starrating spr-badge-starrating"><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i></span><span class="spr-badge-caption">No reviews</span>
															</span>
														</div>
														<div class="product-price">
															<span class="price_sale"><span class="money">8,330원</span></span>
															<del class="price_compare"> <span class="money">11,900원</span></del>
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
			</div>
		</div>
		<!-- @김병직 메인 중간 배너 -->
		<div class="shopify-section index-section index-section-banner">
			<div data-section-id="1491192677181" data-section-type="banner-section">
				<section class="home_banner_layout">
					<div class="home_banner_wrapper">
						<div class="container">
							<div class="row">
								<div class="home_banner_inner">
									<div class="home_banner_content main-banner-long">
										<div class="col-sm-12 banner_item">
											<a href="./snack2.do">
												<img src="./assets/images/banner/banner_main_long_02.jpg" alt="">
											</a>
										</div>
									</div>
									<div class="home_banner_content  main-banner-long">
										<div class="col-sm-12 banner_item">
											<a href="./snack2.do">
												<img src="./assets/images/banner/banner_main_long_03.jpg" alt="">
											</a>
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
		<section class="home_prosli_layout">
			<div class="home_prosli_wrapper">
				<div class="container">
					<div class="row">
						<div class="prosli_group">
							<div class="page-title">
								<h2><b>카테고리별 인기상품</b></h2>
							</div>
							<!-- Food 인기상품 -->
							<div class="shopify-section index-section index-section-protab1">
								<div data-section-id="1490953841934" data-section-type="protab1-section">
									<section class="home_protab1_layout">
										<div class="home_protab1_wrapper">
											<div class="container">
												<div class="row">
													<div class="home_protab1_inner">
														<div class="home_protab1_content">
															<div class="protab1_bottom">
																<div class="protab1_banner">
																	<a href="#"><img src="./assets/images/title/food_title.png" alt=""></a>
																</div>
																<div class="tab-content">
																	<div class="tab-pane active" id="home_protab1_tab_1">
																		<div class="protab1_item"> 
																			<div class="content_product">
																				<div class="row-container product list-unstyled clearfix">
																					<div class="row-left">
																						<a href="./dogFood1.do" class="hoverBorder container_item">
																							<div class="hoverBorderWrapper">
																								<img src="./assets/images/Food/DogFood/dogFood (1).png" class="not-rotation img-responsive front" alt="">
																								<div class="mask"></div>
																								<img src="./assets/images/Food/DogFood/dogFood (1).png" class="rotation img-responsive" alt="">
																							</div>
																						</a>
																						<div class="hover-mask">
																							<div class="group-mask">
																								<div class="inner-mask">
																									<div class="group-actionbutton">
																										<form action="./cart.do" method="post">
																											<div class="effect-ajax-cart">
																												<input type="hidden" name="quantity" value="1">
																												<button class="btn add-to-cart" data-parent=".parent-fly" type="submit" name="add"><i class="fa fa-shopping-bag"></i></button>
																											</div>
																										</form>
																										<ul class="quickview-wishlist-wrapper">
																											<li class="wishlist hidden-xs">
																												<a class="wish-list" href="./wish-list.do"><span class="hidden-xs"><i class="fa fa-heart" title="Wishlist"></i></span></a>
																											</li>
																										</ul>
																									</div>
																								</div>
																								<!--inner-mask-->
																							</div>
																							<!--Group mask-->
																						</div>
																					</div>
																					<div class="row-right animMix">
																						<div class="product-title"><a class="title-5" href="./dogFood1.do">[아미오] 홀리스틱 퍼피 1.4kg</a></div>
																						<div class="rating-star">
																							<span class="spr-badge" data-rating="0.0"><span class="spr-starrating spr-badge-starrating"><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i></span><span class="spr-badge-caption">No reviews</span>
																							</span>
																						</div>
																						<div class="product-price">
																							<span class="price_sale"><span class="money">14,000원</span></span>
																						</div>
																					</div>
																				</div>
																			</div>
																			<div class="content_product">
																				<div class="row-container product list-unstyled clearfix">
																					<div class="row-left">
																						<a href="./dogFood3.do" class="hoverBorder container_item">
																							<div class="hoverBorderWrapper">
																								<img src="./assets/images/Food/DogFood/dogFood (16).png" class="not-rotation img-responsive front" alt="아보덤 칠면조,감자">
																								<div class="mask"></div>
																								<img src="./assets/images/Food/DogFood/dogFood (16).png" class="rotation img-responsive" alt="아보덤 칠면조,감자">
																							</div>
																						</a>
																						<span class="sale_banner">
																						<span class="sale_text">23%</span>
																						</span>
																						<div class="hover-mask">
																							<div class="group-mask">
																								<div class="inner-mask">
																									<div class="group-actionbutton">
																										<form action="./cart.do" method="post">
																											<div class="effect-ajax-cart">
																												<input type="hidden" name="quantity" value="1">
																												<button class="btn add-to-cart" data-parent=".parent-fly" type="submit" name="add"><i class="fa fa-shopping-bag"></i></button>
																											</div>
																										</form>
																										<ul class="quickview-wishlist-wrapper">
																											<li class="wishlist hidden-xs">
																												<a class="wish-list" href="./wish-list.do"><span class="hidden-xs"><i class="fa fa-heart" title="Wishlist"></i></span></a>
																											</li>
																										</ul>
																									</div>
																								</div>
																								<!--inner-mask-->
																							</div>
																							<!--Group mask-->
																						</div>
																					</div>
																					<div class="row-right animMix">
																						<div class="product-title"><a class="title-5" href="./dogFood3.do">[아보덤] 피너클 칠면조 &amp; 감자 (5.44kg)</a></div>
																						<div class="rating-star">
																							<span class="spr-badge" data-rating="0.0"><span class="spr-starrating spr-badge-starrating"><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i></span><span class="spr-badge-caption">No reviews</span>
																							</span>
																						</div>
																						<div class="product-price">
																							<span class="price_sale"><span class="money">50,000원</span></span>
																							<del class="price_compare"> <span class="money">65,000원</span></del>
																						</div>
																					</div>
																				</div>
																			</div>
																			<div class="content_product">
																				<div class="row-container product list-unstyled clearfix">
																					<div class="row-left">
																						<a href="./snack3.do" class="hoverBorder container_item">
																							<div class="hoverBorderWrapper">
																								<img src="./assets/images/Food/Snack/snack (20).png" class="not-rotation img-responsive front" alt="하루애 저키 오리">
																								<div class="mask"></div>
																								<img src="./assets/images/Food/Snack/snack (20).png" class="rotation img-responsive" alt="하루애 저키 오리">
																							</div>
																						</a>																						<div class="hover-mask">
																							<div class="group-mask">
																								<div class="inner-mask">
																									<div class="group-actionbutton">
																										<form action="./cart.do" method="post">
																											<div class="effect-ajax-cart">
																												<input type="hidden" name="quantity" value="1">
																												<button class="btn add-to-cart" data-parent=".parent-fly" type="submit" name="add"><i class="fa fa-shopping-bag"></i></button>
																											</div>
																										</form>
																										<ul class="quickview-wishlist-wrapper">
																											<li class="wishlist hidden-xs">
																												<a class="wish-list" href="./wish-list.do"><span class="hidden-xs"><i class="fa fa-heart" title="Wishlist"></i></span></a>
																											</li>
																										</ul>
																									</div>
																								</div>
																								<!--inner-mask-->
																							</div>
																							<!--Group mask-->
																						</div>
																					</div>
																					<div class="row-right animMix">
																						<div class="product-title"><a class="title-5" href="./snack3.do">[하루애愛] 저키 오리고기 400g</a></div>
																						<div class="rating-star">
																							<span class="spr-badge" data-rating="0.0"><span class="spr-starrating spr-badge-starrating"><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i></span><span class="spr-badge-caption">No reviews</span>
																							</span>
																						</div>
																						<div class="product-price">
																							<span class="price_sale"><span class="money">10,000원</span></span>
																						</div>
																					</div>
																				</div>
																			</div>
																			<div class="content_product">
																				<div class="row-container product list-unstyled clearfix">
																					<div class="row-left">
																						<a href="./snack2.do" class="hoverBorder container_item">
																							<div class="hoverBorderWrapper">
																								<img src="./assets/images/Food/Snack/snack (10).png" class="not-rotation img-responsive front" alt="Sport machine">
																								<div class="mask"></div>
																								<img src="./assets/images/Food/Snack/snack (10).png" class="rotation img-responsive" alt="Sport machine">
																							</div>
																						</a>
																						<div class="hover-mask">
																							<div class="group-mask">
																								<div class="inner-mask">
																									<div class="group-actionbutton">
																										<form action="./cart.do" method="post">
																											<div class="effect-ajax-cart">
																												<input type="hidden" name="quantity" value="1">
																												<button class="btn add-to-cart" data-parent=".parent-fly" type="submit" name="add"><i class="fa fa-shopping-bag"></i></button>
																											</div>
																										</form>
																										<ul class="quickview-wishlist-wrapper">
																											<li class="wishlist hidden-xs">
																												<a class="wish-list" href="./wish-list.do"><span class="hidden-xs"><i class="fa fa-heart" title="Wishlist"></i></span></a>
																											</li>
																										</ul>
																									</div>
																								</div>
																								<!--inner-mask-->
																							</div>
																							<!--Group mask-->
																						</div>
																					</div>
																					<div class="row-right animMix">
																						<div class="product-title"><a class="title-5" href="./snack2.do">[포켄스] 뉴트리션 트릿 눈 눈물 240g</a></div>
																						<div class="rating-star">
																							<span class="spr-badge" data-rating="0.0"><span class="spr-starrating spr-badge-starrating"><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i></span><span class="spr-badge-caption">No reviews</span>
																							</span>
																						</div>
																						<div class="product-price">
																							<span class="price_sale"><span class="money">10,900원</span></span>
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
											</div>
										</div>
									</section>
								</div>
							</div>
		<!-- 칸 나눌 곳 -->
		<div class="main-empty">
		</div>
		<!-- Care 인기상품-->
		<div class="shopify-section index-section index-section-protab1">
			<div data-section-id="1490953841934" data-section-type="protab1-section">
				<section class="home_protab1_layout">
					<div class="home_protab1_wrapper">
						<div class="container">
							<div class="row">
								<div class="home_protab1_inner">
									<div class="home_protab1_content">
										<div class="protab1_bottom">
											<div class="protab1_banner">
												<a href="./collections-all.do"><img src="./assets/images/title/care_title.png" alt=""></a>
											</div>
											<div class="tab-content">
												<div class="tab-pane active" id="home_protab2_tab_1">
													<div class="protab1_item">
														<div class="content_product">
															<div class="row-container product list-unstyled clearfix">
																<div class="row-left">
																	<a href="./bathing_4.do" class="hoverBorder container_item">
																		<div class="hoverBorderWrapper">
																			<img src="./assets/images/Care/Bath/bath (4).png" class="not-rotation img-responsive front" alt="하이포닉 샴푸">
																			<div class="mask"></div>
																			<img src="./assets/images/Care/Bath/bath (4).png" class="rotation img-responsive" alt="하이포닉 샴푸">
																		</div>
																	</a>
																	<div class="hover-mask">
																		<div class="group-mask">
																			<div class="inner-mask">
																				<div class="group-actionbutton">
																					<form action="./cart.do" method="post">
																						<div class="effect-ajax-cart">
																							<input type="hidden" name="quantity" value="1">
																							<button class="btn add-to-cart" data-parent=".parent-fly" type="submit" name="add"><i class="fa fa-shopping-bag"></i></button>
																						</div>
																					</form>
																					<ul class="quickview-wishlist-wrapper">
																						<li class="wishlist hidden-xs">
																							<a class="wish-list" href="./wish-list.do"><span class="hidden-xs"><i class="fa fa-heart" title="Wishlist"></i></span></a>
																						</li>
																					</ul>
																				</div>
																			</div>
																			<!--inner-mask-->
																		</div>
																		<!--Group mask-->
																	</div>
																</div>
																<div class="row-right animMix">
																	<div class="product-title"><a class="title-5" href="./bathing_4.do">[하이포닉] 저자극샴푸 전견용 500ml</a></div>
																	<div class="rating-star">
																		<span class="spr-badge" data-rating="0.0"><span class="spr-starrating spr-badge-starrating"><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i></span><span class="spr-badge-caption">No reviews</span>
																		</span>
																	</div>
																	<div class="product-price">
																		<span class="price_sale"><span class="money">28,000</span></span>
																	</div>
																</div>
															</div>
														</div>
														<div class="content_product">
															<div class="row-container product list-unstyled clearfix">
																<div class="row-left">
																	<a href="./bathing_4.do" class="hoverBorder container_item">
																		<div class="hoverBorderWrapper">
																			<img src="./assets/images/Care/Bath/bath (12).png" class="not-rotation img-responsive front" alt="풋 버블 클렌저">
																			<div class="mask"></div>
																			<img src="./assets/images/Care/Bath/bath (12).png" class="rotation img-responsive" alt="풋 버블 클렌저">
																		</div>
																	</a>
																	<div class="hover-mask">
																		<div class="group-mask">
																			<div class="inner-mask">
																				<div class="group-actionbutton">
																					<form action="./cart.do" method="post">
																						<div class="effect-ajax-cart">
																							<input type="hidden" name="quantity" value="1">
																							<button class="btn add-to-cart" data-parent=".parent-fly" type="submit" name="add"><i class="fa fa-shopping-bag"></i></button>
																						</div>
																					</form>
																					<ul class="quickview-wishlist-wrapper">
																						<li class="wishlist hidden-xs">
																							<a class="wish-list" href="./wish-list.do"><span class="hidden-xs"><i class="fa fa-heart" title="Wishlist"></i></span></a>
																						</li>
																					</ul>
																				</div>
																			</div>
																			<!--inner-mask-->
																		</div>
																		<!--Group mask-->
																	</div>
																</div>
																<div class="row-right animMix">
																	<div class="product-title"><a class="title-5" href="./bathing_4.do">[더독] 2in1 풋 버블 클렌저 160ml</a></div>
																	<div class="rating-star">
																		<span class="spr-badge" data-rating="0.0"><span class="spr-starrating spr-badge-starrating"><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i></span><span class="spr-badge-caption">No reviews</span>
																		</span>
																	</div>
																	<div class="product-price">
																		<span class="price_sale"><span class="money">8,900</span></span>
																	</div>
																</div>
															</div>
														</div>
														<div class="content_product">
															<div class="row-container product list-unstyled clearfix">
																<div class="row-left">
																	<a href="./bathing_4.do" class="hoverBorder container_item">
																		<div class="hoverBorderWrapper">
																			<img src="./assets/images/Care/Beauty/beauty (5).png" class="not-rotation img-responsive front" alt="애견 미용가위">
																			<div class="mask"></div>
																			<img src="./assets/images/Care/Beauty/beauty (5).png" class="rotation img-responsive" alt="애견 미용가위">
																		</div>
																	</a>
																	<div class="hover-mask">
																		<div class="group-mask">
																			<div class="inner-mask">
																				<div class="group-actionbutton">
																					<form action="./cart.do" method="post">
																						<div class="effect-ajax-cart">
																							<input type="hidden" name="quantity" value="1">
																							<button class="btn add-to-cart" data-parent=".parent-fly" type="submit" name="add"><i class="fa fa-shopping-bag"></i></button>
																						</div>
																					</form>
																					<ul class="quickview-wishlist-wrapper">
																						<li class="wishlist hidden-xs">
																							<a class="wish-list" href="./wish-list.do"><span class="hidden-xs"><i class="fa fa-heart" title="Wishlist"></i></span></a>
																						</li>
																					</ul>
																				</div>
																			</div>
																			<!--inner-mask-->
																		</div>
																		<!--Group mask-->
																	</div>
																</div>
																<div class="row-right animMix">
																	<div class="product-title"><a class="title-5" href="./bathing_4.do">애견 미용가위 4종세트 </a></div>
																	<div class="rating-star">
																		<span class="spr-badge" data-rating="0.0"><span class="spr-starrating spr-badge-starrating"><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i></span><span class="spr-badge-caption">No reviews</span>
																		</span>
																	</div>
																	<div class="product-price">
																		<span class="price_sale"><span class="money">29,500</span></span>
																	</div>
																</div>
															</div>
														</div>
														<div class="content_product">
															<div class="row-container product list-unstyled clearfix">
																<div class="row-left">
																	<a href="./bathing_4.do" class="hoverBorder container_item">
																		<div class="hoverBorderWrapper">
																			<img src="./assets/images/Care/Hygiene/hygiene (7).png" class="not-rotation img-responsive front" alt="요요쉬">
																			<div class="mask"></div>
																			<img src="./assets/images/Care/Hygiene/hygiene (7).png" class="rotation img-responsive" alt="요요쉬">
																		</div>
																	</a>
																	<div class="hover-mask">
																		<div class="group-mask">
																			<div class="inner-mask">
																				<div class="group-actionbutton">
																					<form action="./cart.do" method="post">
																						<div class="effect-ajax-cart">
																							<input type="hidden" name="quantity" value="1">
																							<button class="btn add-to-cart" data-parent=".parent-fly" type="submit" name="add"><i class="fa fa-shopping-bag"></i></button>
																						</div>
																					</form>
																					<ul class="quickview-wishlist-wrapper">
																						<li class="wishlist hidden-xs">
																							<a class="wish-list" href="./wish-list.do"><span class="hidden-xs"><i class="fa fa-heart" title="Wishlist"></i></span></a>
																						</li>
																					</ul>
																				</div>
																			</div>
																			<!--inner-mask-->
																		</div>
																		<!--Group mask-->
																	</div>
																</div>
																<div class="row-right animMix">
																	<div class="product-title"><a class="title-5" href="./bathing_4.do">[요요쉬] 플로랄 와인 패드 대형 20매 (60cm x 76cm)</a></div>
																	<div class="rating-star">
																		<span class="spr-badge" data-rating="0.0"><span class="spr-starrating spr-badge-starrating"><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i></span><span class="spr-badge-caption">No reviews</span>
																		</span>
																	</div>
																	<div class="product-price">
																		<span class="price_sale"><span class="money">8,500</span></span>
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
						</div>
					</div>
				</section>
			</div>
		</div>
		<div class="main-empty">
		<!-- 칸 나눌 곳  -->
		</div>
		<!-- Living &amp; Life 인기상품-->
		<div class="shopify-section index-section index-section-protab1">
			<div data-section-id="1490953841934" data-section-type="protab1-section">
				<section class="home_protab1_layout">
					<div class="home_protab1_wrapper">
						<div class="container">
							<div class="row">
								<div class="home_protab1_inner">
									<div class="home_protab1_content">
										<div class="protab1_bottom">
											<div class="protab1_banner">
												<a href="./collections-all.do"><img src="./assets/images/title/li_title.png" alt=""></a>
											</div>
											<div class="tab-content">
												<div class="tab-pane active" id="home_protab3_tab_1">
													<div class="protab1_item">
														<div class="content_product">
															<div class="row-container product list-unstyled clearfix">
																<div class="row-left">
																	<a href="./bathing_4.do" class="hoverBorder container_item">
																		<div class="hoverBorderWrapper">
																			<img src="./assets/images/Living_Life/House/house (15).png" class="not-rotation img-responsive front" alt="사각 방석">
																			<div class="mask"></div>
																			<img src="./assets/images/Living_Life/House/house (15).png" class="rotation img-responsive" alt="사각 방석">
																		</div>
																	</a>
																	<div class="hover-mask">
																		<div class="group-mask">
																			<div class="inner-mask">
																				<div class="group-actionbutton">
																					<form action="./cart.do" method="post">
																						<div class="effect-ajax-cart">
																							<input type="hidden" name="quantity" value="1">
																							<button class="btn add-to-cart" data-parent=".parent-fly" type="submit" name="add"><i class="fa fa-shopping-bag"></i></button>
																						</div>
																					</form>
																					<ul class="quickview-wishlist-wrapper">
																						<li class="wishlist hidden-xs">
																							<a class="wish-list" href="./wish-list.do"><span class="hidden-xs"><i class="fa fa-heart" title="Wishlist"></i></span></a>
																						</li>
																					</ul>
																				</div>
																			</div>
																			<!--inner-mask-->
																		</div>
																		<!--Group mask-->
																	</div>
																</div>
																<div class="row-right animMix">
																	<div class="product-title"><a class="title-5" href="./bathing_4.do">사각방석 (gray)</a></div>
																	<div class="rating-star">
																		<span class="spr-badge" data-rating="0.0"><span class="spr-starrating spr-badge-starrating"><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i></span><span class="spr-badge-caption">No reviews</span>
																		</span>
																	</div>
																	<div class="product-price">
																		<span class="price_sale"><span class="money">14,280</span></span>
																	</div>
																</div>
															</div>
														</div>
														<div class="content_product">
															<div class="row-container product list-unstyled clearfix">
																<div class="row-left">
																	<a href="./bathing_4.do" class="hoverBorder container_item">
																		<div class="hoverBorderWrapper">
																			<img src="./assets/images/Living_Life/Machine(F,W)/machine (6).png" class="not-rotation img-responsive front" alt="급수기">
																			<div class="mask"></div>
																			<img src="./assets/images/Living_Life/Machine(F,W)/machine (6).png" class="rotation img-responsive" alt="급수기">
																		</div>
																	</a>
																	<div class="hover-mask">
																		<div class="group-mask">
																			<div class="inner-mask">
																				<div class="group-actionbutton">
																					<form action="./cart.do" method="post">
																						<div class="effect-ajax-cart">
																							<input type="hidden" name="quantity" value="1">
																							<button class="btn add-to-cart" data-parent=".parent-fly" type="submit" name="add"><i class="fa fa-shopping-bag"></i></button>
																						</div>
																					</form>
																					<ul class="quickview-wishlist-wrapper">
																						<li class="wishlist hidden-xs">
																							<a class="wish-list" href="./wish-list.do"><span class="hidden-xs"><i class="fa fa-heart" title="Wishlist"></i></span></a>
																						</li>
																					</ul>
																				</div>
																			</div>
																			<!--inner-mask-->
																		</div>
																		<!--Group mask-->
																	</div>
																</div>
																<div class="row-right animMix">
																	<div class="product-title"><a class="title-5" href="./bathing_4.do">[푸르미] 보급형물병 (그린)</a></div>
																	<div class="rating-star">
																		<span class="spr-badge" data-rating="0.0"><span class="spr-starrating spr-badge-starrating"><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i></span><span class="spr-badge-caption">No reviews</span>
																		</span>
																	</div>
																	<div class="product-price">
																		<span class="price_sale"><span class="money">10,000</span></span>
																	</div>
																</div>
															</div>
														</div>
														<div class="content_product">
															<div class="row-container product list-unstyled clearfix">
																<div class="row-left">
																	<a href="./bathing_4.do" class="hoverBorder container_item">
																		<div class="hoverBorderWrapper">
																			<img src="./assets/images/Living_Life/Machine(F,W)/machine (3).png" class="not-rotation img-responsive front" alt="발바닥 스탠식기">
																			<div class="mask"></div>
																			<img src="./assets/images/Living_Life/Machine(F,W)/machine (3).png" class="rotation img-responsive" alt="발바닥 스탠식기">
																		</div>
																	</a>
																	<span class="sale_banner">
																		<span class="sale_text">2 7 %</span>
																	</span>
																	<div class="hover-mask">
																		<div class="group-mask">
																			<div class="inner-mask">
																				<div class="group-actionbutton">
																					<form action="./cart.do" method="post">
																						<div class="effect-ajax-cart">
																							<input type="hidden" name="quantity" value="1">
																							<button class="btn add-to-cart" data-parent=".parent-fly" type="submit" name="add"><i class="fa fa-shopping-bag"></i></button>
																						</div>
																					</form>
																					<ul class="quickview-wishlist-wrapper">
																						<li class="wishlist hidden-xs">
																							<a class="wish-list" href="./wish-list.do"><span class="hidden-xs"><i class="fa fa-heart" title="Wishlist"></i></span></a>
																						</li>
																					</ul>
																				</div>
																			</div>
																			<!--inner-mask-->
																		</div>
																		<!--Group mask-->
																	</div>
																</div>
																<div class="row-right animMix">
																	<div class="product-title"><a class="title-5" href="./bathing_4.do">[브리더] 발바닥 스텐식기 96oz</a></div>
																	<div class="rating-star">
																		<span class="spr-badge" data-rating="0.0"><span class="spr-starrating spr-badge-starrating"><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i></span><span class="spr-badge-caption">No reviews</span>
																		</span>
																	</div>
																	<div class="product-price">
																		<span class="price_sale"><span class="money">9,500</span></span>
																		<del class="price_compare"> <span class="money">13,000</span></del>
																	</div>
																</div>
															</div>
														</div>
														<div class="content_product">
															<div class="row-container product list-unstyled clearfix">
																<div class="row-left">
																	<a href="./bathing_4.do" class="hoverBorder container_item">
																		<div class="hoverBorderWrapper">
																			<img src="./assets/images/Living_Life/Out/out (10).png" class="not-rotation img-responsive front" alt="이동장">
																			<div class="mask"></div>
																			<img src="./assets/images/Living_Life/Out/out (10).png" class="rotation img-responsive" alt="이동장">
																		</div>
																	</a>
																	<span class="sale_banner">
																		<span class="sale_text">2 6 %</span>
																	</span>
																	<div class="hover-mask">
																		<div class="group-mask">
																			<div class="inner-mask">
																				<div class="group-actionbutton">
																					<form action="./cart.do" method="post">
																						<div class="effect-ajax-cart">
																							<input type="hidden" name="quantity" value="1">
																							<button class="btn add-to-cart" data-parent=".parent-fly" type="submit" name="add"><i class="fa fa-shopping-bag"></i></button>
																						</div>
																					</form>
																					<ul class="quickview-wishlist-wrapper">
																						<li class="wishlist hidden-xs">
																							<a class="wish-list" href="./wish-list.do"><span class="hidden-xs"><i class="fa fa-heart" title="Wishlist"></i></span></a>
																						</li>
																					</ul>
																				</div>
																			</div>
																			<!--inner-mask-->
																		</div>
																		<!--Group mask-->
																	</div>
																</div>
																<div class="row-right animMix">
																	<div class="product-title"><a class="title-5" href="./bathing_4.do">[해피파우] 스타일리쉬 숄더백 (Black Diamond)</a></div>
																	<div class="rating-star">
																		<span class="spr-badge" data-rating="0.0"><span class="spr-starrating spr-badge-starrating"><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i></span><span class="spr-badge-caption">No reviews</span>
																		</span>
																	</div>
																	<div class="product-price">
																		<span class="price_sale"><span class="money" data-currency-usd="$200.00">55,000</span></span>
																		<del class="price_compare"> <span class="money">40,500</span></del>
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
						</div>
					</div>
				</section>
			</div>
		</div>
		<!-- 칸 나눌 곳 -->
		<div class="main-empty">
		</div>
		<!-- Accessory 인기상품-->
		<div class="shopify-section index-section index-section-protab1">
			<div data-section-id="1490953841934" data-section-type="protab1-section">
				<section class="home_protab1_layout">
					<div class="home_protab1_wrapper">
						<div class="container">
							<div class="row">
								<div class="home_protab1_inner">
									<div class="home_protab1_content">
										<div class="protab1_bottom">
											<div class="protab1_banner">
												<a href="./collections-all.do"><img src="./assets/images/title/acc_title.png" alt=""></a>
											</div>
											<div class="tab-content">
												<div class="tab-pane active" id="home_protab4_tab_1">
													<div class="protab1_item">
														<div class="content_product">
															<div class="row-container product list-unstyled clearfix">
																<div class="row-left">
																	<a href="./bathing_4.do" class="hoverBorder container_item">
																		<div class="hoverBorderWrapper">
																			<img src="./assets/images/Accessory/Lead/0115.png" class="not-rotation img-responsive front" alt="자동 줄">
																			<div class="mask"></div>
																			<img src="./assets/images/Accessory/Lead/0115.png" class="rotation img-responsive" alt="자동 줄">
																		</div>
																	</a>
																	<div class="hover-mask">
																		<div class="group-mask">
																			<div class="inner-mask">
																				<div class="group-actionbutton">
																					<form action="./cart.do" method="post">
																						<div class="effect-ajax-cart">
																							<input type="hidden" name="quantity" value="1">
																							<button class="btn add-to-cart" data-parent=".parent-fly" type="submit" name="add"><i class="fa fa-shopping-bag"></i></button>
																						</div>
																					</form>
																					<ul class="quickview-wishlist-wrapper">
																						<li class="wishlist hidden-xs">
																							<a class="wish-list" href="./wish-list.do"><span class="hidden-xs"><i class="fa fa-heart" title="Wishlist"></i></span></a>
																						</li>
																					</ul>
																				</div>
																			</div>
																			<!--inner-mask-->
																		</div>
																		<!--Group mask-->
																	</div>
																</div>
																<div class="row-right animMix">
																	<div class="product-title"><a class="title-5" href="./bathing_4.do">[프리고] 칼라 자동줄 핑크체크 (S,M,L)</a></div>
																	<div class="rating-star">
																		<span class="spr-badge" data-rating="0.0"><span class="spr-starrating spr-badge-starrating"><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i></span><span class="spr-badge-caption">No reviews</span>
																		</span>
																	</div>
																	<div class="product-price">
																		<span class="price_sale"><span class="money">18,000</span></span>
																	</div>
																</div>
															</div>
														</div>
														<div class="content_product">
															<div class="row-container product list-unstyled clearfix">
																<div class="row-left">
																	<a href="./bathing_4.do" class="hoverBorder container_item">
																		<div class="hoverBorderWrapper">
																			<img src="./assets/images/Accessory/Wear/0215.png" class="not-rotation img-responsive front" alt="목폴라티">
																			<div class="mask"></div>
																			<img src="./assets/images/Accessory/Wear/0215.png" class="rotation img-responsive" alt="목폴라티">
																		</div>
																	</a>
																	<div class="hover-mask">
																		<div class="group-mask">
																			<div class="inner-mask">
																				<div class="group-actionbutton">
																					<form action="./cart.do" method="post">
																						<div class="effect-ajax-cart">
																							<input type="hidden" name="quantity" value="1">
																							<button class="btn add-to-cart" data-parent=".parent-fly" type="submit" name="add"><i class="fa fa-shopping-bag"></i></button>
																						</div>
																					</form>
																					<ul class="quickview-wishlist-wrapper">
																						<li class="wishlist hidden-xs">
																							<a class="wish-list" href="./wish-list.do"><span class="hidden-xs"><i class="fa fa-heart" title="Wishlist"></i></span></a>
																						</li>
																					</ul>
																				</div>
																			</div>
																			<!--inner-mask-->
																		</div>
																		<!--Group mask-->
																	</div>
																</div>
																<div class="row-right animMix">
																	<div class="product-title"><a class="title-5" href="./bathing_4.do">[미스모펫] 폴라 티셔츠</a></div>
																	<div class="rating-star">
																		<span class="spr-badge" data-rating="0.0"><span class="spr-starrating spr-badge-starrating"><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i></span><span class="spr-badge-caption">No reviews</span>
																		</span>
																	</div>
																	<div class="product-price">
																		<span class="price_sale"><span class="money">18,500</span></span>
																	</div>
																</div>
															</div>
														</div>
														<div class="content_product">
															<div class="row-container product list-unstyled clearfix">
																<div class="row-left">
																	<a href="./bathing_4.do" class="hoverBorder container_item">
																		<div class="hoverBorderWrapper">
																			<img src="./assets/images/Accessory/Lead/0123.png" class="not-rotation img-responsive front" alt="뼈다귀 이름표">
																			<div class="mask"></div>
																			<img src="./assets/images/Accessory/Lead/0123.png" class="rotation img-responsive" alt="뼈다귀 이름표">
																		</div>
																	</a>
																	<span class="sale_banner">
																		<span class="sale_text">-33.33%</span>
																	</span>
																	<div class="hover-mask">
																		<div class="group-mask">
																			<div class="inner-mask">
																				<div class="group-actionbutton">
																					<form action="./cart.do" method="post">
																						<div class="effect-ajax-cart">
																							<input type="hidden" name="quantity" value="1">
																							<button class="btn add-to-cart" data-parent=".parent-fly" type="submit" name="add"><i class="fa fa-shopping-bag"></i></button>
																						</div>
																					</form>
																					<ul class="quickview-wishlist-wrapper">
																						<li class="wishlist hidden-xs">
																							<a class="wish-list" href="./wish-list.do"><span class="hidden-xs"><i class="fa fa-heart" title="Wishlist"></i></span></a>
																						</li>
																					</ul>
																				</div>
																			</div>
																			<!--inner-mask-->
																		</div>
																		<!--Group mask-->
																	</div>
																</div>
																<div class="row-right animMix">
																	<div class="product-title"><a class="title-5" href="./bathing_4.do">[러비스펫] 럭셔리 뼈다귀 중,대형견 </a></div>
																	<div class="rating-star">
																		<span class="spr-badge" data-rating="0.0"><span class="spr-starrating spr-badge-starrating"><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i></span><span class="spr-badge-caption">No reviews</span>
																		</span>
																	</div>
																	<div class="product-price">
																		<span class="price_sale"><span class="money">13,900 </span></span>
																	</div>
																</div>
															</div>
														</div>
														<div class="content_product">
															<div class="row-container product list-unstyled clearfix">
																<div class="row-left">
																	<a href="./bathing_4.do" class="hoverBorder container_item">
																		<div class="hoverBorderWrapper">
																			<img src="./assets/images/Accessory/Wear/0216.png" class="not-rotation img-responsive front" alt="애견 부츠">
																			<div class="mask"></div>
																			<img src="./assets/images/Accessory/Wear/0216.png" class="rotation img-responsive" alt="애견 부츠">
																		</div>
																	</a>
																	<div class="hover-mask">
																		<div class="group-mask">
																			<div class="inner-mask">
																				<div class="group-actionbutton">
																					<form action="./cart.do" method="post">
																						<div class="effect-ajax-cart">
																							<input type="hidden" name="quantity" value="1">
																							<button class="btn add-to-cart" data-parent=".parent-fly" type="submit" name="add"><i class="fa fa-shopping-bag"></i></button>
																						</div>
																					</form>
																					<ul class="quickview-wishlist-wrapper">
																						<li class="wishlist hidden-xs">
																							<a class="wish-list" href="./wish-list.do"><span class="hidden-xs"><i class="fa fa-heart" title="Wishlist"></i></span></a>
																						</li>
																					</ul>
																				</div>
																			</div>
																			<!--inner-mask-->
																		</div>
																		<!--Group mask-->
																	</div>
																</div>
																<div class="row-right animMix">
																	<div class="product-title"><a class="title-5" href="./bathing_4.do">가죽 스노우 부츠 (미끄럼방지 및 방수)</a></div>
																	<div class="rating-star">
																		<span class="spr-badge" data-rating="0.0"><span class="spr-starrating spr-badge-starrating"><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i><i class="spr-icon spr-icon-star-empty" style=""></i></span><span class="spr-badge-caption">No reviews</span>
																		</span>
																	</div>
																	<div class="product-price">
																		<span class="price_sale"><span class="money">13,000</span></span>
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
						</div>
					</div>
				</section>
			</div>
		</div>
		</div>
		</div>
		</div>
		</div>
		</section>
		<!-- 칸 나눌 곳 -->
		<div class="main-empty">
		</div>
		<!-- Today's Trending -->
		<div id="shopify-section-1490955218917" class="shopify-section index-section index-section-protab2">
			<div data-section-id="1490955218917" data-section-type="protab2-section">
				<section class="home_protab2_layout">
					<div class="home_protab2_wrapper">
						<div class="container">
							<div class="row">
								<div class="home_protab2_inner">
									<div class="home_protab2_content">
											<div class="page-title">
												<h2>Today's Pick</h2>
											</div>
										<div class="protab2_bottom">
											<div class="tab-content">
												<div class="tab-pane active" id="home_protab6_tab_1">
													<div class="protab2_item home1_protab2_item">
														<div class="content_product">
															<div class="row-container product list-unstyled clearfix">
																<div class="row-left">
																	<a href="./dogFood4.do" class="hoverBorder container_item">
																		<div class="hoverBorderWrapper">
																			<img src="./assets/images/Food/DogFood/dogFood (17).png" class="img-responsive front" alt="양고기 중대형견용 7.5Kg">
																		</div>
																	</a>
																	<span class="sale_banner">
																		<span class="sale_text">-50.0%</span>
																	</span>
																	<div class="hover-mask">
																		<div class="group-mask">
																			<div class="inner-mask">
																				<div class="group-actionbutton">
																					<form action="./cart.do" method="post">
																						<div class="effect-ajax-cart">
																							<input type="hidden" name="quantity" value="1">
																							<button class="btn add-to-cart" data-parent=".parent-fly" type="submit" name="add"><i class="fa fa-shopping-bag"></i></button>
																						</div>
																					</form>
																					<ul class="quickview-wishlist-wrapper">
																						<li class="wishlist hidden-xs">
																							<a class="wish-list" href="./wish-list.do"><span class="hidden-xs"><i class="fa fa-heart" title="Wishlist"></i></span></a>
																						</li>
																					</ul>
																				</div>
																			</div>
																			<!--inner-mask-->
																		</div>
																		<!--Group mask-->
																	</div>
																</div>
																<div class="row-right animMix">
																	<div class="product-title"><a class="title-5" href="./dogFood4.do">[ANF] 양고기 중대형견용 7.5Kg</a></div>
																	<div class="product-price">
																		<span class="price_sale"><span class="money" data-currency-usd="$46900">46,900</span></span>
																		<del class="price_compare"> <span class="money" data-currency-usd="$56900">94,000</span></del> 
																	</div>
																</div>
															</div>
														</div>
														<div class="content_product">
															<div class="row-container product list-unstyled clearfix">
																<div class="row-left">
																	<a href="./beauty2.do" class="hoverBorder container_item">
																		<div class="hoverBorderWrapper">
																			<img src="./assets/images/Care/Beauty/beauty (5).png" class="img-responsive front" alt="Today's trending">
																		</div>
																	</a>
																	<div class="hover-mask">
																		<div class="group-mask">
																			<div class="inner-mask">
																				<div class="group-actionbutton">
																					<form action="./cart.do" method="post">
																						<div class="effect-ajax-cart">
																							<input type="hidden" name="quantity" value="1">
																							<button class="btn add-to-cart" data-parent=".parent-fly" type="submit" name="add"><i class="fa fa-shopping-bag"></i></button>
																						</div>
																					</form>
																					<ul class="quickview-wishlist-wrapper">
																						<li class="wishlist hidden-xs">
																							<a class="wish-list" href="./wish-list.do"><span class="hidden-xs"><i class="fa fa-heart" title="Wishlist"></i></span></a>
																						</li>
																					</ul>
																				</div>
																			</div>
																			<!--inner-mask-->
																		</div>
																		<!--Group mask-->
																	</div>
																</div>
																<div class="row-right animMix">
																	<div class="product-title"><a class="title-5" href="./beauty2.do">[X3] 터보 클리퍼</a></div>
																	<div class="product-price">
																		<span class="price_sale"><span class="money" data-currency-usd="$68000">68,000</span></span>
																	</div>
																</div>
															</div>
														</div>
														<div class="content_product">
															<div class="row-container product list-unstyled clearfix">
																<div class="row-left">
																	<a href="./house_01.do" class="hoverBorder container_item">
																		<div class="hoverBorderWrapper">
																			<img src="./assets/images/house/house_01.png" class="img-responsive front" alt="요기 개벽 안전문 소형견용">
																		</div>
																	</a>
																	<div class="hover-mask">
																		<div class="group-mask">
																			<div class="inner-mask">
																				<div class="group-actionbutton">
																					<form action="./cart.do" method="post">
																						<div class="effect-ajax-cart">
																							<input type="hidden" name="quantity" value="1">
																							<button class="btn add-to-cart" data-parent=".parent-fly" type="submit" name="add"><i class="fa fa-shopping-bag"></i></button>
																						</div>
																					</form>
																					<ul class="quickview-wishlist-wrapper">
																						<li class="wishlist hidden-xs">
																							<a class="wish-list" href="./wish-list.do"><span class="hidden-xs"><i class="fa fa-heart" title="Wishlist"></i></span></a>
																						</li>
																					</ul>
																				</div>
																			</div>
																			<!--inner-mask-->
																		</div>
																		<!--Group mask-->
																	</div>
																</div>
																<div class="row-right animMix">
																	<div class="product-title"><a class="title-5" href="./house_01.do">요기 개벽 안전문 소형견용</a></div>
																	<div class="product-price">
																		<span class="price_sale"><span class="money" data-currency-usd="$9000">9,000</span></span>
																	</div>
																</div>
															</div>
														</div>
														<div class="content_product">
															<div class="row-container product list-unstyled clearfix">
																<div class="row-left">
																	<a href="./toy_04.do" class="hoverBorder container_item">
																		<div class="hoverBorderWrapper">
																			<img src="./assets/images/Accessory/Training/0005.png" class="img-responsive front" alt="원형 치실 타래 8cm">
																		</div>
																	</a>
																	<div class="hover-mask">
																		<div class="group-mask">
																			<div class="inner-mask">
																				<div class="group-actionbutton">
																					<form action="./cart.do" method="post">
																						<div class="effect-ajax-cart">
																							<input type="hidden" name="quantity" value="1">
																							<button class="btn add-to-cart" data-parent=".parent-fly" type="submit" name="add"><i class="fa fa-shopping-bag"></i></button>
																						</div>
																					</form>
																					<ul class="quickview-wishlist-wrapper">
																						<li class="wishlist hidden-xs">
																							<a class="wish-list" href="./wish-list.do"><span class="hidden-xs"><i class="fa fa-heart" title="Wishlist"></i></span></a>
																						</li>
																					</ul>
																				</div>
																			</div>
																			<!--inner-mask-->
																		</div>
																		<!--Group mask-->
																	</div>
																</div>
																<div class="row-right animMix">
																	<div class="product-title"><a class="title-5" href="./toy_04.do">원형 치실 타래 8cm</a></div>
																	<div class="product-price">
																		<span class="price_sale"><span class="money" data-currency-usd="$5000">5,000</span></span>
																	</div>
																</div>
															</div>
														</div>
														<div class="content_product">
															<div class="row-container product list-unstyled clearfix">
																<div class="row-left">
																	<a href="./bathing_4.do" class="hoverBorder container_item">
																		<div class="hoverBorderWrapper">
																			<img src="http://via.placeholder.com/290x335" class="img-responsive front" alt="Today's trending">
																		</div>
																	</a>
																	<div class="hover-mask">
																		<div class="group-mask">
																			<div class="inner-mask">
																				<div class="group-actionbutton">
																					<form action="./cart.do" method="post">
																						<div class="effect-ajax-cart">
																							<input type="hidden" name="quantity" value="1">
																							<button class="btn add-to-cart" data-parent=".parent-fly" type="submit" name="add"><i class="fa fa-shopping-bag"></i></button>
																						</div>
																					</form>
																					<ul class="quickview-wishlist-wrapper">
																						<li class="wishlist hidden-xs">
																							<a class="wish-list" href="./wish-list.do"><span class="hidden-xs"><i class="fa fa-heart" title="Wishlist"></i></span></a>
																						</li>
																					</ul>
																				</div>
																			</div>
																			<!--inner-mask-->
																		</div>
																		<!--Group mask-->
																	</div>
																</div>
																<div class="row-right animMix">
																	<div class="product-title"><a class="title-5" href="./bathing_4.do">Today's trending</a></div>
																	<div class="product-price">
																		<span class="price_sale"><span class="money" data-currency-usd="$200.00">$200.00</span></span>
																	</div>
																</div>
															</div>
														</div>
														<div class="content_product">
															<div class="row-container product list-unstyled clearfix">
																<div class="row-left">
																	<a href="./bathing_4.do" class="hoverBorder container_item">
																		<div class="hoverBorderWrapper">
																			<img src="http://via.placeholder.com/290x335" class="img-responsive front" alt="Today's trending">
																		</div>
																	</a>
																	<div class="hover-mask">
																		<div class="group-mask">
																			<div class="inner-mask">
																				<div class="group-actionbutton">
																					<form action="./cart.do" method="post">
																						<div class="effect-ajax-cart">
																							<input type="hidden" name="quantity" value="1">
																							<button class="btn add-to-cart" data-parent=".parent-fly" type="submit" name="add"><i class="fa fa-shopping-bag"></i></button>
																						</div>
																					</form>
																					<ul class="quickview-wishlist-wrapper">
																						<li class="wishlist hidden-xs">
																							<a class="wish-list" href="./wish-list.do"><span class="hidden-xs"><i class="fa fa-heart" title="Wishlist"></i></span></a>
																						</li>
																					</ul>
																				</div>
																			</div>
																			<!--inner-mask-->
																		</div>
																		<!--Group mask-->
																	</div>
																</div>
																<div class="row-right animMix">
																	<div class="product-title"><a class="title-5" href="./bathing_4.do">Today's trending</a></div>
																	<div class="product-price">
																		<span class="price_sale"><span class="money" data-currency-usd="$200.00">$200.00</span></span>
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
						</div>
					</div>
				</section>
			</div>
		</div>
	</main>
</div>
