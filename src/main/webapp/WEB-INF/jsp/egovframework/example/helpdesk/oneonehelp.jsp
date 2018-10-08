<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- @김병직 171207 고객센터 내 1:1 게시판
	글쓰기 버튼만 눌림
	사용 css 파일명 : helpdesk.css
 -->
<div id="onehelp-body" class="page-wrapper">
	<div class="container">
		<table id="onehelp-board" class="table table-hover">
			<thead>
				<tr>
					<th class="board-num">번호</th>
					<th class="board-title">제목</th>
					<th class="board-aut">작성자</th>
					<th class="board-date">날짜</th>
					<th class="board-hit">조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>3</td>
					<td><a href="#" onclick="ShowTabex('3')">배송이 안 와요 ㅡㅡ</a></td>
					<td>비둘기</td>
					<td>2017.12.20</td>
					<td>1</td>
				</tr>
				<tr>
					<td>2</td>
					<td><a href="#" onclick="ShowTabex('3')">재고 문의 재고 문의</a></td>
					<td>비둘기</td>
					<td>2017.12.06</td>
					<td>1</td>
				</tr>
				<tr>
					<td>1</td>
					<td><a href="#" onclick="ShowTabex('3')">배송 문의 드립니다.</a></td>
					<td>비둘기</td>
					<td>2017.10.11</td>
					<td>1</td>
				</tr>
			</tbody>
		</table>
		<a class="btn btn-default pull-right" href="#"
			onclick="ShowTabex('2')">글쓰기</a>
		<div class="text-center">
			<ul class="pagination">
				<li><a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a
					href="#">4</a> <a href="#">5</a></li>
			</ul>
		</div>
	</div>
</div>


