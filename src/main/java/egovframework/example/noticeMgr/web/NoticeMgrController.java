package egovframework.example.noticeMgr.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.notice.service.TAB_NOTICE_VO;
import egovframework.example.noticeMgr.service.NoticeMgrService;
import egovframework.example.noticeMgr.service.NoticeMgrVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class NoticeMgrController {
	
	@Resource(name="noticeMgrService")
	private NoticeMgrService noticeMgrService;
	
	@RequestMapping(value="noticeMgr.do")
	public String noticeMgr() throws Exception {
		System.out.println("noticeMgr()");
		return "admin/noticeMgr/noticeMgr.tiles";
	}
	
	@RequestMapping(value = "noticeMgrMain.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String noticeMgrMain(@ModelAttribute NoticeMgrVO noticeMgrVO) throws Exception {
		HashMap<String, Object> resMap = new HashMap<String, Object>();
		
		try { 	
			//String xssParseStr = noticeMgrVO.getParam().replaceAll("&quot;", "\"");
			
			List<EgovMap> noticeList = noticeMgrService.selectNoticeList(noticeMgrVO);
			
			EgovMap noticeListCnt = noticeMgrService.selectNoticeListCnt(noticeMgrVO);

			resMap.put("rows", 		noticeList);
			resMap.put("page", 		noticeMgrVO.getPage());
			resMap.put("total", 	noticeListCnt.get("totalpage"));
			resMap.put("records", 	noticeListCnt.get("totaltotcnt"));

			System.out.println("out prdmgrController : " + JsonUtil.HashMapToJson(resMap).toString());
		} catch (Exception e) {		
		}
		return JsonUtil.HashMapToJson(resMap).toString();
	}
	
	@RequestMapping(value="ctrlNoticeMgr.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String ctrlNoticeMgr(@RequestParam String param) throws Exception {
		String result = "";
		try {
			param = param.replaceAll("&quot;", "\"");
			System.out.println(param);
			
			// json object string type은 for 못돌리니깐
			// object 타입으로 바꾼다
			
			JSONArray jsonArray = new JSONArray(param);
			
			noticeMgrService.ctrlJqgridTx(jsonArray);
			
			result = "SUCCESS";
		} catch (Exception e) {
		}
		return JsonUtil.OneStringToJson(result);
	}
	
	@RequestMapping(value = "noticeMgr_detail.do")
	public String noticeMgr_detail(@ModelAttribute TAB_NOTICE_VO vo, ModelMap model) throws Exception {
		
		try {
			List<EgovMap> noticeDetailList = noticeMgrService.noticeDetailList(vo);
			
			model.addAttribute("noticeDetailList", noticeDetailList);
		} catch (Exception e) {
			
		}
		
		return "admin/noticeMgr/noticeMgr_detail";
	}
	
	@RequestMapping(value="noticeModify.do")
	public String noticeModify(HttpServletRequest request, ModelMap model) throws Exception {
		EgovMap resMap = new EgovMap();
		
		try {
			resMap = noticeMgrService.getSelSeqNoData(request.getParameter("selNtSeq"));
		} catch (Exception e) {
			System.out.println(e);
		}

		System.out.println("성공" + resMap);
		model.addAttribute("getNoticeDetail", resMap);
		
		return "admin/noticeMgr/noticeModify"; 
	}
}