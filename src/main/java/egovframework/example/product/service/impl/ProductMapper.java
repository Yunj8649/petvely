package egovframework.example.product.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.example.product.service.TAB_PROD_VO;
import egovframework.example.product.service.ProductMgrVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("productMapper")
public interface ProductMapper {
	
	/* 상품 조회 */
	List<EgovMap> selectJqgridList(ProductMgrVO productMgrVO) throws Exception;

	EgovMap selectJqgridListCnt(ProductMgrVO productMgrVO) throws Exception;

	List<EgovMap> selectCategoryList() throws Exception;

	List<EgovMap> prdMgrChildBoxList(String string) throws Exception;

	void deleteJqgridList(Map<String, Object> param) throws Exception;
	
	/* 상품 추가,수정 및 삭제 */
	void insertProduct(TAB_PROD_VO vo) throws Exception;

	List<EgovMap> selectSubCtList(String string) throws Exception;

	List<EgovMap> selectCtList() throws Exception;

	List<EgovMap> selectProductList(TAB_PROD_VO vo) throws Exception;
}
