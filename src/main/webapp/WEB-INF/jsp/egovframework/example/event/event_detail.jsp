<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
$(document).ready(function () {
	$("#event_detail_ctt").html('<c:out value='${eventDetailCtt }' escapeXml='false'/>');
})
</script>
	<!-- Main Content -->
	<div class="page-container" id="PageContainer">
		<main class="main-content" id="MainContent" role="main">
			<section class="collection-heading heading-content ">
				<div class="container">
					<div class="row">
						<div class="collection-wrapper">
							<h1 class="collection-title"><span>전체 이벤트</span></h1>
							<div class="breadcrumb-group">
								<div class="breadcrumb clearfix">
									<span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="./main.do" title="Bridal 1" itemprop="url"><span itemprop="title">Home</span></a>
									</span>
									<span class="arrow-space">></span>
									<span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb">
										<a href="./eventBoard.do" title="EVENT" itemprop="url"><span itemprop="title">전체 이벤트</span></a>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<div id="event">
				<div class="container">
				
				<table class="event" cellpadding="0" cellspacing="0" border="0">
				<colgroup>
	                <col width="15%"/>
	                <col width="65%"/>
       		    </colgroup>
					<thead>
						<tr>
							<th>제목</th>
							<td class="boardTitle"><c:out value="${eventDetailList[0].evTtl }"/></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td class="boardWriter"><c:out value="${eventDetailList[0].evWtrNm }"/></td>
						</tr>
						<tr>
							<th>작성일</th>
							<td class="boardDate"><fmt:formatDate value="${eventDetailList[0].evCrtDate }" pattern="yyyy년 MM월 dd일"/></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th> 내용 </th>
							<td style="text-align:left;">
								<c:if test="${!empty eventDetailList[0].evFle}">
									<img src="${eventDetailList[0].evFle}" width=70%>
									<br>
								</c:if>
								<div id="event_detail_ctt"></div>
							</td>
						</tr>
					</tbody>
				</table>
				<a class="btn btn-default pull-right" href="./eventBoard.do"> 목록 </a>
			</div>
		</div>
	</main>
</div>