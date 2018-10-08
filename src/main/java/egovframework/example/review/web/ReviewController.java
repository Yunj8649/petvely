package egovframework.example.review.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {
	//후기모음
	@RequestMapping(value = "customReview.do")
	public String initReview() throws Exception {

		return "review/customReview.tiles";
	}
	@RequestMapping(value = "writeCustomReview.do")
	public String initWriteReview() throws Exception {

		return "review/writeCustomReview.tiles";
	}
	@RequestMapping(value = "customReview1.do")
	public String customReview1() throws Exception {

		return "review/customReview1.tiles";
	}
}
