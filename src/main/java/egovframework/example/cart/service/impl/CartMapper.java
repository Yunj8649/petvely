package egovframework.example.cart.service.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestBody;

import egovframework.example.cart.service.TAB_CART_VO;
//import egovframework.example.product.service.TAB_PROD_VO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("cartMapper")
public interface CartMapper {

//	List<EgovMap> selectProductList(TAB_PROD_VO vo) throws Exception;

	void insertCart(TAB_CART_VO vo) throws Exception;

	void updateCart(TAB_CART_VO vo) throws Exception;

	void deleteCart(int crCd) throws Exception;

	void modifyCart(String param) throws Exception;

	List<EgovMap> listCart(String accId) throws Exception;

	int sumCart(String accId) throws Exception;

	int selectOne(Map<String, Object> map) throws Exception;

}
