<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SmartEditor</title>

<!-- SmartEditor를 사용하기 위해서 다음 js파일을 추가 (경로 확인) -->
<script type="text/javascript" src="./se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<!-- jQuery를 사용하기위해 jQuery라이브러리 추가 -->
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script> -->

<script type="text/javascript">

	var oEditors = [];
	$(function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "evCtt", //textarea에서 지정한 id와 일치해야 합니다. 
			//SmartEditor2Skin.html 파일이 존재하는 경로
			sSkinURI : "./se2/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,
				fOnBeforeUnload : function() {

				}
			},
			
			fOnAppLoad : function() {
				var recievedData = "";

				recievedData = '<c:out value='${eventDetailCtt}' escapeXml='false'/>';

				//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
				oEditors.getById["evCtt"].exec("PASTE_HTML", [ recievedData ]);
			},
			
			fCreator : "createSEditor2"
		});

		//저장버튼 클릭시 form 전송

		$("#event_save").click(function() {
			oEditors.getById["evCtt"].exec("UPDATE_CONTENTS_FIELD", []);
			
			if ($("#evTtl").val() != null && $("#evTtl").val() != "") {
				
				if ($("#evCtt").val() != null && $("#evCtt").val() != "") {
					var $eventMgrBoard	= $("#eventMgr_board");
					var evWtrId			= $("#loginId").attr("value");
					var evWtrNm			= $("#loginNm").attr("value");
					var tagForevWtrId	= '<input type="hidden" id="evWtrId" name="evWtrId" value="' + evWtrId + '"/>';
					var tagForevWtrNm	= '<input type="hidden" id="evWtrNm" name="evWtrNm" value="' + evWtrNm + '"/>';

					$eventMgrBoard.append(tagForevWtrId);
					
					$eventMgrBoard.append(tagForevWtrNm);

					$eventMgrBoard.attr("action", "eventMgrSave.do");
					
					$eventMgrBoard.submit();
				} else {
					alert("내용을 입력 해주세요.");
					
					$("#evCtt").focus();
				}
			} else {
				alert("제목을 입력 해주세요.");
				
				$("#evTtl").focus();
			}
		});
	});

var imageUpload = 
{
	fnChkImageFile : function (arg) { /*파일 업로드 시 이미지 파일인지 확인*/
		imgFile = arg.value;

		var extArray = new Array(".gif", ".jpg", ".jpeg", ".png");

		while (imgFile.indexOf("\\") != -1)
			imgFile = imgFile.slice(imgFile.indexOf("\\") + 1);

		ext = imgFile.slice(imgFile.indexOf(".")).toLowerCase();

		isImage = false;

		for (var i = 0; i < extArray.length; i++) 
		{
			if (extArray[i] == ext) 
			{ 
				isImage = true; 
				break; 
			}
		}

		return isImage;
	}, 
	
	readURL : function (input){
		
		if (input.files && input.files[0]) {
			var filename = input.files[0].name;
			var ext = filename.substr(filename.length - 3, filename.length);
			
			if(ext != "jpg" && ext != "jpeg" && ext!= "gif" && ext != "png"){
				alert("이미지 파일이 아닙니다. 이미지파일을 선택해주세요.(jpg,jpeg,gif,png)");
				input.value = "";
				return false;
			}
			
			var reader = new FileReader(); // 파일의 내용을 읽을 수 있는 객체 생성
			
			reader.readAsDataURL(input.files[0]); //파일 읽기
			
 			reader.onload = function(e){
				if (input.name === "evFle_jsp") {
					/* var	imgtag = ""; 
					
					imgtag += '<img src="' + e.target.result + '" width="200" height="200" />';
					
					console.log(imgtag);

					oEditors.getById["evCtt"].exec("PASTE_HTML", [ imgtag ]); */
				}
			}
		}
	},
	
	ajaxUpload : function (input) {
		$("#evFle").wrap('<form id="eventMgr_img" action="eventMgr_img.do" method="post" enctype="multipart/form-data"></form>');

		var formData = new FormData($("#eventMgr_img")[0]);
		
		if (input.files && input.files[0]) {
			var filename = input.files[0].name;
			var ext = filename.substr(filename.length - 3, filename.length);
			
			if(ext != "jpg" && ext != "jpeg" && ext!= "gif" && ext != "png"){
				alert("이미지 파일이 아닙니다. 이미지파일을 선택해주세요.(jpg,jpeg,gif,png)");
				input.value = "";
				return false;
			}
			
			$.ajax({
	            type : 'post', 
	            url : 'eventMgr_img.do', 
	            data : formData, 
	            processData : false, 
	            contentType : false, 
	            success : function(result) {
					var	imgtag = ""; 
					
					imgtag += '<img src="' + result + '" width="200" height="200" />';

					oEditors.getById["evCtt"].exec("PASTE_HTML", [ imgtag ]);
	            }, 
	            
 	            error : function(error) {
	                alert("파일 업로드에 실패하였습니다.");
	            }
	        });
		}
	}
}

var checkVal = {
	chkWSandSC : function (key) {
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
	}, 
	
	chkCharLength : function (min, max, key) {
		
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
}

$(document).ready(function() {
	$("#board_config").addClass("collapse");
	$("#board_config").addClass("in");
	$("#event_board").addClass("active");
	$("#evFle").change(function () {
		imageUpload.ajaxUpload(this);
	});
})
</script>
</head>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Event 글 작성</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<form id="eventMgr_board" method="post" enctype="multipart/form-data">
		<table width="100%">
			<c:choose>
           		<c:when test="${eventItem[0].evTtl != null}">
			        <tr>
			            <td>제목</td>
		            	<td><input type="text" id="evTtl" name="evTtl" style="width:650px" value="<c:out value="${eventItem[0].evTtl }" />"/></td>
            		</tr>
            		<tr>
			        	<td>시작일</td>
			        	<td><input type="text" id="evStaDate" name="evStaDate" style="width:650px" value='<fmt:formatDate value="${eventItem[0].evStaDate }" pattern="yyyy-MM-dd hh:mm:ss"/>' placeholder="ex : 2018-02-15 22:18:50"/></td>
			        </tr>
			        <tr>
			        	<td>종료일</td>
			        	<td><input type="text" id="evEndDate" name="evEndDate" style="width:650px" value="<fmt:formatDate value="${eventItem[0].evEndDate }" pattern="yyyy-MM-dd hh:mm:ss"/>" placeholder="ex : 2018-02-15 22:18:50"/></td>
			        </tr>
			        <input type="hidden" id="evSeq" name="evSeq" value="${eventItem[0].evSeq }"/>
			        <tr>
		            	<td>이미지첨부</td>
		            	<td><input type="file" id="evFle" name="evFle_jsp"/></td>
		            </tr>
            	</c:when>
           		<c:otherwise>
           			<tr>
	           			<td>제목</td>
		            	<td><input type="text" id="evTtl" name="evTtl" style="width:650px"/></td>
	            	</tr>
	            	<tr>
		            	<td>시작일</td>
		            	<td><input type="text" id="evStaDate" name="evStaDate" style="width:650px" placeholder="ex : 2018-02-15 22:18:50"/></td>
	            	</tr>
	            	<tr>
	            		<td>종료일</td>
		            	<td><input type="text" id="evEndDate" name="evEndDate" style="width:650px" placeholder="ex : 2018-02-15 22:18:50"/></td>
		            </tr>
		            <tr>
		            	<td>이미지첨부</td>
		            	<td><input type="file" id="evFle" name="evFle_jsp"/></td>
		            </tr>
	            </c:otherwise>
            </c:choose>
	        <tr>
	            <td>내용</td>
	            <td>
	                <textarea rows="10" cols="30" id="evCtt" name="evCtt" style="width:650px; height:350px; "></textarea>
	            </td>
	        </tr>
	        <tr>
	        	<td></td>
	            <td>
	            	<a href="#" id="event_save" class="btn btn-default">저장</a>
	                <a href="eventMgr.do" class="btn btn-default" >취소</a>
	            </td>
	        </tr>
		</table>
	</form>
</div>