package egovframework.example.product.service;

import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface ProductService {
	
	/* 상품 조회 */
	List<EgovMap> selectJqgridList(ProductMgrVO productMgrVO) throws Exception;

	EgovMap selectJqgridListCnt(ProductMgrVO productMgrVO) throws Exception;

	List<EgovMap> selectCategoryList() throws Exception;

	List<EgovMap> prdMgrChildBoxList(String string) throws Exception;

	void ctrlJqgridTx(JSONArray jsonArray) throws Exception;

	/* 상품 추가,수정 및 삭제 */
	void insertProduct(TAB_PROD_VO vo,MultipartHttpServletRequest mRequest) throws Exception;

	List<EgovMap> selectSubCtList(String string) throws Exception;

	List<EgovMap> selectCtList() throws Exception;

	@SuppressWarnings("rawtypes")
	List<EgovMap> selectProductList(TAB_PROD_VO vo) throws Exception;

}
