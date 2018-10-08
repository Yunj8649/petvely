package egovframework.example.event.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.event.service.EventService;
import egovframework.example.event.service.Event_Paging_VO;
import egovframework.example.event.service.TAB_EVENT_VO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("eventService")
public class EventServiceImpl implements EventService{
	@Resource(name = "eventMapper")
	private EventMapper eventMapper;

	@Override
	public List<EgovMap> selectEventList(Event_Paging_VO pagingVo) throws Exception {
		return eventMapper.selectEventList(pagingVo);
	}

	@Override
	public EgovMap selectPagingListCnt(Event_Paging_VO pagingVo) throws Exception {
		return eventMapper.selectPagingListCnt(pagingVo);
	}

	@Override
	public List<EgovMap> selectEventDetailList(TAB_EVENT_VO vo) throws Exception {
		return eventMapper.selectEventDetailList(vo);
	}
}
