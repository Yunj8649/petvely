<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" type="text/css" href="./admin/jqGrid-master/te/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="./admin/jqGrid-master/css/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" href="./admin/jqGrid-master/css/addons/ui.multiselect.css" />

<script type="text/javascript" src="./admin/jqGrid-master/js/i18n/grid.locale-kr.js"></script>
<script type="text/javascript" src="./admin/jqGrid-master/js/jquery.jqGrid.min.js"></script>

<script type="text/javascript">

var memberTable = 
{
	init : function() {
		var cnames = ['번호', 'ID', '이름', '연락처', '이메일', '가입일', '계정 구분', '계정 구분(숨겨짐)', '탈퇴 여부', '정보 수정'],
		
		$jqGrid = $("#jqGrid");
		
		$jqGrid.jqGrid({
			url			: "memberMgrMain.do",
			datatype	: "local",
			colNames	: cnames,
			colModel	: [
				{name : "seqNo",		index : "seqNo",		width	: 15,		align : "center"}, 	
				{name : "accId", 		index : "accId", 		width	: 40, 		align : "center"}, 			
				{name : "accNm", 		index : "accNm", 		width	: 40,		align : "center"}, 								
				{name : "accPn", 		index : "accPn",		width	: 70,		align : "center"}, 								
				{name : "accEm", 		index : "accEm",		width	: 70,		align : "center"}, 								
				{name : "accCrDate", 	index : "accCrDate",	width	: 70,	 	align : "center"}, 								
				{name : "accGrpView",	index : "accGrpView",	width	: 30,		align : "center"}, 								
				{name : "accGrp",		index : "accGrp",		width	: 30,		align : "center",	hidden : true}, 								
				{name : "accDel",		index : "accDel",		width	: 30,		align : "center"}, 								
				{name : "modifyBtn",	index : "modifyBtn",	width	: 30,		align : "center",
																formatter : gridFunc.modifyBtn}								
			],
			height			: 450, 
			width			: 1000,
			rowNum			: 10, 
			rowList			: [10,20,30],    
			pager			: '#jqGridPager',
			viewrecords		: true,
			caption			: "계정 관리",
			multiselect 	: true,
			sortname		: "seqNo",
			sortorder		: "asc",
			ondblClickRow	: function (rowId, iRow, iCol) {
				// row 더블클릭 action 부분
/* 	 			var $frmPrd = $("#frmPrd");
	 			$("#prCd").val($jqGrid.getRowData(rowId).prCd)
	 			window.open("",'popup_win','width=790,height=580');		// 새창으로 띄우기
	 			$frmPrd.submit(); */
			},
			gridComplete : function(id){ 
					$("#lui_jqGrid").removeClass('jqgrid-overlay ui-widget-overlay'); 
					$(".ui-jqgrid tr.jqgrow td").css('height',45);		// row 10개 화면 높이에 맞춰서 보여주기 위해 45px 설정
				}					
		});		
	},
	
	goSearch : function() {
		var jsonObj = {},
			pnNum	= "",
		$jqGrid = $("#jqGrid");
		
/* 		jsonObj.selectedCategory	= $("#ctSelectBox").val();
		jsonObj.selectedSubCategory = $("#subCtSelectBox").val(); */
		
		 $jqGrid.setGridParam({
			datatype		: "json",
			postData		: {"param" : JSON.stringify(jsonObj)},
			loadComplete	: function(data) {
				
				// accPn1~3 합쳐주는 부분
				for(var i = 0; i < data.rows.length; i++){
					pnNum = "0" + data.rows[i].accPn1 + "" + data.rows[i].accPn2 
						+ "" + data.rows[i].accPn3;

					$jqGrid.setCell(i+1, 'accPn', pnNum);	
					
					if(data.rows[i].accGrp === 0) {
						$jqGrid.setCell(i+1, 'accGrpView', '일반회원');
					} else if (data.rows[i].accGrp === 9) {
						$jqGrid.setCell(i+1, 'accGrpView', '관리자');
					}
				}

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
		divText		= "",
		jsonArray	= new Array(),
		checkData	= {},		// 체크된넘들 들어올 변수, 배열
		returnParam = "";		// 반환될 JSON 문자열
		
		switch(div) {
			        case "advCommonMem" : divText = "일반회원으로 변경";
			                                break;
			        case "advAdmin"          : divText = "운영자로 승급";
			                                break;
			        case "leave"          : divText = "탈퇴";
			                                break;
			        case "restore"          : divText = "복원";
			                                break;
	    		}
		
		checkData	= $jqgrid.getGridParam("selarrrow");		// 체크된넘들 받아옴
		console.log("C selectData fn getGridParam(selarrrow) checkData : " + checkData)
		
		if(checkData.length === 0){
			alert(divText + "할 회원의 체크박스를 선택해주세요");
			
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
			
			//  var data = $jqgrid.getCell(checkData[i], "gender");
			
			jsonArray[iCnt] = jsonObj;
			iCnt++;
		}
		
		if(confirm("선택한 회원을 " + divText + " 하시겠습니까?") === false){
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
			url		: "ctrlMemberMgrGrid.do",
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
}

var gridFunc = 
{
	modifyBtn : function(cellvalue, options, rowObject) {
		return "<a href='javascript:gridFunc.modifyRow(" + options.rowId + ");'>수정</a>";
	},
	
	modifyRow : function(rowId) {
		var modifyParam = $("#jqGrid").getRowData(rowId).seqNo,
			$frmMemData = $("#frmMemData");
		
		$("#memSeqNo").val(modifyParam);
		window.open("", 'popup_win', 'width=790, height=580');
		
		$frmMemData.submit();
	}
}	

$(document).ready(function() {
	
	$("#leaveAId").click(function(e) {
		memberTable.ctrlData("leave");
	});
	
	$("#restoreAId").click(function(e) {
		memberTable.ctrlData("restore");
	});
	
	$("#advAdminAId").click(function(e) {
		memberTable.ctrlData("advAdmin");
	});
	
	$("#advCommonMemAId").click(function(e) {
		memberTable.ctrlData("advCommonMem");
	});
	
	memberTable.init();
	memberTable.goSearch();
});
</script>

<form id="frmMemData" action="memberModify.do" method="post" target="popup_win">
	<input type="hidden" id="memSeqNo" name="memSeqNo" />
</form>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h2 class="page-header">회원 설정</h2>
			<span class="page-meta">회원 리스트 확인 및 수정</span>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
<%-- 		
			<select id="ctSelectBox">
				<option value="">전체</option>
		       	<c:forEach items="${ctBoxList}" var="ctlist">
		       		<option value="${ctlist.ctCd}"><c:out value="${ctlist.ctNm}"/></option>	
		       	</c:forEach>				
			</select>
			<select id="subCtSelectBox" name="subCtSelectBox" disabled>
		   		<option value="none">없음</option>
		   	</select> 
 			<span><a id="goSearchAId" href="#"><등급 변경></a></span>		   	
--%>
			<span><a id="leaveAId" class="btn btn-primary" href="#">탈퇴</a></span>
			<span><a id="restoreAId" class="btn btn-primary" href="#">복원</a></span>
	<!-- 셀렉박스로  -->
			<span><a id="advAdminAId" class="btn btn-primary" href="#">관리자로 승급</a></span>
			<span><a id="advCommonMemAId" class="btn btn-primary" href="#">회원으로</a></span>
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