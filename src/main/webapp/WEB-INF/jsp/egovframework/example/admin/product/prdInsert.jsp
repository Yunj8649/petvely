<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- Main bar -->

<script type="text/javascript">
/* 추가해야할 것
 * 1. 브랜드 테이블
 * 2. 상품명 빈 칸 허용X -> 해결
 * 3. 카테고리 value가 null이면 submit X -> 해결
 * 4. 파일 업로드 -> 해결
 * 5. 중간에 submit해서 경고창이 뜨면 모든 칸이 지워지는 문제
 * 6. 브랜드, 카테고리 추가?
				 */
 var CommonJsUtil = 
{
    isEmpty : function(val) {
        
        if (null == val || null === val || "" == val ||
              val == undefined || typeof(val) == undefined ||
              "undefined" == val || "NaN" == val) {
            
            return true;
        } else {
            return false;
        }
    },
    
    isNumeric : function(val) {

       if (/[^0-9]/.test(val)) {
          
            return false;
        } else {
            return true;
        }
    }
}; 
 
/** category selectbox **/
 var select = {
		
	displayChildSelecbox : function(data) {
		
		if (data.length > 0) { 
			$.each(data, function(i, item){
				var optionStr = "<option value=" + item.subCtCd + ">" +
				item.subCtNm + "</option>";
				$("#subCtSelectBox").append(optionStr);
			});
			
		} else {
			$("#subCtSelectBox").children().remove();
			$("#subCtSelectBox").append("<option value='none'>없음</option>");
			
			$("#subCtSelectBox").attr("disabled", "disabled");
		}
	}
}; 

/*파일 업로드 시 이미지 파일인지 확인*/
function fnChkImageFile(arg) {
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
}


function maxLengthCheck (object) {
	
	if (object.value.length > object.maxLength){
		object.value = object.value.slice(0, object.maxLength);
	}    
}

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
	
	if (min === max) {
		alert(min + "자리의 값을 입력하세요.");
	} else {
		alert("최소 " + min + "이상 최대 " + max + "이하의 값을 입력해주세요.");
	}
	
	return false;
}

$(document).ready(function(){
	
 	$("#subCtSelectBox").attr("disabled", "disabled"); 
 	
	$("#ctSelectBox").change(function(){

		$("#subCtSelectBox").children().remove();
		var thisParam = this.value;
		var form = {param : thisParam}; 
		
		$.ajax({
			type		: "POST",
			url 		: "categorySelect.do",
 			data 		: JSON.stringify(form),
			contentType : "application/json",
			success 	: function(data){	
				var jObj = JSON.parse(data);
				if(jObj.result === "SUCCESS") {
					if (jObj.list != undefined){
						if(this.value!="none"){
							$("#subCtSelectBox").removeAttr("disabled");
						    $("#subCtSelectBox").append("<option value='none'>카테고리2</option>");
						    select.displayChildSelecbox(jObj.list);
						}
					} else {
						$("#subCtSelectBox").append("<option value=''>없음</option>");
					}
				}
			}
		});
	}); 
	
	$("#create_btn").click(function () {
		var $create_prd = $("#insertPRD");
		
		var prNm		= $("#prNm").val(),
			brdNm		= $("#brdNm").val(),
			ctCd		= $("#ctSelectBox").val(),
			subCtCd		= $("#subCtSelectBox").val(),
			prPrc		= $("#prPrc").val(),
			prCntSto	= $("#prCntSto").val(),
		/*	prImg1		= $("#prImg1").val(),
			prImg2		= $("#prImg2").val(),
			prClr		= $("#prClr").val(), 
			prOpt		= $("#prOpt").val(), 
			prDes1		= $("#prDes1").val(), ****/
			prDes2		= $("#prDes2").val();
		
		if (!prNm) {
			alert("상품 명을 입력해주세요");
			return false;
		} else if (CommonJsUtil.isEmpty(brdNm)) {
			alert("브랜드명을 작성해주세요.::"+brdNm);
			return false;
		} else if (ctCd === "none") {
			alert("카테고리를 선택해주세요.");
			return false;
		} else if (subCtCd === "none") {
			alert("하위 카테고리를 선택해주세요.");
			return false;
		} else if (!CommonJsUtil.isNumeric(prPrc)||CommonJsUtil.isEmpty(prPrc)) {
			alert("상품 가격을 형식에 맞게 작성해주세요.");
			return false;
		} else if (!CommonJsUtil.isNumeric(prCntSto)||CommonJsUtil.isEmpty(prCntSto)) {
			alert("재고를 형식에 맞게 작성해주세요.");
			return false;
		} else if (CommonJsUtil.isEmpty(prDes2)) {
			alert("간략 설명을 작성해주세요.");
			return false;
		} else {
			$create_prd.attr("action", "product_insert.do");
			$create_prd.attr("method", "post");
			$create_prd.submit();
			
		}
	});
	
	$("#prImg1").change(function () {
		readURL(this);
	});
	$("#prImg2").change(function () {
		readURL(this);
	});
	
	function readURL(input){
		if(input.files && input.files[0]){
			var filename = input.files[0].name;
			var ext = filename.substr(filename.length - 3, filename.length);
			
			if(ext != "jpg" && ext != "jpeg" && ext!= "gif" && ext != "png"){
				alert("이미지 파일이 아닙니다. 이미지파일을 선택해주세요.(jpg,jpeg,gif,png)");
				input.value = "" ;
				return false;
			}
			
			var reader = new FileReader(); // 파일의 내용을 읽을 수 있는 객체 생성
			
			reader.readAsDataURL(input.files[0]); //파일 읽기
			
			reader.onload = function(e){
				if(input.name==="prImg1"){
					$("#imgfile").attr("src", e.target.result);
				} else {
					$("#imgfileDetail").attr("src", e.target.result);
				}
			}
		}
	}
	
	/* 상품명 영역 변경 시 1~20 사이의 값 확인 성공하면 true 입력 */
	$("#prNm").change(function () {
		var $prNm = $("#prNm");
		
		var key = $prNm.val();
		
		if (chkCharLength(1, 20, key) == true) {
			$prNm.attr("value", "true");
		} else {
			$prNm.attr("value", "");
			$prNm.focus();
		}
	});
});

</script>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">상품 등록</h1>
			<p id="required"> *&nbsp;는 필수 입력 항목입니다.</p>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="main-content">
				<form name="insertPRD" id="insertPRD" accept-charset="UTF-8" 
					enctype="multipart/form-data" method="post">
					<table width="75%" border="1" cellspacing="1" cellpadding="1">
						<tr>
							<td>상품명&nbsp;<label id="required">*</label> </td>
							<td><input type="text" value="" name="prNm" id="prNm" class="text" size="30"></td>
						</tr>
						<tr>
							<td>브랜드명&nbsp;<label id="required">*</label></td>
							<td><input type="text" value="" name="brdNm" id="brdNm" class="text" size="30"></td>
						</tr>
						<tr>
							<td>카테고리&nbsp;<label id="required">*</label></td>
							<td>
								<select id="ctSelectBox" name="ctCd">
                                  	<option value="none">카테고리1</option>
                                   	<c:forEach items="${ctList}" var="ctList">
                                   		<option value="${ctList.ctCd}">
                                   			<c:out value="${ctList.ctNm}"/>
                                   		</option> 				      		
								   	</c:forEach>   
							   	</select>
							   	<select id="subCtSelectBox" name="subCtCd">
							   	 		<option value="none">없음</option>
							   	</select>
						   	</td>
						</tr>
						<tr>
							<td>색상</td>
							<td><input type="text" value="" name="prClr" id="prClr" class="text" size="30"></td>
						</tr>
						<tr>
							<td>옵션&nbsp;(크기,용량,길이)</td>
							<td>
                            	<input type="text" value="" name="prOpt" id="prOpt" class="text" size="30">
                            </td>
                        <tr>
                            <td>상품 가격&nbsp;<label id="required">*</label></td>
							<td><input type="text" value="" name="prPrc" id="prPrc" class="text" size="30"> </td>
						</tr>
<!-- 								<tr> -->
<!-- 									<td>시작일</td> -->
<!-- 									<td><input type="text" value="" name="prStaDate" id="prStaDate"></td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td>종료일</td> -->
<!-- 									<td><input type="text" value="" name="prEndDate" id="prEndDate"></td> -->
<!-- 								</tr> -->
						<tr>
							<td>재고&nbsp;<label id="required">*</label></td>
							<td><input type="text" value="" name="prCntSto" id="prCntSto"></td>
						</tr>
						<tr>
							<td>대표 이미지</td>
							<td>	
								<input type="file" value="" name="prImg1" id="prImg1">
								<img id="imgfile" width="200" height="200" />
							</td>
						</tr>
						<tr>
							<td>상세 이미지</td>
							<td>
								<input type="file" value="" name="prImg2" id="prImg2">
								<img id="imgfileDetail" width="200" height="200" />
							</td>
						</tr>
						<tr>
							<td>상세 설명</td>
							<td><input type="text" value="" name="prDes1" id="prDes1"></td>
						</tr>
						<tr>
							<td>간략 설명&nbsp;<label id="required">*</label></td>
							<td><input type="text" value="" name="prDes2" id="prDes2"></td>
						</tr>
					</table>
					<div class="action_bottom">
						<input class="btn" type="submit" value="상품 등록" id="create_btn">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
	