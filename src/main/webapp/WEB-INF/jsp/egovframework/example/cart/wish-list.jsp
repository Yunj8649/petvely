<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- Main Content -->
	<div class="page-container" id="PageContainer">
		<main class="main-content" id="MainContent" role="main">
			<section class="collection-heading heading-content ">
				<div class="container">
					<div class="row">
						<div class="collection-wrapper">
							<h1 class="collection-title"><span>위시리스트</span></h1>
							<div class="breadcrumb-group">
								<div class="breadcrumb clearfix">
									<span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="./main.do" title="Bridal 1" itemprop="url"><span itemprop="title">Home</span></a>
									</span>
									<span class="arrow-space">></span>
									<span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb">
										<a href="./wish-list.do" title="Wish list" itemprop="url"><span itemprop="title">위시리스트</span></a>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<div id="wish-list">
				<div class="container">
					<div class="row">
						<div id="col-main" class="clearfix">
							<div class="page">
								<div class="table-cart">
									<div class="wrap-table">
										<table class="cart-items haft-border">
											<thead>
												<tr class="top-labels">
													<th class="text-left">상품</th>
													<th>가격</th>
													<th>삭제</th>
													<th>주문</th>
												</tr>
											</thead>
											<tbody>
												<tr class="item wishlist-item">
													<td class="title text-left">
														<ul class="list-inline">
															<li class="image">
																<a class="image text-left" href="./beauty3.do">
																	<img src="./assets/images/Care/Beauty/beauty (3).png" alt="Electronic equipment">
																</a>
															</li>
															<li class="link">
																<a class="title text-left" href="./beauty3.do">[인파로] 애완동물 이발기 HC05</a>
															</li>
														</ul>
													</td>
													<td class="price title-1">
														<span class="money" >16,800원</span>
													</td>
													<td class="remove">
														<div>
															<div class="product-remove">
																<a title="Remove" class="color-red icon icon-clear" href="#">
																	<i class="fa fa-close"></i>
																</a>
															</div>
														</div>
													</td>
													<td class="button">
														<form action="./product.do" method="post">
															<input type="hidden" name="quantity" value="1">
															<button class="btn btn-1 select-option" type="button" onclick="window.location='./beauty3.do';">Options</button>
														</form>
													</td>
												</tr>
												<tr class="item wishlist-item">
													<td class="title text-left">
														<ul class="list-inline">
															<li class="image">
																<a class="image text-left" href="./feed_03.do"><img src="./assets/images/feed/feed_03.png" alt="Electronic equipment"></a>
															</li>
															<li class="link">
																<a class="title text-left" href="./feed_03.do">스텐식기 8oz SS</a>
															</li>
														</ul>
													</td>
													<td class="price title-1">
														<span class="money">1,800원</span>
													</td>
													<td class="remove">
														<div>
															<div class="product-remove">
																<a title="Remove" class="color-red icon icon-clear" href="#">
																	<i class="fa fa-close"></i>
																</a>
															</div>
														</div>
													</td>
													<td class="button">
														<form action="./cart.do" method="post">
															<input type="hidden" name="quantity" value="1">
															<button class="btn btn-1 select-option" type="button" onclick="window.location='./feed_03.do';">Options</button>
														</form>
													</td>
												</tr>
												<tr class="item wishlist-item">
													<td class="title text-left">
														<ul class="list-inline">
															<li class="image">
																<a class="image text-left" href="./walk_03.do"><img src="./assets/images/walk/walk_03.png" alt="Electronic equipment"></a>
															</li>
															<li class="link">
																<a class="title text-left" href="./walk_03.do">닥터펫 패션 이동가방 핑크</a>
															</li>
														</ul>
													</td>
													<td class="price title-1" >
														<span class="money">1,900원</span>
													</td>
													<td class="remove">
														<div>
															<div class="product-remove">
																<a title="Remove" class="color-red icon icon-clear" href="#">
																	<i class="fa fa-close"></i>
																</a>
															</div>
														</div>
													</td>
													<td class="button">
														<form action="./cart.do" method="post">
															<input type="hidden" name="quantity" value="1">
															<button class="btn btn-1 select-option" type="button" onclick="window.location='./walk_03.do';">Options</button>
														</form>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<p>You must <a href="./login.do">Sign In</a> or <a href="./register.do">Register</a>.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>
	
