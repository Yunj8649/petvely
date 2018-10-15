<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
$(document).ready(function(){
	$("#show_order").click(function(){
		$("#purchase_complete .detail_complete").slideDown();
	});
		
});

</script>

<div class="container">
	<div class="row">
		<div class="shopify-section" style="margin-top:50px; margin-bottom:50px">
			<div class="detail-content-inner" id="purchase_complete">
				<div class="logo">
					<img src="./assets/images/pet_photo_ver2.png" alt="PETvely">
				</div>
				<div class="complete_text">
					<h1><span style="font-weight:bold">구매</span>가 <span style="color:blue;font-weight:bold">완료</span>되었습니다.</h1>
				</div>
				<div class="detail_complete">
					<h4>구매내역</h4>
					<table>
						<thead>
							<tr>
								<td colspan="2" id="">구매 상품</td>
								<td class="th_one">단가</td>
								<td class="th_one">수량</td>
								<td class="th_one">금액</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td id="prd_img">
									<img src="./assets/images/clean/clean_01.png" alt=""><br>
								</td>
								<td id="prd_name">상품명</td>
								<td class="tb_one">15,000원</td>
								<td class="tb_one">2개</td>
								<td class="tb_one">30,000원</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="complete_btn">
					<a id="show_order" class="btn">구매 내역 보기</a>
					<a href="./main.do" class="btn">확인</a>
				</div>
			</div>
		</div>
	</div>
</div>
	