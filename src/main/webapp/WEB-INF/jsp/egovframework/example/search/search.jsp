<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Main Content -->

<script>
	function fnGoPaging(page){
		   
	   var $pagingFrm = $("#pagingFrm");
	   
	   $("#page").val(page);
	   
	   $pagingFrm.attr("action", "search.do");
	   $pagingFrm.attr("method", "get");
	
	   $pagingFrm.submit();
	}
	

</script>
<div class="page-container" id="PageContainer">
	<main class="main-content" id="MainContent" role="main">
	<section class="collection-heading heading-content ">
		<div class="container">
			<div class="row">
				<div class="collection-wrapper">
					<h1 class="collection-title">
						<span>검색 결과</span>
					</h1>
					<div class="breadcrumb-group">
						<div class="breadcrumb clearfix">
							<span itemscope=""
								itemtype="http://data-vocabulary.org/Breadcrumb"><a
								href="./main.do" title="Bridal 1" itemprop="url"><span
									itemprop="title">Home</span></a> </span> <span class="arrow-space">></span>
							<span itemscope=""
								itemtype="http://data-vocabulary.org/Breadcrumb"> <a
								href="./search.do"> <span itemprop="title"><c:out value="${searchPageVO.keyword }" /></span>
							</a>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="search-content">
		<div class="search-content-wrapper">
			<div class="container">
				<div class="row">
					<div class="search-content-group">
						<div class="search-content-inner">

							<div id="search">
								<c:forEach items="${prodList }" var="prodList"
									varStatus="status">
									<!-- Begin results -->
									<div class="product-item-wrapper col-sm-3">
										<div class="row-container product list-unstyled clearfix">
											<div class="row-left">
												<a href="./product.html" class="hoverBorder container_item">
													<div class="hoverBorderWrapper">
														<img src="${prodList.prImg1 }"
															class="not-rotation img-responsive front"
															alt="Electronic equipment">
														<div class="mask"></div>
														<img src="${prodList.prImg1 }"
															class="rotation img-responsive"
															alt="Electronic equipment">
													</div>
												</a>
												<div class="hover-mask">
													<div class="group-mask">
														<div class="inner-mask">
															<div class="group-actionbutton">
																<form action="./product.html" method="post">
																	<div class="effect-ajax-cart">
																		<input type="hidden" name="quantity" value="1">
																		<button class="btn select-option" type="button"
																			onclick="window.location='./product.html';">
																			<i class="fa fa-bars"></i>
																		</button>
																	</div>
																</form>
																<ul class="quickview-wishlist-wrapper">
																	<li class="quickview hidden-xs hidden-sm">
																		<div class="product-ajax-cart">
																			<span class="overlay_mask"></span>
																			<div data-handle="navy-peak-dresses-2"
																				data-target="#quick-shop-modal" class="quick_shop"
																				data-toggle="modal">
																				<a class=""><i class="fa fa-search"
																					title="Quick View"></i></a>
																			</div>
																		</div>
																	</li>
																	<li class="wishlist hidden-xs"><a
																		class="wish-list" data-toggle="modal"
																		data-target="#modalNeedToWishlist"> <span
																			class="hidden-xs"><i class="fa fa-heart"
																				title="Wishlist"></i></span>
																	</a></li>
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
													<a class="title-5" href="./product.html"><c:out value= "${prodList.prNm}"/></a>
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
													<span class="price_sale"><span class="money"
														data-currency-usd="$110.00">${prodList.prPrc } 원</span></span>
												</div>
											</div>
										</div>
									</div>
									<!-- forEach 문 종료 -->
								</c:forEach>
								<div class="collection-bottom-toolbar">
								<div class="product-counter col-sm-6"></div>
									<div class="product-pagination col-sm-6">
										<div class="pagination_group">
											<ul class="pagination">
												<c:if test="${prePage > 1 }" >
													<li>
														<a href="javascript:fnGoPaging(${prePage});">이전페이지</a>
													</li>	
												</c:if>
												
												<!-- /#search -->
												<c:forEach var="i" begin="${startPage}"	end="${endPage > totalPage ? totalPage : endPage }">
													
													<c:choose>
														<c:when test="${searchPageVO.page eq i }">
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
												
												<c:if test="${nextPage <= totalPage }" >
													<li>
														<a href="javascript:fnGoPaging(${nextPage});">다음페이지</a>
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
			</div>
		</div>
	<form id="pagingFrm" name="pagingFrm">
					<input type="hidden" id="page" name="page">
					<input type="hidden" id="keyword" name="keyword" value="${searchPageVO.keyword }"/>
	</form>
	</section>
	</main>
</div>
