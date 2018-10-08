<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Main Content -->
<div class="page-container" id="PageContainer">
	<main class="main-content" id="MainContent" role="main">
	<section class="collection-heading heading-content ">
		<div class="container">
			<div class="row">
				<div class="collection-wrapper">
					<h1 class="collection-title">
						<span>My Page</span>
					</h1>
					<div class="breadcrumb-group">
						<div class="breadcrumb clearfix">
							<span itemscope=""
								itemtype="http://data-vocabulary.org/Breadcrumb"> <a
								href="./main.do" title="Bridal 1" itemprop="url"> <span
									itemprop="title">Home</span>
							</a>
							</span> <span class="arrow-space">/</span> <span itemscope=""
								itemtype="http://data-vocabulary.org/Breadcrumb"> <a
								href="./myPage.do" title="Logout" itemprop="url"> <span
									itemprop="title">My Page</span>
							</a>
							</span>
							</span> <span class="arrow-space">/</span> <span itemscope=""
								itemtype="http://data-vocabulary.org/Breadcrumb"> <a
								href="./logout.do" title="Logout" itemprop="url"> <span
									itemprop="title">Logout</span>
							</a>
							</span>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="collection-wrapper">
					<div class="col-md-12">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#mypage_tab1"
								onclick="ShowTabex('0')" data-toggle="tab">혜택관리</a></li>
							<li class=""><a href="#mypage_tab2" onclick="ShowTabex('1')"
								data-toggle="tab">주문 리스트</a></li>
							<li class=""><a href="#mypage_tab3" onclick="ShowTabex('2')"
								data-toggle="tab">일대일문의</a></li>
							<li class=""><a href="#mypage_tab4" onclick="ShowTabex('3')"
								data-toggle="tab">회원정보변경 및 탈퇴</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>


	<div style="text-align: left;">
		<div id="tab_0" style="width: 100%; display: block;">
			<jsp:include page="/WEB-INF/jsp/egovframework/example/mypage/benefitinfo.jsp">
				<jsp:param name="paramHanq" value="두큐" />
			</jsp:include>
		</div>
		<div id="tab_1" style="width: 100%; display: none;">
			<jsp:include page="/WEB-INF/jsp/egovframework/example/mypage/orderlist.jsp">
				<jsp:param name="paramHanq" value="두큐" />
			</jsp:include>
		</div>
		<div id="tab_2" style="width: 100%; display: none;">
			<jsp:include page="/WEB-INF/jsp/egovframework/example/mypage/onetooneask.jsp">
				<jsp:param name="paramHanq" value="두큐" />
			</jsp:include>
		</div>
		<div id="tab_3" style="width: 100%; display: none;">
			<jsp:include page="/WEB-INF/jsp/egovframework/example/mypage/userinfochange.jsp">
				<jsp:param name="paramHanq" value="두큐" />
			</jsp:include>
		</div>
	</div>
	</main>
</div>

<script type="text/javascript">
	function ShowTabex(val) {
		for (i = 0; i < 4; i++) {
			var tb = document.getElementById('tab_' + i);
			if (i != val)
				tb.style.display = "none";
			else
				tb.style.display = "block";
		}
	}
</script>
