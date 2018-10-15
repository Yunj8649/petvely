<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
#eventMgr_table th,
#eventMgr_table td {
	text-align: center;
}
</style>
<script type="text/javascript">
var eventMgr = 
{
	delEvent : function () {
		var checkArray	= new Array();
		
		$("#eventMgr_table tbody input[type=checkbox]:checked").each(function (index) {
			checkArray.push($(this).parent().next().text());
		})
		
		var allData = {"delEvent" : checkArray};
		
		$.ajax({
			type		: "POST", 
			url			: "delEvent.do", 
			dataType	: "json", 
			contentType	: "application/json", 
			data		: JSON.stringify(allData), 
			success		: function (result) {
				if (result == "SUCCESS") {
					alert("삭제가 완료되었습니다.");
					
					location.reload();
				} else if (result == "0") {
					alert("선택된 항목이 없습니다.");
				} else {
					alert("오류가 발생 하였습니다.");
				}
			}
		})
	}, 
	
	relEvent : function () {
		var checkArray	= new Array();
		
		$("#eventMgr_table tbody input[type=checkbox]:checked").each(function (index) {
			checkArray.push($(this).parent().next().text());
		})
		
		var allData = {"relEvent" : checkArray};
		
		$.ajax({
			type		: "POST", 
			url			: "relEvent.do", 
			dataType	: "json", 
			contentType	: "application/json", 
			data		: JSON.stringify(allData), 
			success		: function (result) {
				if (result == "SUCCESS") {
					alert("복구가 완료되었습니다.");
					
					location.reload();
				} else if (result == "0") {
					alert("선택된 항목이 없습니다.");
				} else {
					alert("오류가 발생 하였습니다.");
				}
			}
		})
	}, 
	
	checkBox : function () {
		$("#check_all").change(function () {
			if ($("#check_all").is(":checked")) {
				$("#eventMgr_table tbody input[type=checkbox]").prop("checked", true);
			} else {
				$("#eventMgr_table tbody input[type=checkbox]").prop("checked", false);
			}
		});
	}, 
	
	modiEvent : function () {
		$("#eventMgr_table tbody a").click(function () {
			var evSeq = $(this).attr("id");
			
			var str = "";
			
			str = '<form id="event_frm" method="POST" action="modiEvent.do">';
			str += '<input type="hidden" id="evSeq" name="evSeq" value="' + evSeq + '"/>';
			str += '</form>';
			
			$("#page-wrapper").prepend(str);
			
			$("#event_frm").submit();
		});
	}, 
	
	selectLines : function (target) {
		var data	= {"lines" : target.val(), "page" : $("li[class='active'] a").html(), "del" : $("#event_board_del").val()};
		
		$.ajax({
			type		: "POST", 
			url			: "eventMgr_line.do", 
			dataType	: "json", 
			contentType	: "application/json", 
			data		: JSON.stringify(data), 
			success		: function (result) {
				
				if (result.result === "SUCCESS") {
					var data	= "";
					var pagePa	= "";
					var pageNo	= "";
					var pageEa	= "";
					
					for (var i = 0; i < result.eventMgr.length; i++) {
						var date = new Date(result.eventMgr[i].evCrtDate);
						
						date = formatDate(date);
						
						data += '<tr>';
						data += '<th><input type="checkbox" value="' + (i + 1) + '"/></th>';
						data += '<td>' + result.eventMgr[i].evSeq + '</td>';
						data += '<td><a href="#" id="' + result.eventMgr[i].evSeq + '" style="color: black; text-decoration: none;">' + result.eventMgr[i].evTtl + '</a></td>';
						data += '<td>' + result.eventMgr[i].evWtrNm + '</td>';
						data += '<td>' + date + '</td>';
						data += '<td>' + result.eventMgr[i].evHit + '</td>';
						data += '<td>' + result.eventMgr[i].evDel + '</td>';
						data += '</tr>';
					}
					
					if (result.pageGroup > 1) {
						pagePa += '<li>';
						pagePa += '<a style="border:0px" href="javascript:fnGoPaging(' + result.fstPage + ')">«</a>';
						pagePa += '</li>';
						pagePa += '<li>';
						pagePa += '<a style="border:0px" href="javascript:fnGoPaging(' + result.prePage + ')">＜</a>';
						pagePa += '</li>';
					}
					
					for (var i = parseInt(result.startPage); i <= (parseInt(result.endPage) > parseInt(result.total) ? parseInt(result.total) : parseInt(result.endPage)) ; i++) {
						if (result.page == i) {
							pageNo += '<li class="active">';
							pageNo += '<a href="javascript:fnGoPaging(' + i + ');">' + i + '</a>';
							pageNo += '</li>';
						} else {
							pageNo += '<li>';
							pageNo += '<a href="javascript:fnGoPaging(' + i + ');">' + i + '</a>';
							pageNo += '</li>';
						}
					}
					
					if (result.nextPage <= result.total) {
						pageEa += '<li>';
						pageEa += '<a style="border:0px" href="javascript:fnGoPaging(' + result.nextPage + ')">＞</a>';
						pageEa += '</li>';
						pageEa += '<li>';
						pageEa += '<a style="border:0px" href="javascript:fnGoPaging(' + result.total + ')">»</a>';
						pageEa += '</li>';
					}
					
					$("#eventMgr_table tbody tr").remove();
					
					$("#eventMgr_table tbody").append(data);
					
					$("ul[class='pagination'] li").remove();
					
					$("ul[class='pagination']").append(pagePa);
					$("ul[class='pagination']").append(pageNo);
					$("ul[class='pagination']").append(pageEa);
				}
			}
		})
	}, 
	
	selectDel : function (target) {
		var data	= {"lines" : $("#event_board_line").val(), "page" : $("li[class='active'] a").html(), "del" : target.val()};
		
		$.ajax({
			type		: "POST", 
			url			: "eventMgr_line.do", 
			dataType	: "json", 
			contentType	: "application/json", 
			data		: JSON.stringify(data), 
			success		: function (result) {
				if (result.result === "SUCCESS") {
					var data	= "";
					var pagePa	= "";
					var pageNo	= "";
					var pageEa	= "";
					
					for (var i = 0; i < result.eventMgr.length; i++) {
						var date = new Date(result.eventMgr[i].evCrtDate);
						
						date = formatDate(date);
						
						data += '<tr>';
						data += '<th><input type="checkbox" value="' + (i + 1) + '"/></th>';
						data += '<td>' + result.eventMgr[i].evSeq + '</td>';
						data += '<td><a href="#" id="' + result.eventMgr[i].evSeq + '" style="color: black; text-decoration: none;">' + result.eventMgr[i].evTtl + '</a></td>';
						data += '<td>' + result.eventMgr[i].evWtrNm + '</td>';
						data += '<td>' + date + '</td>';
						data += '<td>' + result.eventMgr[i].evHit + '</td>';
						data += '<td>' + result.eventMgr[i].evDel + '</td>';
						data += '</tr>';
					}
					
					if (result.pageGroup > 1) {
						pagePa += '<li>';
						pagePa += '<a style="border:0px" href="javascript:fnGoPaging(' + result.fstPage + ')">«</a>';
						pagePa += '</li>';
						pagePa += '<li>';
						pagePa += '<a style="border:0px" href="javascript:fnGoPaging(' + result.prePage + ')">＜</a>';
						pagePa += '</li>';
					}
					
					for (var i = parseInt(result.startPage); i <= (parseInt(result.endPage) > parseInt(result.total) ? parseInt(result.total) : parseInt(result.endPage)) ; i++) {
						if (result.page == i) {
							pageNo += '<li class="active">';
							pageNo += '<a href="javascript:fnGoPaging(' + i + ');">' + i + '</a>';
							pageNo += '</li>';
						} else {
							pageNo += '<li>';
							pageNo += '<a href="javascript:fnGoPaging(' + i + ');">' + i + '</a>';
							pageNo += '</li>';
						}
					}
					
					if (result.nextPage <= result.total) {
						pageEa += '<li>';
						pageEa += '<a style="border:0px" href="javascript:fnGoPaging(' + result.nextPage + ')">＞</a>';
						pageEa += '</li>';
						pageEa += '<li>';
						pageEa += '<a style="border:0px" href="javascript:fnGoPaging(' + result.total + ')">»</a>';
						pageEa += '</li>';
					}
					
					$("#eventMgr_table tbody tr").remove();
					
					$("#eventMgr_table tbody").append(data);
					
					$("ul[class='pagination'] li").remove();
					
					$("ul[class='pagination']").append(pagePa);
					$("ul[class='pagination']").append(pageNo);
					$("ul[class='pagination']").append(pageEa);
				}
			}
		})
	}
}

Date.prototype.YYYYMMDDHHMMSS = function () {
    var yyyy = this.getFullYear().toString();
    var MM = pad(this.getMonth() + 1,2);
    var dd = pad(this.getDate(), 2);
    var hh = pad(this.getHours(), 2);
    var mm = pad(this.getMinutes(), 2)
    var ss = pad(this.getSeconds(), 2)

    return yyyy + '년 ' + MM + '월 ' + dd + '일 ' + hh + ':' + mm + ':' + ss;
};

function formatDate(date) {
    return date.YYYYMMDDHHMMSS();
}

function pad(number, length) {

    var str = '' + number;
    while (str.length < length) {
        str = '0' + str;
    }

    return str;
}

function fnGoPaging(page){
	var data	= {"lines" : $("#event_board_line").val(), "page" : page, "del" : $("#event_board_del").val()};
	
	$.ajax({
		type		: "POST", 
		url			: "eventMgr_line.do", 
		dataType	: "json", 
		contentType	: "application/json", 
		data		: JSON.stringify(data), 
		success		: function (result) {
			if (result.result === "SUCCESS") {
				var data	= "";
				var pagePa	= "";
				var pageNo	= "";
				var pageEa	= "";
				
				for (var i = 0; i < result.eventMgr.length; i++) {
					var date = new Date(result.eventMgr[i].evCrtDate);
					
					date = formatDate(date);
					
					data += '<tr>';
					data += '<th><input type="checkbox" value="' + (i + 1) + '"/></th>';
					data += '<td>' + result.eventMgr[i].evSeq + '</td>';
					data += '<td><a href="#" id="' + result.eventMgr[i].evSeq + '" style="color: black; text-decoration: none;">' + result.eventMgr[i].evTtl + '</a></td>';
					data += '<td>' + result.eventMgr[i].evWtrNm + '</td>';
					data += '<td>' + date + '</td>';
					data += '<td>' + result.eventMgr[i].evHit + '</td>';
					data += '<td>' + result.eventMgr[i].evDel + '</td>';
					data += '</tr>';
				}
				
				if (result.pageGroup > 1) {
					pagePa += '<li>';
					pagePa += '<a style="border:0px" href="javascript:fnGoPaging(' + result.fstPage + ')">«</a>';
					pagePa += '</li>';
					pagePa += '<li>';
					pagePa += '<a style="border:0px" href="javascript:fnGoPaging(' + result.prePage + ')">＜</a>';
					pagePa += '</li>';
				}
				
				for (var i = parseInt(result.startPage); i <= (parseInt(result.endPage) > parseInt(result.total) ? parseInt(result.total) : parseInt(result.endPage)) ; i++) {
					if (result.page == i) {
						pageNo += '<li class="active">';
						pageNo += '<a href="javascript:fnGoPaging(' + i + ');">' + i + '</a>';
						pageNo += '</li>';
					} else {
						pageNo += '<li>';
						pageNo += '<a href="javascript:fnGoPaging(' + i + ');">' + i + '</a>';
						pageNo += '</li>';
					}
				}
				
				if (result.nextPage <= result.total) {
					pageEa += '<li>';
					pageEa += '<a style="border:0px" href="javascript:fnGoPaging(' + result.nextPage + ')">＞</a>';
					pageEa += '</li>';
					pageEa += '<li>';
					pageEa += '<a style="border:0px" href="javascript:fnGoPaging(' + result.total + ')">»</a>';
					pageEa += '</li>';
				}
				
				$("#eventMgr_table tbody tr").remove();
				
				$("#eventMgr_table tbody").append(data);
				
				$("ul[class='pagination'] li").remove();
				
				$("ul[class='pagination']").append(pagePa);
				$("ul[class='pagination']").append(pageNo);
				$("ul[class='pagination']").append(pageEa);
			}
		}
	})
}

$(document).ready(function () {
	eventMgr.checkBox();
	eventMgr.modiEvent();
	$("#event_board_line").change(function (){
		eventMgr.selectLines($(this));
	});
	$("#event_board_del").change(function () {
		eventMgr.selectDel($(this));
	})
})
</script>
<form id="pagingFrm" name="pagingFrm">
	<input type="hidden" id="page" name="page">
</form>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Event 관리</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<h3>Event List</h3>
					<label style="text-align:center;">
						Lines
						<select class="form-control input-sm" id="event_board_line">
							<option value="10">10</option>
							<option value="20">20</option>
							<option value="30">30</option>
							<option value="50">50</option>
							<option value="100">100</option>
						</select>
					</label>
					<label style="text-align:center;">
						Deleted
						<select class="form-control input-sm" id="event_board_del">
							<option value="all">ALL</option>
							<option value="Y">Y</option>
							<option value="N">N</option>
						</select>
					</label>
					<div class="table-responsive">
						<table class="table table-bordered table-striped" id="eventMgr_table">
							<thead>
								<tr>
									<th><input type="checkbox" id="check_all" /></th>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
									<th>삭제</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${eventMgr }" var="eventMgr" varStatus="status">
									<tr>
										<th><input type="checkbox" value="${status.count }"/></th>
										<td><c:out value="${eventMgr.evSeq }"></c:out></td>
										<td><a href="#" id="${eventMgr.evSeq }" style="color: black; text-decoration: none;"><c:out value="${eventMgr.evTtl }"></c:out></a></td>
										<td><c:out value="${eventMgr.evWtrNm }"></c:out></td>
										<td><fmt:formatDate value="${eventMgr.evCrtDate}" pattern="yyyy년 MM월 dd일 HH:mm:ss" /></td>
										<td><c:out value="${eventMgr.evHit }"></c:out></td>
										<td><c:out value="${eventMgr.evDel }"></c:out></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div style="width: 100%; text-align: center;">
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
						
						<a href="addEvent.do"><input onclick="href='addEvent.do'" type="button" value="추가" id="event_add_btn" class="btn btn-default"/></a>
                        <input type="button" onclick="eventMgr.delEvent();" value="삭제" id="event_del_btn" class="btn btn-default"/>
                        <input type="button" onclick="eventMgr.relEvent();" value="복구" id="event_rel_btn" class="btn btn-default"/>
					</div>
				</div>
			</div>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
</div>
<!-- /#page-wrapper -->