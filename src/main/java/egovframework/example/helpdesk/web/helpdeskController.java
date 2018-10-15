package egovframework.example.helpdesk.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class helpdeskController {
	
	@RequestMapping(value="helpdesk.do")
	public String helpdesk() throws Exception {	
		return "helpdesk/helpdesk.tiles";
	}
	
	@RequestMapping(value="helpBoardDetail.do")
	public String helpBoardDetail() throws Exception {	
		return "helpdesk/helpBoardDetail.tiles";
	}
	
	//Q & A
	@RequestMapping(value="faqs.do")
	public String faqs() throws Exception {
		return "helpdesk/faqs.tiles";
	}	
	
}