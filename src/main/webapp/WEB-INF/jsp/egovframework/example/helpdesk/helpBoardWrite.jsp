<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- @김병직 171207 고객센터 내 1:1게시판 글쓰기 페이지
	사용 css 파일명 : helpdesk.css
 --> 
 <div class="container help-board-write">
    <table class="table table-bordered">
        <thead>
            <caption> 글쓰기 </caption>
       	</thead>
        <tbody>
            <form action="" method="post" encType="multiplart/form-data">
                <tr>
                    <th>제목</th>
                    <td><input type="text" placeholder="제목" name="subject" class="form-control"/></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td><textarea cols="10" placeholder="내용" name="content" class="form-control"></textarea></td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td><input type="file" placeholder="파일을 선택" name="filename" class="form-control"/></td>
                </tr>
                <tr>
			        <th>비밀번호</th>
                    <td><input type="password" placeholder="비밀번호" class="form-control help-board-passwd"/></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="button" value="등록" class="pull-right btn btn-default" onclick="ShowTabex('1')" />
                        <input type="button" value="초기화" class="pull-left"/>
                        <input type="button" value="글 목록" class="pull-right" onclick="ShowTabex('1')"/>
                    </td>
                </tr>
			</form>
        </tbody>
    </table>
  </div>
