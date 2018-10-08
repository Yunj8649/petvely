package egovframework.example.memberMgr.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import egovframework.example.memberMgr.service.MemberMgrVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.example.cmmn.JsonUtil;
import egovframework.example.memberMgr.service.MemberMgrService;

@Controller
public class MemberMgrController {
	@Resource(name="memberMgrService")
	private MemberMgrService memberMgrService;
	
	@RequestMapping(value="memberMgr.do")
	public String memberMgr() throws Exception {
		return "admin/member/memberMgr.tiles";
	}
	
	@RequestMapping(value="memberMgrMain.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String memberMgrMain(@ModelAttribute MemberMgrVO memberMgrVO) throws Exception {
		HashMap<String, Object> resMap = new HashMap<String, Object>();
		
		try {
			String parseStr = memberMgrVO.getParam().replaceAll("&quot;", "\"");
			
			System.out.println("memberMgrMain parseStr : " + parseStr);
			
			List<EgovMap> jqGridList = memberMgrService.selectJqgridList(memberMgrVO);
			EgovMap	jqGridListCnt = memberMgrService.selectJqgridListCnt(memberMgrVO);
			
/*			
// 			전화번호 합쳐주는 부분..
 			Iterator<EgovMap> itr = jqGridList.iterator();
			
			while (itr.hasNext()) {
				EgovMap egovObj = itr.next();
				
				String str = ""; 
				
				str = "0" + egovObj.get("accPn1").toString() + egovObj.get("accPn2").toString() 
						+ egovObj.get("accPn3").toString();
				try {
					System.out.println(str);
					Integer.parseInt(str);
				} catch (Exception e) {
					System.out.println(e);
				}
				
				egovObj.put("ACC_PN", 111);
			}*/
			
			resMap.put("rows", 		jqGridList);
			resMap.put("page", 		memberMgrVO.getPage());
			resMap.put("total", 	jqGridListCnt.get("totalpage"));
			resMap.put("records", 	jqGridListCnt.get("totaltotcnt"));
			
			System.out.println("out memberMgrMain : " + JsonUtil.HashMapToJson(resMap).toString());
		} catch (Exception e) {
		}
		
		return JsonUtil.HashMapToJson(resMap).toString();
	}
	
	@RequestMapping(value="ctrlMemberMgrGrid.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String ctrlMemberMgrGrid(@RequestParam String param) throws Exception {
		String result = "";
		
		try {
			param = param.replaceAll("&quot;", "\"");
			System.out.println(param);
			
			JSONArray jsonArray = new JSONArray(param);
			
			System.out.println("jsonArray" + jsonArray);
			memberMgrService.ctrlMemGridTx(jsonArray);
			
			result = "SUCCESS";
		} catch (Exception e) {
		}
		
		return JsonUtil.OneStringToJson(result);
	}
	
	@RequestMapping(value="memberModify.do")
	public String memberModify(HttpServletRequest request, ModelMap model) throws Exception {
		EgovMap resMap = new EgovMap();
		
		try {
			resMap = memberMgrService.getSelSeqNoData(request.getParameter("memSeqNo"));
		} catch (Exception e) {
			System.out.println(e);
		}

		System.out.println("성공" + resMap);
		model.addAttribute("getMemData", resMap);
		
		return "admin/member/memberModify"; 
	}
}
