package egovframework.example.category.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.category.service.CategoryService;
import egovframework.example.category.service.Category_Paging_VO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class CategoryController {
	@Resource(name="categoryService")
	private CategoryService categoryService;
	
	//목욕용품
	@RequestMapping(value="bathing.do")
	public String bathing() throws Exception {
		return "category/bathing.tiles";
	}
	
	//영양제
	@RequestMapping(value="supplements.do")
	public String supplements() throws Exception {
		return "category/supplements.tiles";
	}
	
	//위생, 배변
	@RequestMapping(value="clean.do")
	public String clean() throws Exception {
		return "category/clean.tiles";
	}
	
	//하우스, 울타리
	@RequestMapping(value="house.do")
	public String house() throws Exception {
		return "category/house.tiles";
	}
	
	// 외출
	@RequestMapping(value="walk.do")
	public String outing() throws Exception {
		return "category/walk.tiles";
	}
	
	//급수기,급식기
	@RequestMapping(value="feed.do")
	public String feeding() throws Exception {
		return "category/feed.tiles";
	}
	
	//사료
	@RequestMapping(value="dogFood.do")
	public String dogFood() throws Exception {
		return "category/dogFood.tiles";
	}
	
	//간식
	@RequestMapping(value="snack.do")
	public String snack() throws Exception {
		return "category/snack.tiles";
	}
	
	//미용용품
	@RequestMapping(value="beauty.do")
	public String beauty() throws Exception {
		return "category/beauty.tiles";
	}

	//장난감, 훈련용품
	@RequestMapping(value="toy.do")
	public String toy() throws Exception {
		return "category/toy.tiles";
	}

	//줄, 이름표
	@RequestMapping(value="namecard.do")
	public String namecard() throws Exception {
		return "category/namecard.tiles";
	}
	
	//패션의류신발
	@RequestMapping(value="fashion.do")
	public String fashion() throws Exception {
		return "category/fashion.tiles";
	}	
	
	//반품몰
	@RequestMapping(value="returnMall.do")
	public String returnMall() throws Exception {
		return "category/returnMall.tiles";
	}	
	
	//20180114 bsc 추가
	//프론트 상품은 전부 여기를 탄다. 
	// 위 목용용품 ~ 반품몰 모두 사용되지 않음
	// db연동이후에는 아래 xxxxx.do를 타게됨
	@RequestMapping(value="frtPrdList.do")
	public String frtPrdList(@RequestParam("ctCd") String ctCd , @RequestParam("subCtCd") String subCtCd, 
			ModelMap model, @ModelAttribute Category_Paging_VO pagingVo) throws Exception {
		
		try {
			List<EgovMap> frntPrdList  = categoryService.getFrntPrdList(pagingVo);
			List<EgovMap> categoryList  = categoryService.getCtrName(ctCd, subCtCd);
			
			EgovMap pagingListCnt = categoryService.selectPagingListCnt(pagingVo);
			
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
			model.addAttribute("frtPrdList",	frntPrdList);
			model.addAttribute("categoryList",	categoryList);
			
		} catch (Exception e) {
			
		}
		
		return "category/frtPrdList.tiles";
	}	
}
