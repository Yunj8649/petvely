package egovframework.example.notice.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.notice.service.NoticeService;
import egovframework.example.notice.service.Notice_Paging_VO;
import egovframework.example.notice.service.TAB_NOTICE_VO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class NoticeController {
	@Resource(name = "noticeService")
	private NoticeService noticeService;
	
	//공지사항
	@RequestMapping(value = "notice.do")
	public String initNotice(ModelMap model, @ModelAttribute Notice_Paging_VO pagingVo) throws Exception {
		System.out.println("initNotice()");
		try {
			List<EgovMap> noticeList = noticeService.selectPagingList(pagingVo);
			
			EgovMap pagingListCnt = noticeService.selectPagingListCnt(pagingVo);
			
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
			
			resMap.put("pageGroup", pageGroup);
			resMap.put("prePage", prePage);
			resMap.put("nextPage", nextPage);
			
			model.addAttribute("resMap", 		resMap);
			model.addAttribute("noticeList", 	noticeList);
		} catch (Exception e) {
			
		}
		
		return "notice/notice.tiles";
	}
	
	@RequestMapping(value = "notice_detail.do")
	public String notice_detail(@ModelAttribute TAB_NOTICE_VO vo, ModelMap model) throws Exception {
		System.out.println("notice_detail()");
		
		try {
			vo.setNtHit(noticeService.selectNoticeHit(vo) + 1);
			
			noticeService.updateHit(vo);
			
			List<EgovMap> noticeDetailList = noticeService.noticeDetailList(vo);
			
			model.addAttribute("noticeDetailList", noticeDetailList);
		} catch (Exception e) {
			
		}
		
		return "notice/notice_detail.tiles";
	}
}
