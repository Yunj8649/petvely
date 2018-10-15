package egovframework.example.bannerMgr.web;

import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.bannerMgr.service.BannerMgrService;
import egovframework.example.bannerMgr.service.BannerMgrVO;
import egovframework.example.cmmn.JsonUtil;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class bannerMgrController {
	@Resource(name="bannerMgrService")
	private BannerMgrService bannerMgrService;
	
	@RequestMapping(value="bannerMgr.do")
	public String bannerMgr() throws Exception {
		return "admin/mainPageMgr/bannerMgr.tiles";
	}
	
	@RequestMapping(value="bannerInsertPopup.do")
	public String bannerInsert() throws Exception {
		return "admin/mainPageMgr/bannerInsert";
	}
	
	@ModelAttribute("ctBoxList")
	public List<EgovMap> getBannerLocationList(ModelMap model) throws Exception {
		return bannerMgrService.getBannerLocationList();
	}
	
	@RequestMapping(value = "getBannerTypeSelectBox.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String getBannerTypeList(@RequestBody String param) throws Exception {
		
		String banLocString = JsonUtil.JsonToMap(param).get("param").toString();
		HashMap<String, Object> resMap = new HashMap<String, Object>();
		
		try {		
			if(!banLocString.isEmpty()){
				List<EgovMap> banTypeList = bannerMgrService.getBannerTypeList(banLocString);
				System.out.println("banTypeList" + banTypeList);
				if( banTypeList.size() != 0 )
				{
					resMap.put("result", "SUCCESS");
					resMap.put("banTypeList", banTypeList);
				}
			}
		} catch (Exception e) {
			System.out.println("들어온 위치에 맞는 배너 타입이 없어");
		}
		
		return JsonUtil.HashMapToJson(resMap).toString();
	}
	
	@RequestMapping(value ="bannerMgrMain.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String bannerMgrMain(@ModelAttribute BannerMgrVO bannerMgrVO) throws Exception {
		HashMap<String, Object> resMap = new HashMap<String, Object>();
		
		try {
			System.out.println("hello" + bannerMgrVO.getParam());
			String parseStr = bannerMgrVO.getParam().replaceAll("&quot;", "\"");
			System.out.println("bye" + parseStr);
			
			Map<String, Object> tempMap = JsonUtil.JsonToMap(parseStr);
			bannerMgrVO.setSelectedBanLoc((String) tempMap.get("selectedBanLoc"));
			bannerMgrVO.setSelectedBanType((String) tempMap.get("selectedBanType"));
			
			List<EgovMap> jqGridList = bannerMgrService.selectJqgridList(bannerMgrVO);
			
			EgovMap jqGridListCnt = bannerMgrService.selectJqgridListCnt(bannerMgrVO);
			
			resMap.put("rows", jqGridList);
			resMap.put("page", bannerMgrVO.getPage());
			resMap.put("total", jqGridListCnt.get("totalpage"));
			resMap.put("records", jqGridListCnt.get("totaltotcnt"));
			
			System.out.println("out prdmgrController : " + JsonUtil.HashMapToJson(resMap).toString());
		} catch (Exception e) {
		}
		return JsonUtil.HashMapToJson(resMap).toString();
	}
	
	@RequestMapping(value="banMgrRadio.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String banMgrRadio(@RequestParam String param) throws Exception {
		String result = "";
		try {
			param = param.replaceAll("&quot;", "\"");
			System.out.println("radio" + param);
			
			Map<String, Object> resMap = JsonUtil.JsonToMap(param);
			
			bannerMgrService.setBanMgrRadio(resMap);
			
			result = "SUCCESS";
		} catch (Exception e) {
		}
		return JsonUtil.OneStringToJson(result);
	}
	
	@RequestMapping(value="banMgrCheck.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String banMgrCheck(@RequestParam String param) throws Exception {
		String result = "";
		try {
			param = param.replaceAll("&quot;", "\"");
			System.out.println(param);
			
			Map<String, Object> resMap = JsonUtil.JsonToMap(param);
			
			bannerMgrService.setBanMgrCheckBox(resMap);
			
			result = "SUCCESS";
		} catch (Exception e) {
		}
		return JsonUtil.OneStringToJson(result);
	}
	
	@RequestMapping(value = "bannerAdd.do")
	public void bannerAdd(HttpServletRequest request, 
			@ModelAttribute BannerMgrVO bannerMgrVO ) throws Exception {
		// vo로 받기?
		String formType = request.getParameter("bannerMgrFormType").toString();

		try {
			MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest)request;
			
			Iterator<String> iter = mRequest.getFileNames();
			
			MultipartFile multiPartFile = null;
			
			while(iter.hasNext()) {
				multiPartFile = mRequest.getFile(iter.next());
				
				if(multiPartFile.isEmpty() == false) {
					System.out.println("파일정보");
					System.out.println("name : " + multiPartFile.getName());
					System.out.println("filename : " + multiPartFile.getOriginalFilename());
					System.out.println("size : " + multiPartFile.getSize());
					System.out.println("파일정보끝");
				}	else {
					System.out.println("getFile 실패");
				}
			}
			bannerMgrService.insertBanners(mRequest, bannerMgrVO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		/*
		if(formType.equals("insert")) {
			System.out.println("bannerInsertClass Type : insert");
			// 값+이미지

		} else if (formType.equals("modify")) {
			// 값만
			// 값+이미지
			System.out.println("bannerInsertClass Type : modify");
		} else {
			System.out.println("bannerInsertClass Type : 예외값");
		}
		*/
		
	}
		
}
