package egovframework.example.search.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.cmmn.service.PagingVO;
import egovframework.example.search.service.SearchPageVO;
import egovframework.example.search.service.SearchService;

@Service("searchService")
public class SearchServiceImpl implements SearchService {

	@Resource(name = "searchMapper")
	private SearchMapper searchMapper;


	@Override
	public List<Map> selectList(SearchPageVO searchPageVO) throws Exception {
		
		searchPageVO.setRows(12);
		return searchMapper.selectList(searchPageVO);
	}


	@Override
	public int selectListCnt(String keyword) throws Exception {
		// TODO Auto-generated method stub
		return searchMapper.selectListCnt(keyword);
	}
	
	
	

}
