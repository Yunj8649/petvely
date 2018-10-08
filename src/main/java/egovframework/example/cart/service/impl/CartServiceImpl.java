package egovframework.example.cart.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import egovframework.example.cart.service.CartService;
import egovframework.example.cart.service.TAB_CART_VO;
import egovframework.example.cmmn.JsonUtil;
import egovframework.example.product.service.TAB_PROD_VO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("cartService")
public class CartServiceImpl implements CartService{
	@Resource(name = "cartMapper")
	private CartMapper cartMapper;

//	@Override
//	public List<EgovMap> selectProductList(TAB_PROD_VO vo) throws Exception {
//		return cartMapper.selectProductList(vo);
//	}
	
	// 6. 장바구니 동일한 상품 레코드 확인
	@Override
	public int countCart(int prCd, String accId) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("prCd", prCd);
        map.put("accId", accId);
        return  cartMapper.selectOne(map);
	}
	
	@Override
	public void insertCart(TAB_CART_VO vo) throws Exception {
		cartMapper.insertCart(vo);
	}

	@Override
	public void updateCart(TAB_CART_VO vo) throws Exception {
		cartMapper.updateCart(vo);
	}

	@Override
	public void deleteCart(int crCd) throws Exception {
		cartMapper.deleteCart(crCd);
	}

	@Override
	public void modifyCart(String param) throws Exception {		
		System.out.println();
		
		System.out.println("여긴가>>>> " + param);
		/*
		Map<String, Object> aparam = JsonUtil.JsonToMap(aparam);
		List<Map<String, Object>> qustMapList = JsonUtil.JsonToList(qustList);
		
		String stringChange = mainInfoMap.get("humanCategory").toString();
		
		stringChange = stringChange.replace("[", "");
		stringChange = stringChange.replace("]", "");
		stringChange = stringChange.replace(" ", "");
		
		mainInfoMap.put("humanCategory", stringChange);
		mainInfoMap.put("signTrgNo",     signTrgNo);
		
		popMapper.insertEduInfo(mainInfoMap);
		
		for(int i = 0; i < qustMapList.size(); i++){
			Map<String, Object> qustMap = new HashMap<String, Object>();
			
			qustMap.put("qustCode",  qustMapList.get(i).get("qustCode"));
			qustMap.put("qustScore", qustMapList.get(i).get("qustScore"));
			qustMap.put("signTrgNo", signTrgNo);
			
			popMapper.insertEduDetail(qustMap);
		}
		popMapper.updateUserInfo(mainInfoMap);*/
		cartMapper.modifyCart(param);
	}

	@Override
	public List<EgovMap> listCart(String accId) throws Exception {
		return cartMapper.listCart(accId);
	}

	@Override
	public int sumCart(String accId) throws Exception {
		return cartMapper.sumCart(accId);
	}

}
