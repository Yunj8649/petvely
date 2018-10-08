<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 	
    
<link href="./assets/stylesheets/cart.css" rel="stylesheet" type="text/css" media="all">

<script type="text/javascript">
var cartMap = "${cartMap.cartList}";
var cartCount = "${cartMap.count}";
var Basket = {
    modifyQuantity : function(sId) {
        // 수량 유효성 검사 (빈값, 숫자, 숫자가 1이상인지 체크)
        alert(sId);
        alert("aaa");
        if (this._checkQuantity() == false) {
            alert("수량은 1 이상이어야 합니다.");
            return;
        }
        
        var aParam = {};
        
        for (var i = 0, n = parseInt(cartCount); i<n; i++) {
            var iIndex = sId.split("_")[2];
            // index값 가져오기(변경버튼을 클릭했느냐 아니면 +/- 버튼을 클릭했는냐  판단을 위한 값임)
            // index값이 있다는것은  +/- 버튼 클릭했을경우임.
            if (typeof(sId) != "undefined" && sId != null) {
                if (isNaN(iIndex) == false && iIndex != i) {
                    continue;
                }
            }
        }

        aParam.prCd = $("#prCd_id_"+iIndex).val();
        aParam.crCd = $("#crCd_id_"+iIndex).val();
        aParam.crQty = $("#crQty_id_"+iIndex).val();
        aParam.crOpt = $("#crOpt_id_"+iIndex).val();
        aParam.crClr = $("#crClr_id_"+iIndex).val();
        alert(aParam);
        /* 
        // 최소/최대 구매수량 체크
        // 전체 체크는 이 위치에서 수행할 필요가?
        if (bIsNewProduct == false ) {
            if (this.isAbleQuantityForMaxMin(true) == false) {
                return;
            }
        } */
       
		$.ajax({
			type	: "POST",
			url		: "updateCart.do",
			data	: {"param" : aParam},
			async	: false,
			success : function(result) {
				if(result === "SUCCESS") {
					alert("수량이 변경되었습니다.");
			        //$("#crQty_id_"+iIndex).value = crQty;
				}
			}
		});
    },
    
    _checkQuantity : function() {
        var bReturn = true;
        $('[id^="quantity_id_"]').each(function() {
            var iQnty = $.trim($(this).val());
            $(this).val(iQnty);

            if (isNaN(iQnty) == true || iQnty < 1) {
                $(this).select();
                bReturn = false;
                return false;
            }
        });

        return bReturn;
    },
    
    setCheckBasketList: function(sBoxName, oElem)
    {
        if (this._existsBasket(true) == false) return;
        $('input[name="'+ sBoxName +'"]:checkbox').each(function(){
            if ($(oElem).attr('checked')) {
                $(this).attr('checked', true);
            } else {
                $(this).attr('checked', false);
            }
        });
    },
    
    addQuantityShortcut : function(sId, iIdx)
    {	
    	alert("${cartMap.cartList[0].crQty}");
        //var iQuantity = parseInt($('#'+sId).val(), 10) + this.getBuyUnit(iIdx);
        var iQuantity = parseInt($('#'+sId).val(),10);
        iQuantity++;
        if (isNaN(iQuantity) === false) {
            $('#'+sId).val(iQuantity);
        }
//         this.modifyQuantity(sId);
//         alert(sId);
    },
    
    outQuantityShortcut : function(sId, iIdx)
    {
        //var iQuantity = parseInt($('#'+sId).val(), 10) - this.getBuyUnit(iIdx);
        var iQuantity = parseInt($('#'+sId).val(),10);
        iQuantity--;
        if (iQuantity < 1) iQuantity = 1;
        if (isNaN(iQuantity) === false) {
            $('#'+sId).val(iQuantity);
        }
//         this.modifyQuantity(sId);
    }
};
$(document).ready(function() {
	$.each(cartMap, function(index, item) {
		alert(item);
	});
});
</script>

<!-- Main Content -->
<div class="page-container" id="PageContainer">
	<main class="main-content" id="MainContent" role="main">
		<section class="collection-heading heading-content ">
			<div class="container">
				<div class="row">
					<div class="collection-wrapper">
						<h1 class="collection-title"><span>장바구니</span></h1>
						<div class="breadcrumb-group">
							<div class="breadcrumb clearfix">
								<span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="./main.do" title="Bridal 1" itemprop="url"><span itemprop="title">Home</span></a>
								</span>
								<span class="arrow-space">></span>
								<span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb">
									<a href="./cart.do" title="Your Cart" itemprop="url"><span itemprop="title">장바구니</span></a>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="cart-content">
			<div class="cart-wrapper">
				<div class="container">
					<div class="row">
						<div class="xans-element- xans-order xans-order-basketpackage "><!-- 혜택정보 -->
							<form id="cart2order" action="order.do" method="post">	
								<c:choose>
				      				<c:when test="${cartMap.count == 0}">
				         				<div class="xans-element- xans-order xans-order-empty">
				         					<p> 장바구니가 비어 있습니다.</p>
										</div>
				      				</c:when>
				      				<c:otherwise>
									<!-- 할인금액 노출 : 삭제 시 할인금액이 노출되지 않습니다.-->
									<!-- 일반상품 -->
										<div class="orderListArea">
										    <div class="xans-element- xans-order xans-order-normtitle title " style="padding-top:14px;"><h3>상품 (<c:out value="${cartMap.count}"/>)</h3>
											</div>
											<!-- 일반상품 (기본배송) -->
											<table border="1" summary="" class="xans-element- xans-order xans-order-normnormal boardList xans-record- cart-content-table">
												<thead>
													<tr>
														<th scope="col" class="chk"><input type="checkbox" onclick="Basket.setCheckBasketList('basket_product_normal_type_normal', this);"></th>
												        <th scope="col" class="thumb">이미지</th>
											            <th scope="col" class="product">상품정보</th>
											            <th scope="col" class="price">판매가</th>
											            <th scope="col" class="quantity">수량</th>
											            <th scope="col" class="mileage">적립금</th>
											            <th scope="col" class="delivery">배송구분</th>
											            <th scope="col" class="charge">배송비</th>
											            <th scope="col" class="total">합계</th>
											            <th scope="col" class="button">선택</th>
											          </tr>
											    </thead>
												<tfoot>
													<tr>
														<td colspan="10">
															<strong class="type">[기본배송]</strong> 
															상품구매금액<strong> <c:out value="${cartMap.allSum}"/> <span class="displaynone">()</span></strong>
															<span class="displaynone"> </span> + 배송비 <c:out value="${cartMap.dlvPrice}"/> 
															<c:if test="${cartMap.dlvPrice == 0}">
																(무료)
															</c:if>
															<span class="displaynone"> </span> = 합계 : <strong class="total"><span> <c:out value="${cartMap.allSum}"/> </span>원</strong> 
															<span class="displaynone"> </span>
														</td>
											        </tr>
											    </tfoot>
											    <c:forEach var="row" items="${cartMap.cartList}" varStatus="i" begin="0">
												    <input type="hidden" id="cart_id_<c:out value='${i.index}'/>" name="basket_product_normal_type_normal" checked>
												    <input type="hidden" id="prCd_id_<c:out value='${i.index}'/>" value="<c:out value='${row.prCd}'/>">
												    <input type="hidden" id="crCd_id_<c:out value='${i.index}'/>" value="<c:out value='${row.crCd}'/>">
												    <input type="hidden" id="crQty_id_<c:out value='${i.index}'/>" value="<c:out value='${row.crQty}'/>">
												    <input type="hidden" id="crOpt_id_<c:out value='${i.index}'/>" value="<c:out value='${row.crOpt}'/>">
												    <input type="hidden" id="crClr_id_<c:out value='${i.index}'/>" value="<c:out value='${row.crClr}'/>">
												    
												    <tbody class="xans-element- xans-order xans-order-list">
												    	<tr class="xans-record-">
															<td>
																<input type="checkbox" id="basket_chk_id_<c:out value='${i.index}'/>"name="basket_product_normal_type_normal" checked>
															</td>
													        <td class="thumb">
													        	<a href="./detailPrd.do?prCd=<c:out value='${row.prCd}'/>"> <!-- 요기 -->
													        	<img src="<c:out value='${row.prImg1}'/>" onerror="this.src='http://img.echosting.cafe24.com/thumb/img_product_small.gif';" alt="<c:out value='${row.prNm}'/>"></a><!-- 요기 -->
													        </td>
													        <td class="product">
													        	<a href="./detailPrd.do?prCd=<c:out value='${row.prCd}'/>">
													        		<strong>
													        		<c:if test="${row.brdNm != null && row.brdNm != ''}">
													        			[<c:out value='${row.brdNm}'/>]
													        		</c:if>
													        		<c:out value='${row.prNm}'/></strong>
													        	</a><!-- 요기 -->
													        </td>
													        <td class="price">
													        	<div class="">
																	<strong><c:out value='${row.prPrc}'/>원</strong><p class="displaynone"></p>
																</div>
													        	<div class="displaynone"><strong><c:out value='${row.prPrc}'/>원</strong></div>
													        </td>
													        <td>
													        	<span class="quantity"  style="padding:0px; margin-left:-15px;">
														        	<input id="quantity_id_<c:out value='${i.index}'/>" name="quantity_name_<c:out value='${i.index}'/>" size="2" value="${row.crQty}" type="text">
														        	<a href="javascript:;" onclick="Basket.addQuantityShortcut('quantity_id_<c:out value="${i.index}"/>', 0);">
														        		<img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_quantity_up.gif" alt="증가" class="QuantityUp"  style="border:grey;">
														        	</a>
														        	<a href="javascript:;" onclick="Basket.outQuantityShortcut('quantity_id_<c:out value="${i.index}"/>', 0);">
														        		<img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_quantity_down.gif" alt="감소" class="QuantityDown">
														        	</a>
													        	</span>
													            <a href="javascript:;" onclick="Basket.modifyQuantity('quantity_id_<c:out value="${i.index}"/>')" class="ga09_button_class bt1 width1">변경</a>
													       	</td>
												        	<td class="mileage">-</td>
												            <td class="delivery">기본배송
												            	<div class="displaynone">(해외배송가능)</div>
															</td>
												            <td>
												          		<c:choose>
																	<c:when test="${cartMap.dlvPrice == 0}">
																		무료
																	</c:when>
																	<c:otherwise>
																		<c:out value="${cartMap.dlvPrice}"/>원<br>
																		차등
																	</c:otherwise>
																</c:choose>
															</td>
												            <td class="total">
																<strong><c:out value='${row.prPrc}'/>원</strong><div class="displaynone"></div>
															</td>
										                    <td class="button">
										                        <a href="javascript:;" onclick="Basket.orderBasketItem(0);" class="ga09_button_class2 bt1">주문하기</a>
										                        <a href="javascript:;" onclick="BasketNew.moveWish(0);" class="ga09_button_class bt1 margin1">관심상품</a>
										                        <a href="javascript:;" onclick="Basket.deleteBasketItem(0);" class="ga09_button_class bt1">상품삭제</a>
										                    </td>
											            </tr>
													</tbody>
												</c:forEach>
											</table>
										<!-- 일반상품 (업체기본배송) -->
										<!-- 일반상품 (개별배송) -->
								        <!-- 일반상품 (해외배송) -->
							       		</div>
										<!-- 무이자상품 -->
										<div class="orderListArea">
								        <!-- 무이자상품 (기본배송)-->
								        <!-- 무이자상품 (개별배송)-->
								        <!-- 무이자상품 (해외배송) -->
								        </div>
											<!-- 무이자할부 정보 (카드이미지 등) -->
										<div class="xans-element- xans-order xans-order-dcprdguide displaynone ">
											<p>할인 적용 금액은 주문서작성의 결제예정금액에서 확인 가능합니다.</p>
										</div>
											<!-- 선택상품 제어 버튼 -->
										<div class="xans-element- xans-order xans-order-selectorder ">
											<span class="left">
									            <strong class="ctrlTxt">선택상품을</strong>
										            <a href="#none" onclick="Basket.deleteBasket()" class="ga09_button_class2 bt2">삭제하기</a>
										            <a href="#none" onclick="Basket.addWishList()" class="displaynone ga09_button_class bt2">관심상품등록</a>
										            <a href="#none" onclick="Basket.moveOversea()" class=" ga09_button_class bt2">해외배송상품 장바구니로 이동</a>
										            <a href="#none" onclick="Basket.hopeProduct(''); return false;" class="displaynone ga09_button_class bt2">상품조르기</a>
									        </span>
											<a href="#none" onclick="Basket.emptyBasket()" class="ga09_button_class bt2">장바구니비우기</a>
										</div>
										<!-- 총 주문금액 : 국내배송상품 -->
										<div class="xans-element- xans-order xans-order-totalsummary  ">
											<table border="1" style="margin-bottom:0px;">
												<caption>총 주문금액</caption>
											    <thead>
											    	<tr>
														<th scope="col">
															<span>총 상품금액</span>
															<a href="#none" onclick="OrderLayer.onDiv('order_layer_detail', event);" class="more displaynone">
																<img src="http://img.echosting.cafe24.com/skin/base_ko_KR/order/btn_list.gif" alt="내역보기">
															</a>
														</th>
									                    <th scope="col">총 배송비</th>
									                    <th scope="col">결제예정금액</th>
								                	</tr>
								                </thead>
												<tbody>
													<tr>
														<td class="price">
															<div class="box"><strong><c:out value='${cartMap.sumCart}'/></strong><strong class="tail">원</strong> <span class="tail displaynone"></span>
															</div>
														</td>
									                    <td class="option">
									                    	<div class="box">
																<strong>+</strong><strong><c:out value="${cartMap.dlvPrice}"/></strong><strong class="tail">원</strong> <span class="tail displaynone"></span>
															</div>
														</td>
									                    <td class="total">
									                    	<div class="box">
																<strong>=</strong><strong><c:out value="${cartMap.allSum}"/></strong><strong class="tail">원</strong> <span class="tail displaynone"></span>
															</div>
														</td>
									                </tr>
								                </tbody>
											</table>
											<!-- 총 상품금액 상세내역 레이어 -->
											<div id="order_layer_detail" class="totalDetail">
									            <h3>총 상품금액 상세내역</h3>
									            <div class="content">
									                <p><c:out value='${cartMap.sumCart}'/>원</p>
									                <ul>
														<li>
															<strong>상품금액</strong><span></span>
														</li>
									                    <li class="displaynone">
															<strong>부가세</strong><span>0원</span> <!-- 지현 -->
														</li>
									                </ul>
												</div>
									            <div class="close"><a href="#none" onclick="OrderLayer.offDiv('order_layer_detail');">
									            	<img src="http://img.echosting.cafe24.com/skin/base_ko_KR/common/btn_close.png" alt="닫기"></a>
								            	</div>
								        	</div>
										</div>
										<!-- 주문 버튼 -->
										<div class="xans-element- xans-order xans-order-totalorder">
											<ul>
												<li style="float:right; margin-right:10px;"><a href="#none" onclick="Basket.orderAll(this)" class=" ga09_button_class2 bt4" link-order="/order.do?basket_type=all_buy" link-login="/login.do">전체상품주문</a></li>
								                <li style="float:right; margin-right:10px;"><a href="#none" onclick="Basket.orderSelectBasket(this)" link-order="/order.do?basket_type=all_buy" class="ga09_button_class bt4" link-login="/login.do">선택상품주문</a></li>
								                <li style="float:right; margin-right:10px;"><a href="/" class="ga09_button_class bt4">쇼핑계속하기</a></li>
											</ul>
										</div>
									</c:otherwise>
								</c:choose>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
</div>