<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>

	function chkWSandSC(key) {
	    var	str_space 	= /\s/,
	   		re			= /[~!@\#$%^&*\()\-=+_']/gi;
	
		if (str_space.exec(key)) {
			alert("공백이 포함되면 안됩니다.");
			
		    return false;
		}
			
		if (re.test(key)) {
			alert("특수문자가 포함되면 안됩니다.");
			
			return false;
		}
		
		return true;
	}
	
	function chkCharLength (min, max, key) {
		
		if (key.length >= min && key.length <= max) {
			return true;
		}
		
		/* if (min === max) {
			alert(min + "자리의 값을 입력하세요.");
		} else {
			alert("최소 " + min + "이상 최대 " + max + "이하의 값을 입력해주세요.");
		} */
		
		return false;
	}

	function maxLengthCheck(object) {

		if (object.value.length > object.maxLength) {
			object.value = object.value.slice(0, object.maxLength);
		}
	}

	function hasWS(key) {
		var str_space = /\s/;

		if (str_space.exec(key)) {
			return true;
		}

		return false;
	}

	var findId = {

		checkName : function() {
			
			var $accNm = $("#accNm");
			
			var key = $accNm.val();

			if (chkCharLength(2, 15, key) == true && chkWSandSC(key) == true) {
				/* $accNm.attr("value", "true"); */
				return true;

			} else {
				$accNm.attr("value", "");
				$accNm.focus();
				
				return false;
			}
			
			 /* 이름 영역 변경 시 2~15 사이의 값 확인 성공하면 true 입력 */
			/*$("#accNm").change(function() {
				
				
			}); */

		},
		
		focusPhone : function(){
			
			/* 폰번호 입력 시 다음으로 커서 이동 */
			$(".accPn").keyup(function() {
				var charLimit = $(this).attr("maxlength");

				if (this.value.length >= charLimit) {
					$(this).next('.accPn').focus();

					return false;
				}
			});
			
		},

		checkPhone : function() {
			
			var succesPn = 0;
			
			var $accPn1 = $("#accPn1");
			var $accPn2 = $("#accPn2");
			var $accPn3 = $("#accPn3");

			var key1 = $accPn1.val();
			var key2 = $accPn2.val();
			var key3 = $accPn3.val();

			if (chkCharLength(3, 3, key1)) {
				succesPn++;
			} else {
				$accPn1.attr("value", "");

				$accPn1.focus();
			}

			if (chkCharLength(4, 4, key2)) {
				succesPn++;
			} else {
				$accPn2.attr("value", "");

				$accPn2.focus();
			}
		
			if (chkCharLength(4, 4, key3)) {
				succesPn++;
			} else {
				$accPn3.attr("value", "");

				$accPn3.focus();
			}
			
			if (succesPn === 3){
				
				return true;
				
				succesPn = 0;
			} else {
				
				return false;
			}
		},

		idChk : function() {
			$("#id_find").click(function() {

				if (findId.checkName() === true && findId.checkPhone() === true) {
						
						alert("성공");

						$("#find_ID").attr("action", "find_id.do");
						$("#find_ID").attr("method", "post");
						
						$("#find_ID").submit();

				} else if(findId.checkName() === true && findId.checkPhone() === false) {
					
						alert("핸드폰 번호를 정확히 입력해주세요");
				} else if(findId.checkName() === false && findId.checkPhone() === true) {
					
					alert("이름을 정확히 입력해주세요.");
				} else {
					alert ("이름과 핸드폰 번호를 확인해주세요.");
				}

			});
		}

	}

	var rePwFunc = {
		key : "",

		chkPassword : function() {
			var passwordRules = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}$/;

			var pw = $("#accPwNew").val();

			console.log("passwordRules.test(pw)" + passwordRules.test(pw));

			if (!hasWS(pw)) {
				if (!passwordRules.test(pw)) {
					alert("비밀번호는 영문, 숫자, 특수문자를 포함한 6자 이상 16자 이하로 작성해야 합니다.");

					return false;
				}
			} else {
				alert("비밀번호에 공백을 포함 할 수 없습니다.");

				return false;
			}

			return true;
		},

		duplicateChk : function() {
			that = this;
			$("#email_check").click(function() {
				var email = $("#accEm").val();
				var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

				if (exptext.test(email) == false) {
					alert("이메일형식이 올바르지 않습니다.");

				} else {
					var param = $("#accEm").val();

					$.ajax({
						type : "POST",
						url : "duplicateChk.do",
						data : param,
						dataType : "text",
						contentType : "application/json",
						success : function(data) {
							var jObj = JSON.parse(data);

							if (jObj.result === "FAIL") {
								$("#error").show(200);
							} else {
								that.check();
								$("#accEm").prop('readonly',
										true);
								$("#emailDiv").show(500);
								$("#error").hide(300);
							}
						}
					});
				}

				$("#accEm").focus();
			})
		},

		check : function() {
			that = this;
			alert("이메일 전송시간은 2~3분 이 소요됩니다.");

			var email = $("#accEm").val();
			var param = $("#accEm").val();

			$.ajax({
				type : "POST",
				url : "emailCheck.do",
				data : param,
				dataType : "text",
				contentType : "application/json",
				success : function(data) {
					var jObj = JSON.parse(data);

					that.key = jObj.key;
					console.log(that.key);
				}
			});

		},

		keyChk : function() {
			that = this;

			$("#valueChk").click(function() {
				if (that.key == $("#keyText").val()) {
					alert("인증되었습니다.");

					$("#passwordDiv").show(400);
					$("#emailDiv").hide(400);

					$("#password").focus();
				} else {
					$("#keyText").focus();
					alert("인증키를 다시한번 확인해 주세요");
				}
			})
		},

		pwChk : function() {

			$("#passwordBtn").click(function() {

				var pw = $("#accPwNew").val();
				var pwChk = $("#accPwOld").val();

				if (rePwFunc.chkPassword() === true) {
					if (pw === pwChk) {
						$("#password_form").submit();
						alert("성공적으로 변경되었습니다.");

						$("#password_form").attr("action", "pwRe.do");
						$("#password_form").attr("method", "post");

					} else {
						alert("비밀번호가 일치하지 않습니다.");
					}
				} else {
					alert("최소 6글자 이상으로 설정해주세요.");
				}
			});
		}
	};

	$(document).ready(function() {
		
		findId.focusPhone();
		findId.idChk();

		$("#emailDiv").hide();
		$("#passwordDiv").hide();

		rePwFunc.duplicateChk();
		rePwFunc.keyChk();
		rePwFunc.pwChk();

	})

	function ShowTabex(val) {
		console.log(11111);
		for (i = 0; i < 2; i++) {
			var tb = document.getElementById('tab_' + i);
			if (i != val) {
				tb.style.display = "none";
				console.log(val);
			} else
				tb.style.display = "block";
		}
	}
</script>

<div class="page-container" id="PageContainer">
	<main class="main-content" id="MainContent" role="main">
	<section class="collection-heading heading-content ">
		<div class="container">
			<div class="row">
				<div class="collection-wrapper">
					<h1 class="collection-title">
						<span>ID/PW 찾기</span>
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

			<div class="row">
				<div class="collection-wrapper">
					<div class="col-md-12">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#mypage_tab1"
								onclick="ShowTabex('0')" data-toggle="tab">ID 찾기</a></li>
							<li class=""><a href="#mypage_tab2" onclick="ShowTabex('1')"
								data-toggle="tab">비밀번호 찾기</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 아이디 찾기 탭  	-->
	<div id="tab_0" style="width: 100%; display: block;">
		<section class="register-content">
			<div class="register-wrapper">
				<div class="container">

					<div class="row">
						<div class="register-inner">
							<div id="customer-find">
								<div id="register" class="">
									<form name="find_ID" id="find_ID" action="./find_id.do"
										accept-charset="UTF-8">
										<div class="clearfix large_form">
											<label for="accNm" class="label">이름</label> <input
												type="text" value="" name="accNm" id="accNm" class="text"
												size="30" maxlength="15">
										</div>
										<div class="clearfix large_form">
											<label for="accPn" class="label">휴대폰 번호</label> <input
												style="width: 32%;" type="number" value="" name="accPn1"
												id="accPn1" class="text accPn" max="999" maxlength="3"
												oninput="maxLengthCheck(this)"> <input
												style="width: 33%;" type="number" value="" name="accPn2"
												id="accPn2" class="text accPn" max="9999" maxlength="4"
												oninput="maxLengthCheck(this)"> <input
												style="width: 33%;" type="number" value="" name="accPn3"
												id="accPn3" class="text accPn" max="9999" maxlength="4"
												oninput="maxLengthCheck(this)">
										</div>
										<div class="action_bottom">
											<input class="btn" type="button" id="id_find" value="ID 찾기">
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	<!-- 비밀번호 찾기 탭 	-->
	<div id="tab_1" style="width: 100%; display: none;">
		<section class="register-content">
			<div class="register-wrapper">
				<div class="container">
					<div class="row">
						<div class="register-inner">
							<div id="customer-register">
								<form id="password_form" action="pwRe.do" method="POST">
									<div class="clearfix large_form" id="div_email">
										<label for="accEm" class="label">E-Mail</label> <input
											type="text" value="" name="accEm" id="accEm" class="text"
											size="30"> <input class="btn" name="email_check"
											id="email_check" value="전송">
									</div>
									<div class="clearfix large_form" id="emailDiv">
										<label for="accKey" class="label">인증번호</label> <input
											type="text" class="form-control" id="keyText"> <input
											type="button" id="valueChk" class="btn btn-default"
											value="확인">
									</div>
									<br>

									<div id="passwordDiv">
										<label for="accPwNew" class="label">비밀번호</label> <input
											type="password" value="" name="accPwNew" id="accPwNew"
											class="text" size="30"> <label for="accPwOld"
											class="label">비밀번호 확인</label> <input type="password" value=""
											name="accPwOld" id="accPwOld" class="text" size="30">

										<input type="button" id="passwordBtn" name="passwordBtn"
											value="변경" class="form-control btn btn-primary">
									</div>
									<!-- <span id="page_check" value="2"></span> -->
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	</main>
</div>