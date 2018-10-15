package egovframework.example.order.web;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.order.service.OrderService;
import egovframework.example.order.service.TAB_ORDER_VO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class OrderController {
	@Resource(name = "orderService")
	private OrderService orderService;
	
	@RequestMapping(value="/complete.do")
	public String complete() throws Exception {
		return "order/complete.tiles";
	}
	
	@RequestMapping(value = "/order.do")
	public String order(@ModelAttribute TAB_ORDER_VO vo, ModelMap model, HttpSession session) throws Exception {
		String accId = (String) session.getAttribute("sessionID"); // session에 저장된 userId
	    String msgLog = "로그인하세요.";

		Map<String, Object> map = new HashMap<String, Object>();
        List<EgovMap> orderList = orderService.listOrder(accId); // 장바구니 정보 
        
        if(accId != null && accId !=""){
	        
	        int sumOrder = orderService.sumOrder(accId); // 장바구니 전체 금액 호출
	        // 장바구니 전체 긍액에 따라 배송비 구분
	        // 배송료(7만원이상 => 무료, 미만 => 2500원)
	        int dlvPrice = sumOrder >= 30000 ? 0 : 2500;
	        
	        map.put("orderList", orderList);            // 장바구니 정보를 map에 저장
	        map.put("count", orderList.size());        // 장바구니 상품의 유무
	        map.put("sumOrder", sumOrder);       		  // 장바구니 전체 금액
	        map.put("dlvPrice", dlvPrice);            // 배송금액
	        map.put("allSum", sumOrder + dlvPrice);    // 주문 상품 전체 금액
	        model.addAttribute("orderMap", map);
	        
	        if(((int)map.get("count")) == 0) {
	        	msgLog = "주문할 수 있는 상품이 없거나 잘못된 접근입니다.";
	        	
	        	model.put("msgLog", msgLog);
	        	return "main/main.tiles";
	        }
        } else  {
			model.put("msgLog", msgLog);
			
			return "user/login.tiles";
	    }
        
        
        
		return "order/order.tiles";
	}
}
