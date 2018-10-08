package egovframework.example.main.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.bannerMgr.service.impl.BannerMgrMapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class MainController {
//  주입
	@Resource(name = "bannerMgrMapper")
	private BannerMgrMapper bannerMgrMapper;
	
	@RequestMapping(value = "main.do")
	public String initMain(ModelMap model) throws Exception {
		
		List<EgovMap> bannerList = bannerMgrMapper.getAllBannerList();
		List<EgovMap> mainMidSlideBanList = new ArrayList<EgovMap>();
		List<EgovMap> headerLongBanList = new ArrayList<EgovMap>();
		List<EgovMap> mainLeftFloatBanList = new ArrayList<EgovMap>();


		Iterator<EgovMap> iter = bannerList.iterator();
		while(iter.hasNext()){
			EgovMap a = iter.next();
			System.out.println(a.toString());
			// System.out.println(a.get("banTypeNm"));
			if(a.get("banTypeNm").equals("메인_중단_슬라이드배너") && 
					a.get("banChecked").equals("Y")){
				System.out.println("메중슬");
				mainMidSlideBanList.add(a);
			} else if (a.get("banTypeNm").equals("헤더_롱배너")){
				//System.out.println("헤더롱");
				headerLongBanList.add(a);
			} else if (a.get("banTypeNm").equals("메인_좌측_플로팅배너")){
				//System.out.println("메좌플");
				mainLeftFloatBanList.add(a);
			} else {
				System.out.println("예외값 들어옴");
			}
		}
		// 180415 프론트에 뿌려
		model.addAttribute("bannerList", mainMidSlideBanList);
		
		return "main/main.tiles";
	}
}
