package egovframework.example.search.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.example.cmmn.service.PagingVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("searchMapper")
public interface SearchMapper {

	public List<Map> selectList(PagingVO pagingVO);

	public int selectListCnt(String keyword);
	
	
	
	

}
