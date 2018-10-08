package egovframework.example.category.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.example.category.service.Category_Paging_VO;
import egovframework.example.product.service.TAB_PROD_VO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("categoryMapper")
public interface CategoryMapper {

	List<EgovMap> getFrntPrdList(Category_Paging_VO pagingVo) throws Exception;

	List<EgovMap> getCtrName(String ctCd, String subCtCd) throws Exception;

	EgovMap selectPagingListCnt(Category_Paging_VO pagingVo) throws Exception;

}
