package egovframework.example.category.service;

import java.util.List;
import java.util.Map;

import egovframework.example.product.service.TAB_PROD_VO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface CategoryService {

	List<EgovMap> getCtrName(String ctCd, String subCtCd) throws Exception;

	EgovMap selectPagingListCnt(Category_Paging_VO pagingVo) throws Exception;

	List<EgovMap> getFrntPrdList(Category_Paging_VO pagingVo) throws Exception;

}
