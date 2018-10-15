<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">

/* 
추가 사항 (완료사항 앞에 "-" 붙임)

-1. ID : 최소 길이 5자 / 최대 길이 15자로 제한 (설명 툴팁 추가)
-2. NM : 최소 길이 2자 / 최대 길이 15자 / 특수문자, 빈칸 제외 (설명 툴팁 추가)
-3. PW : 최소 길이 5자 / 최대 길이 15자 / 특수문자, 숫자, 영문 포함 (설명 툴팁 추가)
-4. EM : E-Mail 정규식 확인
-5. PN : 3자리 + 3or4자리 + 4자리 (설명 툴팁 추가)
-      : 앞자리 입력 시 자동으로 뒤 입력칸으로 커서 이동
6. 약관 동의 3개 (약관 보기 버튼)
7. SMS 동의 체크 (설명 툴팁 추가)
8. EM 동의 체크 (설명 툴팁 추가)
9. ID 확인과 필수 조건 모두 입력 시 가입 버튼 활성화

*/
function maxLengthCheck (object) {
	
	if (object.value.length > object.maxLength){
		object.value = object.value.slice(0, object.maxLength);
	}    
}

/* 
Name				: chkPassword
Desc				: Verify password contains 
Input Param Type	: none
Return Type			: Boolean
*/
function chkPassword () {
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
}

/* 
Name				: chkEmail
Desc				: Verify that the e-mail is valid.
Input Param Type	: none
Return Type			: Boolean
*/
function chkEmail () {
	var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	var $email = $("#accEm");
	
	if (!$email.val()) {
		alert('이메일주소를 입력 해 주세요');
		
		$email.focus();
		
		return false;
	} else {
		if (!regEmail.test($email.val())) {
			alert('이메일 주소가 유효하지 않습니다');
			
			$email.focus();
			
			return false;
		}
	}
	
	return true;
}

/* 
Name				: chkWSandSC
Desc				: Check input parameter contains white space or special charactor.
					  If input parameter contains white space or special charactor 
					  return false, otherwise true.
Input Param Type	: String(key)
Return Type			: Boolean
*/
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

/* 
Name				: hasWS
Desc				: Check input parameter contains white space.
					  If input parameter contains white space return true, otherwise false.
Input Param Type	: String(key)
Return Type			: Boolean
*/
function hasWS (key) {
	var	str_space 	= /\s/;
	
	if (str_space.exec(key)) {
	    return true;
	}
	
	return false;
}

/* 
Name				: chkCharLength
Desc				: Verify that the key value is greater than min and less than max.
					  If key value greater than min and less than max return true, 
					  otherwise false.
Input Param Type	: Int(min), Int(max), String(key)
Return Type			: Boolean
*/
function chkCharLength (min, max, key) {
	
	if (key.length >= min && key.length <= max) {
		return true;
	}
	
	if (min === max) {
		alert(min + "자리의 값을 입력하세요.");
	} else {
		alert("최소 " + min + "이상 최대 " + max + "이하의 값을 입력해주세요.");
	}
	
	return false;
}

/* 
Name				: tocheckpw2
Desc				: Verify that password1 and password2 are the same.
Input Param Type	: none
Return Type			: Boolean
*/
function tocheckpw2() {
	var pw = document.getElementById("accPwNew").value;
	
	var pwck = document.getElementById("accPwOld").value;
	
	var $pwsame = $("#pwsame");
	
	if (pw != pwck) {
		$pwsame.css("height", "20px");
		
		$pwsame.css("margin-bottom", "20px");
		
		document.getElementById('pwsame').innerHTML = '입력한 비밀번호 및 비밀번호 확인이 서로 다릅니다.';
		
		return false;
	} else {
		$pwsame.css("height", "0px");
		
		$pwsame.css("margin-bottom", "0px");
		
		document.getElementById('pwsame').innerHTML = '';
		
		return true;
	}
}

var registFunc = {
		key	  	: "",
		keyChk	: false,
		
		check 	: function() {		
			that = this;
			
			$("#email_check").click(function(){
				alert("이메일 전송시간은 2~3분 이 소요됩니다.");
				
				var email = $("#accEm").val();
				var param = $("#accEm").val();		
				
				console.log(param);
				
				$.ajax({
					type		: "POST",
					url			: "emailCheck.do",
					data		: param ,
					dataType	: "text",
					contentType : "application/json",			
					success		: function(data) {				
						var jObj = JSON.parse(data);
						
						that.key = jObj.key;
						console.log(that.key);
					}
				});
				$("#emailDiv").show(500);	
				$("#valueChk").show(500);
				$("#email_check").hide(500);
				
			});
		},
		
		keyCheck : function(){
			that = this;

			$("#valueChk").click(function(){
				if(that.key === $("#keyValue").val()){
					alert("인증되었습니다.");
					that.keyChk = true;
					$("#emailDiv").hide(100);
				} else {
					alert("인증키값을 다시한번 확인하여 주세요.");
					$('#keyValue').focus();
				}
			});
		},
		
		lastChk : function(){
			
		}
}
		

$(document).ready(function(){
	
	$("#emailDiv").hide();
	$("#valueChk").hide();
	
	$("#account_check").click(function(){
		var idValue = $("#accId").val();
		
		if (chkWSandSC(idValue)) {
			$.ajax({
				type		: "POST",
				url			: "id_check.do", 
				data		: {"id" : idValue}, 
				async		: false, 
				success		: function (data)	{

					if ((data.result) === "SUCCESS" && data.id.length === 0) {
						alert("사용 할 수 있는 ID 입니다.");
						
						$("#accId").attr("value", "true");
					} else if (data.result === "FALSE") {
						alert("ID 형식이 잘못되었습니다.");
						
						$("#accId").attr("value", "");
					} else {
						alert("해당 ID는 사용 할 수 없습니다.");
						
						$("#accId").attr("value", "");
					}
				}
			});
		}
	});
	
	/* ID 영역 키 입력 시 value "" */
	$("#accId").keydown(function () {
		$("#accId").attr("value", "");
	});
	
	/* 가입버튼 클릭 */
	$("#create_btn").click(function () {
		var $create_cus = $("#create_customer");
		
		var accId		= $("#accId").attr("value"), 
			accNm		= $("#accNm").attr("value"), 
			accPwNew	= $("#accPwNew").attr("value"), 
			accPwOld	= $("#accPwOld").attr("value"), 
			accEm		= $("#accEm").attr("value"), 
			accPn1		= $("#accPn1").attr("value"), 
			accPn2		= $("#accPn2").attr("value"), 
			accPn3		= $("#accPn3").attr("value"), 
			accAg1		= $("#accAg1").val(), 
			accAg2		= $("#accAg2").val(), 
			accAg3		= $("#accAg3").val(), 
			accImSms	= $("#accImSms").val(), 
			accImEm		= $("#accImEm").val();
		
		if (!accId) {
			alert("ID 중복확인 해주세요.");
		} else if (!accNm) {
			alert("이름을 형식에 맞게 작성해주세요.");
		} else if (!accPwNew) {
			alert("비밀번호를 형식에 맞게 작성해주세요.");
		} else if (!accPwOld) {
			alert("비밀번호와 비밀번호확인의 입력값이 다릅니다.");
		} else if (!accPn1) {
			alert("전화번호를 형식에 맞게 작성해주세요.");
		} else if (!accPn2) {
			alert("전화번호를 형식에 맞게 작성해주세요.");
		} else if (!accPn3) {
			alert("전화번호를 형식에 맞게 작성해주세요.");
		} else if (!accEm) {
			alert("E-Mail을 형식에 맞게 작성해주세요.");
		} else if (accAg1 === "N" || accAg2 === "N" || accAg3 === "N") {
			alert("약관 동의를 확인해주세요.");
		} else {
			$create_cus.attr("action", "user_register.do");
			$create_cus.attr("method", "post");
			
			$create_cus.submit();
		}
	});
	
	/* 이름 영역 변경 시 2~15 사이의 값 확인 성공하면 true 입력 */
	$("#accNm").change(function () {
		var $accNm = $("#accNm");
		
		var key = $accNm.val();
		
		if (chkCharLength(2, 15, key) == true && chkWSandSC(key) == true) {
			$accNm.attr("value", "true");
		} else {
			$accNm.attr("value", "");
			
			$accNm.focus();
		}
	});
	
	/* 비밀번호 영역 변경 시 조건 체크 */
	$("#accPwNew").change(function () {
		var $accPwNew = $("#accPwNew");
		
		if (chkPassword()) {
			$accPwNew.attr("value", "true");
		} else {
			$accPwNew.attr("value", "");
		}
	});
	
	/* 비밀번호 확인 영역 변경 시 조건 체크 */
	$("#accPwOld").change(function () {
		var $accPwOld = $("#accPwOld");
		
		if (tocheckpw2()) {
			$accPwOld.attr("value", "true");
		} else {
			$accPwOld.attr("value", "");
			
			alert("입력한 비밀번호와 다릅니다.");
		}
	});
	
	/* 이매일 영역 변경 시 유효값 확인 후 성공하면 true 입력 */
	$("#accEm").change(function () {
		var $accEm = $("#accEm");
		
		if (chkEmail()) {
			$accEm.attr("value", "true");
		} else {
			$accEm.attr("value", "");
		}
	});
	
	/* 폰번호 입력 시 다음으로 커서 이동 */
	$(".accPn").keyup (function () {
		var charLimit = $(this).attr("maxlength");
		
		if (this.value.length >= charLimit) {
			$(this).next('.accPn').focus();
			
			return false;
		}
	});
	
	/* 폰번호 입력 시 빈칸 확인 */
	$("#accPn1").change(function () {
		var $accPn = $("#accPn1");
		
		var key = $accPn.val();
		
		if (chkCharLength(3, 3, key)) {
			$accPn.attr("value", "true");
		} else {
			$accPn.attr("value", "");

			$accPn.focus();
		}
	});
	$("#accPn2").change(function () {
		var $accPn = $("#accPn2");
		
		var key = $accPn.val();
		
		if (chkCharLength(4, 4, key)) {
			$accPn.attr("value", "true");
		} else {
			$accPn.attr("value", "");

			$accPn.focus();
		}
	});
	$("#accPn3").change(function () {
		var $accPn = $("#accPn3");
		
		var key = $accPn.val();
		
		if (chkCharLength(4, 4, key)) {
			$accPn.attr("value", "true");
		} else {
			$accPn.attr("value", "");
			
			$accPn.focus();
		}
	});
	
	/* 필수 이용 약관 체크 시 "Y" 값 입력, 비체크시 "N"값 입력 */
	$("#accAg1_input").change(function () {
		
		if ($("#accAg1_input").is(":checked")) {
			$("#accAg1").attr("value", "Y");
		} else {
			$("#accAg1").attr("value", "N");
		}
	});
	$("#accAg2_input").change(function () {
			
		if ($("#accAg2_input").is(":checked")) {
			$("#accAg2").attr("value", "Y");
		} else {
			$("#accAg2").attr("value", "N");
		}
	});
	$("#accAg3_input").change(function () {
		
		if ($("#accAg3_input").is(":checked")) {
			$("#accAg3").attr("value", "Y");
		} else {
			$("#accAg3").attr("value", "N");
		}
	});
	
	/* SMS 광고 동의 체크 시 "Y" 값 입력, 비체크시 "N"값 입력 */
	$("#accImSms_input").change(function () {
		
		if ($("#accImSms_input").is(":checked")) {
			$("#accImSms").attr("value", "Y");
		} else {
			$("#accImSms").attr("value", "N");
		}
	});
	
	/* E-MAIL 광고 동의 체크 시 "Y" 값 입력, 비체크시 "N"값 입력 */
	$("#accImEm_input").change(function () {
		
		if ($("#accImEm_input").is(":checked")) {
			$("#accImEm").attr("value", "Y");
		} else {
			$("#accImEm").attr("value", "N");
		}
	});
	
	registFunc.check();
	registFunc.keyCheck();
})
</script>


	<!-- Main Content -->
	<div class="page-container" id="PageContainer">
		<main class="main-content" id="MainContent" role="main">
			<section class="collection-heading heading-content ">
				<div class="container">
					<div class="row">
						<div class="collection-wrapper">
							<h1 class="collection-title"><span>회원 가입</span></h1>
							<div class="breadcrumb-group">
								<div class="breadcrumb clearfix">
									<span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb">
										<a href="./main.do" title="Bridal 1" itemprop="url">
											<span itemprop="title">Home</span>
										</a>
									</span>
									<span class="arrow-space">></span>
									<span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb">
										<a href="./register.do" title="Create Account" itemprop="url">
											<span itemprop="title">Create Account</span>
										</a>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section class="register-content">
				<div class="register-wrapper">
					<div class="container">
						<div class="row">
							<div class="register-inner">
								<div id="customer-register">
									<div id="register" class="">
										<form name="create_customer" id="create_customer" accept-charset="UTF-8">
											<div class="clearfix large_form" id="div_id">
												<label for="accId" class="label">ID</label>
												<input type="text" value="" name="accId" id="accId" class="text" size="30">
												<input class="btn" name="account_check" id="account_check" value="중복확인">
											</div>
											<div class="clearfix large_form">
												<label for="accNm" class="label">이름</label>
												<input type="text" value="" name="accNm" id="accNm" class="text" size="30" maxlength="15">
											</div>
											<div class="clearfix large_form">
												<label for="accPwNew" class="label">비밀번호</label>
												<input type="password" value="" name="accPwNew" id="accPwNew" class="text" size="30">
											</div>
											<div class="clearfix large_form">
												<label for="accPwOld" class="label">비밀번호 확인</label>
												<input type="password" value="" name="accPwOld" id="accPwOld" class="text" size="30">
											</div>
											<p id="pwsame" style="color:red; height: 0px; margin: 0 0 0 0"></p>
											<div class="clearfix large_form">
												<label for="accPn" class="label">휴대폰 번호</label>
												<input style="width:32%;" type="number" value="" name="accPn1" id="accPn1" class="text accPn" max="999" maxlength="3" oninput="maxLengthCheck(this)">
												<input style="width:33%;" type="number" value="" name="accPn2" id="accPn2" class="text accPn" max="9999" maxlength="4" oninput="maxLengthCheck(this)">
												<input style="width:33%;" type="number" value="" name="accPn3" id="accPn3" class="text accPn" max="9999" maxlength="4" oninput="maxLengthCheck(this)">
											</div>
											<div class="clearfix large_form" id="div_email">
												<label for="accEm" class="label">E-Mail</label>
												<input type="text" value="" name="accEm" id="accEm" class="text" size="30">
												<input class="btn" name="email_check" id="email_check" value="전송">
											</div>
											<div class="clearfix large_form"  id="emailDiv">
								                <label for="accKey" class="label">인증번호</label>
							                    <input type="text" class="form-control" id="keyValue"> 
							                    <input type="button" id="valueChk" class="btn btn-default" value="확인"> 
								            </div>
											<div class="clearfix large_form" style="height: 25px">
												<label for="accAg1_input" class="label">
													<input type="checkbox" name="accAg1_input" id="accAg1_input" style="width:10px;">
													<input type="hidden" value="N" name="accAg1" id="accAg1">
													<span>(필수) </span>펫블리 이용약관
													<a style="text-decoration: underline; color: blue; font-size: 12px;font-family: Poppins;font-weight: 500;" href="#">전체보기</a>
												</label>
											</div>
											<div class="clearfix large_form" style="height: 25px">
												<label for="accAg2_input" class="label">
													<input type="checkbox" name="accAg2_input" id="accAg2_input" style="width:10px;">
													<input type="hidden" value="N" name="accAg2" id="accAg2">
													<span>(필수) </span>전자금융거래 이용약관
													<a style="text-decoration: underline; color: blue; font-size: 12px;font-family: Poppins;font-weight: 500;" href="#">전체보기</a>
												</label>
											</div>
											<div class="clearfix large_form" style="height: 25px">
												<label for="accAg3_input" class="label">
													<input type="checkbox" name="accAg3_input" id="accAg3_input" style="width:10px;">
													<input type="hidden" value="N" name="accAg3" id="accAg3">
													<span>(필수) </span>개인정보 수집 및 이용
													<a style="text-decoration: underline; color: blue; font-size: 12px;font-family: Poppins;font-weight: 500;" href="#">전체보기</a>
												</label>
											</div>
											<div class="clearfix large_form" style="margin-top: 10px; height: 25px">
												<label for="accImSms_input" class="label">
													<input type="checkbox" name="accImSms_input" id="accImSms_input" style="width:10px;">
													<input type="hidden" value="N" name="accImSms" id="accImSms">
													<span>(선택) </span>SMS 수신 동의
												</label>
											</div>
											<div class="clearfix large_form" style="height: 25px">
												<label for="accImEm_input" class="label">
													<input type="checkbox" name="accImEm_input" id="accImEm_input" style="width:10px;">
													<input type="hidden" value="N" name="accImEm" id="accImEm">
													<span>(선택) </span>E-Mail 수신 동의
												</label>
											</div>
											<div class="action_bottom" style="margin-top: 20px;">
 												<input class="btn" type="button" value="가입" id="create_btn">
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</main>
	</div>