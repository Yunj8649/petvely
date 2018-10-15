<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
$(document).ready(function () {
<%	if (session.getAttribute("sessionID") != null) { %>
	var login_id = '<input type="hidden" id="loginId" name="loginId" value="<%=session.getAttribute("sessionID")%>"/>';
	var login_nm = '<input type="hidden" id="loginNm" name="loginNm" value="<%=session.getAttribute("sessionNM")%>"/>';
	
	$("#admin_frm").append(login_id);
	$("#admin_frm").append(login_nm);
<%	} else { %>
	alert("로그아웃 되었습니다. 다시 로그인 해주세요");
	
	location.href = "main.do";
<% } %>
})
</script>
<form id="admin_frm" method="POST">

</form>
<div class="navbar-default sidebar" role="navigation">
	<div class="sidebar-nav navbar-collapse">
		<ul class="nav" id="side-menu">
			<li class="sidebar-search">
				<div class="input-group custom-search-form">
					<input type="text" class="form-control" placeholder="Search...">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">
							<i class="fa fa-search"></i>
						</button>
					</span>
				</div> <!-- /input-group -->
			</li>
			<li>
				<a href="#">
					<i class="fa fa-dashboard fa-fw"></i>
					Dashboard
				</a>
			</li>
			<li>
				<a href="#">
					<i class="fa fa-bar-chart-o fa-fw"></i>
					기본설정
					<span class="fa arrow"></span>
				</a>
				<ul class="nav nav-second-level">
					<li><a href="#">결제 수단 설정</a></li>
					<li><a href="#">약관 설정</a></li>
				</ul>
			</li>
			<li>
				<a href="./productMgr.do">
					<i class="fa fa-bar-chart-o fa-fw"></i>
					상품 설정
				</a>
			</li>
			<li>
				<a href="#" id="test">
					<i class="fa fa-bar-chart-o fa-fw"></i>
					게시글 설정
					<span class="fa arrow"></span>
				</a>
				<ul class="nav nav-second-level" id="board_config">
					<li><a href="./noticeMgr.do">공지</a></li>
					<li><a href="./eventMgr.do" id="event_board">이벤트</a></li>
					<li><a href="./qaMgr.do">고객센터</a></li>
					<li><a href="#">프로모션</a></li>
				</ul>
			</li><li>
				<a href="#">
					<i class="fa fa-bar-chart-o fa-fw"></i>
					주문 관리
					<span class="fa arrow"></span>
				</a>
				<ul class="nav nav-second-level">
					<li><a href="#">주문 통합</a></li>
					<li><a href="#">입금 대기</a></li>
					<li><a href="#">결제 완료</a></li>
					<li><a href="#">상품 준비중</a></li>
					<li><a href="#">배송 중</a></li>
					<li><a href="#">배송 완료</a></li>
					<li><a href="#">구매 확정</a></li>
				</ul>
			</li>
			<li>
				<a href="#">
					<i class="fa fa-bar-chart-o fa-fw"></i>
					취소/교환/반품/환불 관리
					<span class="fa arrow"></span>
				</a>
				<ul class="nav nav-second-level">
					<li><a href="#">취소 리스트</a></li>
					<li><a href="#">교환 리스트</a></li>
					<li><a href="#">반품 리스트</a></li>
					<li><a href="#">환불 리스트</a></li>
				</ul>
			</li>
			<li>
				<a href="#">
					<i class="fa fa-bar-chart-o fa-fw"></i>
					메인 페이지 설정
					<span class="fa arrow"></span>
				</a>
				<ul class="nav nav-second-level">
					<li><a href="./bannerMgr.do">배너 관리</a>
				</ul>
			</li>
			<li>
				<a href="./memberMgr.do">
					<i class="fa fa-bar-chart-o fa-fw"></i>
					회원 설정
				</a>
			</li>
			<li>
				<a href="#">
					<i class="fa fa-bar-chart-o fa-fw"></i>
					자동 메일
					<span class="fa arrow"></span>
				</a>
				<ul class="nav nav-second-level">
					<li><a href="#">회원 가입</a></li>
					<li><a href="#">주문 완료</a></li>
					<li><a href="#">배송 시작</a></li>
					<li><a href="#">배송 종료</a></li>
					<li><a href="#">고객센터 답변</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<!-- /.sidebar-collapse -->
</div>