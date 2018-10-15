<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- @김병직 171207 고객센터 내 1:1게시판 글쓰기 페이지
	사용 css 파일명 : helpdesk.css
 --> 
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
		<div class="container">
	    <table class="table table-bordered">
	        <thead>
	            <caption> 글쓰기 </caption>
	       	</thead>
	        <tbody>
	            <form action="" method="post" encType="multiplart/form-data">
	                <tr>
	                    <th>제목</th>
	                    <td><input type="text" placeholder="제목" name="subject" class="form-control"/></td>
	                </tr>
	                <tr>
	                    <th>내용</th>
	                    <td><textarea cols="10" placeholder="내용" name="content" class="form-control"></textarea></td>
	                </tr>
	                <tr>
	                    <th>첨부파일</th>
	                    <td><input type="file" placeholder="파일을 선택" name="filename" class="form-control"/></td>
	                </tr>
	                <tr>
				        <th>비밀번호</th>
	                    <td><input type="password" placeholder="비밀번호" class="form-control help-board-passwd"/></td>
	                </tr>
	                <tr>
	                    <td colspan="2">
	                        <input type="button" value="등록" />
	                        <input type="button" value="수정" />
	                        <a class="btn btn-default pull-right" href="./customReview.do"> 목록 </a>
	                    </td>
	                </tr>
				</form>
	        </tbody>
	    </table>
	    </div>
	</main>
  </div>
