package egovframework.example.search.service;

import java.util.List;
import java.util.Map;

import egovframework.example.cmmn.service.PagingVO;

public interface SearchService {

	List<Map> selectList(SearchPageVO searchPageVO) throws Exception;

	int selectListCnt(String keyword) throws Exception;
	
	
	

}
