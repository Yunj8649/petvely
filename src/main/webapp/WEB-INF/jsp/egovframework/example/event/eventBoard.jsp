<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script>
function fnGoPaging(page){
	   
	   var $pagingFrm = $("#event_pagingFrm");
	   
	   $("#page").val(page);
	   
	   $pagingFrm.attr("action", "eventBoard.do");
	   $pagingFrm.attr("method", "post");

	   $pagingFrm.submit();
	}

	$(document).ready(function () {
		$("#event tbody td a").click(function () {
			var $form = $("#event_form");
			
			$("#evSeq").attr("value", $(this).attr("id"));
			
			$form.attr("action", "event_detail.do");
			$form.attr("method", "POST");
			
			$form.submit();
		});
	});
</script>
<form id="event_form" name="event_form">
	<input type="hidden" id="evSeq" name="evSeq" value="">
</form>
<form id="event_pagingFrm" name="event_pagingFrm">
	<input type="hidden" id="page" name="page">
</form>
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
				<table class="notice" cellpadding="0" cellspacing="0" border="0">
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
						<c:forEach items="${eventList }" var="eventList">
							<tr>
								<td><span class ="eventBoard">Event</span></td>
								<td><a href="#" id="${eventList.evSeq}"><c:out value="${eventList.evTtl}"/></a></td>
								<td><c:out value="${eventList.evWtrNm}"></c:out></td>
								<td><c:out value="${eventList.evCrtDate}" /></td>
								<td><c:out value="${eventList.evHit}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="text-center">
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
	</main>
</div>