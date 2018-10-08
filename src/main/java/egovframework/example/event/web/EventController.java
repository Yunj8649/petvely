package egovframework.example.event.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringEscapeUtils;
import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.JsonObject;

import egovframework.example.event.service.EventService;
import egovframework.example.event.service.Event_Paging_VO;
import egovframework.example.event.service.TAB_EVENT_VO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class EventController {
	@Resource(name = "eventService")
	private EventService eventService;
	
	@RequestMapping(value = "eventBoard.do")
	public String eventBoard(ModelMap model, @ModelAttribute Event_Paging_VO pagingVo) throws Exception {
		System.out.println("eventBoard()");
		
		try {
			List<EgovMap> eventList = eventService.selectEventList(pagingVo);
			
			EgovMap pagingListCnt = eventService.selectPagingListCnt(pagingVo);
			
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
			
			model.addAttribute("resMap", 		resMap);
			model.addAttribute("eventList", 	eventList);
		} catch (Exception e) {
			
		}
		
		return "event/eventBoard.tiles";
	}
	
	@RequestMapping(value = "event_detail.do")
	public String event_detail(ModelMap model, @ModelAttribute TAB_EVENT_VO vo) throws Exception {
		System.out.println("event_detail()");
		try {
			List<EgovMap> eventDetailList = eventService.selectEventDetailList(vo);
			
			if (eventDetailList.get(0).containsKey("evCtt")) {
				String eventDetailCtt = StringEscapeUtils.unescapeHtml(eventDetailList.get(0).getValue(2).toString());
				
				model.addAttribute("eventDetailList",	eventDetailList);
				model.addAttribute("eventDetailCtt",	eventDetailCtt);
			} else {
				model.addAttribute("eventDetailList",	eventDetailList);
			}
		} catch (Exception e) {
			
		}
		
		return "event/event_detail.tiles";
	}

}
