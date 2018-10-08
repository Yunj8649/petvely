package egovframework.example.detail.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.detail.service.DetailService;
import egovframework.example.product.service.TAB_PROD_VO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("detailService")
public class DetailServiceImpl implements DetailService{

	@Resource(name="detailMapper")
	private DetailMapper detailMapper;

	@Override
	public List<EgovMap> selectProduct(TAB_PROD_VO vo) throws Exception {
		// TODO Auto-generated method stub
		return detailMapper.selectProduct(vo);
	}

	@Override
	public List<EgovMap> selectCtg(String prCd) throws Exception {
		// TODO Auto-generated method stub
		return detailMapper.selectCtg(prCd);
	}
	

}
