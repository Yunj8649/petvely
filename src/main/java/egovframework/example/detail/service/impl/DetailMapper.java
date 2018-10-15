package egovframework.example.detail.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.example.product.service.TAB_PROD_VO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("detailMapper")
public interface DetailMapper {

	List<EgovMap> selectProduct(TAB_PROD_VO vo) throws Exception;

	List<EgovMap> selectCtg(String prCd) throws Exception;

}
