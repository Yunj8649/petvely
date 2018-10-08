package egovframework.example.order.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.example.order.service.TAB_ORDER_VO;
//import egovframework.example.product.service.TAB_PROD_VO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("orderMapper")
public interface OrderMapper {

//	List<EgovMap> selectProductList(TAB_PROD_VO vo) throws Exception;

	void insertOrder(TAB_ORDER_VO vo) throws Exception;

	void updateOrder(TAB_ORDER_VO vo) throws Exception;

	void deleteOrder(int crCd) throws Exception;

	void modifyOrder(TAB_ORDER_VO vo) throws Exception;

	List<EgovMap> listOrder(String accId) throws Exception;

	int sumOrder(String accId) throws Exception;

	int selectOne(Map<String, Object> map) throws Exception;

}
