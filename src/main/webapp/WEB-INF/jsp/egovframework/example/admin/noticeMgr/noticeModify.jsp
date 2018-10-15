<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../cmmn/common_lib.jsp" %>
 <!-- @김병직 171207 고객센터 내 1:1게시판 글쓰기 페이지
	사용 css 파일명 : helpdesk.css
 --> 
<script type="text/javascript">
$(document).ready(function() {
	$("#close_btn").click(function(){
		window.close();
	});
	
	$("#modify_btn").click(function () { 
		var ntTtl		= $("#ntTtl").val(),
			ntCtt		= $("#ntCtt").val();
		
		if(!ntTtl.trim().length) {
			alert("제목을 입력해 주세요");
		} else if(!ntCtt.trim().length) {
			alert("내용을 입력해 주세요");
		} else {
			var jsonObj 	= {},
				jsonArray	= new Array();
			
			jsonObj.ntSeq = "${getNoticeDetail.ntSeq}";
			jsonObj.ntTtl = ntTtl;
			jsonObj.ntCtt = ntCtt;
			jsonObj.ctrlType = "modify";
			
			jsonArray[0] = jsonObj;
			
			$.ajax({
				type	: "POST",
				url		: "ctrlNoticeMgr.do",
				data	: {"param" : JSON.stringify(jsonArray)},
				success : function(result) {
					
					if(result === "SUCCESS") {
						alert("수정 성공");
						//수정후 부모창 새로고침 & 팝업 끄기
						opener.parent.location.reload();
						window.close();
					}
				}
			});	
		}
	});
	
});
</script>

 
 <div class="container help-board-write">
    <table class="table table-bordered">
        <thead>
            <caption> 공지 수정 </caption>
       	</thead>
        <tbody>
            <form name="modify_notice" id="modify_notice" accept-charset="UTF-8">
                <tr>
                    <th>제목</th>
                    <td><input type="text" value="${getNoticeDetail.ntTtl}" id="ntTtl" placeholder="제목" 
                    		name="subject" class="form-control"/></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td style="text-align:left"><c:out value="${getNoticeDetail.ntWtrId}" /></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><textarea cols="10" id="ntCtt" name="ntCtt" placeholder="내용"  
                    		class="form-control"><c:out value="${getNoticeDetail.ntCtt}" /></textarea></td>
                </tr>
<!--                 
                <tr>
                    <th>첨부파일</th>
                    <td><input type="file" placeholder="파일을 선택" name="filename" class="form-control"/></td>
                </tr>
--> 
<!--             
				<tr>
			        <th>비밀번호</th>
                    <td><input type="password" placeholder="비밀번호" class="form-control help-board-passwd"/></td>
                </tr> 
-->
    	        <tr>
                    <td colspan="2">
                        <input type="button" value="닫기" id="close_btn" class="pull-right" onclick=""/>
                        <input type="button" value="수정" id="modify_btn" class="pull-right btn btn-default" onclick=""/>
                    </td>
                </tr>
			</form>
        </tbody>
    </table>
  </div>
