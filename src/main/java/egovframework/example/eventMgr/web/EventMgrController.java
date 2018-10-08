package egovframework.example.eventMgr.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringEscapeUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.event.service.Event_Paging_VO;
import egovframework.example.event.service.TAB_EVENT_VO;
import egovframework.example.eventMgr.service.EventMgrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class EventMgrController {
	@Resource(name = "eventMgrService")
	private EventMgrService eventMgrService;

	// 이벤트 게시글 첫화면 띄우기 및 페이징 처리
	@RequestMapping(value = "eventMgr.do")
	public String eventMgr(@ModelAttribute Event_Paging_VO pagingVo, ModelMap model) throws Exception {
		System.out.println("eventMgr()");
		
		try {
			pagingVo.setEvDel("all");
			
			List<EgovMap> eventMgr = eventMgrService.selectEventMgrList(pagingVo);
			
			EgovMap pagingListCnt = eventMgrService.selectPagingListCnt(pagingVo);
			
			HashMap<String, Object> resMap = new HashMap<String, Object>();
			
			resMap.put("fstPage", pagingVo.getFstpage());
			resMap.put("page", pagingVo.getPage());
			resMap.put("total", pagingListCnt.get("totalPage"));
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
			model.addAttribute("eventMgr",	eventMgr);
		} catch (Exception e) {
			
		}
		
		return "admin/eventMgr/eventMgr.tiles";
	}
	
	// 이벤트 삭제
	@RequestMapping(value = "delEvent.do" , produces = "application/json; charset=utf-8")
	@ResponseBody
	public String delEvent(@RequestBody String param) throws Exception{
		System.out.println("delEvent()");
		
		String result = "";
		
		try {
			System.out.println("param : " + param);
			
			JsonParser parser = new JsonParser();
			
			JsonObject jsonObj = (JsonObject)parser.parse(param);
			
			if (jsonObj.get("delEvent").getAsJsonArray().size() <= 0) {
				result = "0";
			} else {
				for (int i = 0; i < jsonObj.get("delEvent").getAsJsonArray().size(); i++){
					eventMgrService.deleteEventList(jsonObj.get("delEvent").getAsJsonArray().get(i).toString());
				}
				
				result = "SUCCESS";
			}
		} catch (Exception e) {
			
		}
		
		return JsonUtil.OneStringToJson(result);
	}
	
	// 삭제된 이벤트 복구
	@RequestMapping(value = "relEvent.do" , produces = "application/json; charset=utf-8")
	@ResponseBody
	public String relEvent(@RequestBody String param) throws Exception{
		System.out.println("relEvent()");
		
		String result = "";
		
		try {
			System.out.println("param : " + param);
			
			JsonParser parser = new JsonParser();
			
			JsonObject jsonObj = (JsonObject)parser.parse(param);
			
			System.out.println(jsonObj.get("relEvent").getAsJsonArray().size());
			
			if (jsonObj.get("relEvent").getAsJsonArray().size() <= 0) {
				result = "0";
			} else {
				for (int i = 0; i < jsonObj.get("relEvent").getAsJsonArray().size(); i++){
					eventMgrService.reloadEventList(jsonObj.get("relEvent").getAsJsonArray().get(i).toString());
				}
				
				result = "SUCCESS";
			}
		} catch (Exception e) {
			
		}
		
		return JsonUtil.OneStringToJson(result);
	}
	
	// 이벤트 게시글 추가 화면 이동
	@RequestMapping(value = "addEvent.do")
	public String addEvent() throws Exception {
		System.out.println("addEvent()");
		return "admin/eventMgr/eventMgrDetail.tiles";
	}
	
	// 이벤트 게시글 수정 화면이동
	@RequestMapping(value = "modiEvent.do")
	public String modiEvent(HttpServletRequest request, ModelMap model) throws Exception {
		System.out.println("modiEvent()");
		
		try {
			List<EgovMap> eventItem = eventMgrService.selectEventListevSeq(request.getParameter("evSeq"));
			
			if (eventItem.get(0).containsKey("evCtt")) {
				String eventDetailCtt = StringEscapeUtils.unescapeHtml(eventItem.get(0).getValue(2).toString());
				
				model.addAttribute("eventItem",			eventItem);
				model.addAttribute("eventDetailCtt",	eventDetailCtt);
			} else {
				System.out.println("eventItem : " + 	eventItem);
				model.addAttribute("eventItem",			eventItem);
			}
		} catch (Exception e) {
			
		}
		
		return "admin/eventMgr/eventMgrDetail.tiles";
	}
	
	// 이벤트 게시글 수정 및 추가
	@RequestMapping(value = "eventMgrSave.do")
	public String eventMgrSave(HttpServletRequest request, @ModelAttribute TAB_EVENT_VO vo) throws Exception {
		System.out.println("eventMgrSave()");
		
		try {
			if (request.getParameter("evSeq") != null && request.getParameter("evSeq") != "") {
				System.out.println("eventMgrSave() update()");
				eventMgrService.updateEventContent(vo);
			} else {
				System.out.println("eventMgrSave() insert()");
				eventMgrService.insertEventContent(vo);
			}
		} catch (Exception e) {
			
		}
		
		return "redirect:eventMgr.do";
	}
	
	// 이벤트 매니저 첫화면 한화면에 보이는 라인 수 및 삭제 유무
	@RequestMapping(value = "eventMgr_line.do" , produces = "application/json; charset=utf-8")
	@ResponseBody
	public String eventMgr_lines(@RequestBody String param, @ModelAttribute Event_Paging_VO pagingVo) throws Exception {
		System.out.println("eventMgr_lines()");
		
		System.out.println("param : " + param);
		
		HashMap<String, Object> resMap = new HashMap<String, Object>();
		
		try {
			JsonParser parser = new JsonParser();
			
			JsonObject jsonObj = (JsonObject)parser.parse(param);
			
			long page = Long.parseLong(jsonObj.get("page").toString().replaceAll("\"", ""));
			
			System.out.println("page : " + page);
			
			long rows = Long.parseLong(jsonObj.get("lines").toString().replaceAll("\"", ""));
			
			System.out.println("rows : " + rows);
			
			String del = jsonObj.get("del").toString().replaceAll("\"", "");
			
			System.out.println("del : " + del);
			
			pagingVo.setEvDel(del);
			pagingVo.setRows(rows);
			pagingVo.setPage(page);
			
			System.out.println("pagingVo Rows : " + pagingVo.getRows());
			
			List<EgovMap> eventMgr = eventMgrService.selectEventMgrList(pagingVo);
			
			EgovMap pagingListCnt = eventMgrService.selectPagingListCnt(pagingVo);
			
			resMap.put("fstPage", pagingVo.getFstpage());
			resMap.put("page", pagingVo.getPage());
			resMap.put("total", pagingListCnt.get("totalPage"));
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
			resMap.put("eventMgr", 	eventMgr);
			resMap.put("result", 	"SUCCESS");
			
			System.out.println("resMap : " + resMap);
		} catch (Exception e) {
			
		}
		
		return JsonUtil.HashMapToJson(resMap).toString();
	}
	
	@RequestMapping(value = "eventMgr_img.do")
	@ResponseBody
	public String eventMgr_img (MultipartHttpServletRequest mRequest) throws Exception {
		System.out.println("eventMgr_img()");

		String uploadPath = "C:/eGovFrameDev-3.6.0-64bit/workspace/petvely/src/main/webapp";
		String uploadPathUser = "/assets/images/event";
		String saveImage = "";

		uploadPath += uploadPathUser;
		
		File dir = new File(uploadPath);

		if (!dir.isDirectory()) {
			dir.mkdirs();
		}
		
		Iterator<String> iter = mRequest.getFileNames();

		String uploadFileName = iter.next();
		MultipartFile mFile = mRequest.getFile(uploadFileName);

		String originalFileName = mFile.getOriginalFilename();
		String saveFileName = originalFileName;
		String extName = saveFileName.substring(saveFileName.lastIndexOf(".")+1 );

		if(saveFileName != null && !saveFileName.equals("")) {

			if(new File(uploadPath + "/"+ saveFileName).exists()) {
				saveFileName = saveFileName.substring(0,saveFileName.lastIndexOf(".")) 
						+ "_" + System.currentTimeMillis() + "." + extName;
			}
			
			try {
				System.out.println("원본 파일 이름:" + originalFileName);
				System.out.println("저장 파일 이름:" + saveFileName);
				
				mFile.transferTo(new File(uploadPath + "/" + saveFileName));
				
				saveImage = ".." + uploadPathUser + "/"+ saveFileName;
				
				System.out.println(saveImage);
				
				return saveImage;
			} catch (IllegalStateException e) {
				return "IllegalStateException";
			} catch (IOException e) {
				return "IOException";
			} catch (Exception e) {
				return "Exception";
			}
		}
		return saveImage;
	}
}