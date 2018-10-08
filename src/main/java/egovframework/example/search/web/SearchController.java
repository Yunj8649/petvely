package egovframework.example.search.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.search.service.SearchPageVO;
import egovframework.example.search.service.SearchService;

@Controller
public class SearchController {
	
	@Resource(name = "searchService" )
	private SearchService searchService;
	
	
	@RequestMapping(value = "/search.do")
	public String search(ModelMap model, SearchPageVO searchPageVO) throws Exception {
		
		System.out.println("searchPageVO value : " + searchPageVO.getKeyword());
		
		
		List<Map> prodList = searchService.selectList(searchPageVO);
		
		int prdListCnt = searchService.selectListCnt(searchPageVO.getKeyword());
		
		
		int pageGroup = (int)Math.ceil((double)searchPageVO.getPage() / 
				searchPageVO.getPageScale());		
		// 15 / 10 1.2 / = 2 
		int endPage = (int) (Math.ceil(searchPageVO.getPage() / (double)searchPageVO.getPageScale()) * searchPageVO.getPageScale());  
		
		int startPage = endPage - (int)searchPageVO.getPageScale() + 1;
		
		int totalPage = (int) Math.ceil(prdListCnt / (double)searchPageVO.getRows());
		
		long prePage = (pageGroup - 2) * searchPageVO.getPageScale() + searchPageVO.getPageScale();
		long nextPage = pageGroup * searchPageVO.getPageScale() + 1;
		
		
		System.out.println("endPage : " + endPage);
		System.out.println("startPage : "  + startPage);
		System.out.println("totalPage : "  + totalPage);
		System.out.println("prePage : "  + prePage);
		System.out.println("nextPage : "  + nextPage);
		
		
		model.addAttribute("endPage" , endPage);
		model.addAttribute("startPage" , startPage);
		model.addAttribute("totalPage" , totalPage);
		model.addAttribute("prePage" , prePage);
		model.addAttribute("nextPage" , nextPage);
		

		model.addAttribute("searchPageVO" , searchPageVO);
		model.addAttribute("prodList", prodList);
		
		
		
		
		return "search/search.tiles";
	}
}
