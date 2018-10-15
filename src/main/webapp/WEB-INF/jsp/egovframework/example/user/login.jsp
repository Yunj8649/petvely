<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(document).ready(function () {
	$("#accId").focus();
})

var left = 
{
	pageSubmitFn : function(pageName, frmName) {
		$("#pageName").val(pageName);

		$("#" + frmName).attr("action", pageName + ".do");
		
		$("#" + frmName).submit();
	}
}
</script>

<form id="frm" name="frm">
	<input type="hidden" id="pageName"  name="pageName" />
</form>

	<!-- Main Content -->
	<div class="page-container" id="PageContainer">
		<main class="main-content" id="MainContent" role="main">
			<section class="collection-heading heading-content ">
				<div class="container">
					<div class="row">
						<div class="collection-wrapper">
							<h1 class="collection-title"><span>Login</span></h1>
							<div class="breadcrumb-group">
								<div class="breadcrumb clearfix">
									<span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb">
										<a href="./main.do" title="Bridal 1" itemprop="url">
											<span itemprop="title">Home</span>
										</a>
									</span>
									<span class="arrow-space">></span>
									<span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb">
										<a href="./login.do" title="Login" itemprop="url">
											<span itemprop="title">Login</span>
										</a>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section class="login-content">
				<div class="login-content-wrapper">
					<div class="container">
						<div class="row">
							<div class="login-content-inner">
								<div id="customer-login">
									<div id="login" class="">
										<form id="customer_login1" action="./logindo.do" accept-charset="UTF-8" method="post">
											<input type="hidden" value="customer_login" name="form_type">
											<input type="hidden" name="utf8" value="✓">
											<div class="form-inline form-group" id="loginid" > 
												<label for="accId" class="label">ID</label>
												<input type="text" value="" name="accId" id="accId" class="text">
											</div>
											<div class="form-group" >
												<label for="accPwNew" class="label">Password</label>
												<input type="password" value="" name="accPwNew" id="accPwNew" class="text" size="16">
											<div class="action_bottom">
												<input class="btn" type="submit" value="Sign In">
											</div>
											</div>
										</form>
											
											<b style="font-size:120%;"> 아이디 또는 비밀번호를 잊어버리셨나요?</b> <a style=" width: 28%; padding:3px;"  href="#" onclick="javascript:left.pageSubmitFn('find_idpw','frm')" id="findbtn">아이디  / 비밀번호 찾기 </a> 
											<p> <b style="font-size:120%;"> Petvely 회원이 아니신가요?</b> <a style=" width: 25%; padding:3px;" href="#" onclick="javascript:left.pageSubmitFn('register','frm')" id="registerbtn">회원가입</a> 
											<!-- <br><a href="#" onclick="showRecoverPasswordForm();return false;"> &nbsp;&nbsp;&nbsp; 비밀번호 찾기</a> -->
										
										
									</div>
									<!-- <div id="find-id" style="display:none;" class="">
										<h2>아이디 찾기</h2>
										<p class="note">본인확인 Email로 인증.</p>
										<form method="post">
											<input type="hidden" value="find_customer_id" name="form_type">
											<input type="hidden" name="utf8" value="✓">
											<label class="label">Email address</label>
											<input type="email" value="" size="30" name="email" id="find-email" class="text">
											<div class="action_bottom">
												<input class="btn" type="submit" value="인증"> or
												<span class="note"><a href="#" onclick="hideFindIdForm();return false;">취소</a></span>
											</div>
										</form>
									</div>	 -->
									<!-- 					
									<div id="recover-password" style="display:none;" class="">
										<h2>비밀번호 찾기</h2>
										<p class="note">등록하신 이메일로 초기화된 password를 보내드립니다.</p>
										<form method="post">
											<input type="hidden" value="recover_customer_password" name="form_type">
											<input type="hidden" name="utf8" value="✓">
											<label class="label">Email</label>
											<input type="email" value="" size="30" name="email" id="recover-email" class="text">
											<div class="action_bottom">
												<input class="btn" type="submit" value="Submit"> or
												<span class="note"><a href="#" onclick="hideRecoverPasswordForm();return false;">취소</a></span>
											</div>
										</form>
									</div> -->
								</div>
								<%if (request.getAttribute("loginFAIL") != null){ %>
									<p style="color: red; font-size: 14px;"><%=request.getAttribute("loginFAIL")%></p>
								<% } else if (request.getAttribute("accDel") != null) {%>
									<p style="color: red; font-size: 14px;"><%=request.getAttribute("accDel")%></p>
								<% } %>
							</div>
						</div>
					</div>
				</div>
			</section>

			<script type="text/javascript">
				function showRecoverPasswordForm() {
					document.getElementById('recover-password').style.display = 'block';
					document.getElementById('login').style.display = 'none';
				}

				function hideRecoverPasswordForm() {
					document.getElementById('recover-password').style.display = 'none';
					document.getElementById('login').style.display = 'block';
				}

				if (window.location.hash == '#recover') {
					showRecoverPasswordForm()
				}
				
				function showFindIdForm() {
					document.getElementById('find-id').style.display = 'block';
					document.getElementById('login').style.display = 'none';
				}

				function hideFindIdForm() {
					document.getElementById('find-id').style.display = 'none';
					document.getElementById('login').style.display = 'block';
				}

				if (window.location.hash == '#find') {
					showFindIdForm()
				}				
			</script>
		</main>
	</div>
