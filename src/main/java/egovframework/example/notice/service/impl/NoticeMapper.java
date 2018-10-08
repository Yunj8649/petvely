package egovframework.example.notice.service.impl;

import java.util.List;

import egovframework.example.notice.service.Notice_Paging_VO;
import egovframework.example.notice.service.TAB_NOTICE_VO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("noticeMapper")
public interface NoticeMapper {
	List<EgovMap> noticeDetailList(TAB_NOTICE_VO vo) throws Exception;

	void updateHit(TAB_NOTICE_VO vo) throws Exception;

	int selectNoticeHit(TAB_NOTICE_VO vo) throws Exception;

	List<EgovMap> selectPagingList(Notice_Paging_VO pagingVo) throws Exception;

	EgovMap selectPagingListCnt(Notice_Paging_VO pagingVo) throws Exception;

}
