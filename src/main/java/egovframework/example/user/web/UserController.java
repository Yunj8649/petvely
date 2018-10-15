package egovframework.example.user.web;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.cmmn.TempKey;
import egovframework.example.user.service.TAB_ACCOUNT_VO;
import egovframework.example.user.service.UserService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class UserController {
	@Resource(name = "userService")
	private UserService userService;
	
   @Autowired
    private JavaMailSender sender;

	
	//로그인 페이지 이동
	@RequestMapping(value = "login.do")
	public String login() throws Exception {
		System.out.println("login()");

		return "user/login.tiles";
	}
	
	//회원가입 페이지 이동
	@RequestMapping(value = "register.do")
	public String register() throws Exception {
		System.out.println("register()");

		return "user/register.tiles";
	}
	
	//로그인 시도
	@RequestMapping(value = "logindo.do")
	public String logindo(@ModelAttribute TAB_ACCOUNT_VO vo, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("logindo()");
		
		List<EgovMap> resMap = userService.user_login(vo);
	
		HttpSession session = request.getSession();
		
		if (resMap.size() > 0) {
			if (resMap.get(0).getValue(3).equals("N")) {
				session.setAttribute("sessionID", resMap.get(0).getValue(0));
				
				session.setAttribute("sessionGRP", resMap.get(0).getValue(1));
				
				session.setAttribute("sessionNM", resMap.get(0).getValue(2));
				
				response.sendRedirect("main.do");
			} else if (resMap.get(0).getValue(3).equals("Y")) {
				model.addAttribute("accDel", "탈퇴 혹은 추방된 회원입니다.");
			} else {
				model.addAttribute("loginFAIL", "오류가 발생 하였습니다.");
			}
		} else {
			model.addAttribute("loginFAIL", "등록되지 않은 ID 혹은 비밀번호가 다릅니다.");
		}
		
		return "user/login.tiles";
	}

/*	@RequestMapping(value = "registerdo.do")
	public void registerdo(HttpServletResponse response) throws Exception {

		response.sendRedirect("main.do"); 
	}*/
	
	@RequestMapping(value = "logout.do")
	public String logout(HttpServletRequest request) throws Exception {
		System.out.println("logout()");
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return "main/main.tiles";
	}
	
	//회원가입 신청시 insert method
	@RequestMapping(value = "user_register.do")
	public String user_register (@ModelAttribute TAB_ACCOUNT_VO vo) throws Exception {
		System.out.println("user_register()");
		userService.user_register(vo);
		
		return "user/register_complete.tiles";
	}
	
	//id 중복 검사 method
	@RequestMapping(value = "id_check.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String id_check (@RequestParam String id) throws Exception {
		System.out.println("id_check()");
		String result = "";
		
		HashMap<String, Object> resMap = new HashMap<String, Object>();
		
		try {
			if (id.equals("") || id == null) {
				result = "FALSE";
				
				resMap.put("result", result);
			} else {
				List<EgovMap> check_result = userService.id_check(id);
				
				result = "SUCCESS";
				
				resMap.put("result", result);
				
				resMap.put("id", check_result);
			}
		} catch (Exception e) {
			
		}
		
		return JsonUtil.HashMapToJson(resMap).toString();
	}
	
	//중복처리 ajax 중복이 아니라면 result에  SUCCESS 반환
		@RequestMapping(value = "duplicateChk.do", method = RequestMethod.POST)
		public void duplicateChk(HttpServletResponse response, 
				@RequestBody String param) throws Exception {
		
			HashMap<String, Object> resMap = new HashMap<String, Object>();
			
			try{
				List<EgovMap> list = userService.Email(param);
				
			    if(list.size() == 0){ //같은 이메일이 없으면 비밀번호 찾기를 못함
					resMap.put("result", "FAIL");
				} else {
					resMap.put("result", "SUCCESS");
				}
			} catch(Exception e){
				
			}

			PrintWriter out = null;
			
			response.setCharacterEncoding("UTF-8");
			
			out = response.getWriter();
			
			out.write(JsonUtil.HashMapToJson(resMap));
		}
	
	//이메일 키값을 보낼 ajax
		@RequestMapping(value = "emailCheck.do", method=RequestMethod.POST)
		@ResponseBody
		public void emailChk (HttpServletResponse res, 
					@RequestBody String param) throws Exception {
		 	System.out.println("emailChk()");
			
		 	HashMap<String, Object> resMap = new HashMap<String, Object>();
		 	
		 	//보낼때 사용하는 계정
		 	String setfrom = "zonae8649@gmail.com";     //petvely0
		 	String key	   = new TempKey().getKey(10, false);
		 	
		 	System.out.println(key);
		 	
		    String tomail  = param;     // 받는 사람 이메일
		    String title   = "petvely 이메일 인증 서비스 입니다.";
		    String content = new StringBuffer().
		    		append("제공되는 키를 인증번호 입력 창에 입력해주세요 키값은 : ").
		    		append(key).
		    		append(" 입니다.").
		    		toString();
		    
		    resMap.put("result", "SUCCESS");
		    
		    resMap.put("key", key);
		    
		    try {
		    	

		      MimeMessage message = sender.createMimeMessage();
		      
		      MimeMessageHelper messageHelper 
		                        = new MimeMessageHelper(message, true, "UTF-8");
		   
		      messageHelper.setFrom(setfrom,"petvely");  // 보내는사람 생략하거나 하면 정상작동을 안함 두번째 인자값은 보낼때의 이름이다.
		      messageHelper.setTo(tomail);     // 받는사람 이메일
		      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
		      messageHelper.setText(content);  // 메일 내용

		      sender.send(message);

			  PrintWriter out = null;
				
		      res.setCharacterEncoding("UTF-8");
				
			  out = res.getWriter();
				
			  out.write(JsonUtil.HashMapToJson(resMap));
			  
		    } catch(Exception e){

		    }
		   
		}
		
		//ID PW 찾기
		@RequestMapping(value = "find_idpw.do")
		public String find_idpw() throws Exception {
			System.out.println("ho");
			
			return "user/find_idpw.tiles";
		}
	
		//ID 찾기
		@RequestMapping(value = "/find_id.do", produces = "application/json; charset=utf8")
		public String find_id(@ModelAttribute TAB_ACCOUNT_VO vo, ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {
			System.out.println("finddo()");
			
			HashMap<String, Object> resMap = new HashMap<String, Object>();
			List<EgovMap> user = userService.find_idpw(vo);
			
			resMap.put("resMap", 0);
			System.out.println(request.getParameter("page_check"));
			
			System.out.println(user.get(0).getValue(0));
			model.addAttribute("ID", user.get(0).getValue(0));
			
			System.out.println("gogo");
			
			return "user/result.tiles";
		}
		
	
		@RequestMapping(value = "pwRe.do")
		public String findPw(HttpServletRequest request) throws Exception {
			System.out.println("findpwdo()");
			
			TAB_ACCOUNT_VO vo = new TAB_ACCOUNT_VO();
			
			String email 	= (String) request.getParameter("accEm");
			String pw		= (String) request.getParameter("accPwNew");
			System.out.println(email);
			vo.setAccEm(email);
			vo.setAccPwNew(pw);
				
			userService.user_pw(vo);
				
			
			return "user/login.tiles";
		}
		
		@RequestMapping(value = "test.do")
		public String test() throws Exception {
	
			return "user/register_complete.tiles";
		}
}
