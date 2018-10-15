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
<script type="text/javascript" src="./admin/jqGrid-master/js/jquery.jqGrid.js"></script>

<script type="text/javascript">

var noticeTable = 
	{
		init : function() {
			var cNames = ['번호', '제목', '작성자', '작성일', '조회수', '수정'],
			
			$jqGrid = $("#jqGrid");
			
			$jqGrid.jqGrid({
				url			: "noticeMgrMain.do", 
				datatype	: "local", 
				colNames	: cNames, 
				colModel	: [
					{name : "ntSeq",		index : "ntSeq",		width	: 15,		align : "center"}, 			
					{name : "ntTtl",		index : "ntTtl",		width	: 100,		align : "center"}, 			
					{name : "ntWtrId",		index : "ntWtrId",		width	: 30,		align : "center"}, 			
					{name : "ntCrtDate",	index : "ntCrtDate",	width	: 40,		align : "center"}, 			
					{name : "ntHit",		index : "ntHit",		width	: 15,		align : "center"}, 			
					{name : "modifyBtn",	index : "modifyBtn",	width	: 15,		formatter : gridFunc.modifyBtn,			align : "center"}
					],
	
				height			: 450, 
				autowidth		: true,
				rowNum			: 10,
				rowList			: [10,20,30], //한 페이지에 출력 할 줄 수 (선택사항)
				pager			: '#jqGridPager', //page 나누기 관련 출력 할 영역 설정
				viewrecords		: true, // 우측 하단에 도움말이 생긴다
				caption			: "공지사항 관리",
				multiselect 	: true,
				sortname		: "ntSeq",
				sortorder		: "asc",
				ondblClickRow	: function (rowId, iRow, iCol) {
					// 더블클릭하면 게시글 띄우기 (편집모드 아님)
 		 			var $noticeMgrDetailFrm = $("#noticeMgrDetailFrm");
		 			$("#ntSeq").val($jqGrid.getRowData(rowId).ntSeq)
		 			window.open("",'popup_win','width=800,height=600');		// 새창으로 띄우기
		 			$noticeMgrDetailFrm.submit();
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
			
/* 			jsonObj.selectedCategory	= $("#ctSelectBox").val();
			jsonObj.selectedSubCategory = $("#subCtSelectBox").val(); */

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
		},
		
		selectData : function(div) {
			console.log("selectData : " + div);
			var $jqgrid = $("#jqGrid"),
			iCnt		= 0,
			divText		= "";
			jsonArray	= new Array(),
			checkData	= {},		
			returnParam = "";		
			
			checkData	= $jqgrid.getGridParam("selarrrow");		// 체크된넘들 받아옴
			console.log("C selectData fn getGridParam(selarrrow) checkData : " + checkData)
			
			if (div === "del") {
				divText = "삭제";
			}
			
			if (checkData.length === 0){
				alert(divText + "할 글의 체크박스에 체크해주세요");
				
				return;
			}
			
			for(var i = 0; i < checkData.length; i++) {
				var jsonObj		= {},
					$columns	= $jqgrid.getGridParam("colModel"),
					idx			= 0;
				
				// 여기서 대입한 값으로 serviceImpl에서 삭제인지 체크
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
			
			if(confirm("선택한 글을 " + divText + " 하시겠습니까?") === false){
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
				url		: "ctrlNoticeMgr.do",
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
		modifyBtn : function(cellvalue, options, rowObject) {
			return "<a href='javascript:gridFunc.modifyRow(" + options.rowId + ");'>수정</a>";
		},
		
		modifyRow : function(rowId) {
			var modifyParam = $("#jqGrid").getRowData(rowId).ntSeq,
			$noticeModifyFrm = $("#noticeModifyFrm");
		
			$("#selNtSeq").val(modifyParam);
			window.open("", 'popup_win', 'width=790, height=580');
			
			$noticeModifyFrm.submit();
		}
	}	
	
$(document).ready(function() {
	$("#goSearchAId").click(function(e){					
		noticeTable.goSearch();
	});
	
	$("#deleteAId").click(function(e){
		noticeTable.ctrlData("del");
	});
	
	$("#clearAId").click(function(e){
		noticeTable.clearGrid();
	});
	
	noticeTable.init();
	noticeTable.goSearch();
});
</script>

<form id="noticeMgrDetailFrm" action="noticeMgr_detail.do" target="popup_win" method="post">
	<input type="hidden" id="ntSeq" name="ntSeq" />
</form>

<form id="noticeModifyFrm" action="noticeModify.do" target="popup_win" method="post">
	<input type="hidden" id="selNtSeq" name="selNtSeq" />
</form>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h2 class="page-header">게시글 설정 > 공지</h2>
			<span class="page-meta">공지사항을 수정하고 관리합니다.</span>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
<%-- 			<select id="ctSelectBox">
				<option value="">전체</option>
		       	<c:forEach items="${ctBoxList}" var="ctlist">
		       		<option value="${ctlist.ctCd}"><c:out value="${ctlist.ctNm}"/></option>	
		       	</c:forEach>				
			</select>
			<select id="subCtSelectBox" name="subCtSelectBox" disabled>
		   		<option value="none">없음</option>
		   	</select> --%>
			<span><a class="btn btn-primary" id="goSearchAId" href="#">조회</a></span>
			<span><a class="btn btn-primary" id="deleteAId" href="#">삭제</a></span>
			<span><a class="btn btn-primary" id="clearAId" href="#">초기화</a></span>
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