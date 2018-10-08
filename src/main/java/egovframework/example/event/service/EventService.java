package egovframework.example.event.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface EventService {

	List<EgovMap> selectEventList(Event_Paging_VO pagingVo) throws Exception;

	EgovMap selectPagingListCnt(Event_Paging_VO pagingVo) throws Exception;

	List<EgovMap> selectEventDetailList(TAB_EVENT_VO vo) throws Exception;

}
