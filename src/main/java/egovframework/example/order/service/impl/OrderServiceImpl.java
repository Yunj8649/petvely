package egovframework.example.order.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.order.service.OrderService;
import egovframework.example.order.service.TAB_ORDER_VO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("orderService")
public class OrderServiceImpl implements OrderService{
	@Resource(name = "orderMapper")
	private OrderMapper orderMapper;

//	@Override
//	public List<EgovMap> selectProductList(TAB_PROD_VO vo) throws Exception {
//		return orderMapper.selectProductList(vo);
//	}
	
	// 6. 장바구니 동일한 상품 레코드 확인
	@Override
	public int countOrder(int prCd, String accId) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("prCd", prCd);
        map.put("accId", accId);
        return  orderMapper.selectOne(map);
	}

	@Override
	public List<EgovMap> listOrder(String accId) throws Exception {
		return orderMapper.listOrder(accId);
	}

	@Override
	public int sumOrder(String accId) throws Exception {
		return orderMapper.sumOrder(accId);
	}

	@Override
	public void insertOrder(TAB_ORDER_VO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateOrder(TAB_ORDER_VO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modifyOrder(TAB_ORDER_VO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteOrder(int crCd) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
