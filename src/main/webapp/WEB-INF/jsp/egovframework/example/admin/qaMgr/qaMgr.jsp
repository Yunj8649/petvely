<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>
var qaMgr = {
	
	count : 0,
	
	siId : "", 
	
	selectUser : function () {

		var selectUser = {"userNo"	:	$("#qaMgr_table tbody input[type=radio]:checked").parent().next().text()};
		
		var that = this;
		
		if (selectUser.userNo.length <= 0) {
			alert("회원을 선택 해주세요.");
			return;
		}
		
		that.siId = setInterval(function () { 
			that.chatApplyAjax(selectUser);
		}, 1000);
		
		$("#sendBtn").attr("disabled", false);
		$("#sendMsg").attr("disabled", false);
		$("#sendMsg").val('');
		$("#select_user").slideUp(1000);
		$("#visible_btn").css("border", "solid gray 1px");
		$("#visible_btn").slideDown(1000);
		$("#sendMsg").focus();
		$("#chatLogArea").scrollTop($("#chatLogArea")[0].scrollHeight);
	}, 
	
	chatApplyAjax : function (selectUser) {
		
		var that = this;
		
		$.ajax({
			type		: "POST", 
			url			: "selectUser.do", 
			dataType	: "json", 
			contentType	: "application/json", 
			data		: JSON.stringify(selectUser), 
			success		: function (result) {
				if (result.result == "SUCCESS") {
					that.chatDraw(result.chat);
				} else {
					alert("오류");
				}
			}
		})
	},
	
	chatDraw : function (chatObj) {
		var chatLog = "";
		
		for (var i = 0 ; i < chatObj.length ; i++) {
			
			if (chatObj[i].qaStt == 0) {
				chatLog += '<div class="chatRow col-lg-12" id="chat_' + i + '">';
				chatLog += '<div class="userChat col-sm-6">';
				chatLog += '<p class="chatLog">' + chatObj[i].qaWtrNm + " : " + chatObj[i].qaCtt + '</p>';
				chatLog += '<p class="chatDate">' + chatObj[i].qaCrtDate + '</p>';
				chatLog += '</div>';
				chatLog += '<div class="col-sm-6">';
				chatLog += '</div>';
				chatLog += '</div>';
			} else {
				chatLog += '<div class="chatRow col-lg-12" id="chat_' + i + '">';
				chatLog += '<div class="col-sm-6">';
				chatLog += '</div>';
				chatLog += '<div class="adminChat col-sm-6">';
				chatLog += '<p class="chatLog">' + chatObj[i].qaWtrNm + " : " + chatObj[i].qaCtt + '</p>';
				chatLog += '<p class="chatDate">' + chatObj[i].qaCrtDate + '</p>';
				chatLog += '</div>';
				chatLog += '</div>';
			}
		}
		
		$("#chatLogArea div").remove();
		$("#chatLogArea").css("display", "block");
		$("#chatLogArea").append(chatLog);
	}, 
	
	clickVisibleBtn : function () {
		$("#sendBtn").attr("disabled", true);
		$("#sendMsg").attr("disabled", true);
		$("#sendMsg").val('');
		$("#visible_btn").css("border", "0px");
		$("#visible_btn").slideUp(500);
		$("#chatLogArea").slideUp(500);
		$("#select_user").slideDown(500);
		$("#chatLogArea div").remove();
		clearInterval(this.siId);
	},
	
	sendMsg : function () {
		
		if ($("#sendMsg").val() == null || $("#sendMsg").val() == "") {
			alert("메세지를 입력 해주세요.");
			return;
		}
		
		var sendMsg = 
		{
			"sendMsg"	: $("#sendMsg").val(), 
			"userId"	: $("#qaMgr_table tbody input[type=radio]:checked").parent().next().text()
		}
		
		$.ajax({
			type		: "POST", 
			url			: "sendMsg.do", 
			dataType	: "json", 
			contentType	: "application/json", 
			data		: JSON.stringify(sendMsg), 
			success		: function () {
				
			}
		})
		
		$("#sendMsg").val('');
		$("#sendMsg").focus();
		$("#chatLogArea").scrollTop($("#chatLogArea")[0].scrollHeight);
	}
}

$(document).ready(function () {
	
})

</script>

<style type="text/css">
#chatLogArea {
	display : none;
	height : 600px; 
	overflow-y:scroll
}

#sendBtn[disabled] {
	background-color : gray;
	cursor: inherit;
}

#sendMsg {
	width:80%;
}

#sendMsg[disabled] {
	background-color : gray;
	cursor: inherit;
	width:80%;
}

.userChat {
	margin-top : 10px;
	margin-bottom : 10px;
	width: fit-content;
	border-radius: 10px;
	padding: 5px;
	background-color: #e6e6e6;
}

.adminChat {
	text-align : right;
	margin-top : 10px;
	margin-bottom : 10px;
	width: fit-content;
	border-radius: 10px;
	padding: 5px;
	background-color: #e6e6e6;
}

.chatLog {
	padding: 0px;
	font-size: 16px;
	font-weight: bold;
}

.chatLog, .chatDate {
	max-width: 100%;
	width : fit-content;
	padding-left : 5px;
	padding-right : 5px;
	margin-bottom : 0px;
}

.chatDate {
	margin-top : 1em;
	color : #808080;
}

#visible_btn {
	width : 100%;
	display : none;
	text-align : center;
	font-size : 30px;
	cursor : pointer;
}
</style>


<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">고객 관리</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="col-lg-12" id="visible_btn" onclick="qaMgr.clickVisibleBtn()">
					<i class="fa fa-angle-down"></i>
					<i class="fa fa-angle-down"></i>
					<i class="fa fa-angle-down"></i>
				</div>
				<div class="panel-body" id="select_user">
					<h3>회원 선택</h3>
					<label style="text-align:center;">
						Lines
						<select class="form-control input-sm" id="qa_board_line">
							<option value="10">10</option>
							<option value="20">20</option>
							<option value="30">30</option>
							<option value="50">50</option>
							<option value="100">100</option>
						</select>
					</label>
					<label style="text-align:center;">
						Replied
						<select class="form-control input-sm" id="qa_board_del">
							<option value="all">ALL</option>
							<option value="Y">Clear</option>
							<option value="N">Wait</option>
						</select>
					</label>
					<div class="table-responsive">
						<table class="table table-bordered table-striped" id="qaMgr_table">
							<thead>
								<tr>
									<th></th>
									<th>회원 ID</th>
									<th>회원 닉네임</th>
									<th>답변 여부</th>
									<th>문의 일자</th>
								</tr>
							</thead>
							<tbody>
				 				<c:forEach items="${qaMgr }" var="qaMgr" varStatus="status">
									<tr>
										<th><input type="radio" name="seqNo"/></th>
										<td><c:out value="${qaMgr.qaWtrId }"/></td>
										<td><c:out value="${qaMgr.accNm }"/></td>
										<c:choose>
											<c:when test="${qaMgr.qaStt == 0 }">
												<td style="color : blue;"><c:out value="${qaMgr.qaStt }"/></td>
											</c:when>
											<c:otherwise>
												<td style="color : red;"><c:out value="${qaMgr.qaStt }"/></td>
											</c:otherwise>
										</c:choose>
										<td><fmt:formatDate value="${qaMgr.qaCrtDate}" pattern="yyyy년 MM월 dd일 HH:mm:ss" /></td>
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
                        <input type="button" onclick="qaMgr.selectUser()" value="조회" class="btn btn-default"/>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<h3>문의 사항</h3>
					<div id="chatLogArea" class="col-lg-12"></div>
					<input type="text" id="sendMsg" disabled/>
					<input type="button" onclick="qaMgr.sendMsg();" value="전송" id="sendBtn" class="btn btn-default" disabled/>
				</div>
			</div>
		</div>
	</div>
</div>


				
