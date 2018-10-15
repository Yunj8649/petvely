package egovframework.example.admin.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.admin.service.AdminService;

@Controller
public class AdminController {
	@Resource(name = "adminService")
	private AdminService adminService;
	
	@RequestMapping(value = "admin_main.do")
	public String admin_main(ModelMap model) throws Exception {
		System.out.println("admin_main()");
		//List<EgovMap> pieChartList = adminService.selectCategoryCnt();
		
		//model.addAttribute("pieChartList", pieChartList);
		return "admin/main/main.tiles";
	}
}