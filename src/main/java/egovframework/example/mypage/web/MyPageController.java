package egovframework.example.mypage.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	
	//MyPage
	@RequestMapping(value="myPage.do")
	public String myPage() throws Exception {
		return "mypage/mypage.tiles";
	}	
	
	//주소목록
	@RequestMapping(value="address.do")
	public String address() throws Exception {
		return "mypage/address.tiles";
	}	
}
