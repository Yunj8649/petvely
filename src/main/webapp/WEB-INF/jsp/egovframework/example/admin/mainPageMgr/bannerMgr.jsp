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

<!-- Metis Menu Plugin JavaScript -->
<script src="./admin/vendor/metisMenu/metisMenu.min.js"></script>

<script type="text/javascript">

/* 
	1. 이거 상품코드로 지우면 안됨;; O
	2. 정렬 지원하지 않는 헤더들 false로 O
*/

var selectBox = {
		
	displayChildSelectBox : function(data) {
		
		if(data.length > 0) {
			$.each(data, function(i, item) {
				
				var optionStr = "<option value=" + item.banTypeCd + ">" +
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
}

var jqgridTable = 
{
	init : function() {
		var cnames	= ['ID', '이름', '위치', '타입', '이미지 경로', '지정', '지정(숨겨짐)', '슬라이드배너여부(숨겨짐)'], 
			$jqGrid = $("#jqGrid");
		
		$jqGrid.jqGrid({
			url			: "bannerMgrMain.do", 
			datatype	: "local", 
			colNames	: cnames, 
			colModel	: [
				{name : "banId",		index : "banId",		width	: 15,		align : "center"}, 	
				{name : "banNm", 		index : "banNm", 		width	: 70, 		align : "center"}, 			
				{name : "banLocNm", 	index : "banLocNm", 	width	: 40,		align : "center"}, 								
				{name : "banTypeNm", 	index : "banTypeNm",	width	: 30,		align : "center"}, 								
				{name : "banImg1",		index : "banImg1",		width	: 40,		align : "center"}, 								
				{name : "banChk",		index : "banChk",		width	: 15,		align : "center",
																 formatter : gridFunc.banChk},
				{name : "banChecked",	index : "banChecked",	width	: 0,		align : "center",	hidden : true}, 								
				{name : "banSlide",		index : "banSlide",		width	: 0,		align : "center",	hidden : true}, 								
			],
			height			: 450, 
			width			: 1000,
			rowNum			: 10,
			rowList			: [10,20,30], //한 페이지에 출력 할 줄 수 (선택사항)
			pager			: '#jqGridPager', //page 나누기 관련 출력 할 영역 설정
			viewrecords		: true, // 우측 하단에 도움말이 생긴다
			caption			: "배너 관리",
			multiselect 	: true,
			sortname		: "banId",
			sortorder		: "asc",
			ondblClickRow	: function (rowId, iRow, iCol) {
				// jqgrid의 row를 더블클릭하면
				// prdInsert.do에 prCd를 form에 실어 날려보냄
	 			var $frmPrd = $("#frmPrd");
	 			$("#prCd").val($jqGrid.getRowData(rowId).prCd)
	 			window.open("",'popup_win','width=790,height=580');		// 새창으로 띄우기
	 			$frmPrd.submit();
			},
			gridComplete : function(id){ 
					$("#lui_jqGrid").removeClass('jqgrid-overlay ui-widget-overlay'); 
					$(".ui-jqgrid tr.jqgrow td").css('height',45);		// row 10개 화면 높이에 맞춰서 보여주기 위해 45px 설정
					gridFunc.setRadioClickEvent();
					gridFunc.setCheckBoxClickEvent();
				}
		});
	},
	
	goSearch : function() {
		var jsonObj = {},
		$jqGrid = $("#jqGrid");
		
		jsonObj.selectedBanLoc	= $("#bannerSelectBox").val();
		jsonObj.selectedBanType = $("#bannerChildBox").val();
		
		if(jsonObj.selectedBanType === "none" ){
			alert("모든 카테고리를 선택해주세요");
			return;
		} else {
			 $jqGrid.setGridParam({
				datatype		: "json",
				postData		: {"param" : JSON.stringify(jsonObj)},
				loadComplete	: function(data) {
					console.log(data);
					// ajax의 complete와 같은 기능		
					 if(data.rows.length < 1){
						 alert("불러올 데이터가 없습니다.");
					 }	
				}
			}).trigger("reloadGrid"); 				
		}
	},
	
	selectData : function(div) {
		console.log("selectData : " + div);
		var $jqgrid = $("#jqGrid"),
		iCnt		= 0,
		divText		= div === "del" ? "삭제" : "저장",
		jsonArray	= new Array(),
		checkData	= {},		// 체크된넘들 들어올 변수, 배열
		returnParam = "";		// 문자열
		
		checkData	= $jqgrid.getGridParam("selarrrow");		// 체크된넘들 받아옴
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
				// { $columns[j].name : 'value', ...}
				// 식으로 jsonObj에 data가 들어감
				jsonObj[$columns[idx].name] = $jqgrid.getCell(checkData[i],
						$columns[idx].name);
			});
						
			jsonArray[iCnt] = jsonObj;
			iCnt++;
		}
		
		if(confirm("선택한 데이터를 " + divText + " 하시겠습니까?") === false){
			return;
		}
		
		returnParam = JSON.stringify(jsonArray);
		
		return returnParam;
		
		// checkData	= $jqgrid.getGridParam("selarrrow");
		// jsonObj[$columns[idx].name] = $jqgrid.getCell(checkData[i], $columns[idx].name);
		// 위에서 체크된넘 값만 빼오고
		// 아래에서 { "이름" : "값"} 식으로 배열에 넣고
		// 그 배열을 jsonArray라는 다른 배열에 넣고
		// jsonArray => {{"editType : div", "col이름" : "값", ...}, {"editType : div", "col이름" : "값", ...}}
		// 이 자바스크립트 값들을 JSON.stringify로 JSON 문자열로 변환하여 리턴.
	},

	ctrlData : function(div) {
		
		var $jqgrid = $("#jqGrid");
		
		var param	= this.selectData(div),
			that	= this;	
		
		$.ajax({
			type	: "POST",
			url		: "ctrlBannerMgrGrid.do",
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
	
	clearGrid : function() {
		$("#jqGrid").clearGridData();
	}
}
	
var gridFunc =
	{
		// cellvalue 안쓰면 rowObject 못쓰네??
		banChk : function (cellvalue, options, rowObject) {
/* 			console.log(options);
			console.log(cellvalue);
			console.log(rowObject); */
			if(rowObject.banSlide === "Y") {
				if (rowObject.banChecked === "Y")
					return '<input type="checkbox" name="banner_check" value="' + rowObject.banId + '" checked />';
				else
					return '<input type="checkbox" name="banner_check" value="' + rowObject.banId + '" />';
			} else if (rowObject.banSlide === "N") {	// 라디오 버튼인 경우
				if (rowObject.banChecked === "Y")
					return '<input type="radio" name="banner_radio" value="' + rowObject.banId + '" checked />';					
 				else
					return '<input type="radio" name="banner_radio" value="' + rowObject.banId + '" />';
			} else {
				return "예외값이 들어옴";
			}
		},
		
		setRadioClickEvent : function() {
			$("input:radio[name=banner_radio]").click(function(e){
				var jsonObj = {};
				
				jsonObj.selectedBanLoc	= $("#bannerSelectBox").val();
				jsonObj.selectedBanType = $("#bannerChildBox").val();
				jsonObj.banId			= e.target.defaultValue;
		
				$.ajax({
					type	: "POST",
					url		: "banMgrRadio.do",
					data	: {"param" : JSON.stringify(jsonObj)},
					async	: false,
					success : function(result) {
						if(result === "SUCCESS") {
							console.log("setRadioClickEvent SUCCESS")
						}
					}
				});
			});
		},
		
		setCheckBoxClickEvent : function() {
			$("input:checkbox[name=banner_check]").click(function(e){
				var jsonObj = {};
				console.log(e);
				e.target.checked; // 체크여부 true, false
				
				jsonObj.banId			= e.target.defaultValue;
				jsonObj.checked			= e.target.checked;
				
				$.ajax({
					type	: "POST",
					url		: "banMgrCheck.do",
					data	: {"param" : JSON.stringify(jsonObj)},
					async	: false,
					success : function(result) {
						if ( result === "SUCCESS" ) {
							console.log("setCheckBoxClickEvent SUCCESS")
						}
					}
				});
			});
		},
		
		openBannerInsertPopup : function() {
			$bannerInsertFrm = $("#bannerInsertFrm");
			
			window.open("", "popup_bannerInsert", "width=790, height=580");
			
			bannerInsertFrm.submit();			
		}
	}

$(document).ready(function() {
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
});

</script>

<%-- <form id="banMgrRadioFrm" action="banMgrRadio.do" method="post">
	<input type="hidden" id="banMgrRadioBanId" name="banMgrRadioBanId" />
</form> --%>

<form id="bannerInsertFrm" action="bannerInsertPopup.do" target="popup_bannerInsert" method="post">
</form>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h2 class="page-header">배너 설정</h2>
			<span class="page-meta">배너의 추가, 수정, 삭제, 배치가 가능합니다.</span>
		</div>
	</div>
	<div class="panel-body">
		<div class="dataTables_wrapper form-inline dt-bootstrap no-footer">
			<div class="row">
				<div class="col-sm-6">
					<div class="dataTables_length" id="dataTables-example_length">
						<label>
							<select class="form-control" id="bannerSelectBox">
								<option value="">전체</option>
						       	<c:forEach items="${ctBoxList}" var="ctBoxList">
						       		<option value="${ctBoxList.banLocCd}"><c:out value="${ctBoxList.banLocNm}"/></option>	
						       	</c:forEach>				
							</select>
							<select class="form-control" id="bannerChildBox" name="bannerChildBox" disabled>
						   		<option value="none">없음</option>
						   	</select>
							<span><a class="btn btn-primary" id="goSearchAId" href="#">조회</a></span>
							<span><a class="btn btn-primary" id="deleteAId" href="#">삭제</a></span>
							<span><a class="btn btn-primary" id="clearAId" href="#">초기화</a></span>
							<span><a class="btn btn-primary" id="openBannerPopup" href="
								javascript:gridFunc.openBannerInsertPopup();">추가</a></span>
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


