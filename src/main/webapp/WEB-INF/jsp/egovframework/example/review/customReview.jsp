<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- Main Content -->
	<div class="page-container" id="PageContainer">
		<main class="main-content" id="MainContent" role="main">
			<section class="collection-heading heading-content ">
				<div class="container">
					<div class="row">
						<div class="collection-wrapper">
							<h1 class="collection-title"><span>고객후기모음</span></h1>
							<div class="breadcrumb-group">
								<div class="breadcrumb clearfix">
									<span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="./main.do" title="Bridal 1" itemprop="url"><span itemprop="title">Home</span></a>
									</span>
									<span class="arrow-space">></span>
									<span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb">
										<a href="./customReview.do" title="review" itemprop="url"><span itemprop="title">고객후기모음</span></a>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<div id="notice">
				<div class="container">
				<table class="review" cellpadding="0" cellspacing="0" border="0">
					<thead>
						<tr>
							<th class="boardNo">번호</th>
							<th class="boardTitle">제목</th>
							<th class="boardWriter">작성자</th>
							<th class="boardDate">날짜</th>
							<th class="boardCount">조회수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td> 3 </td>
							<td><a href="./customReview1.do"> 역시 믿고 사는 펫블리 ^^7</a></td>
							<td>병지깅</td>
							<td>2017.12.25</td>
							<td>999</td>
						</tr>
						<tr>
							<td> 2</td>
							<td><a href="./customReview1.do"> 울 강쥐한테는 너무 꽉 껴요ㅠㅠ </a></td>
							<td>지혀닝</td>
							<td>2017.05.03</td>
							<td>999</td>
						</tr>
						<tr>
							<td> 1 </td>
							<td><a href="./customReview1.do"> 울강쥐가 너무 좋아하네요  </a></td>
							<td>효지닝</td>
							<td>2017.02.02</td>
							<td>9999</td>
						</tr>
					</tbody>
				</table>
				
				<a class="btn btn-default pull-right" href="./writeCustomReview.do">글쓰기</a>
					
				<div class="text-center">
					<ul class="pagination">
						<li><a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a
							href="#">4</a> <a href="#">5</a></li>
					</ul>
				</div>
			</div>
		</div>
	</main>
</div>