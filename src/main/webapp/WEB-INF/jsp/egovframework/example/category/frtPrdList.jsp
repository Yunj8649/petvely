<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>
function fnGoPaging(page){
	   
   var $pagingFrm = $("#pagingFrm");
   
   $("#page").val(page);
   
   $pagingFrm.attr("action", "frtPrdList.do");
   $pagingFrm.attr("method", "post");

   $pagingFrm.submit();
}

$(document).ready(function() {
/* 	var left_banner_width = $(".collection-leftsidebar").width();
	
	$(window).scroll(function() {
		var top = $(window).scrollTop();
		
		if(top > 100 && top < 470){
			$("#left-banner").css({width:left_banner_width});
			$("#left-banner").css({position:'fixed'});
			$("#left-banner").css({top:'190px'});
		} else if (top >= 470) {
			$("#left-banner").css({width:left_banner_width});
			$("#left-banner").css({position:'relative'});
			$("#left-banner").css({top:'440px'});
		} else {
			$("#left-banner").css({position:'relative'});
			$("#left-banner").css({top:'0px'});
		}
	}); */
	
	$(".goPaging").click(function(){
		
		var $pageFrm = $("#pageFrm") ,
			$prCd = $(this).data("key");
		
		$("#prCd").val($prCd);
			
		$pageFrm.attr("action", "detailPrd.do");
		$pageFrm.submit();
	});
});
</script>
<form id="pagingFrm" name="pagingFrm">
	<input type="hidden" id="page" name="page">
	<input type="hidden" id="ctCd" name="ctCd" value="<c:out value='${frtPrdList[0].ctCd}' />"/>
	<input type="hidden" id="subCtCd" name="subCtCd" value="<c:out value='${frtPrdList[0].subCtCd}' />"/>
</form>
<form id="pageFrm" name="pageFrm">
	<input type="hidden" id="prCd" name="prCd" value=""/>
</form>

<!-- Main Content -->
<div class="page-container" id="PageContainer">
	<main class="main-content" id="MainContent" role="main">
	<section class="collection-content">
		<div class="collection-wrapper">
			<div class="container">
				<div class="row">
					<div id="shopify-section-collection-template"
						class="shopify-section">
						<div class="collection-inner">
							<!-- Tags loading -->
							<div id="tags-load" style="display: none;">
								<i class="fa fa-spinner fa-pulse fa-2x"></i>
							</div>
							<div id="collection">
								<div class="collection_inner">
									<div class="collection-leftsidebar sidebar col-sm-3 clearfix">
										<!-- Category 삭제 / Event 배너 삽입  -->
										<!--20171125 봉성철 수정 , 상단 배너와 동일한 div사용하고 id값만 다르게 지정함 -->
										<div class="sidebar-block collection-block" id="left-banner">
											<div id="evt_banner_left">
												<div class='bannerimg'
													style="overflow: hidden; width: auto; height: auto; position: relative;">
													<a href="#"> 
														<img src="./assets/images/banner/product_detail_event.jpg">
													</a>
												</div>
											</div>
										</div>
									</div>
									<div class="collection-mainarea col-sm-9 clearfix">
										<div class="collection_toolbar">
											<div class="toolbar_left">
												<p>
											 		"<c:out value='${categoryList[0].subCtNm}' />" 등록 상품 :
											 		 <c:out value='${categoryList[0].cnt}' />개
												</p>
											</div>
											<div class="toolbar_right">
												<div class="group_toolbar">
													<!-- View as -->
													<div class="grid_list">
														<span class="toolbar_title">Select View:</span>
														<ul class="list-inline option-set hidden-xs"
															data-option-key="layoutMode">
															<li data-option-value="fitRows" id="goGrid"
																class="active goAction " data-toggle="tooltip"
																data-placement="top" title="" data-original-title="Grid">
																<i class="fa fa fa-th"></i>
															</li>
															<li data-option-value="straightDown" id="goList"
																class="goAction " data-toggle="tooltip"
																data-placement="top" title="" data-original-title="List">
																<i class="fa fa-th-list"></i>
															</li>
														</ul>
													</div>
													<!-- Sort by -->
													<div class="sortBy">
														<span class="toolbar_title">Sort By:</span>
														<div id="sortButtonWarper" class="dropdown-toggle"
															data-toggle="dropdown">
															<button id="sortButton">
																<span class="name">신상품</span><i class="fa fa-caret-down"></i>
															</button>
															<i class="sub-dropdown1"></i> <i class="sub-dropdown"></i>
														</div>
														<div id="sortBox" class="control-container dropdown-menu">
															<ul id="sortForm"
																class="list-unstyled option-set text-left list-styled"
																data-option-key="sortBy">
																<li class="sort manual"><a
																	href="./collections-all.do">신상품</a></li>
																<li class="sort price-ascending"><a
																	href="./collections-all.do">낮은 가격</a></li>
																<li class="sort price-descending"><a
																	href="./collections-all.do">높은 가격</a></li>
																<li class="sort title-ascending"><a
																	href="./collections-all.do">인기 상품</a></li>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="collection-items clearfix">
											<div class="products">
												<c:forEach items="${frtPrdList}" var="prdList" varStatus="status">
													<div class="product-item col-sm-3">
														<div class="product">
															<div class="row-left">
																<a href="#" class="hoverBorder container_item goPaging" data-key="${prdList.prCd}">
																	<div class="hoverBorderWrapper">
																		<img src="${prdList.prImg1}" data-prkey="${prdList.prCd}" data-img="${prdList.prImg1}" class="not-rotation img-responsive front" alt="PRODUCT_IMG">
																		<div class="mask"></div>
																		<img src="${prdList.prImg1}" data-prkey="${prdList.prCd}" data-img="${prdList.prImg1}" class="rotation img-responsive" alt="PRODUCT_IMG">
																	</div>
																</a>
																<div class="hover-mask grid-mode">
																	<div class="group-mask">
																		<div class="inner-mask">
																			<div class="group-actionbutton">
																				<form action="./cart.do" method="post">
																					<div class="effect-ajax-cart">
																						<input type="hidden" name="quantity" value="1">
																							<button class="btn add-to-cart" data-parent=".parent-fly" type="submit" name="add">
																								<i class="fa fa-shopping-bag"></i>
																							</button>
																					</div>
																				</form>
																				<ul class="quickview-wishlist-wrapper">
																					<li class="wishlist hidden-xs">
																						<a class="wish-list" href="./wish-list.do">
																							<span class="hidden-xs">
																								<i class="fa fa-heart" title="Wishlist"></i>
																							</span>
																						</a>
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
																<div class="grid-mode">
																	<div class="product-title">
																		<a class="title-5 goPaging" href="#" data-key="${prdList.prCd}"> 
																			<c:if test="${prdList.brdNm != '' && prdList.brdNm != null}">
																				[<c:out value="${prdList.brdNm}" />] 
																			</c:if>
																				<c:out value="${prdList.prNm}" /> 
																				<c:out value="${prdList.prOpt}" />
																		</a>
																	</div>
																	<div class="rating-star">
																		<span class="spr-badge" data-rating="4.0"> 
																			<span class="spr-starrating spr-badge-starrating"> 
																				<i class="spr-icon spr-icon-star" style=""></i> 
																				<i class="spr-icon spr-icon-star" style=""></i> 
																				<i class="spr-icon spr-icon-star" style=""></i> 
																				<i class="spr-icon spr-icon-star" style=""></i> 
																				<i class="spr-icon spr-icon-star" style=""></i>
																			</span>
																			<span class="spr-badge-caption">1 review</span>
																		</span>
																	</div>
																	<div class="product-price">
																		<span class="price_sale">
																			<span class="money">
																				<c:out value="${prdList.prPrc}" />원</span>
																			</span>
																		<!-- <del class="price_compare"> <span class="money">$300.00</span></del> -->
																	</div>
																</div>
																<div class="list-mode hide">
																	<div class="list-left">
																		<div class="product-title">
																			<a class="title-5" href="./toy_01.do">
																				[<c:out value="${prdList.brdNm}" />]
																				 <c:out value="${prdList.prNm}" /> 
																				 <c:out value="${prdList.prOpt}" />
																			</a>
																		</div>
																		<div class="rating-star">
																			<span class="spr-badge" data-rating="5.0"> 
																				<span class="spr-starrating spr-badge-starrating"> 
																					<i class="spr-icon spr-icon-star" style=""></i> 
																					<i class="spr-icon spr-icon-star" style=""></i> 
																					<i class="spr-icon spr-icon-star" style=""></i> 
																					<i class="spr-icon spr-icon-star" style=""></i> 
																					<i class="spr-icon spr-icon-star" style=""></i>
																				</span>
																				<span class="spr-badge-caption">1 review</span>
																			</span>
																		</div>
																		<div class="product-description">
																			<c:out value="${prdList.prDes2}" />
																		</div>
																	</div>
																	<div class="list-right">
																		<div class="product-price">
																			<span class="price_sale">
																				<span class="money">
																					<c:out value="${prdList.prPrc}" />원</span>
																				</span>
																		</div>
																		<div class="product-group-actions">
																			<form class="product-addtocart" action="./cart.do"
																				method="post">
																				<div class="effect-ajax-cart">
																					<input type="hidden" name="quantity" value="1">
																					<button class="btn add-to-cart"
																						data-parent=".parent-fly" type="submit" name="add">
																						<i class="fa fa-shopping-bag"></i>
																					</button>
																				</div>
																			</form>
																			<ul class="quickview-wishlist-wrapper">
																				<li class="product-wishlist wishlist">
																					<a class="wish-list" href="./wish-list.do">
																						<span class="hidden-xs"> 
																							<i class="fa fa-heart" title="Wishlist"></i>
																						</span>
																					</a>
																				</li>
																			</ul>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</c:forEach>
											</div>
										</div>
										<div class="collection-bottom-toolbar">
											<!-- 상품이 많은 경우 Page 나누는 부분 -->
											<div class="product-counter col-sm-6">해당 카테고리 이름 등록 상품
												: 16개</div>
											<div class="product-pagination col-sm-6">
												<div class="pagination_group">
													<ul class="pagination">
														<c:if test="${resMap.pageGroup > 1}">
															<li>
																<a style="border:0px" href="javascript:fnGoPaging(<c:out value='${resMap.fstPage}'/>)">«</a>
															</li>
															<li>
																<a style="border:0px" href="javascript:fnGoPaging(<c:out value='${resMap.prePage}'/>)">＜</a>
															</li>
														</c:if>
														<c:forEach var="i" begin="${resMap.startPage}"
															end="${resMap.endPage > resMap.total ? resMap.total : resMap.endPage}">
															<c:choose>
																<c:when test="${resMap.page eq i }">
																	<li class="active">
																		<a href="javascript:fnGoPaging(${i});">${i}</a>
																	</li>
																</c:when>
																<c:otherwise>
																	<li>
																		<a href="javascript:fnGoPaging(${i});">${i}</a>
																	</li>
																</c:otherwise>
															</c:choose>
														</c:forEach>
														<c:if test="${resMap.nextPage <= resMap.total}">
															<li>
																<a style="border:0px" href="javascript:fnGoPaging(<c:out value='${resMap.nextPage}'/>)">＞</a>
															</li>
															<li>
																<a style="border:0px" href="javascript:fnGoPaging(<c:out value='${resMap.total}'/>)">»</a>
															</li>
														</c:if>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<script type="text/javascript">
								/* Handle Grid - List */
								function handleGridList() {
									if ($('#goList').length) {
										$('#goList').on(clickEv, function(e) {
											$(this).parent().find('li').removeClass('active');
											$(this).addClass('active');
											$('.collection-items').addClass('full_width ListMode');
											$('.collection-items').removeClass('no_full_width GridMode');
											$('.collection-items .row-left').addClass('col-md-5');
											$('.collection-items .row-right').addClass('col-md-7');
											$('.collection-items .product-item').removeClass('col-sm-3 col-sm-4');
											$('.grid-mode').addClass("hide");
											$('.list-mode').removeClass("hide");
										});
									}
									if ($('#goGrid').length) {
										$('#goGrid').on(clickEv, function(e) {
											$(this).parent().find('li').removeClass('active');
											$(this).addClass('active');
											$('.collection-items').removeClass('full_width ListMode');
											$('.collection-items').addClass('no_full_width GridMode');
											$('.collection-items .row-left').removeClass('col-md-5');
											$('.collection-items .row-right').removeClass('col-md-7');
		
											$('.collection-items .product-item').addClass('col-sm-3');
		
											$('.grid-mode').removeClass("hide");
											$('.list-mode').addClass("hide");
										});
									}
								}
								$(document).ready(function() {
									if (location.search.search("sort_by=") == -1) {
		
									} else {
										if (location.search != "") {
											var stpo = location.search.search("sort_by=") + 8,
												sortby_url = '.' + location.search.substr(stpo).split('='),
												sortby_url_a = sortby_url + " a";
											$(sortby_url).addClass("active");
											$('#sortButton .name').do($(sortby_url_a).do());
										} else {
											$('.manual').addClass("active");
										}
									}
									handleGridList();
								});
							</script>
					</div>
				</div>
			</div>
		</div>
	</section>

	<div id="shopify-section-index-collection-product"
		class="shopify-section index-section index-section-colpro">
		<section class="collection-colpro">
			<div class="collection-colpro-wrapper">
				<div class="container">
					<div class="row">
						<div class="collection-colpro-inner">
							<div class="collection-colpro-content">
								<span class="colpro_title">많이 본 상품</span>
								<div class="colpro_content colpro_1_index-collection-product">
									<!-- 1번 -->
									<div class="content_product">
										<div class="row-container product list-unstyled clearfix">
											<div class="row-left">
												<!-- 많이 본 상품 : 1번 이미지 -->
												<a href="./product.do" class="hoverBorder container_item">
													<div class="hoverBorderWrapper">
														<img src="./assets/images/Food/DogFood/dogFood (2).png"
															class="not-rotation img-responsive front" alt="">
														<div class="mask"></div>
														<img src="./assets/images/Food/DogFood/dogFood (2).png"
															class="rotation img-responsive" alt="">
													</div>
												</a>
												<!-- 많이 본 상품 : 1번 세일 영역 -->
												<span class="sale_banner"> <span class="sale_text">18%</span>
												</span>
												<div class="hover-mask">
													<div class="group-mask">
														<div class="inner-mask">
															<div class="group-actionbutton">
																<form action="./cart.do" method="post">
																	<div class="effect-ajax-cart">
																		<input type="hidden" name="quantity" value="1">
																		<button class="btn add-to-cart"
																			data-parent=".parent-fly" type="submit" name="add">
																			<i class="fa fa-shopping-bag"></i>
																		</button>
																	</div>
																</form>
																<ul class="quickview-wishlist-wrapper">
																	<li class="wishlist hidden-xs"><a
																		class="wish-list" href="./wish-list.do"><span
																			class="hidden-xs"><i class="fa fa-heart"
																				title="Wishlist"></i></span></a></li>
																</ul>
															</div>
														</div>
														<!--inner-mask-->
													</div>
													<!--Group mask-->
												</div>
											</div>
											<div class="row-right animMix">
												<div class="product-title">
													<a class="title-5" href="./product.do">라일리스 오가닉 L 3개 +
														S 1개 (set)</a>
												</div>
												<div class="rating-star">
													<span class="spr-badge" data-rating="0.0"><span
														class="spr-starrating spr-badge-starrating"><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i></span><span
														class="spr-badge-caption">No reviews</span> </span>
												</div>
												<div class="product-price">
													<span class="price"> <span class="price_sale"><span
															class="money">32,000</span></span> <del class="price_compare">
															<span class="money">38,000</span>
														</del>
													</span>
												</div>
											</div>
										</div>
									</div>
									<!-- 2번 -->
									<div class="content_product">
										<div class="row-container product list-unstyled clearfix">
											<div class="row-left">
												<!-- 많이 본 상품 : 2번 이미지 -->
												<a href="./product.do" class="hoverBorder container_item">
													<div class="hoverBorderWrapper">
														<img src="./assets/images/Food/Snack/snack (7).png"
															class="not-rotation img-responsive front" alt="">
														<div class="mask"></div>
														<img src="./assets/images/Food/Snack/snack (7).png"
															class="rotation img-responsive" alt="">
													</div>
												</a>
												<!-- 많이 본 상품 : 2번 세일 영역 -->
												<!-- 
													<span class="sale_banner">
														<span class="sale_text">18%</span>
													</span>
													 -->
												<div class="hover-mask">
													<div class="group-mask">
														<div class="inner-mask">
															<div class="group-actionbutton">
																<form action="./cart.do" method="post">
																	<div class="effect-ajax-cart">
																		<input type="hidden" name="quantity" value="1">
																		<button class="btn add-to-cart"
																			data-parent=".parent-fly" type="submit" name="add">
																			<i class="fa fa-shopping-bag"></i>
																		</button>
																	</div>
																</form>
																<ul class="quickview-wishlist-wrapper">
																	<li class="wishlist hidden-xs"><a
																		class="wish-list" href="./wish-list.do"><span
																			class="hidden-xs"><i class="fa fa-heart"
																				title="Wishlist"></i></span></a></li>
																</ul>
															</div>
														</div>
														<!--inner-mask-->
													</div>
													<!--Group mask-->
												</div>
											</div>
											<div class="row-right animMix">
												<div class="product-title">
													<a class="title-5" href="./product.do">[아침애] 수제간식 오리떡갈비
														치즈 (80g)</a>
												</div>
												<div class="rating-star">
													<span class="spr-badge" data-rating="0.0"> <span
														class="spr-starrating spr-badge-starrating"> <i
															class="spr-icon spr-icon-star-empty" style=""></i> <i
															class="spr-icon spr-icon-star-empty" style=""></i> <i
															class="spr-icon spr-icon-star-empty" style=""></i> <i
															class="spr-icon spr-icon-star-empty" style=""></i> <i
															class="spr-icon spr-icon-star-empty" style=""></i>
													</span><span class="spr-badge-caption">No reviews</span>
													</span>
												</div>
												<div class="product-price">
													<span class="price"> <span class="money">5,400</span>
													</span>
												</div>
											</div>
										</div>
									</div>
									<!-- 3번 -->
									<div class="content_product">
										<div class="row-container product list-unstyled clearfix">
											<div class="row-left">
												<!-- 많이 본 상품 : 3번 이미지 -->
												<a href="./product.do" class="hoverBorder container_item">
													<div class="hoverBorderWrapper">
														<img src="./assets/images/Accessory/Wear/0229.png"
															class="not-rotation img-responsive front" alt="">
														<div class="mask"></div>
														<img src="./assets/images/Accessory/Wear/0229.png"
															class="rotation img-responsive" alt="">
													</div>
												</a>
												<!-- 많이 본 상품 : 3번 세일 영역 -->
												<!-- 
													<span class="sale_banner">
														<span class="sale_text">18%</span>
													</span>
													 -->
												<div class="hover-mask">
													<div class="group-mask">
														<div class="inner-mask">
															<div class="group-actionbutton">
																<form action="./cart.do" method="post">
																	<div class="effect-ajax-cart">
																		<input type="hidden" name="quantity" value="1">
																		<button class="btn add-to-cart"
																			data-parent=".parent-fly" type="submit" name="add">
																			<i class="fa fa-shopping-bag"></i>
																		</button>
																	</div>
																</form>
																<ul class="quickview-wishlist-wrapper">
																	<li class="wishlist hidden-xs"><a
																		class="wish-list" href="./wish-list.do"><span
																			class="hidden-xs"><i class="fa fa-heart"
																				title="Wishlist"></i></span></a></li>
																</ul>
															</div>
														</div>
														<!--inner-mask-->
													</div>
													<!--Group mask-->
												</div>
											</div>
											<div class="row-right animMix">
												<div class="product-title">
													<a class="title-5" href="./product.do">러블리 땡땡이 스카프
														(red)</a>
												</div>
												<div class="rating-star">
													<span class="spr-badge" data-rating="0.0"> <span
														class="spr-starrating spr-badge-starrating"> <i
															class="spr-icon spr-icon-star-empty" style=""></i> <i
															class="spr-icon spr-icon-star-empty" style=""></i> <i
															class="spr-icon spr-icon-star-empty" style=""></i> <i
															class="spr-icon spr-icon-star-empty" style=""></i> <i
															class="spr-icon spr-icon-star-empty" style=""></i>
													</span> <span class="spr-badge-caption">No reviews</span>
													</span>
												</div>
												<div class="product-price">
													<span class="price"> <span class="money">8,000</span>
													</span>
												</div>
											</div>
										</div>
									</div>
									<!-- 4번 -->
									<div class="content_product">
										<div class="row-container product list-unstyled clearfix">
											<div class="row-left">
												<!-- 많이 본 상품 : 4번 이미지 -->
												<a href="./product.do" class="hoverBorder container_item">
													<div class="hoverBorderWrapper">
														<img
															src="./assets/images/Living_Life/House/house (11).png"
															class="not-rotation img-responsive front" alt="">
														<div class="mask"></div>
														<img
															src="./assets/images/Living_Life/House/house (11).png"
															class="rotation img-responsive" alt="">
													</div>
												</a>
												<!-- 많이 본 상품 : 4번 세일 영역 -->
												<!-- 
													<span class="sale_banner">
														<span class="sale_text">18%</span>
													</span>
													 -->
												<div class="hover-mask">
													<div class="group-mask">
														<div class="inner-mask">
															<div class="group-actionbutton">
																<form action="./cart.do" method="post">
																	<div class="effect-ajax-cart">
																		<input type="hidden" name="quantity" value="1">
																		<button class="btn add-to-cart"
																			data-parent=".parent-fly" type="submit" name="add">
																			<i class="fa fa-shopping-bag"></i>
																		</button>
																	</div>
																</form>
																<ul class="quickview-wishlist-wrapper">
																	<li class="wishlist hidden-xs"><a
																		class="wish-list" href="./wish-list.do"><span
																			class="hidden-xs"><i class="fa fa-heart"
																				title="Wishlist"></i></span></a></li>
																</ul>
															</div>
														</div>
														<!--inner-mask-->
													</div>
													<!--Group mask-->
												</div>
											</div>
											<div class="row-right animMix">
												<div class="product-title">
													<a class="title-5" href="./product.do">도넛 마약 방석 L
														(pink)</a>
												</div>
												<div class="rating-star">
													<span class="spr-badge" data-rating="0.0"> <span
														class="spr-starrating spr-badge-starrating"> <i
															class="spr-icon spr-icon-star-empty" style=""></i> <i
															class="spr-icon spr-icon-star-empty" style=""></i> <i
															class="spr-icon spr-icon-star-empty" style=""></i> <i
															class="spr-icon spr-icon-star-empty" style=""></i> <i
															class="spr-icon spr-icon-star-empty" style=""></i>
													</span> <span class="spr-badge-caption">No reviews</span>
													</span>
												</div>
												<div class="product-price">
													<span class="price"> <span class="money">54,000</span>
													</span>
												</div>
											</div>
										</div>
									</div>
									<!-- 5번 -->
									<div class="content_product">
										<div class="row-container product list-unstyled clearfix">
											<div class="row-left">
												<!-- 많이 본 상품 : 5번 이미지 -->
												<a href="./product.do" class="hoverBorder container_item">
													<div class="hoverBorderWrapper">
														<img src="./assets/images/Care/Bath/bath (17).png"
															class="not-rotation img-responsive front"
															alt="Women's Accessories">
														<div class="mask"></div>
														<img src="./assets/images/Care/Bath/bath (17).png"
															class="rotation img-responsive" alt="Women's Accessories">
													</div>
												</a>
												<!-- 많이 본 상품 : 5번 세일 영역 -->
												<span class="sale_banner"> <span class="sale_text">10%</span>
												</span>
												<div class="hover-mask">
													<div class="group-mask">
														<div class="inner-mask">
															<div class="group-actionbutton">
																<form action="./cart.do" method="post">
																	<div class="effect-ajax-cart">
																		<input type="hidden" name="quantity" value="1">
																		<button class="btn add-to-cart"
																			data-parent=".parent-fly" type="submit" name="add">
																			<i class="fa fa-shopping-bag"></i>
																		</button>
																	</div>
																</form>
																<ul class="quickview-wishlist-wrapper">
																	<li class="wishlist hidden-xs"><a
																		class="wish-list" href="./wish-list.do"><span
																			class="hidden-xs"><i class="fa fa-heart"
																				title="Wishlist"></i></span></a></li>
																</ul>
															</div>
														</div>
														<!--inner-mask-->
													</div>
													<!--Group mask-->
												</div>
											</div>
											<div class="row-right animMix">
												<div class="product-title">
													<a class="title-5" href="./product.do">스파 소다 라벤더향 (3
														Sets)</a>
												</div>
												<div class="rating-star">
													<span class="spr-badge" data-rating="0.0"><span
														class="spr-starrating spr-badge-starrating"><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i></span><span
														class="spr-badge-caption">No reviews</span> </span>
												</div>
												<div class="product-price">
													<span class="price"> <span class="price_sale"><span
															class="money">52,800</span></span> <del class="price_compare">
															<span class="money">58,000</span>
														</del>
													</span>
												</div>
											</div>
										</div>
									</div>
									<!-- 6번 -->
									<div class="content_product">
										<div class="row-container product list-unstyled clearfix">
											<div class="row-left">
												<!-- 많이 본 상품 : 6번 이미지 -->
												<a href="./product.do" class="hoverBorder container_item">
													<div class="hoverBorderWrapper">
														<img src="./assets/images/Accessory/Lead/0124.png"
															class="not-rotation img-responsive front"
															alt="Women's Accessories">
														<div class="mask"></div>
														<img src="./assets/images/Accessory/Lead/0124.png"
															class="rotation img-responsive" alt="Women's Accessories">
													</div>
												</a>
												<!-- 많이 본 상품 : 6번 세일 영역 -->
												<span class="sale_banner"> <span class="sale_text">30%</span>
												</span>
												<div class="hover-mask">
													<div class="group-mask">
														<div class="inner-mask">
															<div class="group-actionbutton">
																<form action="./cart.do" method="post">
																	<div class="effect-ajax-cart">
																		<input type="hidden" name="quantity" value="1">
																		<button class="btn add-to-cart"
																			data-parent=".parent-fly" type="submit" name="add">
																			<i class="fa fa-shopping-bag"></i>
																		</button>
																	</div>
																</form>
																<ul class="quickview-wishlist-wrapper">
																	<li class="wishlist hidden-xs"><a
																		class="wish-list" href="./wish-list.do"><span
																			class="hidden-xs"><i class="fa fa-heart"
																				title="Wishlist"></i></span></a></li>
																</ul>
															</div>
														</div>
														<!--inner-mask-->
													</div>
													<!--Group mask-->
												</div>
											</div>
											<div class="row-right animMix">
												<div class="product-title">
													<a class="title-5" href="./product.do">펫블리 럭셔리 발바닥 이름표</a>
												</div>
												<div class="rating-star">
													<span class="spr-badge" data-rating="0.0"><span
														class="spr-starrating spr-badge-starrating"><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i></span><span
														class="spr-badge-caption">No reviews</span> </span>
												</div>
												<div class="product-price">
													<span class="price"> <span class="price_sale"><span
															class="money">8,330</span></span> <del class="price_compare">
															<span class="money">11,900</span>
														</del>
													</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="collection-colpro-content">
								<span class="colpro_title">다른 고객이 함께 본 상품</span>
								<div class="colpro_content colpro_1_index-collection-product">
									<!-- 1번 -->
									<div class="content_product">
										<div class="row-container product list-unstyled clearfix">
											<div class="row-left">
												<!-- 1번 이미지 -->
												<a href="./product.do" class="hoverBorder container_item">
													<div class="hoverBorderWrapper">
														<img src="./assets/images/bathing/bathing_17.png"
															class="not-rotation img-responsive front" alt="">
														<div class="mask"></div>
														<img src="./assets/images/bathing/bathing_17.png"
															class="rotation img-responsive" alt="">
													</div>
												</a>
												<!-- 1번 이미지 세일 영역-->
												<!-- 
													<span class="sale_banner">
														<span class="sale_text"></span>
													</span>
													 -->
												<div class="hover-mask">
													<div class="group-mask">
														<div class="inner-mask">
															<div class="group-actionbutton">
																<form action="./cart.do" method="post">
																	<div class="effect-ajax-cart">
																		<input type="hidden" name="quantity" value="1">
																		<button class="btn add-to-cart"
																			data-parent=".parent-fly" type="submit" name="add">
																			<i class="fa fa-shopping-bag"></i>
																		</button>
																	</div>
																</form>
																<ul class="quickview-wishlist-wrapper">
																	<li class="wishlist hidden-xs"><a
																		class="wish-list" href="./wish-list.do"><span
																			class="hidden-xs"><i class="fa fa-heart"
																				title="Wishlist"></i></span></a></li>
																</ul>
															</div>
														</div>
														<!--inner-mask-->
													</div>
													<!--Group mask-->
												</div>
											</div>
											<div class="row-right animMix">
												<div class="product-title">
													<a class="title-5" href="./product.do">크라운로얄 딥클린징 샴푸
														236ml</a>
												</div>
												<div class="rating-star">
													<span class="spr-badge" data-rating="0.0"> <span
														class="spr-starrating spr-badge-starrating"> <i
															class="spr-icon spr-icon-star-empty" style=""></i> <i
															class="spr-icon spr-icon-star-empty" style=""></i> <i
															class="spr-icon spr-icon-star-empty" style=""></i> <i
															class="spr-icon spr-icon-star-empty" style=""></i> <i
															class="spr-icon spr-icon-star-empty" style=""></i>
													</span> <span class="spr-badge-caption">No reviews</span>
													</span>
												</div>
												<div class="product-price">
													<span class="price_sale"><span class="money">35,000</span></span>
													<!-- 세일 시 원가격 -->
													<!-- <del class="price_compare"> <span class="money" data-currency-usd="$600.00" data-currency="USD">$600.00</span></del> -->
												</div>
											</div>
										</div>
									</div>
									<!-- 2번 -->
									<div class="content_product">
										<div class="row-container product list-unstyled clearfix">
											<div class="row-left">
												<!-- 2번 이미지 -->
												<a href="./product.do" class="hoverBorder container_item">
													<div class="hoverBorderWrapper">
														<img src="./assets/images/bathing/bathing_18.png"
															class="not-rotation img-responsive front" alt="">
														<div class="mask"></div>
														<img src="./assets/images/bathing/bathing_18.png"
															class="rotation img-responsive" alt="">
													</div>
												</a>
												<!-- 2번 이미지 세일 영역-->
												<!-- 
													<span class="sale_banner">
														<span class="sale_text"></span>
													</span>
													 -->
												<div class="hover-mask">
													<div class="group-mask">
														<div class="inner-mask">
															<div class="group-actionbutton">
																<form action="./cart.do" method="post">
																	<div class="effect-ajax-cart">
																		<input type="hidden" name="quantity" value="1">
																		<button class="btn add-to-cart"
																			data-parent=".parent-fly" type="submit" name="add">
																			<i class="fa fa-shopping-bag"></i>
																		</button>
																	</div>
																</form>
																<ul class="quickview-wishlist-wrapper">
																	<li class="wishlist hidden-xs"><a
																		class="wish-list" href="./wish-list.do"><span
																			class="hidden-xs"><i class="fa fa-heart"
																				title="Wishlist"></i></span></a></li>
																</ul>
															</div>
														</div>
														<!--inner-mask-->
													</div>
													<!--Group mask-->
												</div>
											</div>
											<div class="row-right animMix">
												<div class="product-title">
													<a class="title-5" href="./product.do">크라운로얄 바이오바이트 OB
														샴푸 고농축원액 #1</a>
												</div>
												<div class="rating-star">
													<span class="spr-badge" data-rating="0.0"><span
														class="spr-starrating spr-badge-starrating"><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i></span><span
														class="spr-badge-caption">No reviews</span> </span>
												</div>
												<div class="product-price">
													<span class="price_sale"><span class="money">35,000</span></span>
													<!-- 세일 시 원가격 -->
													<!-- <del class="price_compare"> <span class="money" data-currency-usd="$600.00" data-currency="USD">$600.00</span></del> -->
												</div>
											</div>
										</div>
									</div>
									<!-- 3번 -->
									<div class="content_product">
										<div class="row-container product list-unstyled clearfix">
											<div class="row-left">
												<!-- 3번 이미지 -->
												<a href="./product.do" class="hoverBorder container_item">
													<div class="hoverBorderWrapper">
														<img src="./assets/images/bathing/bathing_19.png"
															class="not-rotation img-responsive front" alt="">
														<div class="mask"></div>
														<img src="./assets/images/bathing/bathing_19.png"
															class="rotation img-responsive" alt="">
													</div>
												</a>
												<!-- 3번 이미지 세일 영역-->
												<!-- 
													<span class="sale_banner">
														<span class="sale_text"></span>
													</span>
													 -->
												<div class="hover-mask">
													<div class="group-mask">
														<div class="inner-mask">
															<div class="group-actionbutton">
																<form action="./cart.do" method="post">
																	<div class="effect-ajax-cart">
																		<input type="hidden" name="quantity" value="1">
																		<button class="btn add-to-cart"
																			data-parent=".parent-fly" type="submit" name="add">
																			<i class="fa fa-shopping-bag"></i>
																		</button>
																	</div>
																</form>
																<ul class="quickview-wishlist-wrapper">
																	<li class="wishlist hidden-xs">
																		<a class="wish-list" href="./wish-list.do">
																			<span class="hidden-xs">
																				<i class="fa fa-heart" title="Wishlist"></i>
																			</span>
																		</a>
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
												<div class="product-title">
													<a class="title-5" href="./product.do">크라운로얄 바이오바이트 OB
														샴푸 저농축원액 #1 236ml</a>
												</div>
												<div class="rating-star">
													<span class="spr-badge" data-rating="0.0"><span
														class="spr-starrating spr-badge-starrating"><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i></span><span
														class="spr-badge-caption">No reviews</span> </span>
												</div>
												<div class="product-price">
													<span class="price_sale"><span class="money">35,000</span></span>
													<!-- 세일 시 원가격 -->
													<!-- <del class="price_compare"> <span class="money" data-currency-usd="$600.00" data-currency="USD">$600.00</span></del> -->
												</div>
											</div>
										</div>
									</div>
									<!-- 4번 -->
									<div class="content_product">
										<div class="row-container product list-unstyled clearfix">
											<div class="row-left">
												<!-- 4번 이미지 -->
												<a href="./product.do" class="hoverBorder container_item">
													<div class="hoverBorderWrapper">
														<img src="./assets/images/bathing/bathing_20.png"
															class="not-rotation img-responsive front" alt="">
														<div class="mask"></div>
														<img src="./assets/images/bathing/bathing_20.png"
															class="rotation img-responsive" alt="">
													</div>
												</a>
												<!-- 4번 이미지 세일 영역-->
												<!-- 
													<span class="sale_banner">
														<span class="sale_text"></span>
													</span>
													 -->
												<div class="hover-mask">
													<div class="group-mask">
														<div class="inner-mask">
															<div class="group-actionbutton">
																<form action="./cart.do" method="post">
																	<div class="effect-ajax-cart">
																		<input type="hidden" name="quantity" value="1">
																		<button class="btn add-to-cart"
																			data-parent=".parent-fly" type="submit" name="add">
																			<i class="fa fa-shopping-bag"></i>
																		</button>
																	</div>
																</form>
																<ul class="quickview-wishlist-wrapper">
																	<li class="wishlist hidden-xs"><a
																		class="wish-list" href="./wish-list.do"><span
																			class="hidden-xs"><i class="fa fa-heart"
																				title="Wishlist"></i></span></a></li>
																</ul>
															</div>
														</div>
														<!--inner-mask-->
													</div>
													<!--Group mask-->
												</div>
											</div>
											<div class="row-right animMix">
												<div class="product-title">
													<a class="title-5" href="./product.do">하이포닉 백모용 샴푸
														500ml</a>
												</div>
												<div class="rating-star">
													<span class="spr-badge" data-rating="0.0"><span
														class="spr-starrating spr-badge-starrating"><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i></span><span
														class="spr-badge-caption">No reviews</span> </span>
												</div>
												<div class="product-price">
													<span class="price_sale"><span class="money">35,000</span></span>
													<!-- 세일 시 원가격 -->
													<!-- <del class="price_compare"> <span class="money" data-currency-usd="$600.00" data-currency="USD">$600.00</span></del> -->
												</div>
											</div>
										</div>
									</div>
									<!-- 5번 -->
									<div class="content_product">
										<div class="row-container product list-unstyled clearfix">
											<div class="row-left">
												<!-- 5번 이미지 -->
												<a href="./product.do" class="hoverBorder container_item">
													<div class="hoverBorderWrapper">
														<img src="./assets/images/bathing/bathing_21.png"
															class="not-rotation img-responsive front" alt="">
														<div class="mask"></div>
														<img src="./assets/images/bathing/bathing_21.png"
															class="rotation img-responsive" alt="">
													</div>
												</a>
												<!-- 5번 이미지 세일 영역-->
												<!-- 
													<span class="sale_banner">
														<span class="sale_text"></span>
													</span>
													 -->
												<div class="hover-mask">
													<div class="group-mask">
														<div class="inner-mask">
															<div class="group-actionbutton">
																<form action="./cart.do" method="post">
																	<div class="effect-ajax-cart">
																		<input type="hidden" name="quantity" value="1">
																		<button class="btn add-to-cart"
																			data-parent=".parent-fly" type="submit" name="add">
																			<i class="fa fa-shopping-bag"></i>
																		</button>
																	</div>
																</form>
																<ul class="quickview-wishlist-wrapper">
																	<li class="wishlist hidden-xs"><a
																		class="wish-list" href="./wish-list.do"><span
																			class="hidden-xs"><i class="fa fa-heart"
																				title="Wishlist"></i></span></a></li>
																</ul>
															</div>
														</div>
														<!--inner-mask-->
													</div>
													<!--Group mask-->
												</div>
											</div>
											<div class="row-right animMix">
												<div class="product-title">
													<a class="title-5" href="./product.do">하이포닉 자견용 샴푸
														500ml</a>
												</div>
												<div class="rating-star">
													<span class="spr-badge" data-rating="0.0"><span
														class="spr-starrating spr-badge-starrating"><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i></span><span
														class="spr-badge-caption">No reviews</span> </span>
												</div>
												<div class="product-price">
													<span class="price_sale"><span class="money">35,000</span></span>
													<!-- 세일 시 원가격 -->
													<!-- <del class="price_compare"> <span class="money" data-currency-usd="$600.00" data-currency="USD">$600.00</span></del> -->
												</div>
											</div>
										</div>
									</div>
									<!-- 6번 -->
									<div class="content_product">
										<div class="row-container product list-unstyled clearfix">
											<div class="row-left">
												<!-- 6번 이미지 -->
												<a href="./product.do" class="hoverBorder container_item">
													<div class="hoverBorderWrapper">
														<img src="./assets/images/bathing/bathing_22.png"
															class="not-rotation img-responsive front" alt="">
														<div class="mask"></div>
														<img src="./assets/images/bathing/bathing_22.png"
															class="rotation img-responsive" alt="">
													</div>
												</a>
												<!-- 6번 이미지 세일 영역-->
												<!-- 
													<span class="sale_banner">
														<span class="sale_text"></span>
													</span>
													 -->
												<div class="hover-mask">
													<div class="group-mask">
														<div class="inner-mask">
															<div class="group-actionbutton">
																<form action="./cart.do" method="post">
																	<div class="effect-ajax-cart">
																		<input type="hidden" name="quantity" value="1">
																		<button class="btn add-to-cart"
																			data-parent=".parent-fly" type="submit" name="add">
																			<i class="fa fa-shopping-bag"></i>
																		</button>
																	</div>
																</form>
																<ul class="quickview-wishlist-wrapper">
																	<li class="wishlist hidden-xs"><a
																		class="wish-list" href="./wish-list.do"><span
																			class="hidden-xs"><i class="fa fa-heart"
																				title="Wishlist"></i></span></a></li>
																</ul>
															</div>
														</div>
														<!--inner-mask-->
													</div>
													<!--Group mask-->
												</div>
											</div>
											<div class="row-right animMix">
												<div class="product-title">
													<a class="title-5" href="./product.do">하이포닉 전견용 샴푸
														500ml</a>
												</div>
												<div class="rating-star">
													<span class="spr-badge" data-rating="0.0"><span
														class="spr-starrating spr-badge-starrating"><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i><i
															class="spr-icon spr-icon-star-empty" style=""></i></span><span
														class="spr-badge-caption">No reviews</span> </span>
												</div>
												<div class="product-price">
													<span class="price_sale"><span class="money">35,000</span></span>
													<!-- 세일 시 원가격 -->
													<!-- <del class="price_compare"> <span class="money" data-currency-usd="$600.00" data-currency="USD">$600.00</span></del> -->
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
	</main>
</div>