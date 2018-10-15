package egovframework.example.qaMgr.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.qaMgr.service.QaMgrService;
import egovframework.example.qaMgr.service.Qa_Paging_Vo;
import egovframework.example.qaMgr.service.TAB_QA_VO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class QaMgrController {
	@Resource(name = "qaMgrService")
	private QaMgrService qaMgrService;
	
	// 고객센터 문의사항 볼 회원 목록 조회
	@RequestMapping(value = "qaMgr.do")
	public String qaMgr(@ModelAttribute Qa_Paging_Vo pagingVo, ModelMap model) throws Exception {
		System.out.println("qaMgr()");
		
		try {
			List<EgovMap> qaMgr = qaMgrService.selectEventMgrList(pagingVo);

			EgovMap pagingListCnt = qaMgrService.selectPagingListCnt(pagingVo);
			
			HashMap<String, Object> resMap = new HashMap<String, Object>();
			
			resMap.put("fstPage", pagingVo.getFstpage());
			resMap.put("page", pagingVo.getPage());
			resMap.put("total", pagingListCnt.get("totalpage"));
			resMap.put("pageScale", pagingVo.getPageScale());
			
			int pageGroup = (int)Math.ceil((double)pagingVo.getPage() / 
					pagingVo.getPageScale());
			
			long startPage = (pageGroup - 1) * pagingVo.getPageScale() + 1;
			
			pagingVo.setStartPage(startPage);
			
			resMap.put("startPage", pagingVo.getStartPage());
			
			long endPage = startPage + pagingVo.getPageScale() - 1;
			
			pagingVo.setEndPage(endPage);
			
			resMap.put("endPage", pagingVo.getEndPage());
			
			long prePage = (pageGroup - 2) * pagingVo.getPageScale() + pagingVo.getPageScale();
			long nextPage = pageGroup * pagingVo.getPageScale() + 1;
			
			resMap.put("pageGroup",	pageGroup);
			resMap.put("prePage",	prePage);
			resMap.put("nextPage",	nextPage);
			
			model.addAttribute("resMap",	resMap);
			model.addAttribute("qaMgr",		qaMgr);
		} catch (Exception e) {
			
		}
		return "admin/qaMgr/qaMgr.tiles";
	}
	
	// 회원 선택 후 조회 버튼 클릭 시 채팅내용 조회
	@RequestMapping(value = "selectUser.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String selectUser (@RequestBody String param) throws Exception{
		System.out.println("selectUser()");
		
		HashMap<String, Object> resMap = new HashMap<String, Object>();
		try {
			JsonParser parser = new JsonParser();
			
			JsonObject jsonObj = (JsonObject)parser.parse(param);
			
			List<EgovMap> result = qaMgrService.selectUserChatList(jsonObj.get("userNo").toString().replaceAll("\"", ""));
			
			System.out.println("result : " + result.toString());
			
			resMap.put("chat", 		result);
			resMap.put("result",	"SUCCESS");
		} catch (Exception e) {
			
		}
		
		return JsonUtil.HashMapToJson(resMap).toString();
	}
	
	@RequestMapping(value = "sendMsg.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public void sendMsg (@RequestBody String param) throws Exception {
		System.out.println("sendMsg()");
		
		try {
			JsonParser parser = new JsonParser();
			
			JsonObject jsonObj = (JsonObject)parser.parse(param);
			
			String msg = jsonObj.get("sendMsg").toString().replaceAll("\"", "");
			
			String userId = jsonObj.get("userId").toString().replaceAll("\"", "");
			
			TAB_QA_VO vo = new TAB_QA_VO();
			
			vo.setQaWtrId(userId);
			
			vo.setQaCtt(msg);
			
			vo.setQaStt(1);
			
			qaMgrService.insertMsgtoUser(vo);
		} catch (Exception e) {
			
		}
		
	}
}
