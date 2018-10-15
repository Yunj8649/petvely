package egovframework.example.detail.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.detail.service.DetailService;
import egovframework.example.product.service.TAB_PROD_VO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class DetailController {
	@Resource(name = "detailService")
	private DetailService detailService;
	
	@RequestMapping(value="detailPrd.do")
	public String detailPrd(@RequestParam("prCd") String prCd, ModelMap model) throws Exception {
		
		System.out.println("detailPrd()");

		TAB_PROD_VO vo = new TAB_PROD_VO();
		
		vo.setPrCd(Integer.parseInt(prCd));
		List<EgovMap> productDetail = detailService.selectProduct(vo);
		List<EgovMap> prdCategory = detailService.selectCtg(prCd);
		
		System.out.println(vo.getPrImg1());
		model.addAttribute("product" , productDetail);
		model.addAttribute("category" , prdCategory);
		
		return "detail/detailPrd.tiles";
	}
	
}
	