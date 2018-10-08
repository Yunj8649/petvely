package egovframework.example.eventMgr.service.impl;

import java.util.List;

import egovframework.example.event.service.Event_Paging_VO;
import egovframework.example.event.service.TAB_EVENT_VO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("eventMgrMapper")
public interface EventMgrMapper {

	List<EgovMap> selectEventMgrList(Event_Paging_VO pagingVo) throws Exception;

	EgovMap selectPagingListCnt(Event_Paging_VO pagingVo) throws Exception;

	void deleteEventList(String string) throws Exception;

	void reloadEventList(String string) throws Exception;

	void insertEventContent(TAB_EVENT_VO vo) throws Exception;

	List<EgovMap> selectEventListevSeq(String parameter) throws Exception;

	void updateEventContent(TAB_EVENT_VO vo) throws Exception;

}
