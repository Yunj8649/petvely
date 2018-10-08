<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- @김병직 171207 고객센터
	tab 부분은 성철형의 MyPage 참고
	사용 css 파일명 : helpdesk.css
 -->
<div class="page-container" id="PageContainer">
	<main class="main-content" id="MainContent" role="main">
	<section class="collection-heading heading-content ">
		<div class="container">
			<div class="row">
				<div class="collection-wrapper">
					<h1 class="collection-title">
						<span>고객센터</span>
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
								onclick="ShowTabex('0')" data-toggle="tab">Q&amp;A</a></li>
							<li class=""><a href="#mypage_tab2" onclick="ShowTabex('1')"
								data-toggle="tab">일대일문의</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>


	<div style="text-align: left;">
		<div id="tab_0" style="width: 100%; display: block;"> 
			<jsp:include page="/WEB-INF/jsp/egovframework/example/helpdesk/faqs.jsp">
				<jsp:param name="" value="" />              	
			</jsp:include>		
		</div>
		<div id="tab_1" style="width: 100%; display: none;">
			<jsp:include page="/WEB-INF/jsp/egovframework/example/helpdesk/oneonehelp.jsp">
				<jsp:param name="" value="" />              	
			</jsp:include>	
		</div>
		<!-- 이부분은 탭메뉴에는 없음, 글쓰기 페이지용 -->
		<div id="tab_2" style="width: 100%; display: none;">
			<jsp:include page="/WEB-INF/jsp/egovframework/example/helpdesk/helpBoardWrite.jsp">
				<jsp:param name="" value="" />              	
			</jsp:include>	
		</div>
		<div id="tab_3" style="width: 100%; display: none;">
			<jsp:include page="/WEB-INF/jsp/egovframework/example/helpdesk/helpBoardDetail.jsp">
				<jsp:param name="" value="" />              	
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
