package egovframework.example.order.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface OrderService {

//	List<EgovMap> selectProductList(TAB_PROD_VO vo) throws Exception;
	int countOrder(int prCd, String accId) throws Exception;
	void insertOrder(TAB_ORDER_VO vo) throws Exception;
	void updateOrder(TAB_ORDER_VO vo) throws Exception;
	void deleteOrder(int crCd) throws Exception;
	void modifyOrder(TAB_ORDER_VO vo) throws Exception;
	List<EgovMap> listOrder(String accId) throws Exception;
	int sumOrder(String accId) throws Exception;
	
}
