package egovframework.example.event.service.impl;

import java.util.List;

import egovframework.example.event.service.Event_Paging_VO;
import egovframework.example.event.service.TAB_EVENT_VO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("eventMapper")
public interface EventMapper {

	List<EgovMap> selectEventList(Event_Paging_VO pagingVo) throws Exception;

	EgovMap selectPagingListCnt(Event_Paging_VO pagingVo) throws Exception;

	List<EgovMap> selectEventDetailList(TAB_EVENT_VO vo) throws Exception;

}
