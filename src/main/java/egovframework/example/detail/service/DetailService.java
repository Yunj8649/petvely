package egovframework.example.detail.service;

import java.util.List;

import egovframework.example.product.service.TAB_PROD_VO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface DetailService {

	List<EgovMap> selectProduct(TAB_PROD_VO vo) throws Exception;

	List<EgovMap> selectCtg(String prCd) throws Exception;

}
