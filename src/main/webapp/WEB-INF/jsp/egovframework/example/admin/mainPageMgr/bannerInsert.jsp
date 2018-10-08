<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<title>PETvely</title>

<link href="./assets/stylesheets/bootstrap.min.css" rel="stylesheet"
	type="text/css" media="all">
<link href="./admin/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
<link href="./admin/dist/css/sb-admin-2.css" rel="stylesheet">
<link href="./assets/stylesheets/font-awesome.min.css" rel="stylesheet"
	type="text/css" media="all">

<script type="text/javascript" src="./assets/javascripts/jquery.min.js"></script>
<script type="text/javascript"
	src="./assets/javascripts/bootstrap.min.js"></script>
<script src="./admin/vendor/metisMenu/metisMenu.js"></script>
<script src="./admin/dist/js/sb-admin-2.js"></script>

<script type="text/javascript">

var selectBox = {
		
		displayChildSelectBox : function(data) {
			
			if(data.length > 0) {
				$.each(data, function(i, item) {  
					
					var optionStr = "<option value=" + item.banTypeCd + " data-slidechk=" + item.banTypeSlide + ">" +
									item.banTypeNm + "</option>";
					
					$("#bannerChildBox").removeAttr("disabled");
					$("#bannerChildBox").append(optionStr);
				});
			} else {
				$("#bannerChildBox").attr("disabled", "disabled");
				$("#bannerChildBox").append("<option value='none'>없음</option>");
			}
		},
		
		parentSelectBoxChange : function() {
			$("#bannerSelectBox").change(function() {
				var valBanLocCd = this.value; //banLocCd 들어옴
				var form = {param : valBanLocCd}; // ajax object

				$("#bannerChildBox").children().remove();
				
				$.ajax({
					type	: "POST",
					url		: "getBannerTypeSelectBox.do",
					data	: JSON.stringify(form),
					contentType : "application/json",
					async	: false, // ajax 통신이 끝날때까지 페이지를 block 시킨다
					success	: function(data) {

						if(data.result == "SUCCESS") {
							$("#bannerChildBox").append("<option value='none'>선택하세요</option>");
							selectBox.displayChildSelectBox(data.banTypeList);
						} else {
							$("#bannerChildBox").attr("disabled", "disabled");
							$("#bannerChildBox").append("<option value='none'>없음</option>");
						}
					}
				});		
			});
		}		
};

var uploadFunc = {
	
	readURL : function(data) {
		console.log("파일업로드");
		console.log(data);
		console.log(data.files);
		console.log(data.files[0]);
		console.log(data.files.length);
		if(data.files.length > 0) {
			var fileName = data.files[0].name;
			var ext = fileName.substr(fileName.length - 3, fileName.length);
			console.log("파일이름");
			console.log(ext);
			if( /\.(jpe?g|png|gif)$/i.test(fileName) ){
				// 이미지 파일인 경우
				var fileReader = new FileReader(); // 파일의 내용을 읽어오는 객체
			
				fileReader.readAsDataURL(data.files[0]); // 파일 읽음
				
				fileReader.onload = function(e) {
					console.log("로드 결과");
					console.log(e.target.result);
					if(data.name === "banImg1") {
						$("#bannerImage").attr("src", e.target.result);
					}
				}
			} else {
				// 아니면
				alert("이미지 파일을 올려주세요(jpg,jpeg,gif,png)");
				data.value = "";
				return false;
			}
		}
	},
	
	bannerBtnClickCheck : function() {
		$("#createBannerBtn").click(function() {

			var $insertBannerForm = $("#insertBannerForm");
			
			// 폼에 bannerSelectBox 에 있는 text를 싣는다
			var banLocNm = $("#bannerSelectBox option:checked").text();
			var banTypeNm = $("#bannerChildBox option:checked").text();
			var banSlideChk = $("#bannerChildBox option:checked").data("slidechk");

			var banLocNmForm = '<input type="hidden" id="banLocNm" name="banLocNm" value="'+ banLocNm +'"/>';
			var banTypeNmForm = '<input type="hidden" id="banTypeNm" name="banTypeNm" value="'+ banTypeNm +'"/>';
			var banSlideChkForm = '<input type="hidden" id="banSlide" name="banSlide" value="'+ banSlideChk +'"/>';
			
			
			$insertBannerForm.append(banLocNmForm);
			$insertBannerForm.append(banTypeNmForm);
			$insertBannerForm.append(banSlideChkForm);
			
			$insertBannerForm.attr("action", "bannerAdd.do");
			
			$insertBannerForm.submit();
		});
	}
};



$(document).ready(function() {
	selectBox.parentSelectBoxChange();
	
	$("#banImg1").change(function() {
		
		uploadFunc.readURL(this);
		uploadFunc.bannerBtnClickCheck();
	});
	
	
});
</script>
<div style="background-color: white;">
	<div class="row">
		<div class="col-xs-12">
			<h1 class="page-header">배너 추가</h1>
		</div>
	</div>
	<div class="col-xs-12">
		<div class="panel panel-default">
			<div class="panel-heading">배너 정보 입력하세요.</div>
			<form name="insertBannerForm" id="insertBannerForm" accept-charset="UTF-8"
				enctype="multipart/form-data" method="post">
			<input type="hidden" id="bannerMgrFormType" name="bannerMgrFormType" value="insert" />
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-6">
						<label>배너 이름</label> 
						<input class="form-control" id="banNm" name="banNm" value="" />
					</div>
				</div>
				<div class="row">
					<div class="col-xs-4">
						<label>배너의 위치 및 종류 지정</label>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-4">
						<select class="form-control" id="bannerSelectBox" name="banLocCd" >
							<option value="">전체</option>
					       	<c:forEach items="${ctBoxList}" var="ctBoxList">
					       		<option value="${ctBoxList.banLocCd}"><c:out value="${ctBoxList.banLocNm}"/></option>	
					       	</c:forEach>								
						</select>
					</div>
					<div class="col-xs-4">
						<select class="form-control" id="bannerChildBox" name="banTypeCd" disabled>
							<option value="none">없음</option>
						</select>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-6">
						<label>이미지 첨부</label> 
						<input type="file" value="" name="banImg1" id="banImg1">
						<img id="bannerImage" width=auto height=auto style="max-width:700px; max-height:300px" />
					</div>
				</div>
				<div class="row">
					<div class="col-xs-6" style="padding-top: 20px;">
						<a class="btn btn-primary" id="createBannerBtn" href="#">등록</a>
					</div>
				</div>
			</div>
		</form>
		</div>
	</div>
</div>






