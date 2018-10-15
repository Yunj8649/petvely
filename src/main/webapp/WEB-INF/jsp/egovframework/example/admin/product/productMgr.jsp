<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 181118 @김병직 #for jqgrid -->
<link rel="stylesheet" type="text/css" href="./admin/jqGrid-master/te/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="./admin/jqGrid-master/css/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" href="./admin/jqGrid-master/css/addons/ui.multiselect.css" />

<!-- jqgrid는 jquery 기반이기 때문에 항상 jquery를 먼저 선언한다. -->
<script type="text/javascript" src="./admin/jqGrid-master/js/i18n/grid.locale-kr.js"></script>
<script type="text/javascript" src="./admin/jqGrid-master/js/jquery.jqGrid.min.js"></script>
<!-- 181118 @김병직 #for jqgrid end -->

<script type="text/javascript">

/* 
	1. 이거 상품코드로 지우면 안됨;; O
	2. 정렬 지원하지 않는 헤더들 false로 O
*/

var selectBox = {
		
	displayChildSelectBox : function(data) {
		
		if(data.length > 0) {
			$.each(data, function(i, item) {
				
				var optionStr = "<option value=" + item.subCtCd + ">" +
				item.subCtNm + "</option>";
				
				$("#subCtSelectBox").removeAttr("disabled");
				$("#subCtSelectBox").append(optionStr);
			});
		} else {
			$("#subCtSelectBox").attr("disabled", "disabled");
			$("#subCtSelectBox").append("<option value='none'>없음</option>");
		}
	},
	
	parentSelectBoxChange : function() {
		$("#ctSelectBox").change(function() {
			var valCtCd = this.value; //ctCd 들어옴
			var form = {param : valCtCd};

			$("#subCtSelectBox").children().remove();
			
			$.ajax({
				type	: "POST",
				url		: "subCtBoxList.do",
				data	: JSON.stringify(form),
				contentType : "application/json",
				async	: false, // ajax 통신이 끝날때까지 페이지를 block 시킨다
				success	: function(data) {

					if(data.result == "PRCDOK") {
						$("#subCtSelectBox").append("<option value='none'>선택하세요</option>");
						selectBox.displayChildSelectBox(data.childList);
					} else {
						$("#subCtSelectBox").attr("disabled", "disabled");
						$("#subCtSelectBox").append("<option value='none'>없음</option>");
					}
				}
			});		
		});
	}
}

/* var CommonJsUtil = 
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
}
 */
var jqgridTable = 
{
	init : function() {
/* 		var cnames = ['상품 코드', '상품 이름', '브랜드 코드', '카테고리 코드', '색상', '옵션', '가격',
		              '등록일', '시작일', '종료일', '재고', '판매횟수', '대표이미지 경로', '상세이미지 경로',
		              '상세설명 문구', '간략설명 문구'],  */
		var cnames = ['상품 코드', '상품 이름', '브랜드명', '카테고리', '상세 카테고리', '색상', '옵션', '가격',
		              '등록일'], 
		$jqGrid = $("#jqGrid");
		
		$jqGrid.jqGrid({
			url			: "productMgrMain.do", 
			datatype	: "local", 
			colNames	: cnames, 
			colModel	: [
				{name : "prCd",			index : "prCd",			width	: 30,		align : "center"}, 			// 상품 코드
				{name : "prNm", 		index : "prNm", 		width	: 100, 		align : "center",	 sortable:false}, 			// 상품 이름
				{name : "brdNm", 		index : "brdNm", 		width	: 40,	 	sortable:false}, 								// 브랜드 코드
				{name : "ctCd", 		index : "ctCd",			width	: 40}, 								// 카테고리 코드
				{name : "subCtCd", 		index : "subCtCd",		width	: 40,		sortable:false}, 								// 카테고리 코드
				{name : "prClr",		index : "prClr",		width	: 40,		sortable:false}, 								// 색상
				{name : "prOpt",		index : "prOpt",		width	: 40,		sortable:false}, 								// 옵션
				{name : "prPrc",		index : "prPrc",		width	: 40}, 								// 가격
				{name : "prCrtDate",	index : "prCrtDate",	width	: 40,	 	sortable:false}, 								// 등록일
/* 				{name : "prStaDate",	index : "prStaDate",	width	: 100}, 								// 시작일
				{name : "prEndDate",	index : "prEndDate",	width	: 100}, 								// 종료일
				{name : "prCntSto",		index : "prCntSto",		width	: 100}, 								// 재고
				{name : "prCntSel",		index : "prCntSel",		width	: 100},									// 판매횟수
				{name : "prImg1",		index : "prImg1",		width	: 100}, 								// 대표이미지 경로
				{name : "prImg2",		index : "prImg2",		width	: 100}, 								// 상세이미지 경로
				{name : "prDes1",		index : "prDes1",		width	: 100}, 								// 상세설명 문구
				{name : "prDes2",		index : "prDes2",		width	: 100} 									// 간략설명 문구 */
			],
			height			: 450, 
			autowidth		: true,
			rowNum			: 10,
			rowList			: [10,20,30], //한 페이지에 출력 할 줄 수 (선택사항)
			pager			: '#jqGridPager', //page 나누기 관련 출력 할 영역 설정
			rownumbers		: true, // 그리드 맨 앞쪽에 숫자가 생긴다
			viewrecords		: true, // 우측 하단에 도움말이 생긴다
			caption			: "상품 리스트",
			multiselect 	: true,
			sortname		: "ctCd",
			sortorder		: "asc",
			ondblClickRow	: function (rowId, iRow, iCol) {
				// jqgrid의 row를 더블클릭하면
				// prdInsert.do에 prCd를 form에 실어 날려보냄
	 			var $frmPrd = $("#frmPrd");
	 			$("#prCd").val($jqGrid.getRowData(rowId).prCd)
	 			$frmPrd.submit();
			},
			gridComplete : function(id){ 
					$("#lui_jqGrid").removeClass('jqgrid-overlay ui-widget-overlay'); 
					$(".ui-jqgrid tr.jqgrow td").css('height',45);		// row 10개 화면 높이에 맞춰서 보여주기 위해 45px 설정
				}
		});
	},
	
	goSearch : function() {
		var jsonObj = {},
		$jqGrid = $("#jqGrid");
		
		jsonObj.selectedCategory	= $("#ctSelectBox").val();
		jsonObj.selectedSubCategory = $("#subCtSelectBox").val();
		/* 
		if($("#ctSelectBox").val() !== "" && 
				jsonObj.selectedCategory === "none")		// '전체'값이 아닌 부모박스만 선택했을 경우
			jsonObj.selectParent = "y";
		 */
		 $jqGrid.setGridParam({
			datatype		: "json",
			postData		: {"param" : JSON.stringify(jsonObj)},
		   /*
			onSortCol		: function (index, columnIndex, sortOrder) {
 			$jqGrid.setGridParam({datatype: "local", loadonce : true});
				
				// 그리드의 데이터를 가져와서 json sort 한다.
				var obj = $jqGrid.jqGrid("getRowData");
				console.log($jqGrid.jqGrid("getRowData"));
				console.log(index);
				obj = jqgridTable.sortByKey(obj, index);
				
				// 그리드의 데이터를 clear하고 정렬된 json을 다시 세팅.
				$jqGrid.clearGridData();
				$jqGrid.setGridParam({data : obj}).trigger("reloadGrid");
				$jqGrid.setGridParam({datatype : "json", loadonce : false});
				
				jsonObj.sortIndex	= index;
				jsonObj.sortOrder	= sortOrder;
				
				// onSortCol 이벤트를 커스터마이징 한것이므로 기존의 이벤트를 부르지 못하게 stop 한다.
				return "stop";
		    },
		    */
			loadComplete	: function(data) {
				console.log(data);
				// ajax의 complete와 같은 기능		
				 if(data.rows.length < 1){
					 alert("불러올 데이터가 없습니다.");
				 }	
			}
		}).trigger("reloadGrid"); 	
	},
	
	selectData : function(div) {
		console.log("selectData : " + div);
		var $jqgrid = $("#jqGrid"),
		iCnt		= 0,
		divText		= div === "del" ? "삭제" : "저장",
		jsonArray	= new Array(),
		checkData	= {},		
		returnParam = "";		
		
		checkData	= $jqgrid.getGridParam("selarrrow");		
		console.log("C selectData fn getGridParam(selarrrow) checkData : " + checkData)
		
		if(checkData.length === 0){
			alert(divText + "할 데이터의 체크박스를 선택해주세요");
			
			return;
		}
		
		for(var i = 0; i < checkData.length; i++) {
			var jsonObj		= {},
				$columns	= $jqgrid.getGridParam("colModel"),
				idx			= 0;
			
			jsonObj.ctrlType = div;
			
			$($columns).each(function(idx) {
				jsonObj[$columns[idx].name] = $jqgrid.getCell(checkData[i], $columns[idx].name);
			});
			
			jsonArray[iCnt] = jsonObj;
			iCnt++;
		}
		
		if(confirm("선택한 데이터를 " + divText + " 하시겠습니까?") === false){
			return;
		}
		
		returnParam = JSON.stringify(jsonArray);
		
		return returnParam;
	},

	ctrlData : function(div) {
		
		var $jqgrid = $("#jqGrid");
		
		var param	= this.selectData(div),
			that	= this;	
		
		$.ajax({
			type	: "POST",
			url		: "ctrlJqgrid.do",
			data	: {"param" : param},
			async	: false,
			success : function(result) {
				
				if(result === "SUCCESS") {
					if( div === "del") {
					var lastPage = $jqgrid.getGridParam("lastpage"),
						currentPage = $jqgrid.getGridParam("page");
						if ($jqgrid.getGridParam("reccount") === $jqgrid.getGridParam("selarrrow").length){
							if ( currentPage === lastPage ){
								$jqgrid.setGridParam({
									page : lastPage - 1
								}).trigger("reloadGrid");					
							}
						}			
					}
					that.goSearch();
				}
			}
		});
	},
	
/* 	sortByKey : function (array, key) {
	    return array.sort(
	            function(a, b) {
	                    var x = a[key];
	                    var y = b[key];
	                    return ((x < y) ? -1 : ((x > y) ? 1 : 0));
	        }
	    );
	}, */
	
	clearGrid : function() {
		$("#jqGrid").clearGridData();
	}
}

$(document).ready(function() {

	var msg = "${msg}";
	
	if (msg != null && msg != undefined && msg != ""){
		alert(msg);
	}
	
	$("#goSearchAId").click(function(e){					// 조회기능
		jqgridTable.goSearch();
	});
	
	$("#deleteAId").click(function(e){
		jqgridTable.ctrlData("del");
	});
	
	$("#clearAId").click(function(e){
		jqgridTable.clearGrid();
	});
	
	jqgridTable.init();
	selectBox.parentSelectBoxChange();
	jqgridTable.goSearch();

});

</script>

<form id="frmPrd" action="prdModify.do" method="post">
	<input type="hidden" id="prCd" name="prCd" />
</form>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h2 class="page-header">상품 설정</h2>
			<span class="page-meta">상품 리스트 확인 및 추가, 삭제가 가능합니다.</span>
		</div>
	</div>
	<div class="row">
		<div class="bread-crumb pull-right">
			<a href="./admin_main.do"><i class="fa fa-home"></i>Home</a>
		</div>
	</div>
	<div class="panel-body">
		<div class="dataTables_wrapper form-inline dt-bootstrap no-footer">
			<div class="row">
				<div class="col-sm-6">
					<div class="dataTables_length" id="dataTables-example_length">
						<label>
							<select class="form-control" id="ctSelectBox">
								<option value="">전체</option>
						       	<c:forEach items="${ctBoxList}" var="ctlist">
						       		<option value="${ctlist.ctCd}"><c:out value="${ctlist.ctNm}"/></option>	
						       	</c:forEach>				
							</select>
							<select class="form-control" id="subCtSelectBox" name="subCtSelectBox" disabled>
						   		<option value="none">없음</option>
						   	</select>
							<span><a class="btn btn-primary" id="goSearchAId" href="#">조회</a></span>
							<span><a class="btn btn-primary" id="newAId" href="./prdInsert.do">추가</a></span>
							<span><a class="btn btn-primary" id="deleteAId" href="#">삭제</a></span>
							<span><a class="btn btn-primary" id="clearAId" href="#">초기화</a></span>
						</label>
					</div>
				</div>
				<div class="col-md-12">
					<!-- 그리드 들어갈 자리 -->
					<div class="jqgrid">
						<div class="container">
							<table id="jqGrid"></table>
							<div id="jqGridPager"></div>
						</div>
					</div>
					<!-- 그리드 끝 -->
				</div>
			</div>
		</div>
	</div>
</div>


