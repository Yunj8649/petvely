package egovframework.example.cart.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface CartService {

//	List<EgovMap> selectProductList(TAB_PROD_VO vo) throws Exception;
	int countCart(int prCd, String accId) throws Exception;
	void insertCart(TAB_CART_VO vo) throws Exception;
	void updateCart(TAB_CART_VO vo) throws Exception;
	void deleteCart(int crCd) throws Exception;
	void modifyCart(String param) throws Exception;
	List<EgovMap> listCart(String accId) throws Exception;
	int sumCart(String accId) throws Exception;
	
}
