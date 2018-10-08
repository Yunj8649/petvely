package egovframework.example.category.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.category.service.CategoryService;
import egovframework.example.category.service.Category_Paging_VO;
import egovframework.example.product.service.TAB_PROD_VO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService{

	@Resource(name="categoryMapper")
	CategoryMapper categoryMapper;
	
	@Override
	public List<EgovMap> getFrntPrdList(Category_Paging_VO pagingVo) throws Exception {
		return categoryMapper.getFrntPrdList(pagingVo);
	}

	@Override
	public List<EgovMap> getCtrName(String ctCd, String subCtCd) throws Exception {
		return categoryMapper.getCtrName(ctCd, subCtCd);
	}

	@Override
	public EgovMap selectPagingListCnt(Category_Paging_VO pagingVo) throws Exception {
		return categoryMapper.selectPagingListCnt(pagingVo);
	}
}
