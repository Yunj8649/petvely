<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script>
	$(document).ready(function() {

	})
</script>
<body>
	<div class="page-container" id="PageContainer">
		<main class="main-content" id="MainContent" role="main">
		<section class="collection-heading heading-content ">
			<div class="container">
				<div class="row">
					<div class="collection-wrapper">
						<h1 class="collection-title">
							<span>ID/비번찾기</span>
						</h1>
						<div class="breadcrumb-group">
							<div class="breadcrumb clearfix">
								<span itemscope=""
									itemtype="http://data-vocabulary.org/Breadcrumb"> <a
									href="./main.do" title="Bridal 1" itemprop="url"> <span
										itemprop="title">Home</span>
								</a>
								</span> </span> <span class="arrow-space">/</span> <span itemscope=""
									itemtype="http://data-vocabulary.org/Breadcrumb"> <a
									href="./login.do" title="Login" itemprop="url"> <span
										itemprop="title">Login</span>
								</a>
								</span>
							</div>
						</div>
					</div>
				</div>


			</div>
		</section>

		<!-- 아이디 찾기 탭  	-->
		<div class="findid" id="tab_0" style="width: 100%; display: block;">
			<section class="register-content">
				<div class="register-wrapper">
					<div class="container">
						<div class="row">
							<div class="register-inner">
								<div id="customer-register">
									<div id="register" class="">
										<form name="find_ID" id="find_ID" accept-charset="UTF-8">
											아이디는
												<c:out value="${ID}" />
											입니다.
										</form>
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
</body>