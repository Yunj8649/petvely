package egovframework.example.cart.web;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.cart.service.CartService;
import egovframework.example.cart.service.TAB_CART_VO;
import egovframework.example.cmmn.JsonUtil;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class CartController {
	@Resource(name = "cartService")
	private CartService cartService;
	
	//카트에 추가
	@RequestMapping(value = "addCart.do")
	public String addCart(@ModelAttribute TAB_CART_VO vo,ModelMap model,HttpSession session,
			@RequestParam int prCd, @RequestParam String crQty) throws Exception {
	    System.out.println("addCart()");
		
	    String msgLog = "로그인하세요.";
	    // 장바구니에 기존 상품이 있는지 검사
	    
    	String accId = (String) session.getAttribute("sessionID");
    	if(accId != null && accId != ""){
		    vo.setAccId(accId);
		    vo.setPrCd(prCd);
		    vo.setCrQty(Integer.parseInt(crQty));
		    
		    int count = cartService.countCart(prCd, accId);
		    if(count == 0){
		        // 없으면 insert
		        cartService.insertCart(vo);
		    } else {
		        // 있으면 update
		        cartService.updateCart(vo);
		    }
    	} else {
			model.put("msgLog", msgLog);
			
			return "user/login.tiles";
	    }
	    return  "redirect:cart.do";
	}
	
	//카트 삭제
	@RequestMapping("deleteCart.do")
    public String deleteCart(@RequestParam int crCd) throws Exception{
        cartService.deleteCart(crCd);
        return "redirect:cart.do";
    }

    // 4. 장바구니 수정
    @RequestMapping("updateCart.do")
    public void updateCart(@RequestBody String param, 
			HttpServletResponse response, HttpSession session) throws Exception {
        // session의 id
    	System.out.println("updateCart()");
        String accId = (String) session.getAttribute("sessionID");
        

		Map<String, Object> paramMap = JsonUtil.JsonToMap(param);
		HashMap<String, Object> resMap = new HashMap<String, Object>(); 
		
		paramMap = JsonUtil.JsonToMap(param);
		System.out.println(paramMap.get("aParam"));
		
		try{
			cartService.modifyCart(paramMap.get("aParam").toString());
			
			resMap.put("result", "SUCCESS");
		} catch (Exception e){
			
		}
		
		PrintWriter out = null;
		
		response.setCharacterEncoding("UTF-8");
		
		out = response.getWriter();
		
		out.write(JsonUtil.HashMapToJson(resMap));
    }
	
    //카트 보여주기
	@RequestMapping(value = "cart.do")
	public String cart(@ModelAttribute TAB_CART_VO vo, ModelMap model, HttpSession session) throws Exception {
	
		String accId = (String) session.getAttribute("sessionID"); // session에 저장된 userId
	    String msgLog = "로그인하세요.";
	    
        if(accId != null && accId !=""){
			Map<String, Object> map = new HashMap<String, Object>();
	        List<EgovMap> cartList = cartService.listCart(accId); // 장바구니 정보 
	        
	        int sumCart = cartService.sumCart(accId); // 장바구니 전체 금액 호출
	        // 장바구니 전체 긍액에 따라 배송비 구분
	        // 배송료(7만원이상 => 무료, 미만 => 2500원)
	        int dlvPrice = sumCart >= 30000 ? 0 : 2500;
	        
	        map.put("cartList", cartList);            // 장바구니 정보를 map에 저장
	        map.put("count", cartList.size());        // 장바구니 상품의 유무
	        map.put("sumCart", sumCart);       		  // 장바구니 전체 금액
	        map.put("dlvPrice", dlvPrice);            // 배송금액
	        map.put("allSum", sumCart + dlvPrice);    // 주문 상품 전체 금액
	        model.addAttribute("cartMap", map);
        } else  {
			model.put("msgLog", msgLog);
			
			return "user/login.tiles";
	    }
        	
		return "cart/cart.tiles";
	}
	
	@RequestMapping(value = "wish-list.do")
	public String initWish() throws Exception {

		return "cart/wish-list.tiles";
	}
}
